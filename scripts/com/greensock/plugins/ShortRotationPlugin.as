package com.greensock.plugins
{
   import com.greensock.TweenLite;
   
   public class ShortRotationPlugin extends TweenPlugin
   {
      
      public static const API:Number = 2;
       
      
      public function ShortRotationPlugin()
      {
         super("shortRotation");
         _overwriteProps.pop();
      }
      
      override public function _onInitTween(target:Object, value:*, tween:TweenLite) : Boolean
      {
         var start:Number = NaN;
         var p:* = null;
         if(typeof value == "number")
         {
            return false;
         }
         var useRadians:Boolean = Boolean(value.useRadians == true);
         for(p in value)
         {
            if(p != "useRadians")
            {
               start = target[p] is Function ? Number(target[p.indexOf("set") || !("get" + p.substr(3) in target) ? p : "get" + p.substr(3)]()) : Number(target[p]);
               this._initRotation(target,p,start,typeof value[p] == "number" ? Number(Number(value[p])) : Number(start + Number(value[p].split("=").join(""))),useRadians);
            }
         }
         return true;
      }
      
      public function _initRotation(target:Object, p:String, start:Number, end:Number, useRadians:Boolean = false) : void
      {
         var cap:Number = !!useRadians ? Number(Math.PI * 2) : Number(360);
         var dif:Number = (end - start) % cap;
         if(dif != dif % (cap / 2))
         {
            dif = dif < 0 ? Number(dif + cap) : Number(dif - cap);
         }
         _addTween(target,p,start,start + dif,p);
         _overwriteProps[_overwriteProps.length] = p;
      }
   }
}
