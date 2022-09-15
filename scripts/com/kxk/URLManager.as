package com.kxk
{
   import flash.events.AsyncErrorEvent;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.NetStatusEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   
   public class URLManager
   {
       
      
      private var _json:String;
      
      private var _urlHeader1:URLRequestHeader;
      
      private var _urlHeader2:URLRequestHeader;
      
      private var _urlHeader3:URLRequestHeader;
      
      private var _urlRequest:URLRequest;
      
      private var _urlLoader:URLLoader;
      
      public var onComplete:Function;
      
      public var onError:Function;
      
      public function URLManager()
      {
         super();
      }
      
      public function postJSON(_data:Object, _url:String) : *
      {
         this._json = JSON.stringify(_data);
         this._urlHeader1 = new URLRequestHeader("Cache-Control","no-cache, must-revalidate");
         this._urlHeader2 = new URLRequestHeader("Expires","Sat, 26 Jul 1997 05:00:00 GMT");
         this._urlHeader3 = new URLRequestHeader("Content-type","application/json; charset=utf-8");
         this._urlRequest = new URLRequest(_url);
         this._urlRequest.requestHeaders.push(this._urlHeader1);
         this._urlRequest.requestHeaders.push(this._urlHeader2);
         this._urlRequest.requestHeaders.push(this._urlHeader3);
         this._urlRequest.data = this._json;
         this._urlRequest.method = URLRequestMethod.POST;
         this._urlLoader = new URLLoader();
         this.openEvents();
         this.loadRequest();
      }
      
      public function getJSON(_url:String) : *
      {
         this._urlRequest = new URLRequest(_url);
         this._urlLoader = new URLLoader();
         this.openEvents();
         this.loadRequest();
      }
      
      public function getHtmlSource(_url:String) : *
      {
         this._urlRequest = new URLRequest(_url);
         this._urlLoader = new URLLoader();
         this.openEvents();
         this.loadRequest();
      }
      
      public function postData(_data:URLVariables, _url:String) : *
      {
         this._urlRequest = new URLRequest(_url);
         this._urlRequest.method = URLRequestMethod.POST;
         this._urlRequest.data = _data;
         this._urlLoader = new URLLoader();
         this.openEvents();
         this.loadRequest();
      }
      
      private function loadRequest() : void
      {
         try
         {
            this._urlLoader.load(this._urlRequest);
         }
         catch(error:Error)
         {
         }
      }
      
      private function loaderRequestComplete(e:Event) : void
      {
         if(this.onComplete != null)
         {
            this.onComplete(this._urlLoader.data);
         }
         this.dispose();
      }
      
      public function dispose() : void
      {
         this.onComplete = null;
         this.onError = null;
         if(this._urlLoader)
         {
            this._urlLoader.close();
            this._urlLoader = null;
            this._urlHeader1 = null;
            this._urlHeader2 = null;
            this._urlHeader3 = null;
            this._urlRequest = null;
         }
      }
      
      private function openEvents() : void
      {
         this._urlLoader.addEventListener(Event.COMPLETE,this.loaderRequestComplete);
         this._urlLoader.addEventListener(Event.OPEN,this.openHandler);
         this._urlLoader.addEventListener(ErrorEvent.ERROR,this.onErrorHandler);
         this._urlLoader.addEventListener(AsyncErrorEvent.ASYNC_ERROR,this.onAsyncError);
         this._urlLoader.addEventListener(NetStatusEvent.NET_STATUS,this.onNetStatus);
         this._urlLoader.addEventListener(ProgressEvent.PROGRESS,this.progressHandler);
         this._urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.securityErrorHandler);
         this._urlLoader.addEventListener(HTTPStatusEvent.HTTP_STATUS,this.httpStatusHandler);
         this._urlLoader.addEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
      }
      
      private function openHandler(event:Event) : void
      {
      }
      
      private function onErrorHandler(event:ErrorEvent) : void
      {
         trace("onError: " + event.type);
         if(this.onError != null)
         {
            this.onError();
         }
         this.dispose();
      }
      
      private function onAsyncError(event:AsyncErrorEvent) : void
      {
      }
      
      private function onNetStatus(event:NetStatusEvent) : void
      {
      }
      
      private function progressHandler(event:ProgressEvent) : void
      {
      }
      
      private function securityErrorHandler(event:SecurityErrorEvent) : void
      {
      }
      
      private function httpStatusHandler(event:HTTPStatusEvent) : void
      {
      }
      
      private function ioErrorHandler(event:IOErrorEvent) : void
      {
         trace("ioErrorHandler: " + event);
         if(this.onError != null)
         {
            this.onError();
         }
         this.dispose();
      }
   }
}
