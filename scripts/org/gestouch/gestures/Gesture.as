package org.gestouch.gestures
{
   import flash.errors.IllegalOperationError;
   import flash.events.EventDispatcher;
   import flash.geom.Point;
   import flash.system.Capabilities;
   import flash.utils.Dictionary;
   import org.gestouch.core.Gestouch;
   import org.gestouch.core.GestureState;
   import org.gestouch.core.GesturesManager;
   import org.gestouch.core.IGestureTargetAdapter;
   import org.gestouch.core.Touch;
   import org.gestouch.core.gestouch_internal;
   import org.gestouch.events.GestureEvent;
   
   use namespace gestouch_internal;
   
   public class Gesture extends EventDispatcher
   {
      
      public static var DEFAULT_SLOP:uint = Math.round(20 / 252 * Capabilities.screenDPI);
       
      
      public var gestureShouldReceiveTouchCallback:Function;
      
      public var gestureShouldBeginCallback:Function;
      
      public var gesturesShouldRecognizeSimultaneouslyCallback:Function;
      
      protected const _gesturesManager:GesturesManager = Gestouch.gesturesManager;
      
      protected var _touchesMap:Object;
      
      protected var _centralPoint:Point;
      
      protected var _gesturesToFail:Dictionary;
      
      protected var _pendingRecognizedState:GestureState;
      
      protected var _targetAdapter:IGestureTargetAdapter;
      
      protected var _enabled:Boolean = true;
      
      protected var _state:GestureState;
      
      protected var _idle:Boolean = true;
      
      protected var _touchesCount:uint = 0;
      
      protected var _location:Point;
      
      public function Gesture(target:Object = null)
      {
         this._touchesMap = {};
         this._centralPoint = new Point();
         this._gesturesToFail = new Dictionary(true);
         this._state = GestureState.POSSIBLE;
         this._location = new Point();
         super();
         this.preinit();
         this.target = target;
      }
      
      gestouch_internal function get targetAdapter() : IGestureTargetAdapter
      {
         return this._targetAdapter;
      }
      
      protected function get targetAdapter() : IGestureTargetAdapter
      {
         return this._targetAdapter;
      }
      
      public function get target() : Object
      {
         return !!this._targetAdapter ? this._targetAdapter.target : null;
      }
      
      public function set target(value:Object) : void
      {
         var target:Object = this.target;
         if(target == value)
         {
            return;
         }
         this.uninstallTarget(target);
         this._targetAdapter = !!value ? Gestouch.createGestureTargetAdapter(value) : null;
         this.installTarget(value);
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function set enabled(value:Boolean) : void
      {
         if(this._enabled == value)
         {
            return;
         }
         this._enabled = value;
         if(!this._enabled)
         {
            if(this.state == GestureState.POSSIBLE)
            {
               this.setState(GestureState.FAILED);
            }
            else if(this.state == GestureState.BEGAN || this.state == GestureState.CHANGED)
            {
               this.setState(GestureState.CANCELLED);
            }
         }
      }
      
      public function get state() : GestureState
      {
         return this._state;
      }
      
      gestouch_internal function get idle() : Boolean
      {
         return this._idle;
      }
      
      public function get touchesCount() : uint
      {
         return this._touchesCount;
      }
      
      public function get location() : Point
      {
         return this._location.clone();
      }
      
      public function reflect() : Class
      {
         throw Error("reflect() is abstract method and must be overridden.");
      }
      
      public function isTrackingTouch(touchID:uint) : Boolean
      {
         return this._touchesMap[touchID] != undefined;
      }
      
      public function reset() : void
      {
         var key:* = undefined;
         var gestureToFail:Gesture = null;
         if(this.idle)
         {
            return;
         }
         var state:GestureState = this.state;
         this._location.x = 0;
         this._location.y = 0;
         this._touchesMap = {};
         this._touchesCount = 0;
         this._idle = true;
         for(key in this._gesturesToFail)
         {
            gestureToFail = key as Gesture;
            gestureToFail.removeEventListener(GestureEvent.GESTURE_STATE_CHANGE,this.gestureToFail_stateChangeHandler);
         }
         this._pendingRecognizedState = null;
         if(state == GestureState.POSSIBLE)
         {
            this.setState(GestureState.FAILED);
         }
         else if(state == GestureState.BEGAN || state == GestureState.CHANGED)
         {
            this.setState(GestureState.CANCELLED);
         }
         else
         {
            this.setState(GestureState.POSSIBLE);
         }
      }
      
      public function dispose() : void
      {
         this.reset();
         this.target = null;
         this.gestureShouldReceiveTouchCallback = null;
         this.gestureShouldBeginCallback = null;
         this.gesturesShouldRecognizeSimultaneouslyCallback = null;
         this._gesturesToFail = null;
      }
      
      gestouch_internal function canBePreventedByGesture(preventingGesture:Gesture) : Boolean
      {
         return true;
      }
      
      gestouch_internal function canPreventGesture(preventedGesture:Gesture) : Boolean
      {
         return true;
      }
      
      public function requireGestureToFail(gesture:Gesture) : void
      {
         if(!gesture)
         {
            throw new ArgumentError();
         }
         this._gesturesToFail[gesture] = true;
      }
      
      protected function preinit() : void
      {
      }
      
      protected function installTarget(target:Object) : void
      {
         if(target)
         {
            this._gesturesManager.addGesture(this);
         }
      }
      
      protected function uninstallTarget(target:Object) : void
      {
         if(target)
         {
            this._gesturesManager.removeGesture(this);
         }
      }
      
      protected function ignoreTouch(touch:Touch) : void
      {
         if(touch.id in this._touchesMap)
         {
            delete this._touchesMap[touch.id];
            --this._touchesCount;
         }
      }
      
      protected function failOrIgnoreTouch(touch:Touch) : void
      {
         if(this.state == GestureState.POSSIBLE)
         {
            this.setState(GestureState.FAILED);
         }
         else
         {
            this.ignoreTouch(touch);
         }
      }
      
      protected function onTouchBegin(touch:Touch) : void
      {
      }
      
      protected function onTouchMove(touch:Touch) : void
      {
      }
      
      protected function onTouchEnd(touch:Touch) : void
      {
      }
      
      protected function onTouchCancel(touch:Touch) : void
      {
      }
      
      protected function setState(newState:GestureState) : Boolean
      {
         var gestureToFail:Gesture = null;
         var key:* = undefined;
         if(this._state == newState && this._state == GestureState.CHANGED)
         {
            if(hasEventListener(GestureEvent.GESTURE_STATE_CHANGE))
            {
               dispatchEvent(new GestureEvent(GestureEvent.GESTURE_STATE_CHANGE,this._state,this._state));
            }
            if(hasEventListener(GestureEvent.GESTURE_CHANGED))
            {
               dispatchEvent(new GestureEvent(GestureEvent.GESTURE_CHANGED,this._state,this._state));
            }
            this.resetNotificationProperties();
            return true;
         }
         if(!this._state.canTransitionTo(newState))
         {
            throw new IllegalOperationError("You cannot change from state " + this._state + " to state " + newState + ".");
         }
         if(newState != GestureState.POSSIBLE)
         {
            this._idle = false;
         }
         if(newState == GestureState.BEGAN || newState == GestureState.RECOGNIZED)
         {
            for(key in this._gesturesToFail)
            {
               gestureToFail = key as Gesture;
               if(!gestureToFail.idle && gestureToFail.state != GestureState.POSSIBLE && gestureToFail.state != GestureState.FAILED)
               {
                  this.setState(GestureState.FAILED);
                  return false;
               }
            }
            for(key in this._gesturesToFail)
            {
               gestureToFail = key as Gesture;
               if(gestureToFail.state == GestureState.POSSIBLE)
               {
                  this._pendingRecognizedState = newState;
                  for(key in this._gesturesToFail)
                  {
                     gestureToFail = key as Gesture;
                     gestureToFail.addEventListener(GestureEvent.GESTURE_STATE_CHANGE,this.gestureToFail_stateChangeHandler,false,0,true);
                  }
                  return false;
               }
            }
            if(this.gestureShouldBeginCallback != null && !this.gestureShouldBeginCallback(this))
            {
               this.setState(GestureState.FAILED);
               return false;
            }
         }
         var oldState:GestureState = this._state;
         this._state = newState;
         if(this._state.isEndState)
         {
            this._gesturesManager.scheduleGestureStateReset(this);
         }
         if(hasEventListener(GestureEvent.GESTURE_STATE_CHANGE))
         {
            dispatchEvent(new GestureEvent(GestureEvent.GESTURE_STATE_CHANGE,this._state,oldState));
         }
         if(hasEventListener(this._state.toEventType()))
         {
            dispatchEvent(new GestureEvent(this._state.toEventType(),this._state,oldState));
         }
         this.resetNotificationProperties();
         if(this._state == GestureState.BEGAN || this._state == GestureState.RECOGNIZED)
         {
            this._gesturesManager.onGestureRecognized(this);
         }
         return true;
      }
      
      gestouch_internal function setState_internal(state:GestureState) : void
      {
         this.setState(state);
      }
      
      protected function updateCentralPoint() : void
      {
         var touchLocation:Point = null;
         var touchID:* = null;
         var x:Number = 0;
         var y:Number = 0;
         for(touchID in this._touchesMap)
         {
            touchLocation = (this._touchesMap[int(touchID)] as Touch).location;
            x += touchLocation.x;
            y += touchLocation.y;
         }
         this._centralPoint.x = x / this._touchesCount;
         this._centralPoint.y = y / this._touchesCount;
      }
      
      protected function updateLocation() : void
      {
         this.updateCentralPoint();
         this._location.x = this._centralPoint.x;
         this._location.y = this._centralPoint.y;
      }
      
      protected function resetNotificationProperties() : void
      {
      }
      
      gestouch_internal function touchBeginHandler(touch:Touch) : void
      {
         this._touchesMap[touch.id] = touch;
         ++this._touchesCount;
         this.onTouchBegin(touch);
         if(this._touchesCount == 1 && this.state == GestureState.POSSIBLE)
         {
            this._idle = false;
         }
      }
      
      gestouch_internal function touchMoveHandler(touch:Touch) : void
      {
         this._touchesMap[touch.id] = touch;
         this.onTouchMove(touch);
      }
      
      gestouch_internal function touchEndHandler(touch:Touch) : void
      {
         delete this._touchesMap[touch.id];
         --this._touchesCount;
         this.onTouchEnd(touch);
      }
      
      gestouch_internal function touchCancelHandler(touch:Touch) : void
      {
         delete this._touchesMap[touch.id];
         --this._touchesCount;
         this.onTouchCancel(touch);
         if(!this.state.isEndState)
         {
            if(this.state == GestureState.BEGAN || this.state == GestureState.CHANGED)
            {
               this.setState(GestureState.CANCELLED);
            }
            else
            {
               this.setState(GestureState.FAILED);
            }
         }
      }
      
      protected function gestureToFail_stateChangeHandler(event:GestureEvent) : void
      {
         var key:* = undefined;
         var gestureToFail:Gesture = null;
         if(!this._pendingRecognizedState || this.state != GestureState.POSSIBLE)
         {
            return;
         }
         if(event.newState == GestureState.FAILED)
         {
            for(key in this._gesturesToFail)
            {
               gestureToFail = key as Gesture;
               if(gestureToFail.state == GestureState.POSSIBLE)
               {
                  return;
               }
            }
            this.setState(this._pendingRecognizedState);
         }
         else if(event.newState != GestureState.POSSIBLE)
         {
            this.setState(GestureState.FAILED);
         }
      }
   }
}
