package com.greensock.loading
{
   import com.greensock.events.LoaderEvent;
   import com.greensock.loading.core.LoaderCore;
   import flash.events.Event;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.system.SecurityDomain;
   import flash.utils.getTimer;
   
   public class XMLLoader extends DataLoader
   {
      
      private static var _classActivated:Boolean = _activateClass("XMLLoader",XMLLoader,"xml,php,jsp,asp,cfm,cfml,aspx");
      
      protected static var _varTypes:Object = {
         "skipFailed":true,
         "skipPaused":true,
         "autoLoad":false,
         "paused":false,
         "load":false,
         "noCache":false,
         "auditSize":true,
         "maxConnections":2,
         "autoPlay":false,
         "autoDispose":false,
         "smoothing":false,
         "autoDetachNetStream":false,
         "estimatedBytes":1,
         "x":1,
         "y":1,
         "z":1,
         "rotationX":1,
         "rotationY":1,
         "rotationZ":1,
         "width":1,
         "height":1,
         "scaleX":1,
         "scaleY":1,
         "rotation":1,
         "alpha":1,
         "visible":true,
         "bgColor":0,
         "bgAlpha":0,
         "deblocking":1,
         "repeat":1,
         "checkPolicyFile":false,
         "centerRegistration":false,
         "bufferTime":5,
         "volume":1,
         "bufferMode":false,
         "estimatedDuration":200,
         "crop":false,
         "autoAdjustBuffer":true,
         "suppressInitReparentEvents":true,
         "allowMalformedURL":false
      };
      
      public static var RAW_LOAD:String = "rawLoad";
       
      
      protected var _loadingQueue:LoaderMax;
      
      protected var _parsed:LoaderMax;
      
      protected var _initted:Boolean;
      
      public function XMLLoader(urlOrRequest:*, vars:Object = null)
      {
         super(urlOrRequest,vars);
         _preferEstimatedBytesInAudit = true;
         _type = "XMLLoader";
         _loader.dataFormat = "text";
      }
      
      protected static function _parseVars(xml:XML) : Object
      {
         var s:String = null;
         var type:* = null;
         var value:String = null;
         var domain:ApplicationDomain = null;
         var attribute:XML = null;
         var v:Object = {"rawXML":xml};
         var list:XMLList = xml.attributes();
         for each(attribute in list)
         {
            s = attribute.name();
            value = attribute.toString();
            if(s != "url")
            {
               if(s == "context")
               {
                  v.context = new LoaderContext(true,value == "own" ? ApplicationDomain.currentDomain : (value == "separate" ? new ApplicationDomain() : new ApplicationDomain(ApplicationDomain.currentDomain)),!_isLocal ? SecurityDomain.currentDomain : null);
               }
               else
               {
                  type = typeof _varTypes[s];
                  if(type == "boolean")
                  {
                     v[s] = Boolean(value == "true" || value == "1");
                  }
                  else if(type == "number")
                  {
                     v[s] = Number(value);
                  }
                  else
                  {
                     v[s] = value;
                  }
               }
            }
         }
         return v;
      }
      
      public static function parseLoaders(xml:XML, all:LoaderMax, toLoad:LoaderMax = null) : void
      {
         var node:XML = null;
         var queue:LoaderMax = null;
         var replaceText:Array = null;
         var i:int = 0;
         var loaderClass:Class = null;
         var parsedVars:Object = null;
         var loader:LoaderCore = null;
         var p:* = null;
         var nodeName:String = String(xml.name()).toLowerCase();
         if(nodeName == "loadermax")
         {
            queue = all.append(new LoaderMax(_parseVars(xml))) as LoaderMax;
            if(toLoad != null && queue.vars.load)
            {
               toLoad.append(queue);
            }
            if(queue.vars.childrenVars != null && queue.vars.childrenVars.indexOf(":") != -1)
            {
               queue.vars.childrenVars = _parseVars(new XML("<childrenVars " + queue.vars.childrenVars.split(",").join("\" ").split(":").join("=\"") + "\" />"));
            }
            for each(node in xml.children())
            {
               parseLoaders(node,queue,toLoad);
            }
            if("replaceURLText" in queue.vars)
            {
               replaceText = queue.vars.replaceURLText.split(",");
               for(i = 0; i < replaceText.length; i += 2)
               {
                  queue.replaceURLText(replaceText[i],replaceText[i + 1],false);
               }
            }
            if("prependURLs" in queue.vars)
            {
               queue.prependURLs(queue.vars.prependURLs,false);
            }
         }
         else
         {
            if(nodeName in _types)
            {
               loaderClass = _types[nodeName];
               parsedVars = _parseVars(xml);
               if(typeof all.vars.childrenVars == "object")
               {
                  for(p in all.vars.childrenVars)
                  {
                     if(!(p in parsedVars))
                     {
                        parsedVars[p] = all.vars.childrenVars[p];
                     }
                  }
               }
               loader = all.append(new loaderClass(xml.@url,parsedVars));
               if(toLoad != null && loader.vars.load && !all.vars.load)
               {
                  toLoad.append(loader);
               }
            }
            for each(node in xml.children())
            {
               parseLoaders(node,all,toLoad);
            }
         }
      }
      
      override protected function _load() : void
      {
         if(!this._initted)
         {
            _prepRequest();
            _loader.load(_request);
         }
         else if(this._loadingQueue != null)
         {
            this._changeQueueListeners(true);
            this._loadingQueue.load(false);
         }
      }
      
      protected function _changeQueueListeners(add:Boolean) : void
      {
         var p:* = null;
         if(this._loadingQueue != null)
         {
            if(add && this.vars.integrateProgress != false)
            {
               for(p in _listenerTypes)
               {
                  if(p != "onProgress" && p != "onInit")
                  {
                     this._loadingQueue.addEventListener(_listenerTypes[p],this._passThroughEvent,false,-100,true);
                  }
               }
               this._loadingQueue.addEventListener(LoaderEvent.COMPLETE,this._completeHandler,false,-100,true);
               this._loadingQueue.addEventListener(LoaderEvent.PROGRESS,this._progressHandler,false,-100,true);
               this._loadingQueue.addEventListener(LoaderEvent.FAIL,this._failHandler,false,-100,true);
            }
            else
            {
               this._loadingQueue.removeEventListener(LoaderEvent.COMPLETE,this._completeHandler);
               this._loadingQueue.removeEventListener(LoaderEvent.PROGRESS,this._progressHandler);
               this._loadingQueue.removeEventListener(LoaderEvent.FAIL,this._failHandler);
               for(p in _listenerTypes)
               {
                  if(p != "onProgress" && p != "onInit")
                  {
                     this._loadingQueue.removeEventListener(_listenerTypes[p],this._passThroughEvent);
                  }
               }
            }
         }
      }
      
      override protected function _dump(scrubLevel:int = 0, newStatus:int = 0, suppressEvents:Boolean = false) : void
      {
         if(this._loadingQueue != null)
         {
            this._changeQueueListeners(false);
            if(scrubLevel == 0)
            {
               this._loadingQueue.cancel();
            }
            else
            {
               this._loadingQueue.dispose(Boolean(scrubLevel == 3));
               this._loadingQueue = null;
            }
         }
         if(scrubLevel >= 1)
         {
            if(this._parsed != null)
            {
               this._parsed.dispose(Boolean(scrubLevel == 3));
               this._parsed = null;
            }
            this._initted = false;
         }
         _cacheIsDirty = true;
         var content:* = _content;
         super._dump(scrubLevel,newStatus,suppressEvents);
         if(scrubLevel == 0)
         {
            _content = content;
         }
      }
      
      override protected function _calculateProgress() : void
      {
         _cachedBytesLoaded = _loader.bytesLoaded;
         if(_loader.bytesTotal != 0)
         {
            _cachedBytesTotal = _loader.bytesTotal;
         }
         if(_cachedBytesTotal < _cachedBytesLoaded || this._initted)
         {
            _cachedBytesTotal = _cachedBytesLoaded;
         }
         var estimate:uint = uint(this.vars.estimatedBytes);
         if(this.vars.integrateProgress != false)
         {
            if(this._loadingQueue != null && (uint(this.vars.estimatedBytes) < _cachedBytesLoaded || this._loadingQueue.auditedSize))
            {
               if(this._loadingQueue.status <= LoaderStatus.COMPLETED)
               {
                  _cachedBytesLoaded += this._loadingQueue.bytesLoaded;
                  _cachedBytesTotal += this._loadingQueue.bytesTotal;
               }
            }
            else if(uint(this.vars.estimatedBytes) > _cachedBytesLoaded && (!this._initted || this._loadingQueue != null && this._loadingQueue.status <= LoaderStatus.COMPLETED && !this._loadingQueue.auditedSize))
            {
               _cachedBytesTotal = uint(this.vars.estimatedBytes);
            }
         }
         if(!this._initted && _cachedBytesLoaded == _cachedBytesTotal)
         {
            _cachedBytesLoaded = int(_cachedBytesLoaded * 0.99);
         }
         _cacheIsDirty = false;
      }
      
      public function getLoader(nameOrURL:String) : *
      {
         return this._parsed != null ? this._parsed.getLoader(nameOrURL) : null;
      }
      
      public function getContent(nameOrURL:String) : *
      {
         if(nameOrURL == this.name || nameOrURL == _url)
         {
            return _content;
         }
         var loader:LoaderCore = this.getLoader(nameOrURL);
         return loader != null ? loader.content : null;
      }
      
      public function getChildren(includeNested:Boolean = false, omitLoaderMaxes:Boolean = false) : Array
      {
         return this._parsed != null ? this._parsed.getChildren(includeNested,omitLoaderMaxes) : [];
      }
      
      override protected function _progressHandler(event:Event) : void
      {
         var bl:uint = 0;
         var bt:uint = 0;
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
      
      override protected function _passThroughEvent(event:Event) : void
      {
         if(event.target != this._loadingQueue)
         {
            super._passThroughEvent(event);
         }
      }
      
      override protected function _receiveDataHandler(event:Event) : void
      {
         var loaders:Array = null;
         var i:int = 0;
         try
         {
            _content = new XML(_loader.data);
         }
         catch(error:Error)
         {
            _content = _loader.data;
            _failHandler(new LoaderEvent(LoaderEvent.ERROR,this,error.message));
            return;
         }
         dispatchEvent(new LoaderEvent(RAW_LOAD,this,"",_content));
         this._initted = true;
         this._loadingQueue = new LoaderMax({
            "name":this.name + "_Queue",
            "maxConnections":uint(this.vars.maxConnections) || 2,
            "skipFailed":Boolean(this.vars.skipFailed != false),
            "skipPaused":Boolean(this.vars.skipPaused != false)
         });
         this._parsed = new LoaderMax({
            "name":this.name + "_ParsedLoaders",
            "paused":true
         });
         parseLoaders(_content as XML,this._parsed,this._loadingQueue);
         if(this._parsed.numChildren == 0)
         {
            this._parsed.dispose(false);
            this._parsed = null;
         }
         else if("recursivePrependURLs" in this.vars)
         {
            this._parsed.prependURLs(this.vars.recursivePrependURLs,true);
            loaders = this._parsed.getChildren(true,true);
            i = loaders.length;
            while(--i > -1)
            {
               if(loaders[i] is XMLLoader)
               {
                  loaders[i].vars.recursivePrependURLs = this.vars.recursivePrependURLs;
               }
            }
         }
         else if("prependURLs" in this.vars)
         {
            this._parsed.prependURLs(this.vars.prependURLs,true);
         }
         if(this._loadingQueue.getChildren(true,true).length == 0)
         {
            this._loadingQueue.empty(false);
            this._loadingQueue.dispose(false);
            this._loadingQueue = null;
            dispatchEvent(new LoaderEvent(LoaderEvent.INIT,this,"",_content));
         }
         else
         {
            _cacheIsDirty = true;
            this._changeQueueListeners(true);
            dispatchEvent(new LoaderEvent(LoaderEvent.INIT,this,"",_content));
            this._loadingQueue.load(false);
         }
         if(this._loadingQueue == null || this.vars.integrateProgress == false)
         {
            this._completeHandler(event);
         }
      }
      
      override protected function _failHandler(event:Event, dispatchError:Boolean = true) : void
      {
         if(event.target == this._loadingQueue)
         {
            _status = LoaderStatus.FAILED;
            _time = getTimer() - _time;
            dispatchEvent(new LoaderEvent(LoaderEvent.CANCEL,this));
            dispatchEvent(new LoaderEvent(LoaderEvent.FAIL,this,this.toString() + " > " + (event as Object).text));
         }
         else
         {
            super._failHandler(event,dispatchError);
         }
      }
      
      override protected function _completeHandler(event:Event = null) : void
      {
         this._calculateProgress();
         if(this.progress == 1)
         {
            this._changeQueueListeners(false);
            super._completeHandler(event);
         }
      }
      
      override public function get progress() : Number
      {
         return this.bytesTotal != 0 ? Number(_cachedBytesLoaded / _cachedBytesTotal) : (_status == LoaderStatus.COMPLETED || this._initted ? Number(1) : Number(0));
      }
   }
}
