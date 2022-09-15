package org.gestouch.events
{
   import flash.events.Event;
   import org.gestouch.core.GestureState;
   
   public class GestureEvent extends Event
   {
      
      public static const GESTURE_POSSIBLE:String = "gesturePossible";
      
      public static const GESTURE_RECOGNIZED:String = "gestureRecognized";
      
      public static const GESTURE_BEGAN:String = "gestureBegan";
      
      public static const GESTURE_CHANGED:String = "gestureChanged";
      
      public static const GESTURE_ENDED:String = "gestureEnded";
      
      public static const GESTURE_CANCELLED:String = "gestureCancelled";
      
      public static const GESTURE_FAILED:String = "gestureFailed";
      
      public static const GESTURE_STATE_CHANGE:String = "gestureStateChange";
       
      
      public var newState:GestureState;
      
      public var oldState:GestureState;
      
      public function GestureEvent(type:String, newState:GestureState, oldState:GestureState)
      {
         super(type,false,false);
         this.newState = newState;
         this.oldState = oldState;
      }
      
      override public function clone() : Event
      {
         return new GestureEvent(type,this.newState,this.oldState);
      }
      
      override public function toString() : String
      {
         return formatToString("GestureEvent","type","oldState","newState");
      }
   }
}
