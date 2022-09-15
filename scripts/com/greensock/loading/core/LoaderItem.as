package com.greensock.loading.core
{
   import com.greensock.events.LoaderEvent;
   import com.greensock.loading.LoaderMax;
   import com.greensock.loading.LoaderStatus;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   import flash.net.URLVariables;
   
   public class LoaderItem extends LoaderCore
   {
      
      protected static var _cacheID:Number = new Date().getTime();
       
      
      protected var _url:String;
      
      protected var _request:URLRequest;
      
      protected var _scriptAccessDenied:Boolean;
      
      protected var _auditStream:URLStream;
      
      protected var _preferEstimatedBytesInAudit:Boolean;
      
      protected var _httpStatus:int;
      
      protected var _skipAlternateURL:Boolean;
      
      public function LoaderItem(urlOrRequest:*, vars:Object = null)
      {
         super(vars);
         this._request = urlOrRequest is URLRequest ? urlOrRequest as URLRequest : new URLRequest(urlOrRequest);
         this._url = this._request.url;
         this._setRequestURL(this._request,this._url);
      }
      
      protected function _prepRequest() : void
      {
         this._scriptAccessDenied = false;
         this._httpStatus = 0;
         this._closeStream();
         if(this.vars.noCache && (!_isLocal || this._url.substr(0,4) == "http"))
         {
            this._setRequestURL(this._request,this._url,"gsCacheBusterID=" + _cacheID++);
         }
      }
      
      protected function _setRequestURL(request:URLRequest, url:String, extraParams:String = "") : void
      {
         var data:URLVariables = null;
         var pair:Array = null;
         var a:Array = !!this.vars.allowMalformedURL ? [url] : url.split("?");
         var s:String = a[0];
         var parsedURL:String = "";
         for(var i:int = 0; i < s.length; i++)
         {
            parsedURL += s.charAt(i);
         }
         request.url = parsedURL;
         if(a.length >= 2)
         {
            extraParams += extraParams == "" ? a[1] : "&" + a[1];
         }
         if(extraParams != "")
         {
            data = new URLVariables(request.data is URLVariables ? request.data.toString() : null);
            a = extraParams.split("&");
            i = a.length;
            while(--i > -1)
            {
               pair = a[i].split("=");
               data[pair.shift()] = pair.join("=");
            }
            request.data = data;
         }
         if(_isLocal && this.vars.allowMalformedURL != true && this._request.data != null && this._request.url.substr(0,4) != "http")
         {
            this._request.method = "POST";
         }
      }
      
      override protected function _dump(scrubLevel:int = 0, newStatus:int = 0, suppressEvents:Boolean = false) : void
      {
         this._closeStream();
         super._dump(scrubLevel,newStatus,suppressEvents);
      }
      
      override public function auditSize() : void
      {
         var request:URLRequest = null;
         if(this._auditStream == null)
         {
            this._auditStream = new URLStream();
            this._auditStream.addEventListener(ProgressEvent.PROGRESS,this._auditStreamHandler,false,0,true);
            this._auditStream.addEventListener(Event.COMPLETE,this._auditStreamHandler,false,0,true);
            this._auditStream.addEventListener("ioError",this._auditStreamHandler,false,0,true);
            this._auditStream.addEventListener("securityError",this._auditStreamHandler,false,0,true);
            request = new URLRequest();
            request.data = this._request.data;
            request.method = this._request.method;
            this._setRequestURL(request,this._url,!_isLocal || this._url.substr(0,4) == "http" ? "gsCacheBusterID=" + _cacheID++ + "&purpose=audit" : "");
            this._auditStream.load(request);
         }
      }
      
      protected function _closeStream() : void
      {
         if(this._auditStream != null)
         {
            this._auditStream.removeEventListener(ProgressEvent.PROGRESS,this._auditStreamHandler);
            this._auditStream.removeEventListener(Event.COMPLETE,this._auditStreamHandler);
            this._auditStream.removeEventListener("ioError",this._auditStreamHandler);
            this._auditStream.removeEventListener("securityError",this._auditStreamHandler);
            try
            {
               this._auditStream.close();
            }
            catch(error:Error)
            {
            }
            this._auditStream = null;
         }
      }
      
      protected function _auditStreamHandler(event:Event) : void
      {
         var request:URLRequest = null;
         if(event is ProgressEvent)
         {
            _cachedBytesTotal = (event as ProgressEvent).bytesTotal;
            if(this._preferEstimatedBytesInAudit && uint(this.vars.estimatedBytes) > _cachedBytesTotal)
            {
               _cachedBytesTotal = uint(this.vars.estimatedBytes);
            }
         }
         else if(event.type == "ioError" || event.type == "securityError")
         {
            if(this.vars.alternateURL != undefined && this.vars.alternateURL != "" && this.vars.alternateURL != this._url)
            {
               _errorHandler(event);
               if(_status != LoaderStatus.DISPOSED)
               {
                  this._url = this.vars.alternateURL;
                  this._setRequestURL(this._request,this._url);
                  request = new URLRequest();
                  request.data = this._request.data;
                  request.method = this._request.method;
                  this._setRequestURL(request,this._url,!_isLocal || this._url.substr(0,4) == "http" ? "gsCacheBusterID=" + _cacheID++ + "&purpose=audit" : "");
                  this._auditStream.load(request);
               }
               return;
            }
            super._failHandler(event);
         }
         _auditedSize = true;
         this._closeStream();
         dispatchEvent(new Event("auditedSize"));
      }
      
      override protected function _failHandler(event:Event, dispatchError:Boolean = true) : void
      {
         if(this.vars.alternateURL != undefined && this.vars.alternateURL != "" && !this._skipAlternateURL)
         {
            _errorHandler(event);
            this._skipAlternateURL = true;
            this._url = "temp" + new Date().getTime();
            this.url = this.vars.alternateURL;
         }
         else
         {
            super._failHandler(event,dispatchError);
         }
      }
      
      protected function _httpStatusHandler(event:Event) : void
      {
         this._httpStatus = (event as Object).status;
         dispatchEvent(new LoaderEvent(event.type,this,String(this._httpStatus),event));
      }
      
      public function get url() : String
      {
         return this._url;
      }
      
      public function set url(value:String) : void
      {
         var isLoading:Boolean = false;
         if(this._url != value)
         {
            this._url = value;
            this._setRequestURL(this._request,this._url);
            isLoading = Boolean(_status == LoaderStatus.LOADING);
            this._dump(1,LoaderStatus.READY,true);
            _auditedSize = Boolean(uint(this.vars.estimatedBytes) != 0 && this.vars.auditSize != true);
            _cachedBytesTotal = uint(this.vars.estimatedBytes) != 0 ? uint(uint(this.vars.estimatedBytes)) : uint(LoaderMax.defaultEstimatedBytes);
            _cacheIsDirty = true;
            if(isLoading)
            {
               _load();
            }
         }
      }
      
      public function get request() : URLRequest
      {
         return this._request;
      }
      
      public function get httpStatus() : int
      {
         return this._httpStatus;
      }
      
      public function get scriptAccessDenied() : Boolean
      {
         return this._scriptAccessDenied;
      }
   }
}
