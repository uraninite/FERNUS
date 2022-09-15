package org.gestouch.input
{
   import flash.display.InteractiveObject;
   import flash.display.Stage;
   import flash.events.EventPhase;
   import flash.events.MouseEvent;
   import flash.events.TouchEvent;
   import flash.ui.Multitouch;
   import flash.ui.MultitouchInputMode;
   import org.gestouch.core.IInputAdapter;
   import org.gestouch.core.TouchesManager;
   import org.gestouch.core.gestouch_internal;
   
   use namespace gestouch_internal;
   
   public class NativeInputAdapter implements IInputAdapter
   {
      
      protected static const MOUSE_TOUCH_POINT_ID:uint = 0;
      
      {
         Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
      }
      
      protected var _stage:Stage;
      
      protected var _explicitlyHandleTouchEvents:Boolean;
      
      protected var _explicitlyHandleMouseEvents:Boolean;
      
      protected var _touchesManager:TouchesManager;
      
      public function NativeInputAdapter(stage:Stage, explicitlyHandleTouchEvents:Boolean = false, explicitlyHandleMouseEvents:Boolean = false)
      {
         super();
         if(!stage)
         {
            throw new ArgumentError("Stage must be not null.");
         }
         this._stage = stage;
         this._explicitlyHandleTouchEvents = explicitlyHandleTouchEvents;
         this._explicitlyHandleMouseEvents = explicitlyHandleMouseEvents;
      }
      
      public function set touchesManager(value:TouchesManager) : void
      {
         this._touchesManager = value;
      }
      
      public function init() : void
      {
         if(Multitouch.supportsTouchEvents || this._explicitlyHandleTouchEvents)
         {
            this._stage.addEventListener(TouchEvent.TOUCH_BEGIN,this.touchBeginHandler,true);
            this._stage.addEventListener(TouchEvent.TOUCH_BEGIN,this.touchBeginHandler,false);
            this._stage.addEventListener(TouchEvent.TOUCH_MOVE,this.touchMoveHandler,true);
            this._stage.addEventListener(TouchEvent.TOUCH_MOVE,this.touchMoveHandler,false);
            this._stage.addEventListener(TouchEvent.TOUCH_END,this.touchEndHandler,true,int.MAX_VALUE);
            this._stage.addEventListener(TouchEvent.TOUCH_END,this.touchEndHandler,false,int.MAX_VALUE);
         }
         if(!Multitouch.supportsTouchEvents || this._explicitlyHandleMouseEvents)
         {
            this._stage.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandler,true);
            this._stage.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandler,false);
         }
      }
      
      public function onDispose() : void
      {
         this._touchesManager = null;
         this._stage.removeEventListener(TouchEvent.TOUCH_BEGIN,this.touchBeginHandler,true);
         this._stage.removeEventListener(TouchEvent.TOUCH_BEGIN,this.touchBeginHandler,false);
         this._stage.removeEventListener(TouchEvent.TOUCH_MOVE,this.touchMoveHandler,true);
         this._stage.removeEventListener(TouchEvent.TOUCH_MOVE,this.touchMoveHandler,false);
         this._stage.removeEventListener(TouchEvent.TOUCH_END,this.touchEndHandler,true);
         this._stage.removeEventListener(TouchEvent.TOUCH_END,this.touchEndHandler,false);
         this._stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandler,true);
         this._stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandler,false);
         this.unstallMouseListeners();
      }
      
      protected function installMouseListeners() : void
      {
         this._stage.addEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler,true);
         this._stage.addEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler,false);
         this._stage.addEventListener(MouseEvent.MOUSE_UP,this.mouseUpHandler,true,int.MAX_VALUE);
         this._stage.addEventListener(MouseEvent.MOUSE_UP,this.mouseUpHandler,false,int.MAX_VALUE);
      }
      
      protected function unstallMouseListeners() : void
      {
         this._stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler,true);
         this._stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler,false);
         this._stage.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUpHandler,true);
         this._stage.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUpHandler,false);
      }
      
      protected function touchBeginHandler(event:TouchEvent) : void
      {
         if(event.eventPhase == EventPhase.BUBBLING_PHASE)
         {
            return;
         }
         this._touchesManager.onTouchBegin(event.touchPointID,event.stageX,event.stageY,event.target as InteractiveObject);
      }
      
      protected function touchMoveHandler(event:TouchEvent) : void
      {
         if(event.eventPhase == EventPhase.BUBBLING_PHASE)
         {
            return;
         }
         this._touchesManager.onTouchMove(event.touchPointID,event.stageX,event.stageY);
      }
      
      protected function touchEndHandler(event:TouchEvent) : void
      {
         if(event.eventPhase == EventPhase.BUBBLING_PHASE)
         {
            return;
         }
         if(event.hasOwnProperty("isTouchPointCanceled") && event["isTouchPointCanceled"])
         {
            this._touchesManager.onTouchCancel(event.touchPointID,event.stageX,event.stageY);
         }
         else
         {
            this._touchesManager.onTouchEnd(event.touchPointID,event.stageX,event.stageY);
         }
      }
      
      protected function mouseDownHandler(event:MouseEvent) : void
      {
         if(event.eventPhase == EventPhase.BUBBLING_PHASE)
         {
            return;
         }
         var touchAccepted:Boolean = this._touchesManager.onTouchBegin(MOUSE_TOUCH_POINT_ID,event.stageX,event.stageY,event.target as InteractiveObject);
         if(touchAccepted)
         {
            this.installMouseListeners();
         }
      }
      
      protected function mouseMoveHandler(event:MouseEvent) : void
      {
         if(event.eventPhase == EventPhase.BUBBLING_PHASE)
         {
            return;
         }
         this._touchesManager.onTouchMove(MOUSE_TOUCH_POINT_ID,event.stageX,event.stageY);
      }
      
      protected function mouseUpHandler(event:MouseEvent) : void
      {
         if(event.eventPhase == EventPhase.BUBBLING_PHASE)
         {
            return;
         }
         this._touchesManager.onTouchEnd(MOUSE_TOUCH_POINT_ID,event.stageX,event.stageY);
         if(this._touchesManager.activeTouchesCount == 0)
         {
            this.unstallMouseListeners();
         }
      }
   }
}
