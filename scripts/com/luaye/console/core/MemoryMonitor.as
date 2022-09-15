package com.luaye.console.core
{
   import flash.events.EventDispatcher;
   import flash.system.System;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   public class MemoryMonitor extends EventDispatcher
   {
       
      
      private var _namesList:Object;
      
      private var _objectsList:Dictionary;
      
      public function MemoryMonitor()
      {
         super();
         this._namesList = new Object();
         this._objectsList = new Dictionary(true);
      }
      
      public function watch(obj:Object, n:String) : String
      {
         var nn:String = null;
         if(this._objectsList[obj])
         {
            if(this._namesList[this._objectsList[obj]])
            {
               this.unwatch(this._objectsList[obj]);
            }
         }
         if(this._namesList[n] && this._objectsList[obj] != n)
         {
            nn = n + "@" + getTimer() + "_" + Math.floor(Math.random() * 100);
            n = nn;
         }
         this._namesList[n] = true;
         this._objectsList[obj] = n;
         return n;
      }
      
      public function unwatch(n:String) : void
      {
         var X:* = null;
         for(X in this._objectsList)
         {
            if(this._objectsList[X] == n)
            {
               delete this._objectsList[X];
            }
         }
         delete this._namesList[n];
      }
      
      public function update() : Array
      {
         var X:* = null;
         var Y:* = null;
         var arr:Array = new Array();
         var o:Object = new Object();
         for(X in this._objectsList)
         {
            o[this._objectsList[X]] = true;
         }
         for(Y in this._namesList)
         {
            if(!o[Y])
            {
               arr.push(Y);
               delete this._namesList[Y];
            }
         }
         return arr;
      }
      
      public function gc() : Boolean
      {
         if(System["gc"] != null)
         {
            System["gc"]();
            return true;
         }
         return false;
      }
   }
}
