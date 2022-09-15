package com.greensock.plugins
{
   import com.greensock.TweenLite;
   import flash.filters.DropShadowFilter;
   
   public class DropShadowFilterPlugin extends FilterPlugin
   {
      
      public static const API:Number = 2;
      
      private static var _propNames:Array = ["distance","angle","color","alpha","blurX","blurY","strength","quality","inner","knockout","hideObject"];
       
      
      public function DropShadowFilterPlugin()
      {
         super("dropShadowFilter");
      }
      
      override public function _onInitTween(target:Object, value:*, tween:TweenLite) : Boolean
      {
         return _initFilter(target,value,tween,DropShadowFilter,new DropShadowFilter(0,45,0,0,0,0,1,int(value.quality) || 2,value.inner,value.knockout,value.hideObject),_propNames);
      }
   }
}
