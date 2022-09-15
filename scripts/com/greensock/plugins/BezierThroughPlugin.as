package com.greensock.plugins
{
   import com.greensock.TweenLite;
   
   public class BezierThroughPlugin extends BezierPlugin
   {
      
      public static const API:Number = 2;
       
      
      public function BezierThroughPlugin()
      {
         super();
         _propName = "bezierThrough";
      }
      
      override public function _onInitTween(target:Object, value:*, tween:TweenLite) : Boolean
      {
         if(value is Array)
         {
            value = {"values":value};
         }
         value.type = "thru";
         return super._onInitTween(target,value,tween);
      }
   }
}
