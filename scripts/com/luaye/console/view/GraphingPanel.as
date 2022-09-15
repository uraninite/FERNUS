package com.luaye.console.view
{
   import com.luaye.console.Console;
   import com.luaye.console.utils.Utils;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.events.TextEvent;
   import flash.text.TextField;
   
   public class GraphingPanel extends AbstractPanel
   {
       
      
      private var _interests:Array;
      
      private var _updatedFrame:uint = 0;
      
      private var _drawnFrame:uint = 0;
      
      private var _needRedraw:Boolean;
      
      private var _isRunning:Boolean;
      
      protected var _history:Array;
      
      protected var fixed:Boolean;
      
      protected var graph:Shape;
      
      protected var lowTxt:TextField;
      
      protected var highTxt:TextField;
      
      protected var keyTxt:TextField;
      
      public var updateEvery:uint = 1;
      
      public var drawEvery:uint = 1;
      
      public var lowest:Number;
      
      public var highest:Number;
      
      public var averaging:uint;
      
      public var inverse:Boolean;
      
      public function GraphingPanel(m:Console, W:int = 0, H:int = 0, resizable:Boolean = true)
      {
         this._interests = [];
         this._history = [];
         super(m);
         registerDragger(bg);
         minimumHeight = 26;
         this.lowTxt = new TextField();
         this.lowTxt.name = "lowestField";
         this.lowTxt.mouseEnabled = false;
         this.lowTxt.styleSheet = style.css;
         this.lowTxt.height = 14;
         addChild(this.lowTxt);
         this.highTxt = new TextField();
         this.highTxt.name = "highestField";
         this.highTxt.mouseEnabled = false;
         this.highTxt.styleSheet = style.css;
         this.highTxt.height = 14;
         this.highTxt.y = 6;
         addChild(this.highTxt);
         this.keyTxt = new TextField();
         this.keyTxt.name = "menuField";
         this.keyTxt.styleSheet = style.css;
         this.keyTxt.height = 16;
         this.keyTxt.y = -3;
         this.keyTxt.addEventListener(TextEvent.LINK,this.linkHandler,false,0,true);
         registerRollOverTextField(this.keyTxt);
         this.keyTxt.addEventListener(AbstractPanel.TEXT_LINK,this.onMenuRollOver,false,0,true);
         registerDragger(this.keyTxt);
         addChild(this.keyTxt);
         this.graph = new Shape();
         this.graph.name = "graph";
         this.graph.y = 10;
         addChild(this.graph);
         init(!!W ? Number(W) : Number(100),!!H ? Number(H) : Number(80),resizable);
      }
      
      public function get rand() : Number
      {
         return Math.random();
      }
      
      public function add(obj:Object, prop:String, col:Number = -1, key:String = null) : void
      {
         var cur:Number = obj[prop];
         if(!isNaN(cur))
         {
            if(isNaN(this.lowest))
            {
               this.lowest = cur;
            }
            if(isNaN(this.highest))
            {
               this.highest = cur;
            }
         }
         if(isNaN(col) || col < 0)
         {
            col = Math.random() * 16777215;
         }
         if(key == null)
         {
            key = prop;
         }
         this._interests.push(new Interest(obj,prop,col,key));
         this.updateKeyText();
         this.start();
      }
      
      public function remove(obj:Object = null, prop:String = null) : void
      {
         var X:* = null;
         var interest:Interest = null;
         for(X in this._interests)
         {
            interest = this._interests[X];
            if(interest && (interest.obj == null || interest.obj == obj) && (interest.prop == null || interest.prop == prop))
            {
               this._interests.splice(int(X),1);
            }
         }
         if(this._interests.length == 0)
         {
            this.close();
         }
         else
         {
            this.updateKeyText();
         }
      }
      
      public function start() : void
      {
         this._isRunning = true;
         addEventListener(Event.ENTER_FRAME,this.onFrame,false,0,true);
      }
      
      public function stop() : void
      {
         this._isRunning = false;
         removeEventListener(Event.ENTER_FRAME,this.onFrame);
      }
      
      public function get numInterests() : int
      {
         return this._interests.length;
      }
      
      override public function close() : void
      {
         this.stop();
         super.close();
      }
      
      public function reset() : void
      {
         if(!this.fixed)
         {
            this.lowest = NaN;
            this.highest = NaN;
         }
         this._history = [];
         this.graph.graphics.clear();
      }
      
      public function get running() : Boolean
      {
         return this._isRunning;
      }
      
      public function fixRange(low:Number, high:Number) : void
      {
         if(isNaN(low) || isNaN(high))
         {
            this.fixed = false;
            return;
         }
         this.fixed = true;
         this.lowest = low;
         this.highest = high;
      }
      
      public function set showKeyText(b:Boolean) : void
      {
         this.keyTxt.visible = b;
      }
      
      public function get showKeyText() : Boolean
      {
         return this.keyTxt.visible;
      }
      
      public function set showBoundsText(b:Boolean) : void
      {
         this.lowTxt.visible = b;
         this.highTxt.visible = b;
      }
      
      public function get showBoundsText() : Boolean
      {
         return this.lowTxt.visible;
      }
      
      override public function set height(n:Number) : void
      {
         super.height = n;
         this.lowTxt.y = n - 13;
         this._needRedraw = true;
      }
      
      override public function set width(n:Number) : void
      {
         super.width = n;
         this.lowTxt.width = n;
         this.highTxt.width = n;
         this.keyTxt.width = n;
         graphics.clear();
         graphics.lineStyle(1,11184810,1);
         graphics.moveTo(0,this.graph.y);
         graphics.lineTo(n,this.graph.y);
         this._needRedraw = true;
      }
      
      protected function getCurrentOf(i:int) : Number
      {
         var values:Array = this._history[this._history.length - 1];
         return !!values ? Number(values[i]) : Number(0);
      }
      
      protected function getAverageOf(i:int) : Number
      {
         var interest:Interest = this._interests[i];
         return !!interest ? Number(interest.avg) : Number(0);
      }
      
      protected function onFrame(e:Event) : Boolean
      {
         var ok:Boolean = master.visible && master.enabled && !master.paused;
         if(ok)
         {
            this.updateData();
         }
         if(ok || this._needRedraw)
         {
            this.drawGraph();
         }
         return ok;
      }
      
      protected function updateData() : void
      {
         var interest:Interest = null;
         var maxLen:int = 0;
         var len:uint = 0;
         var obj:Object = null;
         var v:Number = NaN;
         var avg:Number = NaN;
         ++this._updatedFrame;
         if(this._updatedFrame < this.updateEvery)
         {
            return;
         }
         this._updatedFrame = 0;
         var values:Array = [];
         for each(interest in this._interests)
         {
            obj = interest.obj;
            if(obj)
            {
               v = obj[interest.prop];
               if(isNaN(v))
               {
                  v = 0;
               }
               else
               {
                  if(isNaN(this.lowest))
                  {
                     this.lowest = v;
                  }
                  if(isNaN(this.highest))
                  {
                     this.highest = v;
                  }
               }
               values.push(v);
               if(this.averaging > 0)
               {
                  avg = interest.avg;
                  if(isNaN(avg))
                  {
                     interest.avg = v;
                  }
                  else
                  {
                     interest.avg = Utils.averageOut(avg,v,this.averaging);
                  }
               }
               if(!this.fixed)
               {
                  if(v > this.highest)
                  {
                     this.highest = v;
                  }
                  if(v < this.lowest)
                  {
                     this.lowest = v;
                  }
               }
            }
            else
            {
               this.remove(obj,interest.prop);
            }
         }
         this._history.push(values);
         maxLen = Math.floor(width) + 10;
         len = this._history.length;
         if(len > maxLen)
         {
            this._history.splice(0,len - maxLen);
         }
      }
      
      public function drawGraph() : void
      {
         var interest:Interest = null;
         var first:Boolean = false;
         var i:int = 0;
         var values:Array = null;
         var Y:Number = NaN;
         ++this._drawnFrame;
         if(!this._needRedraw && this._drawnFrame < this.drawEvery)
         {
            return;
         }
         this._needRedraw = false;
         this._drawnFrame = 0;
         var W:Number = width;
         var H:Number = height - this.graph.y;
         this.graph.graphics.clear();
         var diffGraph:Number = this.highest - this.lowest;
         var numInterests:int = this._interests.length;
         var len:int = this._history.length;
         for(var j:int = 0; j < numInterests; j++)
         {
            interest = this._interests[j];
            first = true;
            for(i = 1; i < W; i++)
            {
               if(len < i)
               {
                  break;
               }
               values = this._history[len - i];
               if(first)
               {
                  this.graph.graphics.lineStyle(1,interest.col);
               }
               Y = (!!diffGraph ? (values[j] - this.lowest) / diffGraph : 0.5) * H;
               if(!this.inverse)
               {
                  Y = H - Y;
               }
               if(Y < 0)
               {
                  Y = 0;
               }
               if(Y > H)
               {
                  Y = H;
               }
               this.graph.graphics[!!first ? "moveTo" : "lineTo"](W - i,Y);
               first = false;
            }
            if(this.averaging > 0 && diffGraph)
            {
               Y = (interest.avg - this.lowest) / diffGraph * H;
               if(!this.inverse)
               {
                  Y = H - Y;
               }
               if(Y < -1)
               {
                  Y = -1;
               }
               if(Y > H)
               {
                  Y = H + 1;
               }
               this.graph.graphics.lineStyle(1,interest.col,0.3);
               this.graph.graphics.moveTo(0,Y);
               this.graph.graphics.lineTo(W,Y);
            }
         }
         (!!this.inverse ? this.highTxt : this.lowTxt).text = !!isNaN(this.lowest) ? "" : "<s>" + this.lowest + "</s>";
         (!!this.inverse ? this.lowTxt : this.highTxt).text = !!isNaN(this.highest) ? "" : "<s>" + this.highest + "</s>";
      }
      
      public function updateKeyText() : void
      {
         var interest:Interest = null;
         var str:* = "<r><s>";
         for each(interest in this._interests)
         {
            str += " <font color=\'#" + interest.col.toString(16) + "\'>" + interest.key + "</font>";
         }
         str += " | <menu><a href=\"event:reset\">R</a> <a href=\"event:close\">X</a></menu></s></r>";
         this.keyTxt.htmlText = str;
      }
      
      protected function linkHandler(e:TextEvent) : void
      {
         TextField(e.currentTarget).setSelection(0,0);
         if(e.text == "reset")
         {
            this.reset();
         }
         else if(e.text == "close")
         {
            this.close();
         }
         e.stopPropagation();
      }
      
      protected function onMenuRollOver(e:TextEvent) : void
      {
         master.panels.tooltip(!!e.text ? e.text.replace("event:","") : null,this);
      }
   }
}

import com.luaye.console.utils.WeakRef;

class Interest
{
    
   
   private var _ref:WeakRef;
   
   public var prop:String;
   
   public var col:Number;
   
   public var key:String;
   
   public var avg:Number;
   
   function Interest(object:Object, property:String, color:Number, keystr:String)
   {
      super();
      this._ref = new WeakRef(object);
      this.prop = property;
      this.col = color;
      this.key = keystr;
   }
   
   public function get obj() : Object
   {
      return this._ref.reference;
   }
}
