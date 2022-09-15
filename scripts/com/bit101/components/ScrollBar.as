package com.bit101.components
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class ScrollBar extends Component
   {
       
      
      protected const DELAY_TIME:int = 500;
      
      protected const REPEAT_TIME:int = 100;
      
      protected const UP:String = "up";
      
      protected const DOWN:String = "down";
      
      protected var _autoHide:Boolean = false;
      
      protected var _upButton:PushButton;
      
      protected var _downButton:PushButton;
      
      protected var _scrollSlider:ScrollSlider;
      
      protected var _orientation:String;
      
      protected var _lineSize:int = 1;
      
      protected var _delayTimer:Timer;
      
      protected var _repeatTimer:Timer;
      
      protected var _direction:String;
      
      protected var _shouldRepeat:Boolean = false;
      
      public function ScrollBar(orientation:String, parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0, defaultHandler:Function = null)
      {
         this._orientation = orientation;
         super(parent,xpos,ypos);
         if(defaultHandler != null)
         {
            addEventListener(Event.CHANGE,defaultHandler);
         }
      }
      
      override protected function addChildren() : void
      {
         this._scrollSlider = new ScrollSlider(this._orientation,this,0,10,this.onChange);
         this._upButton = new PushButton(this,0,0,"");
         this._upButton.addEventListener(MouseEvent.MOUSE_DOWN,this.onUpClick);
         this._upButton.setSize(10,10);
         var upArrow:Shape = new Shape();
         this._upButton.addChild(upArrow);
         this._downButton = new PushButton(this,0,0,"");
         this._downButton.addEventListener(MouseEvent.MOUSE_DOWN,this.onDownClick);
         this._downButton.setSize(10,10);
         var downArrow:Shape = new Shape();
         this._downButton.addChild(downArrow);
         if(this._orientation == Slider.VERTICAL)
         {
            upArrow.graphics.beginFill(Style.DROPSHADOW,0.5);
            upArrow.graphics.moveTo(5,3);
            upArrow.graphics.lineTo(7,6);
            upArrow.graphics.lineTo(3,6);
            upArrow.graphics.endFill();
            downArrow.graphics.beginFill(Style.DROPSHADOW,0.5);
            downArrow.graphics.moveTo(5,7);
            downArrow.graphics.lineTo(7,4);
            downArrow.graphics.lineTo(3,4);
            downArrow.graphics.endFill();
         }
         else
         {
            upArrow.graphics.beginFill(Style.DROPSHADOW,0.5);
            upArrow.graphics.moveTo(3,5);
            upArrow.graphics.lineTo(6,7);
            upArrow.graphics.lineTo(6,3);
            upArrow.graphics.endFill();
            downArrow.graphics.beginFill(Style.DROPSHADOW,0.5);
            downArrow.graphics.moveTo(7,5);
            downArrow.graphics.lineTo(4,7);
            downArrow.graphics.lineTo(4,3);
            downArrow.graphics.endFill();
         }
      }
      
      override protected function init() : void
      {
         super.init();
         if(this._orientation == Slider.HORIZONTAL)
         {
            setSize(100,10);
         }
         else
         {
            setSize(10,100);
         }
         this._delayTimer = new Timer(this.DELAY_TIME,1);
         this._delayTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onDelayComplete);
         this._repeatTimer = new Timer(this.REPEAT_TIME);
         this._repeatTimer.addEventListener(TimerEvent.TIMER,this.onRepeat);
      }
      
      public function setSliderParams(min:Number, max:Number, value:Number) : void
      {
         this._scrollSlider.setSliderParams(min,max,value);
      }
      
      public function setThumbPercent(value:Number) : void
      {
         this._scrollSlider.setThumbPercent(value);
      }
      
      override public function draw() : void
      {
         super.draw();
         if(this._orientation == Slider.VERTICAL)
         {
            this._scrollSlider.x = 0;
            this._scrollSlider.y = 10;
            this._scrollSlider.width = 10;
            this._scrollSlider.height = _height - 20;
            this._downButton.x = 0;
            this._downButton.y = _height - 10;
         }
         else
         {
            this._scrollSlider.x = 10;
            this._scrollSlider.y = 0;
            this._scrollSlider.width = _width - 20;
            this._scrollSlider.height = 10;
            this._downButton.x = _width - 10;
            this._downButton.y = 0;
         }
         this._scrollSlider.draw();
         if(this._autoHide)
         {
            visible = this._scrollSlider.thumbPercent < 1;
         }
         else
         {
            visible = true;
         }
      }
      
      public function set autoHide(value:Boolean) : void
      {
         this._autoHide = value;
         invalidate();
      }
      
      public function get autoHide() : Boolean
      {
         return this._autoHide;
      }
      
      public function set value(v:Number) : void
      {
         this._scrollSlider.value = v;
      }
      
      public function get value() : Number
      {
         return this._scrollSlider.value;
      }
      
      public function set minimum(v:Number) : void
      {
         this._scrollSlider.minimum = v;
      }
      
      public function get minimum() : Number
      {
         return this._scrollSlider.minimum;
      }
      
      public function set maximum(v:Number) : void
      {
         this._scrollSlider.maximum = v;
      }
      
      public function get maximum() : Number
      {
         return this._scrollSlider.maximum;
      }
      
      public function set lineSize(value:int) : void
      {
         this._lineSize = value;
      }
      
      public function get lineSize() : int
      {
         return this._lineSize;
      }
      
      public function set pageSize(value:int) : void
      {
         this._scrollSlider.pageSize = value;
         invalidate();
      }
      
      public function get pageSize() : int
      {
         return this._scrollSlider.pageSize;
      }
      
      protected function onUpClick(event:MouseEvent) : void
      {
         this.goUp();
         this._shouldRepeat = true;
         this._direction = this.UP;
         this._delayTimer.start();
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onMouseGoUp);
      }
      
      protected function goUp() : void
      {
         this._scrollSlider.value -= this._lineSize;
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      protected function onDownClick(event:MouseEvent) : void
      {
         this.goDown();
         this._shouldRepeat = true;
         this._direction = this.DOWN;
         this._delayTimer.start();
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onMouseGoUp);
      }
      
      protected function goDown() : void
      {
         this._scrollSlider.value += this._lineSize;
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      protected function onMouseGoUp(event:MouseEvent) : void
      {
         this._delayTimer.stop();
         this._repeatTimer.stop();
         this._shouldRepeat = false;
      }
      
      protected function onChange(event:Event) : void
      {
         dispatchEvent(event);
      }
      
      protected function onDelayComplete(event:TimerEvent) : void
      {
         if(this._shouldRepeat)
         {
            this._repeatTimer.start();
         }
      }
      
      protected function onRepeat(event:TimerEvent) : void
      {
         if(this._direction == this.UP)
         {
            this.goUp();
         }
         else
         {
            this.goDown();
         }
      }
   }
}

