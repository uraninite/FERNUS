package com.kxk
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class Scrollbar extends Sprite
   {
       
      
      private var _content:MovieClip;
      
      private var _contentMask:MovieClip;
      
      private var _slider:MovieClip;
      
      private var _track:MovieClip;
      
      private var _scrollSpeed:Number = 0.5;
      
      private var _scrollWheelSpeed:int = 10;
      
      private var _root:Stage;
      
      private var _direction:String;
      
      private var _rectangle:Rectangle;
      
      private var _rectangleScrollArea:Rectangle;
      
      public function Scrollbar()
      {
         super();
      }
      
      public function init(_d:String, _r:Rectangle, _r2:Rectangle, $content:MovieClip, $track:MovieClip, $slider:MovieClip, $scrollSpeed:Number = 0.5) : void
      {
         this._direction = _d;
         this._rectangle = _r;
         this._rectangleScrollArea = _r2;
         this._content = $content;
         this._slider = $slider;
         this._track = $track;
         this._scrollSpeed = $scrollSpeed;
         this._root = this._slider.parent.stage;
         this._slider.visible = false;
         this._track.visible = false;
         this.enable();
      }
      
      public function enable() : void
      {
         this._slider.buttonMode = true;
         this._slider.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDownHandler);
         this._root.addEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheelHandler);
         this._root.stage.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUpHandler);
         this._track.addEventListener(MouseEvent.CLICK,this.clickStracy);
         this.verifyHeight();
      }
      
      public function disable() : void
      {
         this._slider.buttonMode = false;
         this._slider.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDownHandler);
         this._root.removeEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheelHandler);
         this._root.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUpHandler);
         this._track.removeEventListener(MouseEvent.CLICK,this.clickStracy);
      }
      
      private function onMouseDownHandler($event:MouseEvent) : void
      {
         var newRect:Rectangle = null;
         var newRect2:Rectangle = null;
         if(this._direction == "y")
         {
            newRect = new Rectangle(this._track.x,this._track.y,0,this._track.height - this._slider.height);
            this._slider.startDrag(false,newRect);
         }
         else
         {
            newRect2 = new Rectangle(this._track.x,this._track.y,this._track.width - this._slider.width,0);
            this._slider.startDrag(false,newRect2);
         }
         this._root.addEventListener(Event.ENTER_FRAME,this.updateContentPosition);
      }
      
      private function onMouseWheelHandler($event:MouseEvent) : void
      {
         if(!this.detectMouseOver(this._content))
         {
            return;
         }
         if(this._rectangleScrollArea.height > this._content.height)
         {
            return;
         }
         var scrollDistance:int = $event.delta;
         var minY:int = this._track.y;
         var maxY:int = this._track.height + this._track.y - this._slider.height;
         if(scrollDistance > 0 && this._slider.y <= maxY || scrollDistance < 0 && this._slider.y >= minY)
         {
            this._slider.y -= scrollDistance * this._scrollWheelSpeed;
            if(this._slider.y < minY)
            {
               this._slider.y = minY;
            }
            else if(this._slider.y > maxY)
            {
               this._slider.y = maxY;
            }
            this.updateContentPosition();
         }
      }
      
      private function detectMouseOver(d:MovieClip) : Boolean
      {
         var mousePoint:Point = new Point(d.parent.mouseX,d.parent.mouseY);
         if(this._rectangleScrollArea.x < mousePoint.x && mousePoint.x < this._rectangleScrollArea.x + this._rectangleScrollArea.width && this._rectangleScrollArea.y < mousePoint.y && mousePoint.y < this._rectangleScrollArea.y + this._rectangleScrollArea.height)
         {
            return true;
         }
         return false;
      }
      
      private function onMouseUpHandler($event:MouseEvent) : void
      {
         this._slider.stopDrag();
         if(this._root != null)
         {
            this._root.removeEventListener(Event.ENTER_FRAME,this.updateContentPosition);
         }
      }
      
      private function updateContentPosition($event:Event = null) : void
      {
         var _scrollPercent1:Number = NaN;
         var newContentY:Number = NaN;
         var _scrollPercent2:Number = NaN;
         var newContentX:Number = NaN;
         if(this._direction == "y")
         {
            _scrollPercent1 = 100 / (this._track.height - this._slider.height) * (this._slider.y - this._track.y);
            if(_scrollPercent1 < 0)
            {
               _scrollPercent1 = 0;
            }
            if(_scrollPercent1 > 100)
            {
               _scrollPercent1 = 100;
            }
            _scrollPercent1 = Math.round(_scrollPercent1);
            newContentY = this._rectangleScrollArea.y + (this._rectangleScrollArea.height - this._rectangle.height) / 100 * _scrollPercent1;
            this._content.y = newContentY;
         }
         else
         {
            _scrollPercent2 = 100 / (this._track.width - this._slider.width) * (this._slider.x - this._track.x);
            if(_scrollPercent2 < 0)
            {
               _scrollPercent2 = 0;
            }
            if(_scrollPercent2 > 100)
            {
               _scrollPercent2 = 100;
            }
            _scrollPercent2 = Math.round(_scrollPercent2);
            newContentX = this._rectangleScrollArea.x + (this._rectangleScrollArea.width - this._rectangle.width) / 100 * _scrollPercent2;
            this._content.x = newContentX;
         }
         this.dispatchEvent(new Event(Event.SCROLL));
      }
      
      public function updateSliderPosition(_val:Number = -1) : void
      {
         var contentPercent1:Number = NaN;
         var newDraggerY:int = 0;
         var contentPercent2:Number = NaN;
         var newDraggerX:int = 0;
         if(this._direction == "y")
         {
            if(_val == -1)
            {
               contentPercent1 = Math.abs((this._content.y - this._rectangleScrollArea.y) / (this._content.height - this._rectangleScrollArea.height) * 100);
               newDraggerY = contentPercent1 / 100 * (this._track.height - this._slider.height) + this._track.y;
               this._slider.y = newDraggerY;
            }
            else
            {
               this._slider.y = _val;
            }
         }
         else if(_val == -1)
         {
            contentPercent2 = Math.abs((this._content.x - this._rectangleScrollArea.x) / (this._content.width - this._rectangleScrollArea.width) * 100);
            newDraggerX = contentPercent2 / 100 * (this._track.width - this._slider.width) + this._track.x;
            this._slider.x = newDraggerX;
         }
         else
         {
            this._slider.x = _val;
         }
      }
      
      public function clickStracy(e:MouseEvent) : void
      {
         var minY:int = this._track.y;
         var maxY:int = this._track.height + this._track.y - this._slider.height;
         var _y:* = this._track.y + this._track.mouseY - this._slider.height / 2;
         if(_y < minY)
         {
            _y = minY;
         }
         else if(_y > maxY)
         {
            _y = maxY;
         }
         this._slider.y = _y;
         this.updateContentPosition();
      }
      
      public function verifyHeight() : void
      {
         if(this._direction == "y")
         {
            if(this._rectangleScrollArea.height >= this._rectangle.height)
            {
               this._slider.visible = false;
               this._track.visible = false;
            }
            else
            {
               this._slider.visible = true;
               this._track.visible = true;
            }
         }
         else if(this._rectangleScrollArea.width >= this._rectangle.width)
         {
            this._slider.visible = false;
            this._track.visible = false;
         }
         else
         {
            this._slider.visible = true;
            this._track.visible = true;
         }
      }
      
      public function destroy() : void
      {
         if(this._root.hasEventListener(Event.ENTER_FRAME))
         {
            this._slider.stopDrag();
            this._root.removeEventListener(Event.ENTER_FRAME,this.updateContentPosition);
         }
         this.disable();
      }
   }
}
