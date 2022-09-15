package com.greensock.events
{
   import flash.events.Event;
   
   public class LoaderEvent extends Event
   {
      
      public static const CHILD_OPEN:String = "childOpen";
      
      public static const CHILD_PROGRESS:String = "childProgress";
      
      public static const CHILD_CANCEL:String = "childCancel";
      
      public static const CHILD_COMPLETE:String = "childComplete";
      
      public static const CHILD_FAIL:String = "childFail";
      
      public static const OPEN:String = "open";
      
      public static const PROGRESS:String = "progress";
      
      public static const CANCEL:String = "cancel";
      
      public static const FAIL:String = "fail";
      
      public static const INIT:String = "init";
      
      public static const COMPLETE:String = "complete";
      
      public static const HTTP_STATUS:String = "httpStatus";
      
      public static const HTTP_RESPONSE_STATUS:String = "httpResponseStatus";
      
      public static const SCRIPT_ACCESS_DENIED:String = "scriptAccessDenied";
      
      public static const ERROR:String = "error";
      
      public static const IO_ERROR:String = "ioError";
      
      public static const SECURITY_ERROR:String = "securityError";
      
      public static const UNCAUGHT_ERROR:String = "uncaughtError";
      
      public static const UNLOAD:String = "unload";
       
      
      protected var _target:Object;
      
      protected var _ready:Boolean;
      
      public var text:String;
      
      public var data;
      
      public function LoaderEvent(type:String, target:Object, text:String = "", data:* = null)
      {
         super(type,false,false);
         this._target = target;
         this.text = text;
         this.data = data;
      }
      
      override public function clone() : Event
      {
         return new LoaderEvent(this.type,this._target,this.text,this.data);
      }
      
      override public function get target() : Object
      {
         if(this._ready)
         {
            return this._target;
         }
         this._ready = true;
         return null;
      }
   }
}
