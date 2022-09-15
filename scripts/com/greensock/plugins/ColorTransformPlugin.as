package com.greensock.plugins
{
   import com.greensock.TweenLite;
   import flash.display.DisplayObject;
   import flash.geom.ColorTransform;
   
   public class ColorTransformPlugin extends TintPlugin
   {
      
      public static const API:Number = 2;
       
      
      public function ColorTransformPlugin()
      {
         super();
         _propName = "colorTransform";
      }
      
      override public function _onInitTween(target:Object, value:*, tween:TweenLite) : Boolean
      {
         var start:ColorTransform = null;
         var p:* = null;
         var ratio:Number = NaN;
         var end:ColorTransform = new ColorTransform();
         if(target is DisplayObject)
         {
            _transform = DisplayObject(target).transform;
            start = _transform.colorTransform;
         }
         else
         {
            if(!(target is ColorTransform))
            {
               return false;
            }
            start = target as ColorTransform;
         }
         if(value is ColorTransform)
         {
            end.concat(value);
         }
         else
         {
            end.concat(start);
         }
         for(p in value)
         {
            if(p == "tint" || p == "color")
            {
               if(value[p] != null)
               {
                  end.color = int(value[p]);
               }
            }
            else if(!(p == "tintAmount" || p == "exposure" || p == "brightness"))
            {
               end[p] = value[p];
            }
         }
         if(!(value is ColorTransform))
         {
            if(!isNaN(value.tintAmount))
            {
               ratio = value.tintAmount / (1 - (end.redMultiplier + end.greenMultiplier + end.blueMultiplier) / 3);
               end.redOffset *= ratio;
               end.greenOffset *= ratio;
               end.blueOffset *= ratio;
               end.redMultiplier = end.greenMultiplier = end.blueMultiplier = 1 - value.tintAmount;
            }
            else if(!isNaN(value.exposure))
            {
               end.redOffset = end.greenOffset = end.blueOffset = 255 * (value.exposure - 1);
               end.redMultiplier = end.greenMultiplier = end.blueMultiplier = 1;
            }
            else if(!isNaN(value.brightness))
            {
               end.redOffset = end.greenOffset = end.blueOffset = Math.max(0,(value.brightness - 1) * 255);
               end.redMultiplier = end.greenMultiplier = end.blueMultiplier = 1 - Math.abs(value.brightness - 1);
            }
         }
         _init(start,end);
         return true;
      }
   }
}
