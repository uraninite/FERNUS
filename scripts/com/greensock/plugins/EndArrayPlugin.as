package com.greensock.plugins
{
   import com.greensock.TweenLite;
   
   public class EndArrayPlugin extends TweenPlugin
   {
      
      public static const API:Number = 2;
       
      
      protected var _a:Array;
      
      protected var _round:Boolean;
      
      protected var _info:Array;
      
      public function EndArrayPlugin()
      {
         this._info = [];
         super("endArray");
      }
      
      override public function _onInitTween(target:Object, value:*, tween:TweenLite) : Boolean
      {
         if(!(target is Array) || !(value is Array))
         {
            return false;
         }
         this._init(target as Array,value);
         return true;
      }
      
      public function _init(start:Array, end:Array) : void
      {
         this._a = start;
         var i:int = end.length;
         var cnt:int = 0;
         while(--i > -1)
         {
            if(start[i] != end[i] && start[i] != null)
            {
               var _loc5_:*;
               this._info[_loc5_ = cnt++] = new ArrayTweenInfo(i,this._a[i],end[i] - this._a[i]);
            }
         }
      }
      
      override public function _roundProps(lookup:Object, value:Boolean = true) : void
      {
         if("endArray" in lookup)
         {
            this._round = value;
         }
      }
      
      override public function setRatio(v:Number) : void
      {
         var ti:ArrayTweenInfo = null;
         var val:Number = NaN;
         var i:int = this._info.length;
         if(this._round)
         {
            while(--i > -1)
            {
               ti = this._info[i];
               this._a[ti.i] = (val = ti.c * v + ti.s) > 0 ? val + 0.5 >> 0 : val - 0.5 >> 0;
            }
         }
         else
         {
            while(--i > -1)
            {
               ti = this._info[i];
               this._a[ti.i] = ti.c * v + ti.s;
            }
         }
      }
   }
}

class ArrayTweenInfo
{
    
   
   public var i:uint;
   
   public var s:Number;
   
   public var c:Number;
   
   function ArrayTweenInfo(index:uint, start:Number, change:Number)
   {
      super();
      this.i = index;
      this.s = start;
      this.c = change;
   }
}
