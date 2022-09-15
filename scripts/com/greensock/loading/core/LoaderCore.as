package com.greensock.loading.core
{
   import com.greensock.events.LoaderEvent;
   import com.greensock.loading.LoaderMax;
   import com.greensock.loading.LoaderStatus;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.ProgressEvent;
   import flash.net.LocalConnection;
   import flash.system.Capabilities;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   public class LoaderCore extends EventDispatcher
   {
      
      public static const version:Number = 1.935;
      
      protected static var _loaderCount:uint = 0;
      
      protected static var _rootLookup:Dictionary = new Dictionary(false);
      
      protected static var _isLocal:Boolean;
      
      protected static var _globalRootLoader:LoaderMax;
      
      protected static var _listenerTypes:Object = {
         "onOpen":"open",
         "onInit":"init",
         "onComplete":"complete",
         "onProgress":"progress",
         "onCancel":"cancel",
         "onFail":"fail",
         "onError":"error",
         "onSecurityError":"securityError",
         "onHTTPStatus":"httpStatus",
         "onHTTPResponseStatus":"httpResponseStatus",
         "onIOError":"ioError",
         "onScriptAccessDenied":"scriptAccessDenied",
         "onChildOpen":"childOpen",
         "onChildCancel":"childCancel",
         "onChildComplete":"childComplete",
         "onChildProgress":"childProgress",
         "onChildFail":"childFail",
         "onRawLoad":"rawLoad",
         "onUncaughtError":"uncaughtError"
      };
      
      protected static var _types:Object = {};
      
      protected static var _extensions:Object = {};
       
      
      protected var _cachedBytesLoaded:uint;
      
      protected var _cachedBytesTotal:uint;
      
      protected var _status:int;
      
      protected var _prePauseStatus:int;
      
      protected var _dispatchProgress:Boolean;
      
      protected var _rootLoader:LoaderMax;
      
      protected var _cacheIsDirty:Boolean;
      
      protected var _auditedSize:Boolean;
      
      protected var _dispatchChildProgress:Boolean;
      
      protected var _type:String;
      
      protected var _time:uint;
      
      protected var _content;
      
      public var vars:Object;
      
      public var name:String;
      
      public var autoDispose:Boolean;
      
      public function LoaderCore(vars:Object = null)
      {
         var p:* = null;
         super();
         this.vars = vars != null ? vars : {};
         if(this.vars.isGSVars)
         {
            this.vars = this.vars.vars;
         }
         this.name = this.vars.name != undefined && String(this.vars.name) != "" ? this.vars.name : "loader" + _loaderCount++;
         this._cachedBytesLoaded = 0;
         this._cachedBytesTotal = uint(this.vars.estimatedBytes) != 0 ? uint(uint(this.vars.estimatedBytes)) : uint(LoaderMax.defaultEstimatedBytes);
         this.autoDispose = Boolean(this.vars.autoDispose == true);
         this._status = this.vars.paused == true ? int(LoaderStatus.PAUSED) : int(LoaderStatus.READY);
         this._auditedSize = Boolean(uint(this.vars.estimatedBytes) != 0 && this.vars.auditSize != true);
         if(_globalRootLoader == null)
         {
            if(this.vars.__isRoot == true)
            {
               return;
            }
            _globalRootLoader = new LoaderMax({
               "name":"root",
               "__isRoot":true
            });
            _isLocal = Boolean(Capabilities.playerType == "Desktop" || new LocalConnection().domain == "localhost");
         }
         this._rootLoader = this.vars.requireWithRoot is DisplayObject ? _rootLookup[this.vars.requireWithRoot] : _globalRootLoader;
         if(this._rootLoader == null)
         {
            _rootLookup[this.vars.requireWithRoot] = this._rootLoader = new LoaderMax();
            this._rootLoader.name = "subloaded_swf_" + (this.vars.requireWithRoot.loaderInfo != null ? this.vars.requireWithRoot.loaderInfo.url : String(_loaderCount));
            this._rootLoader.skipFailed = false;
         }
         for(p in _listenerTypes)
         {
            if(p in this.vars && this.vars[p] is Function)
            {
               this.addEventListener(_listenerTypes[p],this.vars[p],false,0,true);
            }
         }
         this._rootLoader.append(this);
      }
      
      protected static function _activateClass(type:String, loaderClass:Class, extensions:String) : Boolean
      {
         if(type != "")
         {
            _types[type.toLowerCase()] = loaderClass;
         }
         var a:Array = extensions.split(",");
         var i:int = a.length;
         while(--i > -1)
         {
            _extensions[a[i]] = loaderClass;
         }
         return true;
      }
      
      public function load(flushContent:Boolean = false) : void
      {
         var time:uint = getTimer();
         if(this.status == LoaderStatus.PAUSED)
         {
            this._status = this._prePauseStatus <= LoaderStatus.LOADING ? int(LoaderStatus.READY) : int(this._prePauseStatus);
            if(this._status == LoaderStatus.READY && this is LoaderMax)
            {
               time -= this._time;
            }
         }
         if(flushContent || this._status == LoaderStatus.FAILED)
         {
            this._dump(1,LoaderStatus.READY);
         }
         if(this._status == LoaderStatus.READY)
         {
            this._status = LoaderStatus.LOADING;
            this._time = time;
            this._load();
            if(this.progress < 1)
            {
               dispatchEvent(new LoaderEvent(LoaderEvent.OPEN,this));
            }
         }
         else if(this._status == LoaderStatus.COMPLETED)
         {
            this._completeHandler(null);
         }
      }
      
      protected function _load() : void
      {
      }
      
      public function pause() : void
      {
         this.paused = true;
      }
      
      public function resume() : void
      {
         this.paused = false;
         this.load(false);
      }
      
      public function cancel() : void
      {
         if(this._status == LoaderStatus.LOADING)
         {
            this._dump(0,LoaderStatus.READY);
         }
      }
      
      protected function _dump(scrubLevel:int = 0, newStatus:int = 0, suppressEvents:Boolean = false) : void
      {
         var p:* = null;
         this._content = null;
         var isLoading:Boolean = Boolean(this._status == LoaderStatus.LOADING);
         if(this._status == LoaderStatus.PAUSED && newStatus != LoaderStatus.PAUSED && newStatus != LoaderStatus.FAILED)
         {
            this._prePauseStatus = newStatus;
         }
         else if(this._status != LoaderStatus.DISPOSED)
         {
            this._status = newStatus;
         }
         if(isLoading)
         {
            this._time = getTimer() - this._time;
         }
         this._cachedBytesLoaded = 0;
         if(this._status < LoaderStatus.FAILED)
         {
            if(this is LoaderMax)
            {
               this._calculateProgress();
            }
            if(this._dispatchProgress && !suppressEvents)
            {
               dispatchEvent(new LoaderEvent(LoaderEvent.PROGRESS,this));
            }
         }
         if(!suppressEvents)
         {
            if(isLoading)
            {
               dispatchEvent(new LoaderEvent(LoaderEvent.CANCEL,this));
            }
            if(scrubLevel != 2)
            {
               dispatchEvent(new LoaderEvent(LoaderEvent.UNLOAD,this));
            }
         }
         if(newStatus == LoaderStatus.DISPOSED)
         {
            if(!suppressEvents)
            {
               dispatchEvent(new Event("dispose"));
            }
            for(p in _listenerTypes)
            {
               if(p in this.vars && this.vars[p] is Function)
               {
                  this.removeEventListener(_listenerTypes[p],this.vars[p]);
               }
            }
         }
      }
      
      public function unload() : void
      {
         this._dump(1,LoaderStatus.READY);
      }
      
      public function dispose(flushContent:Boolean = false) : void
      {
         this._dump(!!flushContent ? 3 : 2,LoaderStatus.DISPOSED);
      }
      
      public function prioritize(loadNow:Boolean = true) : void
      {
         dispatchEvent(new Event("prioritize"));
         if(loadNow && this._status != LoaderStatus.COMPLETED && this._status != LoaderStatus.LOADING)
         {
            this.load(false);
         }
      }
      
      override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false) : void
      {
         if(type == LoaderEvent.PROGRESS)
         {
            this._dispatchProgress = true;
         }
         else if(type == LoaderEvent.CHILD_PROGRESS && this is LoaderMax)
         {
            this._dispatchChildProgress = true;
         }
         super.addEventListener(type,listener,useCapture,priority,useWeakReference);
      }
      
      protected function _calculateProgress() : void
      {
      }
      
      public function auditSize() : void
      {
      }
      
      override public function toString() : String
      {
         return this._type + " \'" + this.name + "\'" + (this is LoaderItem ? " (" + (this as LoaderItem).url + ")" : "");
      }
      
      protected function _progressHandler(event:Event) : void
      {
         if(event is ProgressEvent)
         {
            this._cachedBytesLoaded = (event as ProgressEvent).bytesLoaded;
            this._cachedBytesTotal = (event as ProgressEvent).bytesTotal;
            if(!this._auditedSize)
            {
               this._auditedSize = true;
               dispatchEvent(new Event("auditedSize"));
            }
         }
         if(this._dispatchProgress && this._status == LoaderStatus.LOADING && this._cachedBytesLoaded != this._cachedBytesTotal)
         {
            dispatchEvent(new LoaderEvent(LoaderEvent.PROGRESS,this));
         }
      }
      
      protected function _completeHandler(event:Event = null) : void
      {
         this._cachedBytesLoaded = this._cachedBytesTotal;
         if(this._status != LoaderStatus.COMPLETED)
         {
            dispatchEvent(new LoaderEvent(LoaderEvent.PROGRESS,this));
            this._status = LoaderStatus.COMPLETED;
            this._time = getTimer() - this._time;
         }
         dispatchEvent(new LoaderEvent(LoaderEvent.COMPLETE,this));
         if(this.autoDispose)
         {
            this.dispose();
         }
      }
      
      protected function _errorHandler(event:Event) : void
      {
         var target:Object = event.target;
         target = event is LoaderEvent && this.hasOwnProperty("getChildren") ? event.target : this;
         var text:String = "";
         if(event.hasOwnProperty("error") && Object(event).error is Error)
         {
            text = Object(event).error.message;
         }
         else if(event.hasOwnProperty("text"))
         {
            text = Object(event).text;
         }
         if(event.type != LoaderEvent.ERROR && event.type != LoaderEvent.FAIL && this.hasEventListener(event.type))
         {
            dispatchEvent(new LoaderEvent(event.type,target,text,event));
         }
         if(event.type != "uncaughtError")
         {
            trace("----\nError on " + this.toString() + ": " + text + "\n----");
            if(this.hasEventListener(LoaderEvent.ERROR))
            {
               dispatchEvent(new LoaderEvent(LoaderEvent.ERROR,target,this.toString() + " > " + text,event));
            }
         }
      }
      
      protected function _failHandler(event:Event, dispatchError:Boolean = true) : void
      {
         var target:Object = null;
         this._dump(0,LoaderStatus.FAILED,true);
         if(dispatchError)
         {
            this._errorHandler(event);
         }
         else
         {
            target = event.target;
         }
         dispatchEvent(new LoaderEvent(LoaderEvent.FAIL,event is LoaderEvent && this.hasOwnProperty("getChildren") ? event.target : this,this.toString() + " > " + (event as Object).text,event));
         dispatchEvent(new LoaderEvent(LoaderEvent.CANCEL,this));
      }
      
      protected function _passThroughEvent(event:Event) : void
      {
         var type:String = event.type;
         var target:Object = this;
         if(this.hasOwnProperty("getChildren"))
         {
            if(event is LoaderEvent)
            {
               target = event.target;
            }
            if(type == "complete")
            {
               type = "childComplete";
            }
            else if(type == "open")
            {
               type = "childOpen";
            }
            else if(type == "cancel")
            {
               type = "childCancel";
            }
            else if(type == "fail")
            {
               type = "childFail";
            }
         }
         if(this.hasEventListener(type))
         {
            dispatchEvent(new LoaderEvent(type,target,!!event.hasOwnProperty("text") ? Object(event).text : "",event is LoaderEvent && LoaderEvent(event).data != null ? LoaderEvent(event).data : event));
         }
      }
      
      public function get paused() : Boolean
      {
         return Boolean(this._status == LoaderStatus.PAUSED);
      }
      
      public function set paused(value:Boolean) : void
      {
         if(value && this._status != LoaderStatus.PAUSED)
         {
            this._prePauseStatus = this._status;
            if(this._status == LoaderStatus.LOADING)
            {
               this._dump(0,LoaderStatus.PAUSED);
            }
            this._status = LoaderStatus.PAUSED;
         }
         else if(!value && this._status == LoaderStatus.PAUSED)
         {
            if(this._prePauseStatus == LoaderStatus.LOADING)
            {
               this.load(false);
            }
            else
            {
               this._status = int(this._prePauseStatus) || int(LoaderStatus.READY);
            }
         }
      }
      
      public function get status() : int
      {
         return this._status;
      }
      
      public function get bytesLoaded() : uint
      {
         if(this._cacheIsDirty)
         {
            this._calculateProgress();
         }
         return this._cachedBytesLoaded;
      }
      
      public function get bytesTotal() : uint
      {
         if(this._cacheIsDirty)
         {
            this._calculateProgress();
         }
         return this._cachedBytesTotal;
      }
      
      public function get progress() : Number
      {
         return this.bytesTotal != 0 ? Number(this._cachedBytesLoaded / this._cachedBytesTotal) : (this._status == LoaderStatus.COMPLETED ? Number(1) : Number(0));
      }
      
      public function get rootLoader() : LoaderMax
      {
         return this._rootLoader;
      }
      
      public function get content() : *
      {
         return this._content;
      }
      
      public function get auditedSize() : Boolean
      {
         return this._auditedSize;
      }
      
      public function get loadTime() : Number
      {
         if(this._status == LoaderStatus.READY)
         {
            return 0;
         }
         if(this._status == LoaderStatus.LOADING)
         {
            return (getTimer() - this._time) / 1000;
         }
         return this._time / 1000;
      }
   }
}
