package org.gestouch.gestures
{
   import flash.geom.Point;
   import org.gestouch.core.GestureState;
   import org.gestouch.core.Touch;
   
   public class TransformGesture extends AbstractContinuousGesture
   {
       
      
      public var slop:Number;
      
      protected var _touch1:Touch;
      
      protected var _touch2:Touch;
      
      protected var _transformVector:Point;
      
      protected var _offsetX:Number = 0;
      
      protected var _offsetY:Number = 0;
      
      protected var _rotation:Number = 0;
      
      protected var _scale:Number = 1;
      
      public function TransformGesture(target:Object = null)
      {
         this.slop = Gesture.DEFAULT_SLOP;
         super(target);
      }
      
      public function get offsetX() : Number
      {
         return this._offsetX;
      }
      
      public function get offsetY() : Number
      {
         return this._offsetY;
      }
      
      public function get rotation() : Number
      {
         return this._rotation;
      }
      
      public function get scale() : Number
      {
         return this._scale;
      }
      
      override public function reflect() : Class
      {
         return TransformGesture;
      }
      
      override public function reset() : void
      {
         this._touch1 = null;
         this._touch2 = null;
         super.reset();
      }
      
      override protected function onTouchBegin(touch:Touch) : void
      {
         if(touchesCount > 2)
         {
            failOrIgnoreTouch(touch);
            return;
         }
         if(touchesCount == 1)
         {
            this._touch1 = touch;
         }
         else
         {
            this._touch2 = touch;
            this._transformVector = this._touch2.location.subtract(this._touch1.location);
         }
         updateLocation();
         if(state == GestureState.BEGAN || state == GestureState.CHANGED)
         {
            setState(GestureState.CHANGED);
         }
      }
      
      override protected function onTouchMove(touch:Touch) : void
      {
         var currTransformVector:Point = null;
         var prevLocation:Point = _location.clone();
         updateLocation();
         if(state == GestureState.POSSIBLE)
         {
            if(this.slop > 0 && touch.locationOffset.length < this.slop)
            {
               if(this._touch2)
               {
                  this._transformVector = this._touch2.location.subtract(this._touch1.location);
               }
               return;
            }
         }
         if(this._touch2 && !currTransformVector)
         {
            currTransformVector = this._touch2.location.subtract(this._touch1.location);
         }
         this._offsetX = _location.x - prevLocation.x;
         this._offsetY = _location.y - prevLocation.y;
         if(this._touch2)
         {
            this._rotation = Math.atan2(currTransformVector.y,currTransformVector.x) - Math.atan2(this._transformVector.y,this._transformVector.x);
            this._scale = currTransformVector.length / this._transformVector.length;
            this._transformVector = this._touch2.location.subtract(this._touch1.location);
         }
         setState(state == GestureState.POSSIBLE ? GestureState.BEGAN : GestureState.CHANGED);
      }
      
      override protected function onTouchEnd(touch:Touch) : void
      {
         if(touchesCount == 0)
         {
            if(state == GestureState.BEGAN || state == GestureState.CHANGED)
            {
               setState(GestureState.ENDED);
            }
            else if(state == GestureState.POSSIBLE)
            {
               setState(GestureState.FAILED);
            }
         }
         else
         {
            if(touch == this._touch1)
            {
               this._touch1 = this._touch2;
            }
            this._touch2 = null;
            if(state == GestureState.BEGAN || state == GestureState.CHANGED)
            {
               updateLocation();
               setState(GestureState.CHANGED);
            }
         }
      }
      
      override protected function resetNotificationProperties() : void
      {
         super.resetNotificationProperties();
         this._offsetX = this._offsetY = 0;
         this._rotation = 0;
         this._scale = 1;
      }
   }
}
