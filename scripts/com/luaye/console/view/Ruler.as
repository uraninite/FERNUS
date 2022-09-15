package com.luaye.console.view
{
   import com.luaye.console.Console;
   import com.luaye.console.utils.Utils;
   import flash.display.BlendMode;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import flash.ui.Mouse;
   
   public class Ruler extends Sprite
   {
      
      public static const EXIT:String = "exit";
      
      private static const POINTER_DISTANCE:int = 12;
       
      
      private var _master:Console;
      
      private var _area:Rectangle;
      
      private var _pointer:Shape;
      
      private var _posTxt:TextField;
      
      private var _points:Array;
      
      public function Ruler()
      {
         super();
      }
      
      public function start(console:Console) : void
      {
         this._master = console;
         buttonMode = true;
         this._points = new Array();
         this._pointer = new Shape();
         addChild(this._pointer);
         var p:Point = new Point();
         p = globalToLocal(p);
         this._area = new Rectangle(-stage.stageWidth * 1.5 + p.x,-stage.stageHeight * 1.5 + p.y,stage.stageWidth * 3,stage.stageHeight * 3);
         graphics.beginFill(0,0.1);
         graphics.drawRect(this._area.x,this._area.y,this._area.width,this._area.height);
         graphics.endFill();
         this._posTxt = new TextField();
         this._posTxt.name = "positionText";
         this._posTxt.autoSize = TextFieldAutoSize.LEFT;
         this._posTxt.background = true;
         this._posTxt.backgroundColor = this._master.style.panelBackgroundColor;
         this._posTxt.styleSheet = console.style.css;
         this._posTxt.mouseEnabled = false;
         addChild(this._posTxt);
         addEventListener(MouseEvent.CLICK,this.onMouseClick,false,0,true);
         addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove,false,0,true);
         this.onMouseMove();
         if(this._master.rulerHidesMouse)
         {
            Mouse.hide();
         }
         this._master.report("<b>Ruler started. Click on two locations to measure.</b>",-1);
      }
      
      private function onMouseMove(e:MouseEvent = null) : void
      {
         this._pointer.graphics.clear();
         this._pointer.graphics.lineStyle(1,11193344,1);
         this._pointer.graphics.moveTo(this._area.x,mouseY);
         this._pointer.graphics.lineTo(this._area.x + this._area.width,mouseY);
         this._pointer.graphics.moveTo(mouseX,this._area.y);
         this._pointer.graphics.lineTo(mouseX,this._area.y + this._area.height);
         this._pointer.blendMode = BlendMode.INVERT;
         this._posTxt.text = "<s>" + mouseX + "," + mouseY + "</s>";
         this._posTxt.x = mouseX - this._posTxt.width - POINTER_DISTANCE;
         this._posTxt.y = mouseY - this._posTxt.height - POINTER_DISTANCE;
         if(this._posTxt.x < 0)
         {
            this._posTxt.x = mouseX + POINTER_DISTANCE;
         }
         if(this._posTxt.y < 0)
         {
            this._posTxt.y = mouseY + POINTER_DISTANCE;
         }
      }
      
      private function onMouseClick(e:MouseEvent) : void
      {
         var p:Point = null;
         var p2:Point = null;
         var mp:Point = null;
         var xmin:Point = null;
         var xmax:Point = null;
         var ymin:Point = null;
         var ymax:Point = null;
         var w:Number = NaN;
         var h:Number = NaN;
         var d:Number = NaN;
         var txt:TextField = null;
         var a1:Number = NaN;
         var a2:Number = NaN;
         e.stopPropagation();
         if(this._points.length == 0)
         {
            p = new Point(e.localX,e.localY);
            graphics.lineStyle(1,16711680);
            graphics.drawCircle(p.x,p.y,3);
            this._points.push(p);
         }
         else if(this._points.length == 1)
         {
            if(this._master.rulerHidesMouse)
            {
               Mouse.show();
            }
            removeChild(this._pointer);
            removeChild(this._posTxt);
            removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            p = this._points[0];
            p2 = new Point(e.localX,e.localY);
            this._points.push(p2);
            graphics.clear();
            graphics.beginFill(0,0.4);
            graphics.drawRect(this._area.x,this._area.y,this._area.width,this._area.height);
            graphics.endFill();
            graphics.lineStyle(1.5,16711680);
            graphics.drawCircle(p.x,p.y,4);
            graphics.lineStyle(1.5,16750848);
            graphics.drawCircle(p2.x,p2.y,4);
            mp = Point.interpolate(p,p2,0.5);
            graphics.lineStyle(1,11184810);
            graphics.drawCircle(mp.x,mp.y,4);
            xmin = p;
            xmax = p2;
            if(p.x > p2.x)
            {
               xmin = p2;
               xmax = p;
            }
            ymin = p;
            ymax = p2;
            if(p.y > p2.y)
            {
               ymin = p2;
               ymax = p;
            }
            w = xmax.x - xmin.x;
            h = ymax.y - ymin.y;
            d = Point.distance(p,p2);
            txt = this.makeTxtField();
            txt.text = Utils.round(p.x,10) + "," + Utils.round(p.y,10);
            txt.x = p.x;
            txt.y = p.y - (ymin == p ? 14 : 0);
            addChild(txt);
            txt = this.makeTxtField();
            txt.text = Utils.round(p2.x,10) + "," + Utils.round(p2.y,10);
            txt.x = p2.x;
            txt.y = p2.y - (ymin == p2 ? 14 : 0);
            addChild(txt);
            if(w > 40 || h > 25)
            {
               txt = this.makeTxtField(43520);
               txt.text = Utils.round(mp.x,10) + "," + Utils.round(mp.y,10);
               txt.x = mp.x;
               txt.y = mp.y;
               addChild(txt);
            }
            graphics.lineStyle(1,11193344,0.5);
            graphics.moveTo(this._area.x,ymin.y);
            graphics.lineTo(this._area.x + this._area.width,ymin.y);
            graphics.moveTo(this._area.x,ymax.y);
            graphics.lineTo(this._area.x + this._area.width,ymax.y);
            graphics.moveTo(xmin.x,this._area.y);
            graphics.lineTo(xmin.x,this._area.y + this._area.height);
            graphics.moveTo(xmax.x,this._area.y);
            graphics.lineTo(xmax.x,this._area.y + this._area.height);
            a1 = Utils.round(Utils.angle(p,p2),100);
            a2 = Utils.round(Utils.angle(p2,p),100);
            graphics.lineStyle(1,11141120,0.8);
            Utils.drawCircleSegment(graphics,10,p,a1,-90);
            graphics.lineStyle(1,13404160,0.8);
            Utils.drawCircleSegment(graphics,10,p2,a2,-90);
            graphics.lineStyle(2,65280,0.7);
            graphics.moveTo(p.x,p.y);
            graphics.lineTo(p2.x,p2.y);
            this._master.report("Ruler results: (red) <b>[" + p.x + "," + p.y + "]</b> to (orange) <b>[" + p2.x + "," + p2.y + "]</b>",-2);
            this._master.report("Distance: <b>" + Utils.round(d,100) + "</b>",-2);
            this._master.report("Mid point: <b>[" + mp.x + "," + mp.y + "]</b>",-2);
            this._master.report("Width:<b>" + w + "</b>, Height: <b>" + h + "</b>",-2);
            this._master.report("Angle from first point (red): <b>" + a1 + "°</b>",-2);
            this._master.report("Angle from second point (orange): <b>" + a2 + "°</b>",-2);
         }
         else
         {
            this.exit();
         }
      }
      
      public function exit() : void
      {
         this._points = null;
         this._master = null;
         dispatchEvent(new Event(EXIT));
      }
      
      private function makeTxtField(col:Number = 65280, b:Boolean = true) : TextField
      {
         var format:TextFormat = new TextFormat("Arial",11,col,b,true,null,null,TextFormatAlign.RIGHT);
         var txt:TextField = new TextField();
         txt.autoSize = TextFieldAutoSize.RIGHT;
         txt.selectable = false;
         txt.defaultTextFormat = format;
         return txt;
      }
   }
}
