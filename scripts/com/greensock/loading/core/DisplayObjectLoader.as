package com.greensock.loading.core
{
   import com.greensock.events.LoaderEvent;
   import com.greensock.loading.LoaderMax;
   import com.greensock.loading.LoaderStatus;
   import com.greensock.loading.display.ContentDisplay;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.display.Sprite;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.net.LocalConnection;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.Capabilities;
   import flash.system.LoaderContext;
   import flash.system.Security;
   import flash.system.SecurityDomain;
   
   public class DisplayObjectLoader extends LoaderItem
   {
      
      public static var defaultAutoForceGC:Boolean = true;
      
      protected static var _gcDispatcher:Sprite;
      
      protected static var _gcCycles:uint = 0;
       
      
      protected var _loader:Loader;
      
      protected var _sprite:Sprite;
      
      protected var _context:LoaderContext;
      
      protected var _initted:Boolean;
      
      protected var _stealthMode:Boolean;
      
      protected var _fallbackAudit:Loader;
      
      public function DisplayObjectLoader(urlOrRequest:*, vars:Object = null)
      {
         super(urlOrRequest,vars);
         this._refreshLoader(false);
         if(LoaderMax.contentDisplayClass is Class)
         {
            this._sprite = new LoaderMax.contentDisplayClass(this);
            if(!this._sprite.hasOwnProperty("rawContent"))
            {
               throw new Error("LoaderMax.contentDisplayClass must be set to a class with a \'rawContent\' property, like com.greensock.loading.display.ContentDisplay");
            }
         }
         else
         {
            this._sprite = new ContentDisplay(this);
         }
      }
      
      public static function forceGC(cycles:uint = 1) : void
      {
         if(_gcCycles < cycles)
         {
            _gcCycles = cycles;
            if(_gcDispatcher == null)
            {
               _gcDispatcher = new Sprite();
               _gcDispatcher.addEventListener(Event.ENTER_FRAME,_forceGCHandler,false,0,true);
            }
         }
      }
      
      protected static function _forceGCHandler(event:Event) : void
      {
         if(--_gcCycles <= 0)
         {
            _gcDispatcher.removeEventListener(Event.ENTER_FRAME,_forceGCHandler);
            _gcDispatcher = null;
         }
         try
         {
            new LocalConnection().connect("FORCE_GC");
            new LocalConnection().connect("FORCE_GC");
         }
         catch(error:Error)
         {
         }
      }
      
      public function setContentDisplay(contentDisplay:Sprite) : void
      {
         this._sprite = contentDisplay;
      }
      
      override protected function _load() : void
      {
         _prepRequest();
         if(this.vars.context is LoaderContext)
         {
            this._context = this.vars.context;
         }
         else if(this._context == null)
         {
            if(LoaderMax.defaultContext != null)
            {
               this._context = LoaderMax.defaultContext;
               if(_isLocal)
               {
                  this._context.securityDomain = null;
               }
            }
            else if(!_isLocal)
            {
               this._context = new LoaderContext(true,new ApplicationDomain(ApplicationDomain.currentDomain),SecurityDomain.currentDomain);
            }
         }
         if(Capabilities.playerType != "Desktop")
         {
            Security.allowDomain(_url);
         }
         this._loader.load(_request,this._context);
      }
      
      override public function auditSize() : void
      {
         if(Capabilities.playerType != "Desktop")
         {
            Security.allowDomain(_url);
         }
         super.auditSize();
      }
      
      override protected function _closeStream() : void
      {
         this._closeFallbackAudit();
         super._closeStream();
      }
      
      protected function _closeFallbackAudit() : void
      {
         if(this._fallbackAudit != null)
         {
            this._fallbackAudit.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,this._auditStreamHandler,false,0,true);
            this._fallbackAudit.contentLoaderInfo.addEventListener(Event.COMPLETE,this._auditStreamHandler,false,0,true);
            this._fallbackAudit.contentLoaderInfo.addEventListener("ioError",this._auditStreamHandler,false,0,true);
            this._fallbackAudit.contentLoaderInfo.addEventListener("securityError",this._auditStreamHandler,false,0,true);
            try
            {
               this._fallbackAudit.close();
            }
            catch(error:Error)
            {
            }
            this._fallbackAudit = null;
         }
      }
      
      override protected function _auditStreamHandler(event:Event) : void
      {
         var request:URLRequest = null;
         if(event.type == "securityError")
         {
            if(this._fallbackAudit == null)
            {
               this._context = new LoaderContext(false);
               _scriptAccessDenied = true;
               dispatchEvent(new LoaderEvent(LoaderEvent.SCRIPT_ACCESS_DENIED,this,ErrorEvent(event).text));
               _errorHandler(event);
               this._fallbackAudit = new Loader();
               this._fallbackAudit.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,this._auditStreamHandler,false,0,true);
               this._fallbackAudit.contentLoaderInfo.addEventListener(Event.COMPLETE,this._auditStreamHandler,false,0,true);
               this._fallbackAudit.contentLoaderInfo.addEventListener("ioError",this._auditStreamHandler,false,0,true);
               this._fallbackAudit.contentLoaderInfo.addEventListener("securityError",this._auditStreamHandler,false,0,true);
               request = new URLRequest();
               request.data = _request.data;
               request.method = _request.method;
               _setRequestURL(request,_url,!_isLocal || _url.substr(0,4) == "http" ? "gsCacheBusterID=" + _cacheID++ + "&purpose=audit" : "");
               if(Capabilities.playerType != "Desktop")
               {
                  Security.allowDomain(_url);
               }
               this._fallbackAudit.load(request,this._context);
               return;
            }
            this._closeFallbackAudit();
         }
         super._auditStreamHandler(event);
      }
      
      protected function _refreshLoader(unloadContent:Boolean = true) : void
      {
         if(this._loader != null)
         {
            if(_status == LoaderStatus.LOADING)
            {
               try
               {
                  this._loader.close();
               }
               catch(error:Error)
               {
               }
            }
            this._loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,_progressHandler);
            this._loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,_completeHandler);
            this._loader.contentLoaderInfo.removeEventListener("ioError",_failHandler);
            this._loader.contentLoaderInfo.removeEventListener("securityError",this._securityErrorHandler);
            this._loader.contentLoaderInfo.removeEventListener("httpStatus",_httpStatusHandler);
            this._loader.contentLoaderInfo.removeEventListener("httpResponseStatus",_httpStatusHandler);
            this._loader.contentLoaderInfo.removeEventListener(Event.INIT,this._initHandler);
            if(this._loader.hasOwnProperty("uncaughtErrorEvents"))
            {
               Object(this._loader).uncaughtErrorEvents.removeEventListener("uncaughtError",_errorHandler);
            }
            if(unloadContent)
            {
               try
               {
                  if(this._loader.parent == null && this._sprite != null)
                  {
                     this._sprite.addChild(this._loader);
                  }
                  if(this._loader.hasOwnProperty("unloadAndStop"))
                  {
                     (this._loader as Object).unloadAndStop();
                  }
                  else
                  {
                     this._loader.unload();
                  }
               }
               catch(error:Error)
               {
               }
               if(this._loader.parent)
               {
                  this._loader.parent.removeChild(this._loader);
               }
               if("autoForceGC" in this.vars ? Boolean(this.vars.autoForceGC) : Boolean(defaultAutoForceGC))
               {
                  forceGC(!!this.hasOwnProperty("getClass") ? uint(3) : uint(1));
               }
            }
         }
         this._initted = false;
         this._loader = new Loader();
         this._loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,_progressHandler,false,0,true);
         this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE,_completeHandler,false,0,true);
         this._loader.contentLoaderInfo.addEventListener("ioError",_failHandler,false,0,true);
         this._loader.contentLoaderInfo.addEventListener("securityError",this._securityErrorHandler,false,0,true);
         this._loader.contentLoaderInfo.addEventListener("httpStatus",_httpStatusHandler,false,0,true);
         this._loader.contentLoaderInfo.addEventListener("httpResponseStatus",_httpStatusHandler,false,0,true);
         this._loader.contentLoaderInfo.addEventListener(Event.INIT,this._initHandler,false,0,true);
         if(this._loader.hasOwnProperty("uncaughtErrorEvents"))
         {
            Object(this._loader).uncaughtErrorEvents.addEventListener("uncaughtError",_errorHandler,false,0,true);
         }
      }
      
      override protected function _dump(scrubLevel:int = 0, newStatus:int = 0, suppressEvents:Boolean = false) : void
      {
         if(!this._stealthMode)
         {
            this._refreshLoader(Boolean(scrubLevel != 2));
         }
         if(scrubLevel == 1)
         {
            (this._sprite as Object).rawContent = null;
         }
         else if(scrubLevel == 2)
         {
            (this._sprite as Object).loader = null;
         }
         else if(scrubLevel == 3)
         {
            (this._sprite as Object).dispose(false,false);
         }
         super._dump(scrubLevel,newStatus,suppressEvents);
      }
      
      protected function _determineScriptAccess() : void
      {
         if(!_scriptAccessDenied)
         {
            if(!this._loader.contentLoaderInfo.childAllowsParent)
            {
               _scriptAccessDenied = true;
               dispatchEvent(new LoaderEvent(LoaderEvent.SCRIPT_ACCESS_DENIED,this,"Error #2123: Security sandbox violation: " + this + ". No policy files granted access."));
            }
         }
      }
      
      protected function _securityErrorHandler(event:ErrorEvent) : void
      {
         if(this._context != null && this._context.checkPolicyFile && !(this.vars.context is LoaderContext))
         {
            this._context = new LoaderContext(false);
            _scriptAccessDenied = true;
            dispatchEvent(new LoaderEvent(LoaderEvent.SCRIPT_ACCESS_DENIED,this,event.text));
            _errorHandler(event);
            this._load();
         }
         else
         {
            _failHandler(event);
         }
      }
      
      protected function _initHandler(event:Event) : void
      {
         if(!this._initted)
         {
            this._initted = true;
            if(_content == null)
            {
               _content = !!_scriptAccessDenied ? this._loader : this._loader.content;
            }
            (this._sprite as Object).rawContent = _content as DisplayObject;
            dispatchEvent(new LoaderEvent(LoaderEvent.INIT,this));
         }
      }
      
      override public function get content() : *
      {
         return this._sprite;
      }
      
      public function get rawContent() : *
      {
         return _content;
      }
   }
}
