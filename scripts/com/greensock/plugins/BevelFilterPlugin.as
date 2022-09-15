package com.greensock.plugins
{
   import com.greensock.TweenLite;
   import flash.filters.BevelFilter;
   
   public class BevelFilterPlugin extends FilterPlugin
   {
      
      public static const API:Number = 2;
      
      private static var _propNames:Array = ["distance","angle","highlightColor","highlightAlpha","shadowColor","shadowAlpha","blurX","blurY","strength","quality"];
       
      
      public function BevelFilterPlugin()
      {
         super("bevelFilter");
      }
      
      override public function _onInitTween(target:Object, value:*, tween:TweenLite) : Boolean
      {
         return _initFilter(target,value,tween,BevelFilter,new BevelFilter(0,0,16777215,0.5,0,0.5,2,2,0,int(value.quality) || 2),_propNames);
      }
   }
}
