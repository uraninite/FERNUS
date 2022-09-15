package com.greensock.loading
{
   import com.greensock.events.LoaderEvent;
   import com.greensock.loading.core.LoaderCore;
   import com.greensock.loading.core.LoaderItem;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import flash.utils.Dictionary;
   
   public class LoaderMax extends LoaderCore
   {
      
      public static const version:Number = 1.938;
      
      public static var defaultEstimatedBytes:uint = 20000;
      
      public static var defaultAuditSize:Boolean = true;
      
      public static var defaultContext:LoaderContext;
      
      public static var contentDisplayClass:Class;
       
      
      protected var _loaders:Array;
      
      protected var _activeLoaders:Dictionary;
      
      public var skipFailed:Boolean;
      
      public var skipPaused:Boolean;
      
      public var maxConnections:uint;
      
      public var autoLoad:Boolean;
      
      public function LoaderMax(vars:Object = null)
      {
         var i:int = 0;
         super(vars);
         _type = "LoaderMax";
         this._loaders = [];
         this._activeLoaders = new Dictionary();
         this.skipFailed = Boolean(this.vars.skipFailed != false);
         this.skipPaused = Boolean(this.vars.skipPaused != false);
         this.autoLoad = Boolean(this.vars.autoLoad == true);
         this.maxConnections = "maxConnections" in this.vars ? uint(uint(this.vars.maxConnections)) : uint(2);
         if(this.vars.loaders is Array)
         {
            for(i = 0; i < this.vars.loaders.length; i++)
            {
               this.insert(this.vars.loaders[i],i);
            }
         }
      }
      
      public static function parse(data:*, vars:Object = null, childrenVars:Object = null) : *
      {
         var queue:LoaderMax = null;
         var l:int = 0;
         var i:int = 0;
         var s:String = null;
         if(data is Array)
         {
            queue = new LoaderMax(vars);
            l = data.length;
            for(i = 0; i < l; i++)
            {
               queue.append(LoaderMax.parse(data[i],childrenVars));
            }
            return queue;
         }
         if(data is String || data is URLRequest)
         {
            s = data is String ? data : URLRequest(data).url;
            s = s.toLowerCase().split("?")[0];
            s = s.substr(s.lastIndexOf(".") + 1);
            if(s in _extensions)
            {
               return new _extensions[s](data,vars);
            }
         }
         else if(data is LoaderCore)
         {
            return data as LoaderCore;
         }
         throw new Error("LoaderMax could not parse " + data + ". Don\'t forget to use LoaderMax.activate() to activate the necessary types of loaders.");
      }
      
      public static function activate(loaderClasses:Array) : void
      {
      }
      
      public static function registerFileType(extensions:String, loaderClass:Class) : void
      {
         _activateClass("",loaderClass,extensions);
      }
      
      public static function getLoader(nameOrURL:String) : *
      {
         return _globalRootLoader != null ? _globalRootLoader.getLoader(nameOrURL) : null;
      }
      
      public static function getContent(nameOrURL:String) : *
      {
         return _globalRootLoader != null ? _globalRootLoader.getContent(nameOrURL) : null;
      }
      
      public static function prioritize(nameOrURL:String, loadNow:Boolean = true) : LoaderCore
      {
         var loader:LoaderCore = getLoader(nameOrURL);
         if(loader != null)
         {
            loader.prioritize(loadNow);
         }
         return loader;
      }
      
      override protected function _load() : void
      {
         this._loadNext(null);
      }
      
      public function append(loader:LoaderCore) : LoaderCore
      {
         return this.insert(loader,this._loaders.length);
      }
      
      public function prepend(loader:LoaderCore) : LoaderCore
      {
         return this.insert(loader,0);
      }
      
      public function insert(loader:LoaderCore, index:uint = 999999999) : LoaderCore
      {
         var p:* = null;
         if(loader == null || loader == this || _status == LoaderStatus.DISPOSED)
         {
            return null;
         }
         if(this != loader.rootLoader)
         {
            this._removeLoader(loader,false);
         }
         if(loader.rootLoader == _globalRootLoader)
         {
            loader.rootLoader.remove(loader);
         }
         if(index > this._loaders.length)
         {
            index = this._loaders.length;
         }
         this._loaders.splice(index,0,loader);
         if(this != _globalRootLoader)
         {
            for(p in _listenerTypes)
            {
               if(p != "onProgress" && p != "onInit")
               {
                  loader.addEventListener(_listenerTypes[p],this._passThroughEvent,false,-100,true);
               }
            }
            loader.addEventListener(LoaderEvent.PROGRESS,this._progressHandler,false,-100,true);
            loader.addEventListener("prioritize",this._prioritizeHandler,false,-100,true);
         }
         loader.addEventListener("dispose",this._disposeHandler,false,-100,true);
         _cacheIsDirty = true;
         if(_status != LoaderStatus.LOADING)
         {
            if(_status != LoaderStatus.PAUSED)
            {
               _status = LoaderStatus.READY;
            }
            else if(_prePauseStatus == LoaderStatus.COMPLETED)
            {
               _prePauseStatus = LoaderStatus.READY;
            }
         }
         if(this.autoLoad && loader.status == LoaderStatus.READY)
         {
            if(_status != LoaderStatus.LOADING)
            {
               this.load(false);
            }
            else
            {
               this._loadNext(null);
            }
         }
         return loader;
      }
      
      public function remove(loader:LoaderCore) : void
      {
         this._removeLoader(loader,true);
      }
      
      protected function _removeLoader(loader:LoaderCore, rootLoaderAppend:Boolean) : void
      {
         if(loader == null)
         {
            return;
         }
         if(rootLoaderAppend && this != loader.rootLoader)
         {
            loader.rootLoader.append(loader);
         }
         this._removeLoaderListeners(loader,true);
         this._loaders.splice(this.getChildIndex(loader),1);
         if(loader in this._activeLoaders)
         {
            delete this._activeLoaders[loader];
            loader.cancel();
            if(_status == LoaderStatus.LOADING)
            {
               this._loadNext(null);
            }
         }
         _cacheIsDirty = true;
         this._progressHandler(null);
      }
      
      public function empty(disposeChildren:Boolean = true, unloadAllContent:Boolean = false) : void
      {
         var i:int = this._loaders.length;
         while(--i > -1)
         {
            if(disposeChildren)
            {
               LoaderCore(this._loaders[i]).dispose(unloadAllContent);
            }
            else if(unloadAllContent)
            {
               LoaderCore(this._loaders[i]).unload();
            }
            else
            {
               this._removeLoader(this._loaders[i],true);
            }
         }
      }
      
      override protected function _dump(scrubLevel:int = 0, newStatus:int = 0, suppressEvents:Boolean = false) : void
      {
         var i:int = 0;
         if(newStatus == LoaderStatus.DISPOSED)
         {
            _status = LoaderStatus.DISPOSED;
            this.empty(true,Boolean(scrubLevel == 3));
            if(this.vars.requireWithRoot is DisplayObject)
            {
               delete _rootLookup[this.vars.requireWithRoot];
            }
            this._activeLoaders = null;
         }
         if(scrubLevel <= 1)
         {
            this._cancelActiveLoaders();
         }
         if(scrubLevel == 1)
         {
            i = this._loaders.length;
            while(--i > -1)
            {
               LoaderCore(this._loaders[i]).unload();
            }
         }
         super._dump(scrubLevel,newStatus,suppressEvents);
         _cacheIsDirty = true;
      }
      
      override protected function _calculateProgress() : void
      {
         var loader:LoaderCore = null;
         var s:int = 0;
         _cachedBytesLoaded = 0;
         _cachedBytesTotal = 0;
         var i:int = this._loaders.length;
         while(--i > -1)
         {
            loader = this._loaders[i];
            s = loader.status;
            if(s <= LoaderStatus.COMPLETED || !this.skipPaused && s == LoaderStatus.PAUSED || !this.skipFailed && s == LoaderStatus.FAILED)
            {
               _cachedBytesLoaded += loader.bytesLoaded;
               _cachedBytesTotal += loader.bytesTotal;
            }
         }
         _cacheIsDirty = false;
      }
      
      protected function _cancelActiveLoaders() : void
      {
         var loader:LoaderCore = null;
         var i:int = this._loaders.length;
         while(--i > -1)
         {
            loader = this._loaders[i];
            if(loader.status == LoaderStatus.LOADING)
            {
               delete this._activeLoaders[loader];
               this._removeLoaderListeners(loader,false);
               loader.cancel();
            }
         }
      }
      
      protected function _removeLoaderListeners(loader:LoaderCore, all:Boolean) : void
      {
         var p:* = null;
         loader.removeEventListener(LoaderEvent.COMPLETE,this._loadNext);
         loader.removeEventListener(LoaderEvent.CANCEL,this._loadNext);
         if(all)
         {
            loader.removeEventListener(LoaderEvent.PROGRESS,this._progressHandler);
            loader.removeEventListener("prioritize",this._prioritizeHandler);
            loader.removeEventListener("dispose",this._disposeHandler);
            for(p in _listenerTypes)
            {
               if(p != "onProgress" && p != "onInit")
               {
                  loader.removeEventListener(_listenerTypes[p],this._passThroughEvent);
               }
            }
         }
      }
      
      public function getChildrenByStatus(status:int, includeNested:Boolean = false, omitLoaderMaxes:Boolean = false) : Array
      {
         var a:Array = [];
         var loaders:Array = this.getChildren(includeNested,omitLoaderMaxes);
         var l:int = loaders.length;
         for(var i:int = 0; i < l; i++)
         {
            if(LoaderCore(loaders[i]).status == status)
            {
               a.push(loaders[i]);
            }
         }
         return a;
      }
      
      public function getChildAt(index:int) : *
      {
         return this._loaders[index];
      }
      
      public function getChildren(includeNested:Boolean = false, omitLoaderMaxes:Boolean = false) : Array
      {
         var a:Array = [];
         var l:int = this._loaders.length;
         for(var i:int = 0; i < l; i++)
         {
            if(!omitLoaderMaxes || !(this._loaders[i] is LoaderMax))
            {
               a.push(this._loaders[i]);
            }
            if(includeNested && this._loaders[i].hasOwnProperty("getChildren"))
            {
               a = a.concat(this._loaders[i].getChildren(true,omitLoaderMaxes));
            }
         }
         return a;
      }
      
      public function prependURLs(prependText:String, includeNested:Boolean = false) : void
      {
         var loaders:Array = this.getChildren(includeNested,true);
         var i:int = loaders.length;
         while(--i > -1)
         {
            LoaderItem(loaders[i]).url = prependText + LoaderItem(loaders[i]).url;
         }
      }
      
      public function replaceURLText(fromText:String, toText:String, includeNested:Boolean = false) : void
      {
         var loader:LoaderItem = null;
         var loaders:Array = this.getChildren(includeNested,true);
         var i:int = loaders.length;
         while(--i > -1)
         {
            loader = loaders[i];
            loader.url = loader.url.split(fromText).join(toText);
            if("alternateURL" in loader.vars)
            {
               loader.vars.alternateURL = loader.vars.alternateURL.split(fromText).join(toText);
            }
         }
      }
      
      public function getLoader(nameOrURL:String) : *
      {
         var loader:LoaderCore = null;
         var i:int = this._loaders.length;
         while(--i > -1)
         {
            loader = this._loaders[i];
            if(loader.name == nameOrURL || loader is LoaderItem && (loader as LoaderItem).url == nameOrURL)
            {
               return loader;
            }
            if(loader.hasOwnProperty("getLoader"))
            {
               loader = (loader as Object).getLoader(nameOrURL) as LoaderCore;
               if(loader != null)
               {
                  return loader;
               }
            }
         }
         return null;
      }
      
      public function getContent(nameOrURL:String) : *
      {
         var loader:LoaderCore = this.getLoader(nameOrURL);
         return loader != null ? loader.content : null;
      }
      
      public function getChildIndex(loader:LoaderCore) : uint
      {
         var i:int = this._loaders.length;
         while(--i > -1)
         {
            if(this._loaders[i] == loader)
            {
               return i;
            }
         }
         return 999999999;
      }
      
      override public function auditSize() : void
      {
         if(!this.auditedSize)
         {
            this._auditSize(null);
         }
      }
      
      protected function _auditSize(event:Event = null) : void
      {
         var loader:LoaderCore = null;
         var found:Boolean = false;
         if(event != null)
         {
            event.target.removeEventListener("auditedSize",this._auditSize);
            event.target.removeEventListener(LoaderEvent.FAIL,this._auditSize);
         }
         var l:uint = this._loaders.length;
         var maxStatus:int = !!this.skipPaused ? int(LoaderStatus.COMPLETED) : int(LoaderStatus.PAUSED);
         for(var i:int = 0; i < l; i++)
         {
            loader = this._loaders[i];
            if(!loader.auditedSize && loader.status <= maxStatus && loader.vars.auditSize != false)
            {
               if(!found)
               {
                  loader.addEventListener("auditedSize",this._auditSize,false,-100,true);
                  loader.addEventListener(LoaderEvent.FAIL,this._auditSize,false,-100,true);
               }
               found = true;
               loader.auditSize();
            }
         }
         if(!found)
         {
            if(_status == LoaderStatus.LOADING)
            {
               this._loadNext(null);
            }
            dispatchEvent(new Event("auditedSize"));
         }
      }
      
      protected function _loadNext(event:Event = null) : void
      {
         var audit:Boolean = false;
         var loader:LoaderCore = null;
         var loaders:Array = null;
         var l:int = 0;
         var activeCount:uint = 0;
         var i:int = 0;
         if(event != null && this._activeLoaders != null)
         {
            delete this._activeLoaders[event.target];
            this._removeLoaderListeners(LoaderCore(event.target),false);
         }
         if(_status == LoaderStatus.LOADING)
         {
            audit = "auditSize" in this.vars ? Boolean(Boolean(this.vars.auditSize)) : Boolean(LoaderMax.defaultAuditSize);
            if(audit && !this.auditedSize)
            {
               this._auditSize(null);
               return;
            }
            l = (loaders = this._loaders.concat()).length;
            activeCount = 0;
            this._calculateProgress();
            for(i = 0; i < l; i++)
            {
               loader = loaders[i];
               if(!this.skipPaused && loader.status == LoaderStatus.PAUSED)
               {
                  super._failHandler(new LoaderEvent(LoaderEvent.FAIL,this,"Did not complete LoaderMax because skipPaused was false and " + loader.toString() + " was paused."),false);
                  return;
               }
               if(!this.skipFailed && loader.status == LoaderStatus.FAILED)
               {
                  super._failHandler(new LoaderEvent(LoaderEvent.FAIL,this,"Did not complete LoaderMax because skipFailed was false and " + loader.toString() + " failed."),false);
                  return;
               }
               if(loader.status <= LoaderStatus.LOADING)
               {
                  activeCount++;
                  if(!(loader in this._activeLoaders))
                  {
                     this._activeLoaders[loader] = true;
                     loader.addEventListener(LoaderEvent.COMPLETE,this._loadNext,false,-100,true);
                     loader.addEventListener(LoaderEvent.CANCEL,this._loadNext,false,-100,true);
                     loader.load(false);
                  }
                  if(activeCount == this.maxConnections)
                  {
                     break;
                  }
               }
            }
            if(activeCount == 0 && _cachedBytesLoaded == _cachedBytesTotal)
            {
               _completeHandler(null);
            }
         }
      }
      
      override protected function _progressHandler(event:Event) : void
      {
         var bl:uint = 0;
         var bt:uint = 0;
         if(_dispatchChildProgress && event != null)
         {
            dispatchEvent(new LoaderEvent(LoaderEvent.CHILD_PROGRESS,event.target));
         }
         if(_dispatchProgress && _status != LoaderStatus.DISPOSED)
         {
            bl = _cachedBytesLoaded;
            bt = _cachedBytesTotal;
            this._calculateProgress();
            if(!(bl == 0 && _cachedBytesLoaded == 0))
            {
               if((_cachedBytesLoaded != _cachedBytesTotal || _status != LoaderStatus.LOADING) && (bl != _cachedBytesLoaded || bt != _cachedBytesTotal))
               {
                  dispatchEvent(new LoaderEvent(LoaderEvent.PROGRESS,this));
               }
            }
         }
         else
         {
            _cacheIsDirty = true;
         }
      }
      
      protected function _disposeHandler(event:Event) : void
      {
         this._removeLoader(LoaderCore(event.target),false);
      }
      
      protected function _prioritizeHandler(event:Event) : void
      {
         var prevMaxConnections:uint = 0;
         var loader:LoaderCore = event.target as LoaderCore;
         this._loaders.splice(this.getChildIndex(loader),1);
         this._loaders.unshift(loader);
         if(_status == LoaderStatus.LOADING && loader.status <= LoaderStatus.LOADING && !(loader in this._activeLoaders))
         {
            this._cancelActiveLoaders();
            prevMaxConnections = this.maxConnections;
            this.maxConnections = 1;
            this._loadNext(null);
            this.maxConnections = prevMaxConnections;
         }
      }
      
      override protected function _passThroughEvent(event:Event) : void
      {
         super._passThroughEvent(event);
         if(!this.skipFailed && (event.type == "fail" || event.type == "childFail") && this.status == LoaderStatus.LOADING)
         {
            super._failHandler(new LoaderEvent(LoaderEvent.FAIL,this,"Did not complete LoaderMax because skipFailed was false and " + event.target.toString() + " failed."),false);
         }
      }
      
      public function get numChildren() : uint
      {
         return this._loaders.length;
      }
      
      override public function get content() : *
      {
         var a:Array = [];
         var i:int = this._loaders.length;
         while(--i > -1)
         {
            a[i] = LoaderCore(this._loaders[i]).content;
         }
         return a;
      }
      
      override public function get status() : int
      {
         var statusCounts:Array = null;
         var i:int = 0;
         if(_status == LoaderStatus.COMPLETED)
         {
            statusCounts = [0,0,0,0,0,0];
            i = this._loaders.length;
            while(--i > -1)
            {
               ++statusCounts[LoaderCore(this._loaders[i]).status];
            }
            if(!this.skipFailed && statusCounts[4] != 0 || !this.skipPaused && statusCounts[3] != 0)
            {
               _status = LoaderStatus.FAILED;
            }
            else if(statusCounts[0] + statusCounts[1] != 0)
            {
               _status = LoaderStatus.READY;
               _cacheIsDirty = true;
            }
         }
         return _status;
      }
      
      override public function get auditedSize() : Boolean
      {
         var maxStatus:int = !!this.skipPaused ? int(LoaderStatus.COMPLETED) : int(LoaderStatus.PAUSED);
         var i:int = this._loaders.length;
         while(--i > -1)
         {
            if(!LoaderCore(this._loaders[i]).auditedSize && LoaderCore(this._loaders[i]).status <= maxStatus && this._loaders[i].vars.auditSize != false)
            {
               return false;
            }
         }
         return true;
      }
      
      public function get rawProgress() : Number
      {
         var status:int = 0;
         var loaded:Number = 0;
         var total:uint = 0;
         var i:int = this._loaders.length;
         while(--i > -1)
         {
            status = LoaderCore(this._loaders[i]).status;
            if(status != LoaderStatus.DISPOSED && !(status == LoaderStatus.PAUSED && this.skipPaused) && !(status == LoaderStatus.FAILED && this.skipFailed))
            {
               total++;
               loaded += this._loaders[i] is LoaderMax ? LoaderMax(this._loaders[i]).rawProgress : LoaderCore(this._loaders[i]).progress;
            }
         }
         return total == 0 ? Number(0) : Number(loaded / total);
      }
   }
}
