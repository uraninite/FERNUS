package com.kxk
{
   import air.net.URLMonitor;
   import flash.desktop.NativeApplication;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.StatusEvent;
   import flash.net.URLRequest;
   
   public class Network
   {
      
      private static var _urlMonitor:URLMonitor;
      
      private static var _status:Boolean = true;
      
      private static var _dispatcher:EventDispatcher;
       
      
      public function Network()
      {
         super();
      }
      
      public static function initialize() : void
      {
         _dispatcher = new EventDispatcher();
         _urlMonitor = new URLMonitor(new URLRequest("http://www.google.com"));
         _urlMonitor.addEventListener(StatusEvent.STATUS,announceStatus);
         NativeApplication.nativeApplication.addEventListener(Event.NETWORK_CHANGE,onNetworkChange);
         monitorConnection();
      }
      
      private static function monitorConnection() : void
      {
         _urlMonitor.start();
      }
      
      public static function get status() : Boolean
      {
         return _status;
      }
      
      private static function announceStatus(e:StatusEvent) : void
      {
         if(_urlMonitor.available)
         {
            _status = true;
         }
         else
         {
            _status = false;
         }
         _dispatcher.dispatchEvent(new Event(Event.CHANGE));
      }
      
      private static function onNetworkChange(event:Event) : void
      {
         monitorConnection();
      }
      
      public static function addEventListener(type:String, listener:Function) : void
      {
         _dispatcher.addEventListener(type,listener);
      }
      
      public static function removeEventListener(type:String, listener:Function) : void
      {
         _dispatcher.removeEventListener(type,listener);
      }
      
      public static function hasEventListener(type:String) : Boolean
      {
         return _dispatcher.hasEventListener(type);
      }
   }
}
