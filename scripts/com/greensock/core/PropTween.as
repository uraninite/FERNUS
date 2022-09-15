package com.greensock.core
{
   public final class PropTween
   {
       
      
      public var t:Object;
      
      public var p:String;
      
      public var s:Number;
      
      public var c:Number;
      
      public var f:Boolean;
      
      public var pr:int;
      
      public var pg:Boolean;
      
      public var n:String;
      
      public var r:Boolean;
      
      public var _next:PropTween;
      
      public var _prev:PropTween;
      
      public function PropTween(target:Object, property:String, start:Number, change:Number, name:String, isPlugin:Boolean, next:PropTween = null, priority:int = 0)
      {
         super();
         this.t = target;
         this.p = property;
         this.s = start;
         this.c = change;
         this.n = name;
         this.f = target[property] is Function;
         this.pg = isPlugin;
         if(next)
         {
            next._prev = this;
            this._next = next;
         }
         this.pr = priority;
      }
   }
}
