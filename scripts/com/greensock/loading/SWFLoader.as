package com.greensock.loading
{
   import com.greensock.events.LoaderEvent;
   import com.greensock.loading.core.DisplayObjectLoader;
   import com.greensock.loading.core.LoaderCore;
   import flash.display.AVM1Movie;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.media.SoundTransform;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getTimer;
   
   public class SWFLoader extends DisplayObjectLoader
   {
      
      private static var _classActivated:Boolean = _activateClass("SWFLoader",SWFLoader,"swf");
       
      
      protected var _lastPTUncaughtError:Event;
      
      protected var _queue:LoaderMax;
      
      protected var _hasRSL:Boolean;
      
      protected var _rslAddedCount:uint;
      
      protected var _loaderCompleted:Boolean;
      
      protected var _loadOnExitStealth:Boolean;
      
      protected var _loaderFailed:Boolean;
      
      public function SWFLoader(urlOrRequest:*, vars:Object = null)
      {
         super(urlOrRequest,vars);
         _preferEstimatedBytesInAudit = true;
         _type = "SWFLoader";
      }
      
      override protected function _load() : void
      {
         if(_stealthMode)
         {
            _stealthMode = this._loadOnExitStealth;
         }
         else if(!_initted)
         {
            _loader.visible = false;
            _sprite.addChild(_loader);
            super._load();
         }
         else if(this._queue != null)
         {
            this._changeQueueListeners(true);
            this._queue.load(false);
         }
      }
      
      override protected function _refreshLoader(unloadContent:Boolean = true) : void
      {
         super._refreshLoader(unloadContent);
         this._loaderCompleted = false;
      }
      
      protected function _changeQueueListeners(add:Boolean) : void
      {
         var p:* = null;
         if(this._queue != null)
         {
            if(add && this.vars.integrateProgress != false)
            {
               for(p in _listenerTypes)
               {
                  if(p != "onProgress" && p != "onInit")
                  {
                     this._queue.addEventListener(_listenerTypes[p],this._passThroughEvent,false,-100,true);
                  }
               }
               this._queue.addEventListener(LoaderEvent.COMPLETE,this._completeHandler,false,-100,true);
               this._queue.addEventListener(LoaderEvent.PROGRESS,this._progressHandler,false,-100,true);
               this._queue.addEventListener(LoaderEvent.FAIL,this._failHandler,false,-100,true);
            }
            else
            {
               this._queue.removeEventListener(LoaderEvent.COMPLETE,this._completeHandler);
               this._queue.removeEventListener(LoaderEvent.PROGRESS,this._progressHandler);
               this._queue.removeEventListener(LoaderEvent.FAIL,this._failHandler);
               for(p in _listenerTypes)
               {
                  if(p != "onProgress" && p != "onInit")
                  {
                     this._queue.removeEventListener(_listenerTypes[p],this._passThroughEvent);
                  }
               }
            }
         }
      }
      
      override protected function _dump(scrubLevel:int = 0, newStatus:int = 0, suppressEvents:Boolean = false) : void
      {
         var content:* = undefined;
         this._loaderCompleted = false;
         if(_status == LoaderStatus.LOADING && !_initted && !this._loaderFailed)
         {
            _stealthMode = true;
            super._dump(scrubLevel,newStatus,suppressEvents);
            return;
         }
         if(_initted && !_scriptAccessDenied && scrubLevel != 2)
         {
            this._stopMovieClips(_loader.content);
            if(_loader.content in _rootLookup)
            {
               this._queue = LoaderMax(_rootLookup[_loader.content]);
               this._changeQueueListeners(false);
               if(scrubLevel == 0)
               {
                  this._queue.cancel();
               }
               else
               {
                  delete _rootLookup[_loader.content];
                  this._queue.dispose(Boolean(scrubLevel != 2));
               }
            }
         }
         if(_stealthMode)
         {
            try
            {
               _loader.close();
            }
            catch(error:Error)
            {
            }
         }
         this._loadOnExitStealth = false;
         _stealthMode = this._hasRSL = this._loaderFailed = false;
         _cacheIsDirty = true;
         if(scrubLevel >= 1)
         {
            this._queue = null;
            _initted = false;
            super._dump(scrubLevel,newStatus,suppressEvents);
         }
         else
         {
            content = _content;
            super._dump(scrubLevel,newStatus,suppressEvents);
            _content = content;
         }
      }
      
      protected function _stopMovieClips(obj:DisplayObject) : void
      {
         var mc:MovieClip = obj as MovieClip;
         if(mc == null)
         {
            return;
         }
         mc.stop();
         var i:int = mc.numChildren;
         while(--i > -1)
         {
            this._stopMovieClips(mc.getChildAt(i));
         }
      }
      
      override protected function _determineScriptAccess() : void
      {
         var mc:DisplayObject = null;
         try
         {
            mc = _loader.content;
         }
         catch(error:Error)
         {
            _scriptAccessDenied = true;
            dispatchEvent(new LoaderEvent(LoaderEvent.SCRIPT_ACCESS_DENIED,this,error.message));
            return;
         }
         if(_loader.content is AVM1Movie)
         {
            _scriptAccessDenied = true;
            dispatchEvent(new LoaderEvent(LoaderEvent.SCRIPT_ACCESS_DENIED,this,"AVM1Movie denies script access"));
         }
      }
      
      override protected function _calculateProgress() : void
      {
         _cachedBytesLoaded = !!_stealthMode ? uint(0) : uint(_loader.contentLoaderInfo.bytesLoaded);
         if(_loader.contentLoaderInfo.bytesTotal != 0)
         {
            _cachedBytesTotal = _loader.contentLoaderInfo.bytesTotal;
         }
         if(_cachedBytesTotal < _cachedBytesLoaded || this._loaderCompleted)
         {
            _cachedBytesTotal = _cachedBytesLoaded;
         }
         if(this.vars.integrateProgress != false)
         {
            if(this._queue != null && (uint(this.vars.estimatedBytes) < _cachedBytesLoaded || this._queue.auditedSize))
            {
               if(this._queue.status <= LoaderStatus.COMPLETED)
               {
                  _cachedBytesLoaded += this._queue.bytesLoaded;
                  _cachedBytesTotal += this._queue.bytesTotal;
               }
            }
            else if(uint(this.vars.estimatedBytes) > _cachedBytesLoaded && (!_initted || this._queue != null && this._queue.status <= LoaderStatus.COMPLETED && !this._queue.auditedSize))
            {
               _cachedBytesTotal = uint(this.vars.estimatedBytes);
            }
         }
         if(this._hasRSL && _content == null || !_initted && _cachedBytesLoaded == _cachedBytesTotal)
         {
            _cachedBytesLoaded = int(_cachedBytesLoaded * 0.99);
         }
         _cacheIsDirty = false;
      }
      
      protected function _checkRequiredLoaders() : void
      {
         if(this._queue == null && this.vars.integrateProgress != false && !_scriptAccessDenied && _content != null)
         {
            this._queue = _rootLookup[_content];
            if(this._queue != null)
            {
               this._changeQueueListeners(true);
               this._queue.load(false);
               _cacheIsDirty = true;
            }
         }
      }
      
      public function getClass(className:String) : Class
      {
         var result:Object = null;
         var loaders:Array = null;
         var i:int = 0;
         if(_content == null || _scriptAccessDenied)
         {
            return null;
         }
         if(_content.loaderInfo.applicationDomain.hasDefinition(className))
         {
            return _content.loaderInfo.applicationDomain.getDefinition(className);
         }
         if(this._queue != null)
         {
            loaders = this._queue.getChildren(true,true);
            i = loaders.length;
            while(--i > -1)
            {
               if(loaders[i] is SWFLoader)
               {
                  result = (loaders[i] as SWFLoader).getClass(className);
                  if(result != null)
                  {
                     return result as Class;
                  }
               }
            }
         }
         return null;
      }
      
      public function getSWFChild(name:String) : DisplayObject
      {
         return !_scriptAccessDenied && _content is DisplayObjectContainer ? DisplayObjectContainer(_content).getChildByName(name) : null;
      }
      
      public function getLoader(nameOrURL:String) : *
      {
         return this._queue != null ? this._queue.getLoader(nameOrURL) : null;
      }
      
      public function getContent(nameOrURL:String) : *
      {
         if(nameOrURL == this.name || nameOrURL == _url)
         {
            return this.content;
         }
         var loader:LoaderCore = this.getLoader(nameOrURL);
         return loader != null ? loader.content : null;
      }
      
      public function getChildren(includeNested:Boolean = false, omitLoaderMaxes:Boolean = false) : Array
      {
         return this._queue != null ? this._queue.getChildren(includeNested,omitLoaderMaxes) : [];
      }
      
      override protected function _initHandler(event:Event) : void
      {
         var awaitingLoad:Boolean = false;
         var tempContent:DisplayObject = null;
         var className:String = null;
         var rslPreloader:Object = null;
         if(_stealthMode)
         {
            _initted = true;
            awaitingLoad = this._loadOnExitStealth;
            this._dump(_status == LoaderStatus.DISPOSED ? 3 : 1,_status,true);
            if(awaitingLoad)
            {
               this._load();
            }
            return;
         }
         this._hasRSL = false;
         try
         {
            tempContent = _loader.content;
            className = getQualifiedClassName(tempContent);
            if(className.substr(-13) == "__Preloader__")
            {
               rslPreloader = tempContent["__rslPreloader"];
               if(rslPreloader != null)
               {
                  className = getQualifiedClassName(rslPreloader);
                  if(className == "fl.rsl::RSLPreloader")
                  {
                     this._hasRSL = true;
                     this._rslAddedCount = 0;
                     tempContent.addEventListener(Event.ADDED,this._rslAddedHandler);
                  }
               }
            }
         }
         catch(error:Error)
         {
         }
         if(!this._hasRSL)
         {
            this._init();
         }
      }
      
      protected function _init() : void
      {
         var st:SoundTransform = null;
         this._determineScriptAccess();
         if(!_scriptAccessDenied)
         {
            if(!this._hasRSL)
            {
               _content = _loader.content;
            }
            if(_content != null)
            {
               if(this.vars.autoPlay == false && _content is MovieClip)
               {
                  st = _content.soundTransform;
                  st.volume = 0;
                  _content.soundTransform = st;
                  _content.stop();
               }
               this._checkRequiredLoaders();
            }
            if(_loader.parent == _sprite)
            {
               if(_sprite.stage != null && this.vars.suppressInitReparentEvents == true)
               {
                  _sprite.addEventListener(Event.ADDED_TO_STAGE,this._captureFirstEvent,true,1000,true);
                  _loader.addEventListener(Event.REMOVED_FROM_STAGE,this._captureFirstEvent,true,1000,true);
               }
               _sprite.removeChild(_loader);
            }
         }
         else
         {
            _content = _loader;
            _loader.visible = true;
         }
         super._initHandler(null);
      }
      
      protected function _captureFirstEvent(event:Event) : void
      {
         event.stopImmediatePropagation();
         event.currentTarget.removeEventListener(event.type,this._captureFirstEvent);
      }
      
      protected function _rslAddedHandler(event:Event) : void
      {
         if(event.target is DisplayObject && event.currentTarget is DisplayObjectContainer && event.target.parent == event.currentTarget)
         {
            ++this._rslAddedCount;
         }
         if(this._rslAddedCount > 1)
         {
            event.currentTarget.removeEventListener(Event.ADDED,this._rslAddedHandler);
            if(_status == LoaderStatus.LOADING)
            {
               _content = event.target;
               this._init();
               this._calculateProgress();
               dispatchEvent(new LoaderEvent(LoaderEvent.PROGRESS,this));
               this._completeHandler(null);
            }
         }
      }
      
      override protected function _passThroughEvent(event:Event) : void
      {
         if(!(event.type == "uncaughtError" && this._suppressUncaughtError(event)) && event.target != this._queue)
         {
            super._passThroughEvent(event);
         }
      }
      
      override protected function _progressHandler(event:Event) : void
      {
         var bl:uint = 0;
         var bt:uint = 0;
         if(_status == LoaderStatus.LOADING)
         {
            if(this._queue == null && _initted)
            {
               this._checkRequiredLoaders();
            }
            if(_dispatchProgress)
            {
               bl = _cachedBytesLoaded;
               bt = _cachedBytesTotal;
               this._calculateProgress();
               if(_cachedBytesLoaded != _cachedBytesTotal && (bl != _cachedBytesLoaded || bt != _cachedBytesTotal))
               {
                  dispatchEvent(new LoaderEvent(LoaderEvent.PROGRESS,this));
               }
            }
            else
            {
               _cacheIsDirty = true;
            }
         }
      }
      
      override protected function _completeHandler(event:Event = null) : void
      {
         var st:SoundTransform = null;
         this._loaderCompleted = true;
         this._checkRequiredLoaders();
         this._calculateProgress();
         if(this.progress == 1)
         {
            if(!_scriptAccessDenied && this.vars.autoPlay == false && _content is MovieClip)
            {
               st = _content.soundTransform;
               st.volume = 1;
               _content.soundTransform = st;
            }
            this._changeQueueListeners(false);
            super._determineScriptAccess();
            super._completeHandler(event);
         }
      }
      
      override protected function _errorHandler(event:Event) : void
      {
         if(!this._suppressUncaughtError(event))
         {
            super._errorHandler(event);
         }
      }
      
      protected function _suppressUncaughtError(event:Event) : Boolean
      {
         if(event is LoaderEvent && LoaderEvent(event).data is Event)
         {
            event = LoaderEvent(event).data as Event;
         }
         if(event.type == "uncaughtError")
         {
            if(this._lastPTUncaughtError == (this._lastPTUncaughtError = event))
            {
               return true;
            }
            if(this.vars.suppressUncaughtErrors == true)
            {
               event.preventDefault();
               event.stopImmediatePropagation();
               return true;
            }
         }
         return false;
      }
      
      override protected function _failHandler(event:Event, dispatchError:Boolean = true) : void
      {
         if((event.type == "ioError" || event.type == "securityError") && event.target == _loader.contentLoaderInfo)
         {
            this._loaderFailed = true;
            if(this._loadOnExitStealth)
            {
               this._dump(1,_status,true);
               this._load();
               return;
            }
         }
         if(event.target == this._queue)
         {
            _status = LoaderStatus.FAILED;
            _time = getTimer() - _time;
            dispatchEvent(new LoaderEvent(LoaderEvent.CANCEL,this));
            dispatchEvent(new LoaderEvent(LoaderEvent.FAIL,this,this.toString() + " > " + (event as Object).text));
            return;
         }
         super._failHandler(event,dispatchError);
      }
      
      override public function set url(value:String) : void
      {
         if(_url != value)
         {
            if(_status == LoaderStatus.LOADING && !_initted && !this._loaderFailed)
            {
               this._loadOnExitStealth = true;
            }
            super.url = value;
         }
      }
   }
}
