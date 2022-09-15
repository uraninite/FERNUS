package com.greensock.plugins
{
   import com.greensock.TweenLite;
   import flash.filters.BlurFilter;
   
   public class BlurFilterPlugin extends FilterPlugin
   {
      
      public static const API:Number = 2;
      
      private static var _propNames:Array = ["blurX","blurY","quality"];
       
      
      public function BlurFilterPlugin()
      {
         super("blurFilter");
      }
      
      override public function _onInitTween(target:Object, value:*, tween:TweenLite) : Boolean
      {
         return _initFilter(target,value,tween,BlurFilter,new BlurFilter(0,0,int(value.quality) || 2),_propNames);
      }
   }
}
