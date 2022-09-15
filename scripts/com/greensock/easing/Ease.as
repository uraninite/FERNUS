package com.greensock.easing
{
   public class Ease
   {
      
      protected static var _baseParams:Array = [0,0,1,1];
       
      
      protected var _func:Function;
      
      protected var _params:Array;
      
      protected var _p1:Number;
      
      protected var _p2:Number;
      
      protected var _p3:Number;
      
      public var _type:int;
      
      public var _power:int;
      
      public var _calcEnd:Boolean;
      
      public function Ease(func:Function = null, extraParams:Array = null, type:Number = 0, power:Number = 0)
      {
         super();
         this._func = func;
         this._params = !!extraParams ? _baseParams.concat(extraParams) : _baseParams;
         this._type = type;
         this._power = power;
      }
      
      public function getRatio(p:Number) : Number
      {
         var r:Number = NaN;
         if(this._func != null)
         {
            this._params[0] = p;
            return this._func.apply(null,this._params);
         }
         r = this._type == 1 ? Number(1 - p) : (this._type == 2 ? Number(p) : (p < 0.5 ? Number(p * 2) : Number((1 - p) * 2)));
         if(this._power == 1)
         {
            r *= r;
         }
         else if(this._power == 2)
         {
            r *= r * r;
         }
         else if(this._power == 3)
         {
            r *= r * r * r;
         }
         else if(this._power == 4)
         {
            r *= r * r * r * r;
         }
         return this._type == 1 ? Number(1 - r) : (this._type == 2 ? Number(r) : (p < 0.5 ? Number(r / 2) : Number(1 - r / 2)));
      }
   }
}
