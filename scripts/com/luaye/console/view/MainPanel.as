package com.luaye.console.view
{
   import com.luaye.console.Console;
   import com.luaye.console.core.CommandLine;
   import com.luaye.console.core.Log;
   import com.luaye.console.core.Logs;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.geom.ColorTransform;
   import flash.geom.Rectangle;
   import flash.system.Capabilities;
   import flash.system.Security;
   import flash.system.SecurityPanel;
   import flash.system.System;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   import flash.ui.Keyboard;
   
   public class MainPanel extends AbstractPanel
   {
      
      private static const CHANNELS_IN_MENU:int = 7;
      
      public static const TOOLTIPS:Object = {
         "fps":"Frames Per Second",
         "mm":"Memory Monitor",
         "roller":"Display Roller::Map the display list under your mouse",
         "ruler":"Screen Ruler::Measure the distance and angle between two points on screen.",
         "command":"Command Line",
         "copy":"Copy to clipboard",
         "clear":"Clear log",
         "trace":"Trace",
         "pause":"Pause updates",
         "resume":"Resume updates",
         "priority":"Priority filter",
         "channels":"Expand channels",
         "close":"Close",
         "closemain":"Close::Type password to show again",
         "viewall":"View all channels",
         "defaultch":"Default channel::Logs with no channel",
         "consolech":"Console\'s channel::Logs generated from Console",
         "filterch":"Filtering channel",
         "channel":"Change channel::Hold shift to select multiple channels",
         "scrollUp":"Scroll up",
         "scrollDown":"Scroll down",
         "scope":"Current scope::(CommandLine)"
      };
       
      
      private var _extraMenuKeys:Array;
      
      public var topMenuClick:Function;
      
      public var topMenuRollOver:Function;
      
      private var _traceField:TextField;
      
      private var _menuField:TextField;
      
      private var _commandPrefx:TextField;
      
      private var _commandField:TextField;
      
      private var _commandBackground:Shape;
      
      private var _bottomLine:Shape;
      
      private var _isMinimised:Boolean;
      
      private var _shift:Boolean;
      
      private var _canUseTrace:Boolean;
      
      private var _scrollbar:Sprite;
      
      private var _scroller:Sprite;
      
      private var _scrolldelay:uint;
      
      private var _scrolldir:int;
      
      private var _channels:Array;
      
      private var _lines:Logs;
      
      private var _commandsHistory:Array;
      
      private var _commandsInd:int;
      
      private var _needUpdateMenu:Boolean;
      
      private var _needUpdateTrace:Boolean;
      
      private var _lockScrollUpdate:Boolean;
      
      private var _atBottom:Boolean = true;
      
      private var _enteringLogin:Boolean;
      
      public function MainPanel(m:Console, lines:Logs, channels:Array)
      {
         this._extraMenuKeys = [];
         this._commandsHistory = [];
         super(m);
         this._canUseTrace = Capabilities.playerType == "External" || Capabilities.isDebugger;
         this._channels = channels;
         this._lines = lines;
         name = Console.PANEL_MAIN;
         minimumWidth = 50;
         minimumHeight = 18;
         this._traceField = new TextField();
         this._traceField.name = "traceField";
         this._traceField.wordWrap = true;
         this._traceField.background = false;
         this._traceField.multiline = true;
         this._traceField.styleSheet = style.css;
         this._traceField.y = 12;
         this._traceField.addEventListener(Event.SCROLL,this.onTraceScroll,false,0,true);
         addChild(this._traceField);
         this._menuField = new TextField();
         this._menuField.name = "menuField";
         this._menuField.styleSheet = style.css;
         this._menuField.height = 18;
         this._menuField.y = -2;
         registerRollOverTextField(this._menuField);
         this._menuField.addEventListener(AbstractPanel.TEXT_LINK,this.onMenuRollOver,false,0,true);
         addChild(this._menuField);
         this._commandBackground = new Shape();
         this._commandBackground.name = "commandBackground";
         this._commandBackground.graphics.beginFill(style.commandLineColor,0.1);
         this._commandBackground.graphics.drawRoundRect(0,0,100,18,12,12);
         this._commandBackground.scale9Grid = new Rectangle(9,9,80,1);
         addChild(this._commandBackground);
         this._commandField = new TextField();
         this._commandField.name = "commandField";
         this._commandField.type = TextFieldType.INPUT;
         this._commandField.x = 40;
         this._commandField.height = 18;
         this._commandField.addEventListener(KeyboardEvent.KEY_DOWN,this.commandKeyDown,false,0,true);
         this._commandField.addEventListener(KeyboardEvent.KEY_UP,this.commandKeyUp,false,0,true);
         this._commandField.defaultTextFormat = style.textFormat;
         addChild(this._commandField);
         this._commandPrefx = new TextField();
         this._commandPrefx.name = "commandPrefx";
         this._commandPrefx.type = TextFieldType.DYNAMIC;
         this._commandPrefx.x = 2;
         this._commandPrefx.height = 18;
         this._commandPrefx.selectable = false;
         this._commandPrefx.styleSheet = style.css;
         this._commandPrefx.text = " ";
         this._commandPrefx.addEventListener(MouseEvent.MOUSE_DOWN,this.onCmdPrefMouseDown,false,0,true);
         this._commandPrefx.addEventListener(MouseEvent.MOUSE_MOVE,this.onCmdPrefRollOverOut,false,0,true);
         this._commandPrefx.addEventListener(MouseEvent.ROLL_OUT,this.onCmdPrefRollOverOut,false,0,true);
         addChild(this._commandPrefx);
         this._bottomLine = new Shape();
         this._bottomLine.name = "blinkLine";
         this._bottomLine.alpha = 0.2;
         addChild(this._bottomLine);
         this._scrollbar = new Sprite();
         this._scrollbar.name = "scrollbar";
         this._scrollbar.buttonMode = true;
         this._scrollbar.addEventListener(MouseEvent.MOUSE_DOWN,this.onScrollbarDown,false,0,true);
         this._scrollbar.y = 16;
         addChild(this._scrollbar);
         this._scroller = new Sprite();
         this._scroller.name = "scroller";
         this._scroller.graphics.beginFill(style.panelScalerColor,1);
         this._scroller.graphics.drawRect(-5,0,5,30);
         this._scroller.graphics.beginFill(0,0);
         this._scroller.graphics.drawRect(-10,0,10,30);
         this._scroller.graphics.endFill();
         this._scroller.buttonMode = true;
         this._scroller.addEventListener(MouseEvent.MOUSE_DOWN,this.onScrollerDown,false,0,true);
         addChild(this._scroller);
         this._commandField.visible = false;
         this._commandPrefx.visible = false;
         this._commandBackground.visible = false;
         init(420,100,true);
         registerDragger(this._menuField);
         addEventListener(TextEvent.LINK,this.linkHandler,false,0,true);
         addEventListener(Event.ADDED_TO_STAGE,this.stageAddedHandle,false,0,true);
         addEventListener(Event.REMOVED_FROM_STAGE,this.stageRemovedHandle,false,0,true);
         master.cl.addEventListener(CommandLine.CHANGED_SCOPE,this.onUpdateCommandLineScope,false,0,true);
      }
      
      public function addMenuKey(key:String) : void
      {
         this._extraMenuKeys.push(key);
         this._needUpdateMenu = true;
      }
      
      private function stageAddedHandle(e:Event = null) : void
      {
         stage.addEventListener(KeyboardEvent.KEY_UP,this.keyUpHandler,false,0,true);
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this.keyDownHandler,false,0,true);
      }
      
      private function stageRemovedHandle(e:Event = null) : void
      {
         stage.removeEventListener(KeyboardEvent.KEY_UP,this.keyUpHandler);
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.keyDownHandler);
      }
      
      private function onCmdPrefRollOverOut(e:MouseEvent) : void
      {
         master.panels.tooltip(e.type == MouseEvent.MOUSE_MOVE ? TOOLTIPS["scope"] : "",this);
      }
      
      private function onCmdPrefMouseDown(e:MouseEvent) : void
      {
         stage.focus = this._commandField;
         this._commandField.setSelection(this._commandField.text.length,this._commandField.text.length);
      }
      
      private function keyDownHandler(e:KeyboardEvent) : void
      {
         if(e.keyCode == Keyboard.SHIFT)
         {
            this._shift = true;
         }
      }
      
      private function keyUpHandler(e:KeyboardEvent) : void
      {
         if(e.keyCode == Keyboard.SHIFT)
         {
            this._shift = false;
         }
      }
      
      public function requestLogin(on:Boolean = true) : void
      {
         var ct:ColorTransform = new ColorTransform();
         if(on)
         {
            master.commandLine = true;
            master.report("//",-2);
            master.report("// <b>Enter remoting password</b> in CommandLine below...",-2);
            this.updateCLScope("Password");
            ct.color = style.bottomLineColor;
            this._commandBackground.transform.colorTransform = ct;
            this._traceField.transform.colorTransform = new ColorTransform(0.7,0.7,0.7);
         }
         else
         {
            this.updateCLScope("?");
            this._commandBackground.transform.colorTransform = ct;
            this._traceField.transform.colorTransform = ct;
         }
         this._commandField.displayAsPassword = on;
         this._enteringLogin = on;
      }
      
      public function update(changed:Boolean) : void
      {
         if(this._bottomLine.alpha > 0)
         {
            this._bottomLine.alpha -= 0.25;
         }
         if(changed)
         {
            this._bottomLine.alpha = 1;
            this._needUpdateMenu = true;
            this._needUpdateTrace = true;
         }
         if(this._needUpdateTrace)
         {
            this._needUpdateTrace = false;
            this._updateTraces(true);
         }
         if(this._needUpdateMenu)
         {
            this._needUpdateMenu = false;
            this._updateMenu();
         }
      }
      
      public function updateToBottom() : void
      {
         this._atBottom = true;
         this._needUpdateTrace = true;
      }
      
      public function updateTraces(instant:Boolean = false) : void
      {
         if(instant)
         {
            this._updateTraces();
         }
         else
         {
            this._needUpdateTrace = true;
         }
      }
      
      private function _updateTraces(onlyBottom:Boolean = false) : void
      {
         if(this._atBottom)
         {
            this.updateBottom();
         }
         else if(!onlyBottom)
         {
            this.updateFull();
         }
      }
      
      private function updateFull() : void
      {
         var str:String = "";
         var line:Log = this._lines.first;
         while(line)
         {
            if(master.lineShouldShow(line))
            {
               str += this.makeLine(line);
            }
            line = line.next;
         }
         this._lockScrollUpdate = true;
         this._traceField.htmlText = str;
         this._lockScrollUpdate = false;
         this.updateScroller();
      }
      
      public function setPaused(b:Boolean) : void
      {
         if(b && this._atBottom)
         {
            this._atBottom = false;
            this.updateTraces(true);
            this._traceField.scrollV = this._traceField.maxScrollV;
         }
         else if(!b)
         {
            this._atBottom = true;
            this.updateBottom();
         }
         this.updateMenu();
      }
      
      private function updateBottom() : void
      {
         var lines:Array = new Array();
         var linesLeft:int = Math.round(this._traceField.height / 10);
         var line:Log = this._lines.last;
         while(line)
         {
            if(master.lineShouldShow(line))
            {
               linesLeft--;
               lines.push(this.makeLine(line));
               if(linesLeft <= 0)
               {
                  break;
               }
            }
            line = line.prev;
         }
         this._lockScrollUpdate = true;
         this._traceField.htmlText = lines.reverse().join("");
         this._traceField.scrollV = this._traceField.maxScrollV;
         this._lockScrollUpdate = false;
         this.updateScroller();
      }
      
      private function makeLine(line:Log) : String
      {
         var str:String = "";
         var txt:String = line.text;
         if(master.prefixChannelNames && (master.viewingChannels.indexOf(Console.GLOBAL_CHANNEL) >= 0 || master.viewingChannels.length > 1) && line.c != Console.DEFAULT_CHANNEL)
         {
            txt = "[<a href=\"event:channel_" + line.c + "\">" + line.c + "</a>] " + txt;
         }
         var ptag:String = "p" + line.p;
         return str + ("<p><" + ptag + ">" + txt + "</" + ptag + "></p>");
      }
      
      private function onTraceScroll(e:Event = null) : void
      {
         var diff:int = 0;
         if(this._lockScrollUpdate)
         {
            return;
         }
         var atbottom:* = this._traceField.scrollV >= this._traceField.maxScrollV - 1;
         if(!master.paused && this._atBottom != atbottom)
         {
            diff = this._traceField.maxScrollV - this._traceField.scrollV;
            this._atBottom = atbottom;
            this._updateTraces();
            this._traceField.scrollV = this._traceField.maxScrollV - diff;
         }
         this.updateScroller();
      }
      
      private function updateScroller() : void
      {
         var per:Number = NaN;
         if(this._traceField.maxScrollV <= 1 || this.scrollerMaxY < 22)
         {
            this._scroller.visible = false;
            this._scrollbar.visible = false;
         }
         else
         {
            this._scrollbar.visible = true;
            this._scroller.visible = true;
            if(this._atBottom)
            {
               this._scroller.y = this.scrollerMaxY;
            }
            else
            {
               per = (this._traceField.scrollV - 1) / (this._traceField.maxScrollV - 1);
               this._scroller.y = 21 + (this.scrollerMaxY - 21) * per;
            }
         }
      }
      
      private function onScrollerDown(e:MouseEvent) : void
      {
         var Y:int = 0;
         if(!master.paused)
         {
            this._atBottom = false;
            Y = this._scroller.y;
            this._updateTraces();
            this._scroller.y = Y;
         }
         this._scroller.startDrag(false,new Rectangle(this._scroller.x,21,0,this.scrollerMaxY - 21));
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onScrollerMove,false,0,true);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onScrollerUp,false,0,true);
      }
      
      private function onScrollerMove(e:MouseEvent) : void
      {
         var minY:Number = 21;
         var per:Number = (this._scroller.y - minY) / (this.scrollerMaxY - minY);
         this._lockScrollUpdate = true;
         this._traceField.scrollV = Math.round(per * (this._traceField.maxScrollV - 1) + 1);
         this._lockScrollUpdate = false;
      }
      
      private function get scrollerMaxY() : Number
      {
         return this._bottomLine.y - this._scroller.height - (!!this._commandField.visible ? 5 : 15);
      }
      
      private function onScrollerUp(e:MouseEvent) : void
      {
         this._scroller.stopDrag();
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onScrollerMove);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onScrollerUp);
         this.onTraceScroll();
      }
      
      private function onScrollbarDown(e:MouseEvent) : void
      {
         if(this._scroller.mouseY > 0)
         {
            this._traceField.scrollV += 3;
            this._scrolldir = 3;
         }
         else
         {
            this._traceField.scrollV -= 3;
            this._scrolldir = -3;
         }
         this._scrolldelay = 0;
         this._scrollbar.addEventListener(Event.ENTER_FRAME,this.onScrollBarFrame,false,0,true);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onScrollBarUp,false,0,true);
      }
      
      private function onScrollBarFrame(e:Event) : void
      {
         ++this._scrolldelay;
         if(this._scrolldelay > 10)
         {
            this._scrolldelay = 9;
            if(this._scrolldir < 0 && this._scroller.y > mouseY || this._scrolldir > 0 && this._scroller.y + this._scroller.height < mouseY)
            {
               this._traceField.scrollV += this._scrolldir;
            }
         }
      }
      
      private function onScrollBarUp(e:Event) : void
      {
         this._scrollbar.removeEventListener(Event.ENTER_FRAME,this.onScrollBarFrame);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onScrollBarUp);
      }
      
      override public function set width(n:Number) : void
      {
         this._lockScrollUpdate = true;
         super.width = n;
         this._traceField.width = n - 4;
         this._menuField.width = n;
         this._commandField.width = width - 15 - this._commandField.x;
         this._commandBackground.width = n;
         this._bottomLine.graphics.clear();
         this._bottomLine.graphics.lineStyle(1,style.bottomLineColor);
         this._bottomLine.graphics.moveTo(10,-1);
         this._bottomLine.graphics.lineTo(n - 10,-1);
         this._scroller.x = n;
         this._scrollbar.x = n;
         this.onUpdateCommandLineScope();
         this._atBottom = true;
         this._needUpdateMenu = true;
         this._needUpdateTrace = true;
         this._lockScrollUpdate = false;
      }
      
      override public function set height(n:Number) : void
      {
         this._lockScrollUpdate = true;
         super.height = n;
         var minimize:Boolean = false;
         if(n < (!!this._commandField.visible ? 42 : 24))
         {
            minimize = true;
         }
         if(this._isMinimised != minimize)
         {
            registerDragger(this._menuField,minimize);
            registerDragger(this._traceField,!minimize);
            this._isMinimised = minimize;
         }
         this._menuField.visible = !minimize;
         this._traceField.y = !!minimize ? Number(0) : Number(12);
         this._traceField.height = n - (!!this._commandField.visible ? 16 : 0) - (!!minimize ? 0 : 12);
         var cmdy:Number = n - 18;
         this._commandField.y = cmdy;
         this._commandPrefx.y = cmdy;
         this._commandBackground.y = cmdy;
         this._bottomLine.y = !!this._commandField.visible ? Number(cmdy) : Number(n);
         var sbh:Number = this._bottomLine.y - (!!this._commandField.visible ? 0 : 10) - this._scrollbar.y;
         this._scrollbar.graphics.clear();
         this._scrollbar.graphics.beginFill(style.panelScalerColor,0.7);
         this._scrollbar.graphics.drawRect(-5,0,5,5);
         this._scrollbar.graphics.drawRect(-5,sbh - 5,5,5);
         this._scrollbar.graphics.beginFill(style.panelScalerColor,0.25);
         this._scrollbar.graphics.drawRect(-5,5,5,sbh - 10);
         this._scrollbar.graphics.endFill();
         this._atBottom = true;
         this._needUpdateTrace = true;
         this._lockScrollUpdate = false;
      }
      
      public function updateMenu(instant:Boolean = false) : void
      {
         if(instant)
         {
            this._updateMenu();
         }
         else
         {
            this._needUpdateMenu = true;
         }
      }
      
      private function _updateMenu() : void
      {
         var link:String = null;
         var str:* = "<r><w>";
         if(!master.channelsPanel)
         {
            str += this.getChannelsLink(true);
         }
         str += "<menu>[ <b>";
         str += this.doActive("<a href=\"event:fps\">F</a>",master.fpsMonitor > 0);
         str += this.doActive(" <a href=\"event:mm\">M</a>",master.memoryMonitor > 0);
         if(master.commandLineAllowed)
         {
            str += this.doActive(" <a href=\"event:command\">CL</a>",this.commandLine);
         }
         if(!master.remote)
         {
            str += this.doActive(" <a href=\"event:roller\">Ro</a>",master.displayRoller);
            str += this.doActive(" <a href=\"event:ruler\">RL</a>",master.panels.rulerActive);
         }
         str += " ¦</b>";
         for each(link in this._extraMenuKeys)
         {
            str += " <a href=\"event:" + link + "\">" + link + "</a>";
         }
         if(this._canUseTrace)
         {
            str += this.doActive(" <a href=\"event:trace\">T</a>",master.tracing);
         }
         str += " <a href=\"event:copy\">Cc</a>";
         str += " <a href=\"event:priority\">P" + master.priority + "</a>";
         str += this.doActive(" <a href=\"event:pause\">P</a>",master.paused);
         str += " <a href=\"event:clear\">C</a> <a href=\"event:close\">X</a>";
         str += " ]</menu> </w></r>";
         this._menuField.htmlText = str;
         this._menuField.scrollH = this._menuField.maxScrollH;
      }
      
      public function getChannelsLink(limited:Boolean = false) : String
      {
         var channel:String = null;
         var channelTxt:String = null;
         var str:String = "<chs>";
         var len:int = this._channels.length;
         if(limited && len > CHANNELS_IN_MENU)
         {
            len = CHANNELS_IN_MENU;
         }
         for(var ci:int = 0; ci < len; ci++)
         {
            channel = this._channels[ci];
            channelTxt = master.viewingChannels.indexOf(channel) >= 0 ? "<ch><b>" + channel + "</b></ch>" : channel;
            str += "<a href=\"event:channel_" + channel + "\">[" + channelTxt + "]</a> ";
         }
         if(limited)
         {
            str += "<ch><a href=\"event:channels\"><b>" + (this._channels.length > len ? "..." : "") + "</b>^^ </a></ch>";
         }
         return str + "</chs> ";
      }
      
      private function doActive(str:String, b:Boolean) : String
      {
         if(b)
         {
            return "<y>" + str + "</y>";
         }
         return str;
      }
      
      public function onMenuRollOver(e:TextEvent, src:AbstractPanel = null) : void
      {
         var t:String = null;
         if(src == null)
         {
            src = this;
         }
         var txt:* = !!e.text ? e.text.replace("event:","") : "";
         if(this.topMenuRollOver != null)
         {
            t = this.topMenuRollOver(txt);
            if(t)
            {
               master.panels.tooltip(t,src);
               return;
            }
         }
         if(txt == "channel_" + Console.GLOBAL_CHANNEL)
         {
            txt = TOOLTIPS["viewall"];
         }
         else if(txt == "channel_" + Console.DEFAULT_CHANNEL)
         {
            txt = TOOLTIPS["defaultch"];
         }
         else if(txt == "channel_" + Console.CONSOLE_CHANNEL)
         {
            txt = TOOLTIPS["consolech"];
         }
         else if(txt == "channel_" + Console.FILTERED_CHANNEL)
         {
            txt = TOOLTIPS["filterch"] + "::*" + master.filterText + "*";
         }
         else if(txt.indexOf("channel_") == 0)
         {
            txt = TOOLTIPS["channel"];
         }
         else if(txt == "pause")
         {
            if(master.paused)
            {
               txt = TOOLTIPS["resume"];
            }
            else
            {
               txt = TOOLTIPS["pause"];
            }
         }
         else if(txt == "copy")
         {
            txt = TOOLTIPS["copy"];
         }
         else if(txt == "close" && src == this)
         {
            txt = TOOLTIPS["closemain"];
         }
         else
         {
            txt = TOOLTIPS[txt];
         }
         master.panels.tooltip(txt,src);
      }
      
      private function linkHandler(e:TextEvent) : void
      {
         var str:String = null;
         this._menuField.setSelection(0,0);
         stopDrag();
         if(this.topMenuClick != null && this.topMenuClick(e.text))
         {
            return;
         }
         if(e.text == "pause")
         {
            if(master.paused)
            {
               master.paused = false;
               master.panels.tooltip(TOOLTIPS["pause"],this);
            }
            else
            {
               master.paused = true;
               master.panels.tooltip(TOOLTIPS["resume"],this);
            }
         }
         else if(e.text == "trace")
         {
            master.tracing = !master.tracing;
            if(master.tracing)
            {
               master.report("Tracing turned [<b>On</b>]",-1);
            }
            else
            {
               master.report("Tracing turned [<b>Off</b>]",-1);
            }
         }
         else if(e.text == "close")
         {
            master.panels.tooltip();
            visible = false;
         }
         else if(e.text == "channels")
         {
            master.channelsPanel = !master.channelsPanel;
         }
         else if(e.text == "fps")
         {
            master.fpsMonitor = !master.fpsMonitor;
         }
         else if(e.text == "priority")
         {
            if(master.priority < 10)
            {
               ++master.priority;
            }
            else
            {
               master.priority = 0;
            }
         }
         else if(e.text == "mm")
         {
            master.memoryMonitor = !master.memoryMonitor;
         }
         else if(e.text == "roller")
         {
            master.displayRoller = !master.displayRoller;
         }
         else if(e.text == "ruler")
         {
            master.panels.tooltip();
            master.panels.startRuler();
         }
         else if(e.text == "command")
         {
            this.commandLine = !this.commandLine;
         }
         else if(e.text == "copy")
         {
            System.setClipboard(master.getAllLog());
            master.report("Copied log to clipboard.",-1);
         }
         else if(e.text == "clear")
         {
            master.clear();
         }
         else if(e.text == "settings")
         {
            master.report("A new window should open in browser. If not, try searching for \'Flash Player Global Security Settings panel\' online :)",-1);
            Security.showSettings(SecurityPanel.SETTINGS_MANAGER);
         }
         else if(e.text.substring(0,8) == "channel_")
         {
            this.onChannelPressed(e.text.substring(8));
         }
         else if(e.text.substring(0,5) == "clip_")
         {
            str = "/remap " + e.text.substring(5);
            master.runCommand(str);
         }
         else if(e.text.substring(0,6) == "sclip_")
         {
            master.runCommand("/remap 0" + Console.MAPPING_SPLITTER + e.text.substring(6));
         }
         this._menuField.setSelection(0,0);
         e.stopPropagation();
      }
      
      public function onChannelPressed(chn:String) : void
      {
         var ind:int = 0;
         var current:Array = master.viewingChannels.concat();
         if(this._shift && master.viewingChannel != Console.GLOBAL_CHANNEL && chn != Console.GLOBAL_CHANNEL)
         {
            ind = current.indexOf(chn);
            if(ind >= 0)
            {
               current.splice(ind,1);
               if(current.length == 0)
               {
                  current.push(Console.GLOBAL_CHANNEL);
               }
            }
            else
            {
               current.push(chn);
            }
            master.viewingChannels = current;
         }
         else
         {
            master.viewingChannel = chn;
         }
      }
      
      private function commandKeyDown(e:KeyboardEvent) : void
      {
         e.stopPropagation();
      }
      
      private function commandKeyUp(e:KeyboardEvent) : void
      {
         if(!master.enabled)
         {
            return;
         }
         if(e.keyCode == 13)
         {
            if(this._enteringLogin)
            {
               master.sendLogin(this._commandField.text);
               this._commandField.text = "";
               this.requestLogin(false);
            }
            else
            {
               master.runCommand(this._commandField.text);
               this._commandsHistory.unshift(this._commandField.text);
               this._commandsInd = -1;
               this._commandField.text = "";
               if(this._commandsHistory.length > 20)
               {
                  this._commandsHistory.splice(20);
               }
            }
         }
         else if(e.keyCode == 38)
         {
            if(this._commandField.text && this._commandsInd < 0)
            {
               this._commandsHistory.unshift(this._commandField.text);
               ++this._commandsInd;
            }
            if(this._commandsInd < this._commandsHistory.length - 1)
            {
               ++this._commandsInd;
               this._commandField.text = this._commandsHistory[this._commandsInd];
               this._commandField.setSelection(this._commandField.text.length,this._commandField.text.length);
            }
            else
            {
               this._commandsInd = this._commandsHistory.length;
               this._commandField.text = "";
            }
         }
         else if(e.keyCode == 40)
         {
            if(this._commandsInd > 0)
            {
               --this._commandsInd;
               this._commandField.text = this._commandsHistory[this._commandsInd];
               this._commandField.setSelection(this._commandField.text.length,this._commandField.text.length);
            }
            else
            {
               this._commandsInd = -1;
               this._commandField.text = "";
            }
         }
         e.stopPropagation();
      }
      
      private function onUpdateCommandLineScope(e:Event = null) : void
      {
         if(!master.remote)
         {
            this.updateCLScope(master.cl.scopeString);
         }
      }
      
      public function updateCLScope(str:String) : void
      {
         if(this._enteringLogin)
         {
            this._enteringLogin = false;
            this.requestLogin(false);
         }
         this._commandPrefx.autoSize = TextFieldAutoSize.LEFT;
         this._commandPrefx.htmlText = "<w><p1>" + str + ":</p1></w>";
         var w:Number = width - 48;
         if(this._commandPrefx.width > 120 || this._commandPrefx.width > w)
         {
            this._commandPrefx.autoSize = TextFieldAutoSize.NONE;
            this._commandPrefx.width = w > 120 ? Number(120) : Number(w);
            this._commandPrefx.scrollH = this._commandPrefx.maxScrollH;
         }
         this._commandField.x = this._commandPrefx.width + 2;
         this._commandField.width = width - 15 - this._commandField.x;
      }
      
      public function set commandLine(b:Boolean) : void
      {
         if(b && master.commandLineAllowed > 0)
         {
            this._commandField.visible = true;
            this._commandPrefx.visible = true;
            this._commandBackground.visible = true;
         }
         else
         {
            this._commandField.visible = false;
            this._commandPrefx.visible = false;
            this._commandBackground.visible = false;
         }
         this.height = height;
      }
      
      public function get commandLine() : Boolean
      {
         return this._commandField.visible;
      }
   }
}
