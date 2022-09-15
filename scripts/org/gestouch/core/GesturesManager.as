package org.gestouch.core
{
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Stage;
   import flash.errors.IllegalOperationError;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   import org.gestouch.extensions.native.NativeTouchHitTester;
   import org.gestouch.gestures.Gesture;
   import org.gestouch.input.NativeInputAdapter;
   
   public class GesturesManager
   {
       
      
      protected const _frameTickerShape:Shape = new Shape();
      
      protected var _gesturesMap:Dictionary;
      
      protected var _gesturesForTouchMap:Dictionary;
      
      protected var _gesturesForTargetMap:Dictionary;
      
      protected var _dirtyGesturesCount:uint = 0;
      
      protected var _dirtyGesturesMap:Dictionary;
      
      protected var _stage:Stage;
      
      public function GesturesManager()
      {
         this._gesturesMap = new Dictionary(true);
         this._gesturesForTouchMap = new Dictionary();
         this._gesturesForTargetMap = new Dictionary(true);
         this._dirtyGesturesMap = new Dictionary(true);
         super();
      }
      
      protected function onStageAvailable(stage:Stage) : void
      {
         this._stage = stage;
         Gestouch.inputAdapter = Gestouch.inputAdapter || new NativeInputAdapter(stage);
         Gestouch.addTouchHitTester(new NativeTouchHitTester(stage));
      }
      
      protected function resetDirtyGestures() : void
      {
         var gesture:* = null;
         for(gesture in this._dirtyGesturesMap)
         {
            (gesture as Gesture).reset();
         }
         this._dirtyGesturesCount = 0;
         this._dirtyGesturesMap = new Dictionary(true);
         this._frameTickerShape.removeEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
      }
      
      gestouch_internal function addGesture(gesture:Gesture) : void
      {
         var targetAsDO:DisplayObject = null;
         if(!gesture)
         {
            throw new ArgumentError("Argument \'gesture\' must be not null.");
         }
         var target:Object = gesture.target;
         if(!target)
         {
            throw new IllegalOperationError("Gesture must have target.");
         }
         var targetGestures:Vector.<Gesture> = this._gesturesForTargetMap[target] as Vector.<Gesture>;
         if(targetGestures)
         {
            if(targetGestures.indexOf(gesture) == -1)
            {
               targetGestures.push(gesture);
            }
         }
         else
         {
            targetGestures = this._gesturesForTargetMap[target] = new Vector.<Gesture>();
            targetGestures[0] = gesture;
         }
         this._gesturesMap[gesture] = true;
         if(!this._stage)
         {
            targetAsDO = target as DisplayObject;
            if(targetAsDO)
            {
               if(targetAsDO.stage)
               {
                  this.onStageAvailable(targetAsDO.stage);
               }
               else
               {
                  targetAsDO.addEventListener(Event.ADDED_TO_STAGE,this.gestureTarget_addedToStageHandler,false,0,true);
               }
            }
         }
      }
      
      gestouch_internal function removeGesture(gesture:Gesture) : void
      {
         var targetGestures:Vector.<Gesture> = null;
         if(!gesture)
         {
            throw new ArgumentError("Argument \'gesture\' must be not null.");
         }
         var target:Object = gesture.target;
         if(target)
         {
            targetGestures = this._gesturesForTargetMap[target] as Vector.<Gesture>;
            if(targetGestures.length > 1)
            {
               targetGestures.splice(targetGestures.indexOf(gesture),1);
            }
            else
            {
               delete this._gesturesForTargetMap[target];
               if(target is IEventDispatcher)
               {
                  (target as IEventDispatcher).removeEventListener(Event.ADDED_TO_STAGE,this.gestureTarget_addedToStageHandler);
               }
            }
         }
         delete this._gesturesMap[gesture];
         gesture.reset();
      }
      
      gestouch_internal function scheduleGestureStateReset(gesture:Gesture) : void
      {
         if(!this._dirtyGesturesMap[gesture])
         {
            this._dirtyGesturesMap[gesture] = true;
            ++this._dirtyGesturesCount;
            this._frameTickerShape.addEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
         }
      }
      
      gestouch_internal function onGestureRecognized(gesture:Gesture) : void
      {
         var key:* = null;
         var otherGesture:Gesture = null;
         var otherTarget:Object = null;
         var target:Object = gesture.target;
         for(key in this._gesturesMap)
         {
            otherGesture = key as Gesture;
            otherTarget = otherGesture.target;
            if(otherGesture != gesture && target && otherTarget && otherGesture.enabled && otherGesture.state == GestureState.POSSIBLE)
            {
               if(otherTarget == target || gesture.targetAdapter.contains(otherTarget) || otherGesture.targetAdapter.contains(target))
               {
                  if(gesture.canPreventGesture(otherGesture) && otherGesture.canBePreventedByGesture(gesture) && (gesture.gesturesShouldRecognizeSimultaneouslyCallback == null || !gesture.gesturesShouldRecognizeSimultaneouslyCallback(gesture,otherGesture)) && (otherGesture.gesturesShouldRecognizeSimultaneouslyCallback == null || !otherGesture.gesturesShouldRecognizeSimultaneouslyCallback(otherGesture,gesture)))
                  {
                     otherGesture.setState_internal(GestureState.FAILED);
                  }
               }
            }
         }
      }
      
      gestouch_internal function onTouchBegin(touch:Touch) : void
      {
         var gesture:Gesture = null;
         var i:uint = 0;
         var target:Object = null;
         var hierarchy:Vector.<Object> = null;
         var gesturesForTarget:Vector.<Gesture> = null;
         var gesturesForTouch:Vector.<Gesture> = this._gesturesForTouchMap[touch] as Vector.<Gesture>;
         if(!gesturesForTouch)
         {
            gesturesForTouch = new Vector.<Gesture>();
            this._gesturesForTouchMap[touch] = gesturesForTouch;
         }
         else
         {
            gesturesForTouch.length = 0;
         }
         target = touch.target;
         var displayListAdapter:IDisplayListAdapter = Gestouch.gestouch_internal::getDisplayListAdapter(target);
         if(!displayListAdapter)
         {
            throw new Error("Display list adapter not found for target of type \'" + getQualifiedClassName(target) + "\'.");
         }
         hierarchy = displayListAdapter.getHierarchy(target);
         var hierarchyLength:uint = hierarchy.length;
         if(hierarchyLength == 0)
         {
            throw new Error("No hierarchy build for target \'" + target + "\'. Something is wrong with that IDisplayListAdapter.");
         }
         if(this._stage && !(hierarchy[hierarchyLength - 1] is Stage))
         {
            hierarchy[hierarchyLength] = this._stage;
         }
         for each(target in hierarchy)
         {
            gesturesForTarget = this._gesturesForTargetMap[target] as Vector.<Gesture>;
            if(gesturesForTarget)
            {
               i = gesturesForTarget.length;
               while(i-- > 0)
               {
                  gesture = gesturesForTarget[i];
                  if(gesture.enabled && (gesture.gestureShouldReceiveTouchCallback == null || gesture.gestureShouldReceiveTouchCallback(gesture,touch)))
                  {
                     gesturesForTouch.unshift(gesture);
                  }
               }
            }
         }
         i = gesturesForTouch.length;
         while(i-- > 0)
         {
            gesture = gesturesForTouch[i];
            if(!this._dirtyGesturesMap[gesture])
            {
               gesture.touchBeginHandler(touch);
            }
            else
            {
               gesturesForTouch.splice(i,1);
            }
         }
      }
      
      gestouch_internal function onTouchMove(touch:Touch) : void
      {
         var gesture:Gesture = null;
         var gesturesForTouch:Vector.<Gesture> = this._gesturesForTouchMap[touch] as Vector.<Gesture>;
         var i:uint = gesturesForTouch.length;
         while(i-- > 0)
         {
            gesture = gesturesForTouch[i];
            if(!this._dirtyGesturesMap[gesture] && gesture.isTrackingTouch(touch.id))
            {
               gesture.touchMoveHandler(touch);
            }
            else
            {
               gesturesForTouch.splice(i,1);
            }
         }
      }
      
      gestouch_internal function onTouchEnd(touch:Touch) : void
      {
         var gesture:Gesture = null;
         var gesturesForTouch:Vector.<Gesture> = this._gesturesForTouchMap[touch] as Vector.<Gesture>;
         var i:uint = gesturesForTouch.length;
         while(i-- > 0)
         {
            gesture = gesturesForTouch[i];
            if(!this._dirtyGesturesMap[gesture] && gesture.isTrackingTouch(touch.id))
            {
               gesture.touchEndHandler(touch);
            }
         }
         gesturesForTouch.length = 0;
         delete this._gesturesForTouchMap[touch];
      }
      
      gestouch_internal function onTouchCancel(touch:Touch) : void
      {
         var gesture:Gesture = null;
         var gesturesForTouch:Vector.<Gesture> = this._gesturesForTouchMap[touch] as Vector.<Gesture>;
         var i:uint = gesturesForTouch.length;
         while(i-- > 0)
         {
            gesture = gesturesForTouch[i];
            if(!this._dirtyGesturesMap[gesture] && gesture.isTrackingTouch(touch.id))
            {
               gesture.touchCancelHandler(touch);
            }
         }
         gesturesForTouch.length = 0;
         delete this._gesturesForTouchMap[touch];
      }
      
      protected function gestureTarget_addedToStageHandler(event:Event) : void
      {
         var target:DisplayObject = event.target as DisplayObject;
         target.removeEventListener(Event.ADDED_TO_STAGE,this.gestureTarget_addedToStageHandler);
         if(!this._stage)
         {
            this.onStageAvailable(target.stage);
         }
      }
      
      private function enterFrameHandler(event:Event) : void
      {
         this.resetDirtyGestures();
      }
   }
}
