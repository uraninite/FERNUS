package com.greensock.plugins
{
   import com.greensock.TweenLite;
   import com.greensock.easing.Ease;
   import com.greensock.utils.VelocityTracker;
   
   public class ThrowPropsPlugin extends TweenPlugin
   {
      
      public static const API:Number = 2;
      
      public static var defaultResistance:Number = 100;
      
      private static var _max:Number = 999999999999999;
      
      private static var _min:Number = 1e-10;
       
      
      protected var _target:Object;
      
      protected var _props:Array;
      
      protected var _tween:TweenLite;
      
      protected var _invertEase:Boolean;
      
      public function ThrowPropsPlugin()
      {
         super("throwProps");
         _overwriteProps.length = 0;
      }
      
      public static function track(target:Object, props:String, types:String = "") : VelocityTracker
      {
         return VelocityTracker.track(target,props);
      }
      
      public static function untrack(target:Object, props:String = null) : void
      {
         VelocityTracker.untrack(target,props);
      }
      
      public static function isTracking(target:Object, prop:String = null) : Boolean
      {
         return VelocityTracker.isTracking(target,prop);
      }
      
      public static function getVelocity(target:Object, prop:String) : Number
      {
         var vt:VelocityTracker = VelocityTracker.getByTarget(target);
         return vt != null ? Number(vt.getVelocity(prop)) : Number(NaN);
      }
      
      protected static function _getClosest(n:Number, values:Array, max:Number, min:Number) : Number
      {
         var val:Number = NaN;
         var dif:Number = NaN;
         var i:int = values.length;
         var closest:int = 0;
         var absDif:Number = _max;
         while(--i > -1)
         {
            val = values[i];
            dif = val - n;
            if(dif < 0)
            {
               dif = -dif;
            }
            if(dif < absDif && val >= min && val <= max)
            {
               closest = i;
               absDif = dif;
            }
         }
         return values[closest];
      }
      
      protected static function _parseEnd(curProp:Object, end:Number, max:Number, min:Number) : Object
      {
         if(curProp.end === "auto")
         {
            return curProp;
         }
         max = !!isNaN(max) ? Number(_max) : Number(max);
         min = !!isNaN(min) ? Number(-_max) : Number(min);
         var adjustedEnd:Number = typeof curProp.end === "function" ? Number(curProp.end(end)) : (curProp.end is Array ? Number(_getClosest(end,curProp.end,max,min)) : Number(Number(curProp.end)));
         if(adjustedEnd > max)
         {
            adjustedEnd = max;
         }
         else if(adjustedEnd < min)
         {
            adjustedEnd = min;
         }
         return {
            "max":adjustedEnd,
            "min":adjustedEnd
         };
      }
      
      public static function to(target:Object, vars:Object, maxDuration:Number = 100, minDuration:Number = 0.25, overshootTolerance:Number = 1) : TweenLite
      {
         if(!("throwProps" in vars))
         {
            vars = {"throwProps":vars};
         }
         if(overshootTolerance === 0)
         {
            vars.throwProps.preventOvershoot = true;
         }
         return new TweenLite(target,calculateTweenDuration(target,vars,maxDuration,minDuration,overshootTolerance),vars);
      }
      
      public static function calculateChange(velocity:Number, ease:*, duration:Number, checkpoint:Number = 0.05) : Number
      {
         var e:Ease = ease is Ease ? Ease(ease) : (ease is Function ? new Ease(Function(ease)) : TweenLite.defaultEase);
         return duration * checkpoint * velocity / e.getRatio(checkpoint);
      }
      
      public static function calculateDuration(start:Number, end:Number, velocity:Number, ease:*, checkpoint:Number = 0.05) : Number
      {
         var e:Ease = ease is Ease ? Ease(ease) : (ease is Function ? new Ease(ease as Function) : TweenLite.defaultEase);
         return Math.abs((end - start) * e.getRatio(checkpoint) / velocity / checkpoint);
      }
      
      public static function calculateTweenDuration(target:Object, vars:Object, maxDuration:Number = 10, minDuration:Number = 0.2, overshootTolerance:Number = 1) : Number
      {
         var curProp:Object = null;
         var curDuration:Number = NaN;
         var curVelocity:Number = NaN;
         var curResistance:Number = NaN;
         var curVal:Number = NaN;
         var end:Number = NaN;
         var curClippedDuration:Number = NaN;
         var tracker:VelocityTracker = null;
         var p:* = null;
         var duration:Number = 0;
         var clippedDuration:Number = 9999999999;
         var throwPropsVars:Object = "throwProps" in vars ? vars.throwProps : vars;
         var ease:Ease = vars.ease is Ease ? Ease(vars.ease) : (vars.ease is Function ? new Ease(vars.ease as Function) : TweenLite.defaultEase);
         var checkpoint:Number = "checkpoint" in throwPropsVars ? Number(Number(throwPropsVars.checkpoint)) : Number(0.05);
         var resistance:Number = "resistance" in throwPropsVars ? Number(Number(throwPropsVars.resistance)) : Number(defaultResistance);
         for(p in throwPropsVars)
         {
            if(p != "resistance" && p != "checkpoint" && p !== "preventOvershoot")
            {
               curProp = throwPropsVars[p];
               if(typeof curProp !== "object")
               {
                  tracker = tracker || VelocityTracker.getByTarget(target);
                  if(tracker && tracker.isTrackingProp(p))
                  {
                     curProp = typeof curProp === "number" ? {"velocity":curProp} : {"velocity":tracker.getVelocity(p)};
                  }
                  else
                  {
                     curVelocity = Number(Number(curProp)) || Number(0);
                     curDuration = curVelocity * resistance > 0 ? Number(curVelocity / resistance) : Number(curVelocity / -resistance);
                  }
               }
               if(typeof curProp === "object")
               {
                  if("velocity" in curProp)
                  {
                     curVelocity = Number(Number(curProp.velocity)) || Number(0);
                  }
                  else
                  {
                     tracker = tracker || VelocityTracker.getByTarget(target);
                     curVelocity = tracker && tracker.isTrackingProp(p) ? Number(tracker.getVelocity(p)) : Number(0);
                  }
                  curResistance = "resistance" in curProp ? Number(Number(curProp.resistance)) : Number(resistance);
                  curDuration = curVelocity * curResistance > 0 ? Number(curVelocity / curResistance) : Number(curVelocity / -curResistance);
                  curVal = target[p] is Function ? Number(target[p.indexOf("set") || !("get" + p.substr(3) in target) ? p : "get" + p.substr(3)]()) : Number(target[p]);
                  end = curVal + calculateChange(curVelocity,ease,curDuration,checkpoint);
                  if("end" in curProp)
                  {
                     curProp = _parseEnd(curProp,end,curProp.max,curProp.min);
                  }
                  if("max" in curProp && end > Number(curProp.max) + _min)
                  {
                     curClippedDuration = curVal > curProp.max || curVelocity > -15 && curVelocity < 45 ? Number(minDuration + (maxDuration - minDuration) * 0.1) : Number(calculateDuration(curVal,curProp.max,curVelocity,ease,checkpoint));
                     if(curClippedDuration + overshootTolerance < clippedDuration)
                     {
                        clippedDuration = curClippedDuration + overshootTolerance;
                     }
                  }
                  else if("min" in curProp && end < Number(curProp.min) - _min)
                  {
                     curClippedDuration = curVal < curProp.min || curVelocity > -45 && curVelocity < 15 ? Number(minDuration + (maxDuration - minDuration) * 0.1) : Number(calculateDuration(curVal,curProp.min,curVelocity,ease,checkpoint));
                     if(curClippedDuration + overshootTolerance < clippedDuration)
                     {
                        clippedDuration = curClippedDuration + overshootTolerance;
                     }
                  }
                  if(curClippedDuration > duration)
                  {
                     duration = curClippedDuration;
                  }
               }
               if(curDuration > duration)
               {
                  duration = curDuration;
               }
            }
         }
         if(duration > clippedDuration)
         {
            duration = clippedDuration;
         }
         if(duration > maxDuration)
         {
            return maxDuration;
         }
         if(duration < minDuration)
         {
            return minDuration;
         }
         return duration;
      }
      
      override public function _onInitTween(target:Object, value:*, tween:TweenLite) : Boolean
      {
         var p:* = null;
         var curProp:Object = null;
         var velocity:Number = NaN;
         var change1:Number = NaN;
         var curVal:Number = NaN;
         var isFunc:* = false;
         var end:Number = NaN;
         var change2:Number = NaN;
         var tracker:VelocityTracker = null;
         this._target = target;
         this._props = [];
         var ease:Ease = tween._ease;
         var checkpoint:Number = Number(Number(value.checkpoint)) || Number(0.05);
         var duration:Number = tween._duration;
         var preventOvershoot:Boolean = Boolean(value.preventOvershoot);
         var cnt:uint = 0;
         for(p in value)
         {
            if(p != "resistance" && p != "checkpoint" && p !== "preventOvershoot")
            {
               curProp = value[p];
               if(typeof curProp === "number")
               {
                  velocity = Number(Number(curProp)) || Number(0);
               }
               else if("velocity" in curProp && curProp.velocity !== "auto")
               {
                  velocity = Number(Number(curProp.velocity)) || Number(0);
               }
               else
               {
                  tracker = tracker || VelocityTracker.getByTarget(target);
                  if(tracker && tracker.isTrackingProp(p))
                  {
                     velocity = tracker.getVelocity(p);
                  }
                  else
                  {
                     trace("ERROR: No velocity was defined in the throwProps tween of " + target + " property: " + p);
                     velocity = 0;
                  }
               }
               change1 = calculateChange(velocity,ease,duration,checkpoint);
               change2 = 0;
               isFunc = this._target[p] is Function;
               curVal = !!isFunc ? Number(this._target[p.indexOf("set") || !("get" + p.substr(3) in this._target) ? p : "get" + p.substr(3)]()) : Number(this._target[p]);
               if(typeof curProp != "number")
               {
                  end = curVal + change1;
                  if("end" in curProp)
                  {
                     curProp = _parseEnd(curProp,end,curProp.max,curProp.min);
                  }
                  if("max" in curProp && Number(curProp.max) < end)
                  {
                     if(preventOvershoot || curProp.preventOvershoot)
                     {
                        change1 = curProp.max - curVal;
                     }
                     else
                     {
                        change2 = curProp.max - curVal - change1;
                     }
                  }
                  else if("min" in curProp && Number(curProp.min) > end)
                  {
                     if(preventOvershoot || curProp.preventOvershoot)
                     {
                        change1 = curProp.min - curVal;
                     }
                     else
                     {
                        change2 = curProp.min - curVal - change1;
                     }
                  }
               }
               var _loc20_:*;
               this._props[_loc20_ = cnt++] = new ThrowProp(p,curVal,change1,change2,isFunc);
               _overwriteProps[cnt] = p;
            }
         }
         return true;
      }
      
      override public function _kill(lookup:Object) : Boolean
      {
         var i:int = this._props.length;
         while(--i > -1)
         {
            if(lookup[this._props[i].p] != null)
            {
               this._props.splice(i,1);
            }
         }
         return super._kill(lookup);
      }
      
      override public function _roundProps(lookup:Object, value:Boolean = true) : void
      {
         var i:int = this._props.length;
         while(--i > -1)
         {
            if("throwProps" in lookup || this._props[i].p in lookup)
            {
               this._props[i].r = value;
            }
         }
      }
      
      override public function setRatio(v:Number) : void
      {
         var cp:ThrowProp = null;
         var val:Number = NaN;
         var i:int = this._props.length;
         while(--i > -1)
         {
            cp = this._props[i];
            val = cp.s + cp.c1 * v + cp.c2 * v * v;
            if(cp.r)
            {
               val = val + (val > 0 ? 0.5 : -0.5) | 0;
            }
            if(cp.f)
            {
               this._target[cp.p](val);
            }
            else
            {
               this._target[cp.p] = val;
            }
         }
      }
   }
}

class ThrowProp
{
    
   
   public var p:String;
   
   public var s:Number;
   
   public var c1:Number;
   
   public var c2:Number;
   
   public var f:Boolean;
   
   public var r:Boolean;
   
   function ThrowProp(property:String, start:Number, change1:Number, change2:Number, isFunc:Boolean)
   {
      super();
      this.p = property;
      this.s = start;
      this.c1 = change1;
      this.c2 = change2;
      this.f = isFunc;
   }
}
