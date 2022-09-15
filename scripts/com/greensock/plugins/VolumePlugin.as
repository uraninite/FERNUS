package com.greensock.plugins
{
   import com.greensock.TweenLite;
   import flash.media.SoundTransform;
   
   public class VolumePlugin extends TweenPlugin
   {
      
      public static const API:Number = 2;
       
      
      protected var _target:Object;
      
      protected var _st:SoundTransform;
      
      public function VolumePlugin()
      {
         super("volume");
      }
      
      override public function _onInitTween(target:Object, value:*, tween:TweenLite) : Boolean
      {
         if(isNaN(value) || target.hasOwnProperty("volume") || !target.hasOwnProperty("soundTransform"))
         {
            return false;
         }
         this._target = target;
         this._st = this._target.soundTransform;
         _addTween(this._st,"volume",this._st.volume,value,"volume");
         return true;
      }
      
      override public function setRatio(v:Number) : void
      {
         super.setRatio(v);
         this._target.soundTransform = this._st;
      }
   }
}
