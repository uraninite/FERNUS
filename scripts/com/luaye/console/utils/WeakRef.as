package com.luaye.console.utils
{
   import flash.utils.Dictionary;
   
   public class WeakRef
   {
       
      
      private var _val;
      
      private var _strong:Boolean;
      
      public function WeakRef(ref:*, strong:Boolean = false)
      {
         super();
         if(ref is Function)
         {
            strong = true;
         }
         this._strong = strong;
         this.reference = ref;
      }
      
      public function get reference() : *
      {
         var X:* = undefined;
         if(this._strong)
         {
            return this._val;
         }
         var _loc2_:int = 0;
         var _loc3_:* = this._val;
         for(X in _loc3_)
         {
            return X;
         }
         return null;
      }
      
      public function set reference(ref:*) : void
      {
         if(this._strong)
         {
            this._val = ref;
         }
         else
         {
            this._val = new Dictionary(true);
            this._val[ref] = null;
         }
      }
      
      public function get strong() : Boolean
      {
         return this._strong;
      }
      
      public function set strong(b:Boolean) : void
      {
         var ref:* = undefined;
         if(this._strong != b)
         {
            ref = this.reference;
            this._strong = b;
            this.reference = ref;
         }
      }
   }
}
