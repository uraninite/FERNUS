package com.kxk.keyboard
{
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class Key extends Sprite
   {
       
      
      private var _tf1:KeyTextField;
      
      private var _tf2:KeyTextField;
      
      private var _width:Number;
      
      private var _height:Number;
      
      private var _toggle:Boolean = false;
      
      private var _shiftStatus:Boolean = false;
      
      public function Key(_data:Object, _width:Number, _height:Number, _padding:Number)
      {
         var _p1:Point = null;
         var _p2:Point = null;
         super();
         this._width = _width;
         this._height = _height;
         this.drawRectangle(KeyConst.KEY_BACKGROUND_COLOR_UP);
         if(_data.t1 && _data.t2)
         {
            this._tf1 = new KeyTextField(_data.t1,_height / 3,KeyConst.KEY_TEXT_COLOR_ON);
            this._tf2 = new KeyTextField(_data.t2,_height / 3,KeyConst.KEY_TEXT_COLOR_OFF);
            this.addChild(this._tf1);
            this.addChild(this._tf2);
            if(_data.upper)
            {
               _p1 = new Point(_padding,_padding);
               _p2 = new Point(_width - this._tf2.width - this._tf2.textWidth - _padding,_height - this._tf2.height - _padding);
               if(_data.t2 == "@")
               {
                  _p2.x += _padding * 2;
               }
            }
            else
            {
               _p1 = new Point(_width - this._tf1.width - this._tf1.textWidth - _padding,_height - this._tf1.height - _padding);
               _p2 = new Point(_padding,_padding);
            }
         }
         else
         {
            this._tf1 = new KeyTextField(_data.t1,_height / 3,KeyConst.KEY_TEXT_COLOR_ON);
            _p1 = new Point(_padding,_padding);
            this.addChild(this._tf1);
         }
         if(this._tf1)
         {
            this._tf1.x = _p1.x;
            this._tf1.y = _p1.y;
         }
         if(this._tf2)
         {
            this._tf2.x = _p2.x;
            this._tf2.y = _p2.y;
         }
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
      }
      
      public function onDown(e:MouseEvent = null) : void
      {
         if(!this._toggle)
         {
            this.drawRectangle(KeyConst.KEY_BACKGROUND_COLOR_DOWN);
            this.removeEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
            this.stage.addEventListener(MouseEvent.MOUSE_UP,this.onUp);
         }
      }
      
      public function onUp(e:MouseEvent = null) : void
      {
         if(!this._toggle)
         {
            this.drawRectangle(KeyConst.KEY_BACKGROUND_COLOR_UP);
            this.addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
            this.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onUp);
         }
      }
      
      public function drawRectangle(_color:uint) : void
      {
         this.graphics.beginFill(_color);
         this.graphics.drawRect(0,0,this._width,this._height);
         this.graphics.endFill();
      }
      
      public function set toggle(_status:Boolean) : void
      {
         this._toggle = _status;
         if(this._toggle)
         {
            this.drawRectangle(KeyConst.KEY_BACKGROUND_COLOR_DOWN);
         }
         else
         {
            this.drawRectangle(KeyConst.KEY_BACKGROUND_COLOR_UP);
         }
      }
      
      public function set shift(_status:Boolean) : void
      {
         this._shiftStatus = _status;
         if(this._shiftStatus)
         {
            this._tf2.textColor = KeyConst.KEY_TEXT_COLOR_ON;
            this._tf1.textColor = KeyConst.KEY_TEXT_COLOR_OFF;
         }
         else
         {
            this._tf2.textColor = KeyConst.KEY_TEXT_COLOR_OFF;
            this._tf1.textColor = KeyConst.KEY_TEXT_COLOR_ON;
         }
      }
      
      public function set text(_text:String) : void
      {
         this._tf1.text = _text;
      }
   }
}
