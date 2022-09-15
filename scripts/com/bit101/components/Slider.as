package com.bit101.components
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class Slider extends Component
   {
      
      public static const HORIZONTAL:String = "horizontal";
      
      public static const VERTICAL:String = "vertical";
       
      
      protected var _handle:Sprite;
      
      protected var _back:Sprite;
      
      protected var _backClick:Boolean = true;
      
      protected var _value:Number = 0;
      
      protected var _max:Number = 100;
      
      protected var _min:Number = 0;
      
      protected var _orientation:String;
      
      protected var _tick:Number = 0.01;
      
      public function Slider(orientation:String = "horizontal", parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0, defaultHandler:Function = null)
      {
         this._orientation = orientation;
         super(parent,xpos,ypos);
         if(defaultHandler != null)
         {
            addEventListener(Event.CHANGE,defaultHandler);
         }
      }
      
      override protected function init() : void
      {
         super.init();
         if(this._orientation == HORIZONTAL)
         {
            setSize(100,10);
         }
         else
         {
            setSize(10,100);
         }
      }
      
      override protected function addChildren() : void
      {
         this._back = new Sprite();
         this._back.filters = [getShadow(2,true)];
         addChild(this._back);
         this._handle = new Sprite();
         this._handle.filters = [getShadow(1)];
         this._handle.addEventListener(MouseEvent.MOUSE_DOWN,this.onDrag);
         this._handle.buttonMode = true;
         this._handle.useHandCursor = true;
         addChild(this._handle);
      }
      
      protected function drawBack() : void
      {
         this._back.graphics.clear();
         this._back.graphics.beginFill(Style.BACKGROUND);
         this._back.graphics.drawRect(0,0,_width,_height);
         this._back.graphics.endFill();
         if(this._backClick)
         {
            this._back.addEventListener(MouseEvent.MOUSE_DOWN,this.onBackClick);
         }
         else
         {
            this._back.removeEventListener(MouseEvent.MOUSE_DOWN,this.onBackClick);
         }
      }
      
      protected function drawHandle() : void
      {
         this._handle.graphics.clear();
         this._handle.graphics.beginFill(Style.BUTTON_FACE);
         if(this._orientation == HORIZONTAL)
         {
            this._handle.graphics.drawRect(1,1,_height - 2,_height - 2);
         }
         else
         {
            this._handle.graphics.drawRect(1,1,_width - 2,_width - 2);
         }
         this._handle.graphics.endFill();
         this.positionHandle();
      }
      
      protected function correctValue() : void
      {
         if(this._max > this._min)
         {
            this._value = Math.min(this._value,this._max);
            this._value = Math.max(this._value,this._min);
         }
         else
         {
            this._value = Math.max(this._value,this._max);
            this._value = Math.min(this._value,this._min);
         }
      }
      
      protected function positionHandle() : void
      {
         var range:Number = NaN;
         if(this._orientation == HORIZONTAL)
         {
            range = _width - _height;
            this._handle.x = (this._value - this._min) / (this._max - this._min) * range;
         }
         else
         {
            range = _height - _width;
            this._handle.y = _height - _width - (this._value - this._min) / (this._max - this._min) * range;
         }
      }
      
      override public function draw() : void
      {
         super.draw();
         this.drawBack();
         this.drawHandle();
      }
      
      public function setSliderParams(min:Number, max:Number, value:Number) : void
      {
         this.minimum = min;
         this.maximum = max;
         this.value = value;
      }
      
      protected function onBackClick(event:MouseEvent) : void
      {
         if(this._orientation == HORIZONTAL)
         {
            this._handle.x = mouseX - _height / 2;
            this._handle.x = Math.max(this._handle.x,0);
            this._handle.x = Math.min(this._handle.x,_width - _height);
            this._value = this._handle.x / (width - _height) * (this._max - this._min) + this._min;
         }
         else
         {
            this._handle.y = mouseY - _width / 2;
            this._handle.y = Math.max(this._handle.y,0);
            this._handle.y = Math.min(this._handle.y,_height - _width);
            this._value = (_height - _width - this._handle.y) / (height - _width) * (this._max - this._min) + this._min;
         }
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      protected function onDrag(event:MouseEvent) : void
      {
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onDrop);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onSlide);
         if(this._orientation == HORIZONTAL)
         {
            this._handle.startDrag(false,new Rectangle(0,0,_width - _height,0));
         }
         else
         {
            this._handle.startDrag(false,new Rectangle(0,0,0,_height - _width));
         }
      }
      
      protected function onDrop(event:MouseEvent) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onDrop);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSlide);
         stopDrag();
      }
      
      protected function onSlide(event:MouseEvent) : void
      {
         var oldValue:Number = this._value;
         if(this._orientation == HORIZONTAL)
         {
            this._value = this._handle.x / (width - _height) * (this._max - this._min) + this._min;
         }
         else
         {
            this._value = (_height - _width - this._handle.y) / (height - _width) * (this._max - this._min) + this._min;
         }
         if(this._value != oldValue)
         {
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function set backClick(b:Boolean) : void
      {
         this._backClick = b;
         invalidate();
      }
      
      public function get backClick() : Boolean
      {
         return this._backClick;
      }
      
      public function set value(v:Number) : void
      {
         this._value = v;
         this.correctValue();
         this.positionHandle();
      }
      
      public function get value() : Number
      {
         return Math.round(this._value / this._tick) * this._tick;
      }
      
      public function get rawValue() : Number
      {
         return this._value;
      }
      
      public function set maximum(m:Number) : void
      {
         this._max = m;
         this.correctValue();
         this.positionHandle();
      }
      
      public function get maximum() : Number
      {
         return this._max;
      }
      
      public function set minimum(m:Number) : void
      {
         this._min = m;
         this.correctValue();
         this.positionHandle();
      }
      
      public function get minimum() : Number
      {
         return this._min;
      }
      
      public function set tick(t:Number) : void
      {
         this._tick = t;
      }
      
      public function get tick() : Number
      {
         return this._tick;
      }
   }
}
