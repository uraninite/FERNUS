package com.greensock.plugins
{
   import com.greensock.TweenLite;
   import flash.display.MovieClip;
   
   public class FramePlugin extends TweenPlugin
   {
      
      public static const API:Number = 2;
       
      
      public var frame:int;
      
      protected var _target:MovieClip;
      
      public function FramePlugin()
      {
         super("frame,frameLabel,frameForward,frameBackward");
      }
      
      override public function _onInitTween(target:Object, value:*, tween:TweenLite) : Boolean
      {
         if(!(target is MovieClip) || isNaN(value))
         {
            return false;
         }
         this._target = target as MovieClip;
         this.frame = this._target.currentFrame;
         _addTween(this,"frame",this.frame,value,"frame",true);
         return true;
      }
      
      override public function setRatio(v:Number) : void
      {
         super.setRatio(v);
         if(this.frame != this._target.currentFrame)
         {
            this._target.gotoAndStop(this.frame);
         }
      }
   }
}
