package com.luaye.console.view
{
   import com.luaye.console.Console;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public class PanelsManager
   {
      
      private static const USER_GRAPH_PREFIX:String = "graph_";
       
      
      private var _master:Console;
      
      private var _mainPanel:MainPanel;
      
      private var _ruler:Ruler;
      
      private var _tooltipField:TextField;
      
      public function PanelsManager(master:Console, mp:MainPanel)
      {
         super();
         this._master = master;
         this._tooltipField = new TextField();
         this._tooltipField.autoSize = TextFieldAutoSize.CENTER;
         this._tooltipField.multiline = true;
         this._tooltipField.background = true;
         this._tooltipField.backgroundColor = this._master.style.panelBackgroundColor;
         this._tooltipField.styleSheet = this._master.style.css;
         this._tooltipField.mouseEnabled = false;
         this._mainPanel = mp;
         this.addPanel(this._mainPanel);
      }
      
      public function addPanel(panel:AbstractPanel) : void
      {
         if(this._master.contains(this._tooltipField))
         {
            this._master.addChildAt(panel,this._master.getChildIndex(this._tooltipField));
         }
         else
         {
            this._master.addChild(panel);
         }
         panel.addEventListener(AbstractPanel.STARTED_DRAGGING,this.onPanelStartDragScale,false,0,true);
         panel.addEventListener(AbstractPanel.STARTED_SCALING,this.onPanelStartDragScale,false,0,true);
      }
      
      public function removePanel(n:String) : void
      {
         var panel:AbstractPanel = this._master.getChildByName(n) as AbstractPanel;
         if(panel)
         {
            panel.close();
         }
      }
      
      public function getPanel(n:String) : AbstractPanel
      {
         return this._master.getChildByName(n) as AbstractPanel;
      }
      
      public function get mainPanel() : MainPanel
      {
         return this._mainPanel;
      }
      
      public function panelExists(n:String) : Boolean
      {
         return !!(this._master.getChildByName(n) as AbstractPanel) ? true : false;
      }
      
      public function setPanelArea(panelname:String, rect:Rectangle) : void
      {
         var panel:AbstractPanel = this.getPanel(panelname);
         if(panel)
         {
            if(rect.x)
            {
               panel.x = rect.x;
            }
            if(rect.y)
            {
               panel.y = rect.y;
            }
            if(rect.width)
            {
               panel.width = rect.width;
            }
            if(rect.height)
            {
               panel.height = rect.height;
            }
         }
      }
      
      public function get channelsPanel() : Boolean
      {
         return !!(this.getPanel(Console.PANEL_CHANNELS) as ChannelsPanel) ? true : false;
      }
      
      public function set channelsPanel(b:Boolean) : void
      {
         var chpanel:ChannelsPanel = null;
         if(this.channelsPanel != b)
         {
            if(b)
            {
               chpanel = new ChannelsPanel(this._master);
               chpanel.x = this._mainPanel.x + this._mainPanel.width - 332;
               chpanel.y = this._mainPanel.y - 2;
               this.addPanel(chpanel);
            }
            else
            {
               this.removePanel(Console.PANEL_CHANNELS);
               this.updateMenu();
            }
         }
      }
      
      public function updateMenu() : void
      {
         this._mainPanel.updateMenu();
         var chpanel:ChannelsPanel = this.getPanel(Console.PANEL_CHANNELS) as ChannelsPanel;
         if(chpanel)
         {
            chpanel.update();
         }
      }
      
      public function get displayRoller() : Boolean
      {
         return !!(this.getPanel(Console.PANEL_ROLLER) as RollerPanel) ? true : false;
      }
      
      public function set displayRoller(n:Boolean) : void
      {
         var roller:RollerPanel = null;
         if(this.displayRoller != n)
         {
            if(n)
            {
               roller = new RollerPanel(this._master);
               roller.x = this._mainPanel.x + this._mainPanel.width - 160;
               roller.y = this._mainPanel.y + 55;
               this.addPanel(roller);
               roller.start(this._master);
            }
            else
            {
               this.removePanel(Console.PANEL_ROLLER);
            }
            this._mainPanel.updateMenu();
         }
      }
      
      public function get fpsMonitor() : Boolean
      {
         return this.getPanel(Console.PANEL_FPS) as FPSPanel != null;
      }
      
      public function set fpsMonitor(b:Boolean) : void
      {
         var fps:FPSPanel = null;
         if(this.fpsMonitor != b)
         {
            if(b)
            {
               fps = new FPSPanel(this._master);
               fps.x = this._mainPanel.x + this._mainPanel.width - 160;
               fps.y = this._mainPanel.y + 15;
               this.addPanel(fps);
            }
            else
            {
               this.removePanel(Console.PANEL_FPS);
            }
            this._mainPanel.updateMenu();
         }
      }
      
      public function get memoryMonitor() : Boolean
      {
         return this.getPanel(Console.PANEL_MEMORY) as MemoryPanel != null;
      }
      
      public function set memoryMonitor(b:Boolean) : void
      {
         var mp:MemoryPanel = null;
         if(this.memoryMonitor != b)
         {
            if(b)
            {
               mp = new MemoryPanel(this._master);
               mp.x = this._mainPanel.x + this._mainPanel.width - 80;
               mp.y = this._mainPanel.y + 15;
               this.addPanel(mp);
            }
            else
            {
               this.removePanel(Console.PANEL_MEMORY);
            }
            this._mainPanel.updateMenu();
         }
      }
      
      public function addGraph(n:String, obj:Object, prop:String, col:Number = -1, key:String = null, rect:Rectangle = null, inverse:Boolean = false) : void
      {
         n = USER_GRAPH_PREFIX + n;
         var graph:GraphingPanel = this.getPanel(n) as GraphingPanel;
         if(!graph)
         {
            graph = new GraphingPanel(this._master,100,100);
            graph.x = this._mainPanel.x + 80;
            graph.y = this._mainPanel.y + 20;
            graph.name = n;
         }
         if(rect)
         {
            graph.x = rect.x;
            graph.y = rect.y;
            if(rect.width > 0)
            {
               graph.width = rect.width;
            }
            if(rect.height > 0)
            {
               graph.height = rect.height;
            }
         }
         graph.inverse = inverse;
         graph.add(obj,prop,col,key);
         this.addPanel(graph);
      }
      
      public function fixGraphRange(n:String, min:Number = NaN, max:Number = NaN) : void
      {
         var graph:GraphingPanel = this.getPanel(USER_GRAPH_PREFIX + n) as GraphingPanel;
         if(graph)
         {
            graph.fixRange(min,max);
         }
      }
      
      public function removeGraph(n:String, obj:Object = null, prop:String = null) : void
      {
         var graph:GraphingPanel = this.getPanel(USER_GRAPH_PREFIX + n) as GraphingPanel;
         if(graph)
         {
            graph.remove(obj,prop);
         }
      }
      
      public function tooltip(str:String = null, panel:AbstractPanel = null) : void
      {
         var txtRect:Rectangle = null;
         var panRect:Rectangle = null;
         var doff:Number = NaN;
         var loff:Number = NaN;
         var roff:Number = NaN;
         if(str && !this.rulerActive)
         {
            str = str.replace(/\:\:(.*)/,"<br/><s>$1</s>");
            this._master.addChild(this._tooltipField);
            this._tooltipField.wordWrap = false;
            this._tooltipField.htmlText = "<tooltip>" + str + "</tooltip>";
            if(this._tooltipField.width > 120)
            {
               this._tooltipField.width = 120;
               this._tooltipField.wordWrap = true;
            }
            this._tooltipField.x = this._master.mouseX - this._tooltipField.width / 2;
            this._tooltipField.y = this._master.mouseY + 20;
            if(panel)
            {
               txtRect = this._tooltipField.getBounds(this._master);
               panRect = new Rectangle(panel.x,panel.y,panel.width,panel.height);
               doff = txtRect.bottom - panRect.bottom;
               if(doff > 0)
               {
                  if(this._tooltipField.y - doff > this._master.mouseY + 15)
                  {
                     this._tooltipField.y -= doff;
                  }
                  else if(panRect.y < this._master.mouseY - 24 && txtRect.y > panRect.bottom)
                  {
                     this._tooltipField.y = this._master.mouseY - this._tooltipField.height - 15;
                  }
               }
               loff = txtRect.left - panRect.left;
               roff = txtRect.right - panRect.right;
               if(loff < 0)
               {
                  this._tooltipField.x -= loff;
               }
               else if(roff > 0)
               {
                  this._tooltipField.x -= roff;
               }
            }
         }
         else if(this._master.contains(this._tooltipField))
         {
            this._master.removeChild(this._tooltipField);
         }
      }
      
      public function startRuler() : void
      {
         if(this.rulerActive)
         {
            return;
         }
         this._ruler = new Ruler();
         this._ruler.addEventListener(Ruler.EXIT,this.onRulerExit,false,0,true);
         this._master.addChild(this._ruler);
         this._ruler.start(this._master);
         this._mainPanel.updateMenu();
      }
      
      public function get rulerActive() : Boolean
      {
         return this._ruler && this._master.contains(this._ruler) ? true : false;
      }
      
      private function onRulerExit(e:Event) : void
      {
         if(this._ruler && this._master.contains(this._ruler))
         {
            this._master.removeChild(this._ruler);
         }
         this._ruler = null;
         this._mainPanel.updateMenu();
      }
      
      private function onPanelStartDragScale(e:Event) : void
      {
         var X:Array = null;
         var Y:Array = null;
         var numchildren:int = 0;
         var i:int = 0;
         var panel:AbstractPanel = null;
         var target:AbstractPanel = e.currentTarget as AbstractPanel;
         if(target.snapping)
         {
            X = [0];
            Y = [0];
            if(this._master.stage)
            {
               X.push(this._master.stage.stageWidth);
               Y.push(this._master.stage.stageHeight);
            }
            numchildren = this._master.numChildren;
            for(i = 0; i < numchildren; i++)
            {
               panel = this._master.getChildAt(i) as AbstractPanel;
               if(panel && panel.visible)
               {
                  X.push(panel.x);
                  X.push(panel.x + panel.width);
                  Y.push(panel.y);
                  Y.push(panel.y + panel.height);
               }
            }
            target.registerSnaps(X,Y);
         }
      }
   }
}
