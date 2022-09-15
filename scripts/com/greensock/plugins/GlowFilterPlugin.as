package com.greensock.plugins
{
   import com.greensock.TweenLite;
   import flash.filters.GlowFilter;
   
   public class GlowFilterPlugin extends FilterPlugin
   {
      
      public static const API:Number = 2;
      
      private static var _propNames:Array = ["color","alpha","blurX","blurY","strength","quality","inner","knockout"];
       
      
      public function GlowFilterPlugin()
      {
         super("glowFilter");
      }
      
      override public function _onInitTween(target:Object, value:*, tween:TweenLite) : Boolean
      {
         return _initFilter(target,value,tween,GlowFilter,new GlowFilter(16777215,0,0,0,Number(value.strength) || Number(1),int(value.quality) || 2,value.inner,value.knockout),_propNames);
      }
   }
}
