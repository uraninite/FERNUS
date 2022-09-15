package com.greensock.plugins
{
   import com.greensock.TweenLite;
   
   public class VisiblePlugin extends TweenPlugin
   {
      
      public static const API:Number = 2;
       
      
      protected var _target:Object;
      
      protected var _tween:TweenLite;
      
      protected var _visible:Boolean;
      
      protected var _initVal:Boolean;
      
      protected var _progress:int;
      
      public function VisiblePlugin()
      {
         super("visible");
      }
      
      override public function _onInitTween(target:Object, value:*, tween:TweenLite) : Boolean
      {
         this._target = target;
         this._tween = tween;
         this._progress = !!this._tween.vars.runBackwards ? 0 : 1;
         this._initVal = this._target.visible;
         this._visible = Boolean(value);
         return true;
      }
      
      override public function setRatio(v:Number) : void
      {
         this._target.visible = v == 1 && (this._tween._time / this._tween._duration == this._progress || this._tween._duration == 0) ? this._visible : this._initVal;
      }
   }
}
