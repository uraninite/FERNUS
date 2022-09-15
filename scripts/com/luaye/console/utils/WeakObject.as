package com.luaye.console.utils
{
   import flash.utils.Proxy;
   import flash.utils.flash_proxy;
   
   public class WeakObject extends Proxy
   {
       
      
      private var _item:Array;
      
      private var _dir:Object;
      
      public function WeakObject()
      {
         super();
         this._dir = new Object();
      }
      
      public function set(n:String, obj:Object, strong:Boolean = false) : void
      {
         if(obj == null)
         {
            return;
         }
         this._dir[n] = new WeakRef(obj,strong);
      }
      
      public function get(n:String) : Object
      {
         if(this._dir[n])
         {
            return this._dir[n].reference;
         }
         return null;
      }
      
      override flash_proxy function getProperty(n:*) : *
      {
         return this.get(n);
      }
      
      override flash_proxy function callProperty(n:*, ... rest) : *
      {
         var o:Object = this.get(n);
         if(o is Function)
         {
            return (o as Function).apply(this,rest);
         }
         return null;
      }
      
      override flash_proxy function setProperty(n:*, v:*) : void
      {
         this.set(n,v);
      }
      
      override flash_proxy function nextNameIndex(index:int) : int
      {
         var x:* = undefined;
         if(index == 0)
         {
            this._item = new Array();
            for(x in this._dir)
            {
               this._item.push(x);
            }
         }
         if(index < this._item.length)
         {
            return index + 1;
         }
         return 0;
      }
      
      override flash_proxy function nextName(index:int) : String
      {
         return this._item[index - 1];
      }
      
      public function toString() : String
      {
         return "[WeakObject]";
      }
   }
}
