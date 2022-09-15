package com.greensock.utils
{
   import com.greensock.core.Animation;
   import flash.events.Event;
   import flash.utils.getTimer;
   
   public final class VelocityTracker
   {
      
      public static var _first:VelocityTracker;
      
      public static var _initted:Boolean;
      
      public static var _time1:Number;
      
      public static var _time2:Number;
       
      
      public var target:Object;
      
      public var _firstVP:VelocityProp;
      
      public var _next:VelocityTracker;
      
      public var _prev:VelocityTracker;
      
      public var _lookup:Object;
      
      public function VelocityTracker(target:Object)
      {
         super();
         this._lookup = {};
         this.target = target;
         if(!_initted)
         {
            Animation.ticker.addEventListener(Event.ENTER_FRAME,_update,false,-100,true);
            _time1 = _time2 = getTimer();
            _initted = true;
         }
         if(_first)
         {
            this._next = _first;
            _first._prev = this;
         }
         _first = this;
      }
      
      private static function _update(event:Event) : void
      {
         var val:Number = NaN;
         var vp:VelocityProp = null;
         var vt:VelocityTracker = _first;
         var t:uint = getTimer();
         if(t - _time1 >= 30)
         {
            _time2 = _time1;
            _time1 = t;
            while(vt)
            {
               vp = vt._firstVP;
               while(vp)
               {
                  val = !!vp.f ? Number(vt.target[vp.p]()) : Number(vt.target[vp.p]);
                  if(val !== vp.v1 || t - vp.t1 > 90)
                  {
                     vp.v2 = vp.v1;
                     vp.v1 = val;
                     vp.t2 = vp.t1;
                     vp.t1 = t;
                  }
                  vp = vp._next;
               }
               vt = vt._next;
            }
         }
      }
      
      public static function getByTarget(target:Object) : VelocityTracker
      {
         var vt:VelocityTracker = _first;
         while(vt)
         {
            if(vt.target === target)
            {
               return vt;
            }
            vt = vt._next;
         }
         return null;
      }
      
      public static function track(target:Object, props:String, types:String = "num") : VelocityTracker
      {
         var vt:VelocityTracker = getByTarget(target);
         var a:Array = props.split(",");
         var t:Array = (types || "").split(",");
         var i:int = a.length;
         if(vt == null)
         {
            vt = new VelocityTracker(target);
         }
         while(--i > -1)
         {
            vt.addProp(a[i],t[i] || t[0]);
         }
         return vt;
      }
      
      public static function untrack(target:Object, props:String = null) : void
      {
         var vt:VelocityTracker = getByTarget(target);
         var a:Array = String(props || "").split(",");
         var i:int = a.length;
         if(vt == null)
         {
            return;
         }
         while(--i > -1)
         {
            vt.removeProp(a[i]);
         }
         if(!vt._firstVP || props == null)
         {
            if(vt._prev)
            {
               vt._prev._next = vt._next;
            }
            else if(vt == _first)
            {
               _first = vt._next;
            }
            if(vt._next)
            {
               vt._next._prev = vt._prev;
            }
         }
      }
      
      public static function isTracking(target:Object, prop:String = null) : Boolean
      {
         var vt:VelocityTracker = getByTarget(target);
         return vt == null ? false : (prop == null && vt._firstVP ? true : Boolean(vt.isTrackingProp(prop)));
      }
      
      public function addProp(prop:String, type:String = "num") : void
      {
         var isFunc:* = false;
         var alt:String = null;
         if(!this._lookup[prop])
         {
            isFunc = typeof this.target[prop] === "function";
            alt = !!isFunc ? this._altProp(prop) : prop;
            this._firstVP = this._lookup[prop] = this._lookup[alt] = new VelocityProp(alt !== prop && prop.indexOf("set") === 0 ? alt : prop,isFunc,this._firstVP);
            this._firstVP.v1 = this._firstVP.v2 = !!isFunc ? Number(this.target[this._firstVP.p]()) : Number(this.target[this._firstVP.p]);
            this._firstVP.type = type;
         }
      }
      
      public function removeProp(prop:String) : void
      {
         var vp:VelocityProp = this._lookup[prop];
         if(vp != null)
         {
            if(vp._prev)
            {
               vp._prev._next = vp._next;
            }
            else if(vp === this._firstVP)
            {
               this._firstVP = vp._next;
            }
            if(vp._next)
            {
               vp._next._prev = vp._prev;
            }
            this._lookup[prop] = 0;
            if(vp.f)
            {
               this._lookup[this._altProp(prop)] = 0;
            }
         }
      }
      
      private function _altProp(p:String) : String
      {
         var pre:String = p.substr(0,3);
         var alt:String = (pre === "get" ? "set" : (pre === "set" ? "get" : pre)) + p.substr(3);
         return typeof this.target[alt] === "function" ? alt : p;
      }
      
      public function isTrackingProp(prop:String) : Boolean
      {
         return this._lookup[prop] is VelocityProp;
      }
      
      public function getVelocity(prop:String) : Number
      {
         var dif:Number = NaN;
         var rotationCap:Number = NaN;
         var vp:VelocityProp = this._lookup[prop];
         if(!vp)
         {
            throw new Error("The velocity of " + prop + " is not being tracked.");
         }
         dif = vp.v1 - vp.v2;
         if(vp.type === "rad" || vp.type === "deg")
         {
            rotationCap = vp.type === "rad" ? Number(Math.PI * 2) : Number(360);
            dif %= rotationCap;
            if(dif !== dif % (rotationCap / 2))
            {
               dif = dif < 0 ? Number(dif + rotationCap) : Number(dif - rotationCap);
            }
         }
         return dif / ((_time1 - _time2) / 1000);
      }
   }
}

import flash.utils.getTimer;

class VelocityProp
{
    
   
   public var p:String;
   
   public var f:Boolean;
   
   public var v1:Number;
   
   public var v2:Number;
   
   public var t1:Number;
   
   public var t2:Number;
   
   public var type:String;
   
   public var _next:VelocityProp;
   
   public var _prev:VelocityProp;
   
   function VelocityProp(p:String, isFunc:Boolean, next:VelocityProp = null)
   {
      super();
      this.p = p;
      this.f = isFunc;
      this.t1 = this.t2 = getTimer();
      if(next)
      {
         this._next = next;
         next._prev = this;
      }
   }
}
