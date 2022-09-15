package com.luaye.console.view
{
   import com.luaye.console.Console;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public class AbstractPanel extends Sprite
   {
      
      public static const STARTED_DRAGGING:String = "startedDragging";
      
      public static const STARTED_SCALING:String = "startedScaling";
      
      public static const TEXT_LINK:String = "textLinkEvent";
       
      
      private var _snaps:Array;
      
      private var _dragOffset:Point;
      
      private var _resizeTxt:TextField;
      
      protected var master:Console;
      
      protected var style:Style;
      
      protected var bg:Sprite;
      
      protected var scaler:Sprite;
      
      protected var minimumWidth:int = 18;
      
      protected var minimumHeight:int = 18;
      
      public var moveable:Boolean = true;
      
      public var snapping:uint = 3;
      
      public function AbstractPanel(m:Console)
      {
         super();
         this.master = m;
         this.style = this.master.style;
         this.bg = new Sprite();
         this.bg.name = "background";
         addChild(this.bg);
      }
      
      public static function registerRollOverTextField(field:TextField) : void
      {
         field.addEventListener(MouseEvent.MOUSE_MOVE,onTextFieldMouseMove,false,0,true);
         field.addEventListener(MouseEvent.ROLL_OUT,onTextFieldMouseMove,false,0,true);
      }
      
      private static function onTextFieldMouseMove(e:MouseEvent) : void
      {
         var index:int = 0;
         var scrollH:Number = NaN;
         var w:Number = NaN;
         var X:XML = null;
         var txtformat:XML = null;
         var field:TextField = e.currentTarget as TextField;
         if(!field.stage || !field.visible || field.parent && !field.parent.visible)
         {
            field.dispatchEvent(new TextEvent(TEXT_LINK));
            return;
         }
         if(field.scrollH > 0)
         {
            scrollH = field.scrollH;
            w = field.width;
            field.width = w + scrollH;
            index = field.getCharIndexAtPoint(field.mouseX + scrollH,field.mouseY);
            field.width = w;
            field.scrollH = scrollH;
         }
         else
         {
            index = field.getCharIndexAtPoint(field.mouseX,field.mouseY);
         }
         var url:String = null;
         var txt:String = null;
         if(index > 0)
         {
            X = new XML(field.getXMLText(index,index + 1));
            if(X.hasOwnProperty("textformat"))
            {
               txtformat = X["textformat"][0] as XML;
               if(txtformat)
               {
                  url = txtformat.@url;
                  txt = txtformat.toString();
               }
            }
         }
         field.dispatchEvent(new TextEvent(TEXT_LINK,false,false,url));
      }
      
      protected function drawBG(col:Number = 0, a:Number = 0.6, rounding:int = 10) : void
      {
         this.bg.graphics.clear();
         this.bg.graphics.beginFill(col,a);
         var size:int = 100;
         var roundSize:int = 100 - rounding * 2;
         this.bg.graphics.drawRoundRect(0,0,size,size,rounding,rounding);
         var grid:Rectangle = new Rectangle(rounding,rounding,roundSize,roundSize);
         this.bg.scale9Grid = grid;
      }
      
      public function init(w:Number, h:Number, resizable:Boolean = false, col:Number = -1, a:Number = -1, rounding:int = 10) : void
      {
         this.drawBG(col >= 0 ? Number(col) : Number(this.style.panelBackgroundColor),a >= 0 ? Number(a) : Number(this.style.panelBackgroundAlpha),rounding);
         this.scalable = resizable;
         this.width = w;
         this.height = h;
      }
      
      public function close() : void
      {
         this.stopDragging();
         this.master.panels.tooltip();
         if(parent)
         {
            parent.removeChild(this);
         }
      }
      
      override public function set width(n:Number) : void
      {
         if(n < this.minimumWidth)
         {
            n = this.minimumWidth;
         }
         if(this.scaler)
         {
            this.scaler.x = n;
         }
         this.bg.width = n;
      }
      
      override public function set height(n:Number) : void
      {
         if(n < this.minimumHeight)
         {
            n = this.minimumHeight;
         }
         if(this.scaler)
         {
            this.scaler.y = n;
         }
         this.bg.height = n;
      }
      
      override public function get width() : Number
      {
         return this.bg.width;
      }
      
      override public function get height() : Number
      {
         return this.bg.height;
      }
      
      public function registerSnaps(X:Array, Y:Array) : void
      {
         this._snaps = [X,Y];
      }
      
      protected function registerDragger(mc:DisplayObject, dereg:Boolean = false) : void
      {
         if(dereg)
         {
            mc.removeEventListener(MouseEvent.MOUSE_DOWN,this.onDraggerMouseDown);
         }
         else
         {
            mc.addEventListener(MouseEvent.MOUSE_DOWN,this.onDraggerMouseDown,false,0,true);
         }
      }
      
      private function onDraggerMouseDown(e:MouseEvent) : void
      {
         if(!stage || !this.moveable)
         {
            return;
         }
         this._resizeTxt = new TextField();
         this._resizeTxt.name = "positioningField";
         this._resizeTxt.autoSize = TextFieldAutoSize.LEFT;
         this.formatText(this._resizeTxt);
         addChild(this._resizeTxt);
         this.updateDragText();
         this._dragOffset = new Point(mouseX,mouseY);
         this._snaps = [[],[]];
         dispatchEvent(new Event(STARTED_DRAGGING));
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onDraggerMouseUp,false,0,true);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onDraggerMouseMove,false,0,true);
      }
      
      private function onDraggerMouseMove(e:MouseEvent = null) : void
      {
         if(this.snapping == 0)
         {
            return;
         }
         var p:Point = this.returnSnappedFor(parent.mouseX - this._dragOffset.x,parent.mouseY - this._dragOffset.y);
         x = p.x;
         y = p.y;
         this.updateDragText();
      }
      
      private function updateDragText() : void
      {
         this._resizeTxt.text = "<s>" + x + "," + y + "</s>";
      }
      
      private function onDraggerMouseUp(e:MouseEvent) : void
      {
         this.stopDragging();
      }
      
      private function stopDragging() : void
      {
         this._snaps = null;
         if(stage)
         {
            stage.removeEventListener(MouseEvent.MOUSE_UP,this.onDraggerMouseUp);
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onDraggerMouseMove);
         }
         if(this._resizeTxt && this._resizeTxt.parent)
         {
            this._resizeTxt.parent.removeChild(this._resizeTxt);
         }
         this._resizeTxt = null;
      }
      
      public function get scalable() : Boolean
      {
         return !!this.scaler ? true : false;
      }
      
      public function set scalable(b:Boolean) : void
      {
         if(b && !this.scaler)
         {
            this.scaler = new Sprite();
            this.scaler.name = "scaler";
            this.scaler.graphics.beginFill(this.style.panelScalerColor,this.style.panelBackgroundAlpha);
            this.scaler.graphics.lineTo(-10,0);
            this.scaler.graphics.lineTo(0,-10);
            this.scaler.graphics.endFill();
            this.scaler.buttonMode = true;
            this.scaler.doubleClickEnabled = true;
            this.scaler.addEventListener(MouseEvent.MOUSE_DOWN,this.onScalerMouseDown,false,0,true);
            addChild(this.scaler);
         }
         else if(!b && this.scaler)
         {
            if(contains(this.scaler))
            {
               removeChild(this.scaler);
            }
            this.scaler = null;
         }
      }
      
      private function onScalerMouseDown(e:Event) : void
      {
         this._resizeTxt = new TextField();
         this._resizeTxt.name = "resizingField";
         this._resizeTxt.autoSize = TextFieldAutoSize.RIGHT;
         this._resizeTxt.x = -4;
         this._resizeTxt.y = -17;
         this.formatText(this._resizeTxt);
         this.scaler.addChild(this._resizeTxt);
         this.updateScaleText();
         this._dragOffset = new Point(this.scaler.mouseX,this.scaler.mouseY);
         this._snaps = [[],[]];
         this.scaler.stage.addEventListener(MouseEvent.MOUSE_UP,this.onScalerMouseUp,false,0,true);
         this.scaler.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.updateScale,false,0,true);
         dispatchEvent(new Event(STARTED_SCALING));
      }
      
      private function updateScale(e:Event = null) : void
      {
         var p:Point = this.returnSnappedFor(x + mouseX - this._dragOffset.x,y + mouseY - this._dragOffset.x);
         p.x -= x;
         p.y -= y;
         this.width = p.x < this.minimumWidth ? Number(this.minimumWidth) : Number(p.x);
         this.height = p.y < this.minimumHeight ? Number(this.minimumHeight) : Number(p.y);
         this.updateScaleText();
      }
      
      private function updateScaleText() : void
      {
         this._resizeTxt.text = "<s>" + this.width + "," + this.height + "</s>";
      }
      
      public function stopScaling() : void
      {
         this.onScalerMouseUp(null);
      }
      
      private function onScalerMouseUp(e:Event) : void
      {
         this.scaler.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onScalerMouseUp);
         this.scaler.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.updateScale);
         this.updateScale();
         this._snaps = null;
         if(this._resizeTxt && this._resizeTxt.parent)
         {
            this._resizeTxt.parent.removeChild(this._resizeTxt);
         }
         this._resizeTxt = null;
      }
      
      private function formatText(txt:TextField) : void
      {
         txt.background = true;
         txt.backgroundColor = this.style.panelBackgroundColor;
         txt.styleSheet = this.style.css;
         txt.mouseEnabled = false;
      }
      
      private function returnSnappedFor(X:Number, Y:Number) : Point
      {
         var Xi:Number = NaN;
         var ey:Number = NaN;
         var Ys:Array = null;
         var Yi:Number = NaN;
         var ex:Number = X + this.width;
         var Xs:Array = this._snaps[0];
         for each(Xi in Xs)
         {
            if(Math.abs(Xi - X) < this.snapping)
            {
               X = Xi;
               break;
            }
            if(Math.abs(Xi - ex) < this.snapping)
            {
               X = Xi - this.width;
               break;
            }
         }
         ey = Y + this.height;
         Ys = this._snaps[1];
         for each(Yi in Ys)
         {
            if(Math.abs(Yi - Y) < this.snapping)
            {
               Y = Yi;
               break;
            }
            if(Math.abs(Yi - ey) < this.snapping)
            {
               Y = Yi - this.height;
               break;
            }
         }
         return new Point(X,Y);
      }
   }
}
