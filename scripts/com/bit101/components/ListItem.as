package com.bit101.components
{
   import flash.display.DisplayObjectContainer;
   import flash.events.MouseEvent;
   
   public class ListItem extends Component
   {
       
      
      protected var _data:Object;
      
      protected var _label:Label;
      
      protected var _defaultColor:uint = 16777215;
      
      protected var _selectedColor:uint = 14540253;
      
      protected var _rolloverColor:uint = 15658734;
      
      protected var _selected:Boolean;
      
      protected var _mouseOver:Boolean = false;
      
      public function ListItem(parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0, data:Object = null)
      {
         this._data = data;
         super(parent,xpos,ypos);
      }
      
      override protected function init() : void
      {
         super.init();
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         setSize(100,20);
      }
      
      override protected function addChildren() : void
      {
         super.addChildren();
         this._label = new Label(this,5,0);
         this._label.draw();
      }
      
      override public function draw() : void
      {
         super.draw();
         graphics.clear();
         if(this._selected)
         {
            graphics.beginFill(this._selectedColor);
         }
         else if(this._mouseOver)
         {
            graphics.beginFill(this._rolloverColor);
         }
         else
         {
            graphics.beginFill(this._defaultColor);
         }
         graphics.drawRect(0,0,width,height);
         graphics.endFill();
         if(this._data == null)
         {
            return;
         }
         if(this._data is String)
         {
            this._label.text = this._data as String;
         }
         else if(this._data.hasOwnProperty("label") && this._data.label is String)
         {
            this._label.text = this._data.label;
         }
         else
         {
            this._label.text = this._data.toString();
         }
      }
      
      protected function onMouseOver(event:MouseEvent) : void
      {
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         this._mouseOver = true;
         invalidate();
      }
      
      protected function onMouseOut(event:MouseEvent) : void
      {
         removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         this._mouseOver = false;
         invalidate();
      }
      
      public function set data(value:Object) : void
      {
         this._data = value;
         invalidate();
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set selected(value:Boolean) : void
      {
         this._selected = value;
         invalidate();
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set defaultColor(value:uint) : void
      {
         this._defaultColor = value;
         invalidate();
      }
      
      public function get defaultColor() : uint
      {
         return this._defaultColor;
      }
      
      public function set selectedColor(value:uint) : void
      {
         this._selectedColor = value;
         invalidate();
      }
      
      public function get selectedColor() : uint
      {
         return this._selectedColor;
      }
      
      public function set rolloverColor(value:uint) : void
      {
         this._rolloverColor = value;
         invalidate();
      }
      
      public function get rolloverColor() : uint
      {
         return this._rolloverColor;
      }
   }
}
