package com.bit101.components
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.display.StageAlign;
   import flash.display.StageScaleMode;
   import flash.events.Event;
   import flash.filters.DropShadowFilter;
   
   public class Component extends Sprite
   {
      
      public static const DRAW:String = "draw";
       
      
      protected var Ronda:Class;
      
      protected var _width:Number = 0;
      
      protected var _height:Number = 0;
      
      protected var _tag:int = -1;
      
      protected var _enabled:Boolean = true;
      
      public function Component(parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0)
      {
         this.Ronda = Component_Ronda;
         super();
         this.move(xpos,ypos);
         this.init();
         if(parent != null)
         {
            parent.addChild(this);
         }
      }
      
      public static function initStage(stage:Stage) : void
      {
         stage.align = StageAlign.TOP_LEFT;
         stage.scaleMode = StageScaleMode.NO_SCALE;
      }
      
      protected function init() : void
      {
         this.addChildren();
         this.invalidate();
      }
      
      protected function addChildren() : void
      {
      }
      
      protected function getShadow(dist:Number, knockout:Boolean = false) : DropShadowFilter
      {
         return new DropShadowFilter(dist,45,Style.DROPSHADOW,1,dist,dist,0.3,1,knockout);
      }
      
      protected function invalidate() : void
      {
         addEventListener(Event.ENTER_FRAME,this.onInvalidate);
      }
      
      public function move(xpos:Number, ypos:Number) : void
      {
         this.x = Math.round(xpos);
         this.y = Math.round(ypos);
      }
      
      public function setSize(w:Number, h:Number) : void
      {
         this._width = w;
         this._height = h;
         dispatchEvent(new Event(Event.RESIZE));
         this.invalidate();
      }
      
      public function draw() : void
      {
         dispatchEvent(new Event(Component.DRAW));
      }
      
      protected function onInvalidate(event:Event) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.onInvalidate);
         this.draw();
      }
      
      override public function set width(w:Number) : void
      {
         this._width = w;
         this.invalidate();
         dispatchEvent(new Event(Event.RESIZE));
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set height(h:Number) : void
      {
         this._height = h;
         this.invalidate();
         dispatchEvent(new Event(Event.RESIZE));
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      public function set tag(value:int) : void
      {
         this._tag = value;
      }
      
      public function get tag() : int
      {
         return this._tag;
      }
      
      override public function set x(value:Number) : void
      {
         super.x = Math.round(value);
      }
      
      override public function set y(value:Number) : void
      {
         super.y = Math.round(value);
      }
      
      public function set enabled(value:Boolean) : void
      {
         this._enabled = value;
         mouseEnabled = mouseChildren = this._enabled;
         tabEnabled = value;
         alpha = !!this._enabled ? Number(1) : Number(0.5);
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
   }
}
