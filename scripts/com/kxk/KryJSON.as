package com.kxk
{
   import com.greensock.events.LoaderEvent;
   import com.greensock.loading.DataLoader;
   import flash.events.EventDispatcher;
   
   public class KryJSON extends EventDispatcher
   {
       
      
      private var _jsonLoader:DataLoader;
      
      private var _dispose:Boolean;
      
      public var onComplete:Function;
      
      public var onError:Function;
      
      public function KryJSON(_url:Object, _dispose:Boolean = false)
      {
         this.onComplete = new Function();
         this.onError = new Function();
         trace(this,JSON.stringify(_url));
         this._dispose = _dispose;
         this._jsonLoader = new DataLoader(_url,{
            "onComplete":this.onJSONLoaded,
            "onError":this.onJSONError
         });
         super();
      }
      
      public function start() : void
      {
         this._jsonLoader.load(true);
      }
      
      private function onJSONLoaded(e:LoaderEvent) : void
      {
         var _o:* = undefined;
         trace(this,e.target.content);
         try
         {
            _o = JSON.parse(e.target.content);
         }
         catch(e:*)
         {
            onJSONError();
            return;
         }
      }
      
      private function onJSONError(e:LoaderEvent = null) : void
      {
         this.onError();
         if(this._dispose)
         {
            this.dispose();
         }
      }
      
      public function dispose() : void
      {
         if(this._jsonLoader)
         {
            this._jsonLoader.dispose(true);
            this._jsonLoader = null;
         }
      }
      
      public function get status() : int
      {
         return this._jsonLoader.status;
      }
   }
}
