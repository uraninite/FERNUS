package com.bit101.components
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class PushButton extends Component
   {
       
      
      protected var _back:Sprite;
      
      protected var _face:Sprite;
      
      protected var _label:Label;
      
      protected var _labelText:String = "";
      
      protected var _over:Boolean = false;
      
      protected var _down:Boolean = false;
      
      protected var _selected:Boolean = false;
      
      protected var _toggle:Boolean = false;
      
      public function PushButton(parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0, label:String = "", defaultHandler:Function = null)
      {
         super(parent,xpos,ypos);
         if(defaultHandler != null)
         {
            addEventListener(MouseEvent.CLICK,defaultHandler);
         }
         this.label = label;
      }
      
      override protected function init() : void
      {
         super.init();
         buttonMode = true;
         useHandCursor = true;
         setSize(100,20);
      }
      
      override protected function addChildren() : void
      {
         this._back = new Sprite();
         this._back.filters = [getShadow(2,true)];
         this._back.mouseEnabled = false;
         addChild(this._back);
         this._face = new Sprite();
         this._face.mouseEnabled = false;
         this._face.filters = [getShadow(1)];
         this._face.x = 1;
         this._face.y = 1;
         addChild(this._face);
         this._label = new Label();
         addChild(this._label);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseGoDown);
         addEventListener(MouseEvent.ROLL_OVER,this.onMouseOver);
      }
      
      protected function drawFace() : void
      {
         this._face.graphics.clear();
         if(this._down)
         {
            this._face.graphics.beginFill(Style.BUTTON_DOWN);
         }
         else
         {
            this._face.graphics.beginFill(Style.BUTTON_FACE);
         }
         this._face.graphics.drawRect(0,0,_width - 2,_height - 2);
         this._face.graphics.endFill();
      }
      
      override public function draw() : void
      {
         super.draw();
         this._back.graphics.clear();
         this._back.graphics.beginFill(Style.BACKGROUND);
         this._back.graphics.drawRect(0,0,_width,_height);
         this._back.graphics.endFill();
         this.drawFace();
         this._label.text = this._labelText;
         this._label.autoSize = true;
         this._label.draw();
         if(this._label.width > _width - 4)
         {
            this._label.autoSize = false;
            this._label.width = _width - 4;
         }
         else
         {
            this._label.autoSize = true;
         }
         this._label.draw();
         this._label.move(_width / 2 - this._label.width / 2,_height / 2 - this._label.height / 2);
      }
      
      protected function onMouseOver(event:MouseEvent) : void
      {
         this._over = true;
         addEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
      }
      
      protected function onMouseOut(event:MouseEvent) : void
      {
         this._over = false;
         if(!this._down)
         {
            this._face.filters = [getShadow(1)];
         }
         removeEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
      }
      
      protected function onMouseGoDown(event:MouseEvent) : void
      {
         this._down = true;
         this.drawFace();
         this._face.filters = [getShadow(1,true)];
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onMouseGoUp);
      }
      
      protected function onMouseGoUp(event:MouseEvent) : void
      {
         if(this._toggle && this._over)
         {
            this._selected = !this._selected;
         }
         this._down = this._selected;
         this.drawFace();
         this._face.filters = [getShadow(1,this._selected)];
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseGoUp);
      }
      
      public function set label(str:String) : void
      {
         this._labelText = str;
         this.draw();
      }
      
      public function get label() : String
      {
         return this._labelText;
      }
      
      public function set selected(value:Boolean) : void
      {
         if(!this._toggle)
         {
            value = false;
         }
         this._selected = value;
         this._down = this._selected;
         this._face.filters = [getShadow(1,this._selected)];
         this.drawFace();
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set toggle(value:Boolean) : void
      {
         this._toggle = value;
      }
      
      public function get toggle() : Boolean
      {
         return this._toggle;
      }
   }
}
