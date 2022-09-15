package com.greensock.plugins
{
   import com.greensock.TweenLite;
   import flash.display.MovieClip;
   
   public class FrameLabelPlugin extends FramePlugin
   {
      
      public static const API:Number = 2;
       
      
      public function FrameLabelPlugin()
      {
         super();
         _propName = "frameLabel";
      }
      
      override public function _onInitTween(target:Object, value:*, tween:TweenLite) : Boolean
      {
         if(!tween.target is MovieClip)
         {
            return false;
         }
         _target = target as MovieClip;
         this.frame = _target.currentFrame;
         var labels:Array = _target.currentLabels;
         var label:String = value;
         var endFrame:int = _target.currentFrame;
         var i:int = labels.length;
         while(--i > -1)
         {
            if(labels[i].name == label)
            {
               endFrame = labels[i].frame;
               break;
            }
         }
         if(this.frame != endFrame)
         {
            _addTween(this,"frame",this.frame,endFrame,"frame",true);
         }
         return true;
      }
   }
}