import com.bit101.components.Slider;
import com.bit101.components.Style;
import flash.display.DisplayObjectContainer;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Rectangle;

class ScrollSlider extends Slider
{
    
   
   protected var _thumbPercent:Number = 1.0;
   
   protected var _pageSize:int = 1;
   
   function ScrollSlider(orientation:String, parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0, defaultHandler:Function = null)
   {
      super(orientation,parent,xpos,ypos);
      if(defaultHandler != null)
      {
         addEventListener(Event.CHANGE,defaultHandler);
      }
   }
   
   override protected function init() : void
   {
      super.init();
      setSliderParams(1,1,0);
      backClick = true;
   }
   
   override protected function drawHandle() : void
   {
      var size:Number = NaN;
      _handle.graphics.clear();
      if(_orientation == HORIZONTAL)
      {
         size = Math.round(_width * this._thumbPercent);
         size = Math.max(_height,size);
         _handle.graphics.beginFill(0,0);
         _handle.graphics.drawRect(0,0,size,_height);
         _handle.graphics.endFill();
         _handle.graphics.beginFill(Style.BUTTON_FACE);
         _handle.graphics.drawRect(1,1,size - 2,_height - 2);
      }
      else
      {
         size = Math.round(_height * this._thumbPercent);
         size = Math.max(_width,size);
         _handle.graphics.beginFill(0,0);
         _handle.graphics.drawRect(0,0,_width - 2,size);
         _handle.graphics.endFill();
         _handle.graphics.beginFill(Style.BUTTON_FACE);
         _handle.graphics.drawRect(1,1,_width - 2,size - 2);
      }
      _handle.graphics.endFill();
      this.positionHandle();
   }
   
   override protected function positionHandle() : void
   {
      var range:Number = NaN;
      if(_orientation == HORIZONTAL)
      {
         range = width - _handle.width;
         _handle.x = (_value - _min) / (_max - _min) * range;
      }
      else
      {
         range = height - _handle.height;
         _handle.y = (_value - _min) / (_max - _min) * range;
      }
   }
   
   public function setThumbPercent(value:Number) : void
   {
      this._thumbPercent = Math.min(value,1);
      invalidate();
   }
   
   override protected function onBackClick(event:MouseEvent) : void
   {
      if(_orientation == HORIZONTAL)
      {
         if(mouseX < _handle.x)
         {
            if(_max > _min)
            {
               _value -= this._pageSize;
            }
            else
            {
               _value += this._pageSize;
            }
            correctValue();
         }
         else
         {
            if(_max > _min)
            {
               _value += this._pageSize;
            }
            else
            {
               _value -= this._pageSize;
            }
            correctValue();
         }
         this.positionHandle();
      }
      else
      {
         if(mouseY < _handle.y)
         {
            if(_max > _min)
            {
               _value -= this._pageSize;
            }
            else
            {
               _value += this._pageSize;
            }
            correctValue();
         }
         else
         {
            if(_max > _min)
            {
               _value += this._pageSize;
            }
            else
            {
               _value -= this._pageSize;
            }
            correctValue();
         }
         this.positionHandle();
      }
      dispatchEvent(new Event(Event.CHANGE));
   }
   
   override protected function onDrag(event:MouseEvent) : void
   {
      stage.addEventListener(MouseEvent.MOUSE_UP,onDrop);
      stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onSlide);
      if(_orientation == HORIZONTAL)
      {
         _handle.startDrag(false,new Rectangle(0,0,_width - _handle.width,0));
      }
      else
      {
         _handle.startDrag(false,new Rectangle(0,0,0,_height - _handle.height));
      }
   }
   
   override protected function onSlide(event:MouseEvent) : void
   {
      var oldValue:Number = _value;
      if(_orientation == HORIZONTAL)
      {
         if(_width == _handle.width)
         {
            _value = _min;
         }
         else
         {
            _value = _handle.x / (_width - _handle.width) * (_max - _min) + _min;
         }
      }
      else if(_height == _handle.height)
      {
         _value = _min;
      }
      else
      {
         _value = _handle.y / (_height - _handle.height) * (_max - _min) + _min;
      }
      if(_value != oldValue)
      {
         dispatchEvent(new Event(Event.CHANGE));
      }
   }
   
   public function set pageSize(value:int) : void
   {
      this._pageSize = value;
      invalidate();
   }
   
   public function get pageSize() : int
   {
      return this._pageSize;
   }
   
   public function get thumbPercent() : Number
   {
      return this._thumbPercent;
   }
}
