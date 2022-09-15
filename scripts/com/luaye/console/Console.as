package com.luaye.console
{
   import com.luaye.console.core.CommandLine;
   import com.luaye.console.core.Log;
   import com.luaye.console.core.Logs;
   import com.luaye.console.core.MemoryMonitor;
   import com.luaye.console.core.Remoting;
   import com.luaye.console.utils.Utils;
   import com.luaye.console.view.ChannelsPanel;
   import com.luaye.console.view.FPSPanel;
   import com.luaye.console.view.MainPanel;
   import com.luaye.console.view.PanelsManager;
   import com.luaye.console.view.RollerPanel;
   import com.luaye.console.view.Style;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.geom.Rectangle;
   import flash.net.LocalConnection;
   import flash.system.System;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getTimer;
   
   public class Console extends Sprite
   {
      
      public static const VERSION:Number = 2.31;
      
      public static const VERSION_STAGE:String = "";
      
      public static const NAME:String = "Console";
      
      public static const PANEL_MAIN:String = "mainPanel";
      
      public static const PANEL_CHANNELS:String = "channelsPanel";
      
      public static const PANEL_FPS:String = "fpsPanel";
      
      public static const PANEL_MEMORY:String = "memoryPanel";
      
      public static const PANEL_ROLLER:String = "rollerPanel";
      
      public static var REMOTING_CONN_NAME:String = "_Console";
      
      public static const CONSOLE_CHANNEL:String = "C";
      
      public static const FILTERED_CHANNEL:String = "~";
      
      public static const GLOBAL_CHANNEL:String = " * ";
      
      public static const DEFAULT_CHANNEL:String = "-";
      
      public static const LOG_LEVEL:uint = 2;
      
      public static const INFO_LEVEL:uint = 4;
      
      public static const DEBUG_LEVEL:uint = 6;
      
      public static const WARN_LEVEL:uint = 8;
      
      public static const ERROR_LEVEL:uint = 10;
      
      public static const FATAL_LEVEL:uint = 100;
      
      public static const FPS_MAX_LAG_FRAMES:uint = 25;
      
      public static const MAPPING_SPLITTER:String = "|";
       
      
      public var style:Style;
      
      public var panels:PanelsManager;
      
      public var cl:CommandLine;
      
      private var mm:MemoryMonitor;
      
      private var remoter:Remoting;
      
      public var quiet:Boolean;
      
      public var maxLines:int = 1000;
      
      public var prefixChannelNames:Boolean = true;
      
      public var alwaysOnTop:Boolean = true;
      
      public var moveTopAttempts:int = 50;
      
      public var maxRepeats:Number = 75;
      
      public var remoteDelay:int = 20;
      
      public var tracingPriority:int = 0;
      
      public var rulerHidesMouse:Boolean = true;
      
      private var _isPaused:Boolean;
      
      private var _enabled:Boolean = true;
      
      private var _password:String;
      
      private var _passwordIndex:int;
      
      private var _remotingPassword:String = "";
      
      private var _tracing:Boolean = false;
      
      private var _filterText:String;
      
      private var _keyBinds:Object;
      
      private var _mspf:Number;
      
      private var _previousTime:Number;
      
      private var _traceCall:Function;
      
      private var _rollerCaptureKey:String;
      
      private var _needToMoveTop:Boolean;
      
      private var _commandLineAllowed:Boolean = true;
      
      private var _strongRef:Boolean;
      
      private var _channels:Array;
      
      private var _viewingChannels:Array;
      
      private var _tracingChannels:Array;
      
      private var _isRepeating:Boolean;
      
      private var _priority:int;
      
      private var _repeated:int;
      
      private var _lines:Logs;
      
      private var _lineAdded:Boolean;
      
      public function Console(pass:String = "", uiset:int = 1)
      {
         this._keyBinds = {};
         this._traceCall = trace;
         this._channels = [GLOBAL_CHANNEL,DEFAULT_CHANNEL];
         this._viewingChannels = [GLOBAL_CHANNEL];
         this._tracingChannels = [];
         super();
         name = NAME;
         if(pass == null)
         {
            pass = "";
         }
         this._password = pass;
         this._remotingPassword = pass;
         tabChildren = false;
         this._lines = new Logs();
         this.cl = new CommandLine(this);
         this.remoter = new Remoting(this,this.remoteLogSend);
         this.mm = new MemoryMonitor();
         this.style = new Style(uiset);
         this.panels = new PanelsManager(this,new MainPanel(this,this._lines,this._channels));
         this.report("<b>Console v" + VERSION + (!!VERSION_STAGE ? " " + VERSION_STAGE : "") + ", Happy bug fixing!</b>",-2);
         addEventListener(Event.ADDED_TO_STAGE,this.stageAddedHandle,false,0,true);
         addEventListener(Event.REMOVED_FROM_STAGE,this.stageRemovedHandle,false,0,true);
         if(this._password)
         {
            visible = false;
         }
      }
      
      public static function get remoteIsRunning() : Boolean
      {
         var sCon:LocalConnection = new LocalConnection();
         try
         {
            sCon.allowInsecureDomain("*");
            sCon.connect(REMOTING_CONN_NAME + Remoting.REMOTE_PREFIX);
         }
         catch(error:Error)
         {
            return true;
         }
         sCon.close();
         return false;
      }
      
      private function stageAddedHandle(e:Event = null) : void
      {
         if(this.cl.base == null)
         {
            this.cl.base = parent;
         }
         addEventListener(Event.ENTER_FRAME,this._onEnterFrame,false,0,true);
         parent.addEventListener(Event.ADDED,this.onParentDisplayAdded,false,0,true);
         stage.addEventListener(Event.MOUSE_LEAVE,this.onStageMouseLeave,false,0,true);
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this.keyUpHandler,false,0,true);
      }
      
      private function stageRemovedHandle(e:Event = null) : void
      {
         removeEventListener(Event.ENTER_FRAME,this._onEnterFrame);
         parent.removeEventListener(Event.ADDED,this.onParentDisplayAdded);
         stage.removeEventListener(Event.MOUSE_LEAVE,this.onStageMouseLeave);
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.keyUpHandler);
      }
      
      private function onParentDisplayAdded(e:Event) : void
      {
         if((e.target as DisplayObject).parent == parent)
         {
            this._needToMoveTop = true;
         }
      }
      
      private function onStageMouseLeave(e:Event) : void
      {
         this.panels.tooltip(null);
      }
      
      private function keyUpHandler(e:KeyboardEvent) : void
      {
         var char:String = null;
         var key:String = null;
         var bind:Array = null;
         if(!this._enabled)
         {
            return;
         }
         if(e.keyLocation == 0)
         {
            char = String.fromCharCode(e.charCode);
            if(char == this._password.substring(this._passwordIndex,this._passwordIndex + 1))
            {
               ++this._passwordIndex;
               if(this._passwordIndex >= this._password.length)
               {
                  this._passwordIndex = 0;
                  if(visible && !this.panels.mainPanel.visible)
                  {
                     this.panels.mainPanel.visible = true;
                  }
                  else
                  {
                     visible = !visible;
                  }
               }
            }
            else
            {
               this._passwordIndex = 0;
               key = char.toLowerCase() + (!!e.ctrlKey ? "0" : "1") + (!!e.altKey ? "0" : "1") + (!!e.shiftKey ? "0" : "1");
               if(this._keyBinds[key])
               {
                  bind = this._keyBinds[key];
                  bind[0].apply(this,bind[1]);
               }
            }
         }
      }
      
      public function destroy() : void
      {
         this.enabled = false;
         this.remoter.close();
         removeEventListener(Event.ENTER_FRAME,this._onEnterFrame);
         this.cl.destory();
         if(stage)
         {
            this.stageRemovedHandle();
         }
      }
      
      public function addGraph(n:String, obj:Object, prop:String, col:Number = -1, key:String = null, rect:Rectangle = null, inverse:Boolean = false) : void
      {
         if(obj == null)
         {
            this.report("ERROR: Graph [" + n + "] received a null object to graph property [" + prop + "].",10);
            return;
         }
         this.panels.addGraph(n,obj,prop,col,key,rect,inverse);
      }
      
      public function fixGraphRange(n:String, min:Number = NaN, max:Number = NaN) : void
      {
         this.panels.fixGraphRange(n,min,max);
      }
      
      public function removeGraph(n:String, obj:Object = null, prop:String = null) : void
      {
         this.panels.removeGraph(n,obj,prop);
      }
      
      public function bindKey(char:String, ctrl:Boolean, alt:Boolean, shift:Boolean, fun:Function, args:Array = null) : void
      {
         if(!char || char.length != 1)
         {
            this.report("Binding key must be a single character. You gave [" + char + "]",10);
            return;
         }
         this.bindByKey(this.getKey(char,ctrl,alt,shift),fun,args);
         if(!this.quiet)
         {
            this.report((fun is Function ? "Bined" : "Unbined") + " key <b>" + char.toUpperCase() + "</b>" + (!!ctrl ? "+ctrl" : "") + (!!alt ? "+alt" : "") + (!!shift ? "+shift" : "") + ".",-1);
         }
      }
      
      private function bindByKey(key:String, fun:Function, args:Array = null) : void
      {
         if(fun == null)
         {
            delete this._keyBinds[key];
         }
         else
         {
            this._keyBinds[key] = [fun,args];
         }
      }
      
      private function getKey(char:String, ctrl:Boolean = false, alt:Boolean = false, shift:Boolean = false) : String
      {
         return char.toLowerCase() + (!!ctrl ? "0" : "1") + (!!alt ? "0" : "1") + (!!shift ? "0" : "1");
      }
      
      public function setPanelArea(panelname:String, rect:Rectangle) : void
      {
         this.panels.setPanelArea(panelname,rect);
      }
      
      public function get channelsPanel() : Boolean
      {
         return this.panels.channelsPanel;
      }
      
      public function set channelsPanel(b:Boolean) : void
      {
         var chPanel:ChannelsPanel = null;
         this.panels.channelsPanel = b;
         if(b)
         {
            chPanel = this.panels.getPanel(PANEL_CHANNELS) as ChannelsPanel;
            chPanel.start(this._channels);
         }
         this.panels.updateMenu();
      }
      
      public function get displayRoller() : Boolean
      {
         return this.panels.displayRoller;
      }
      
      public function set displayRoller(b:Boolean) : void
      {
         this.panels.displayRoller = b;
      }
      
      public function setRollerCaptureKey(char:String, ctrl:Boolean = false, alt:Boolean = false, shift:Boolean = false) : void
      {
         if(this._rollerCaptureKey)
         {
            this.bindByKey(this._rollerCaptureKey,null);
         }
         if(char && char.length == 1)
         {
            this._rollerCaptureKey = this.getKey(char,ctrl,alt,shift);
            this.bindByKey(this._rollerCaptureKey,this.onRollerCaptureKey);
         }
      }
      
      private function onRollerCaptureKey() : void
      {
         if(this.displayRoller)
         {
            this.report("Display Roller Capture:" + RollerPanel(this.panels.getPanel(PANEL_ROLLER)).capture(),-1);
         }
      }
      
      public function get fpsMonitor() : Boolean
      {
         return this.panels.fpsMonitor;
      }
      
      public function set fpsMonitor(b:Boolean) : void
      {
         this.panels.fpsMonitor = b;
      }
      
      public function get memoryMonitor() : Boolean
      {
         return this.panels.memoryMonitor;
      }
      
      public function set memoryMonitor(b:Boolean) : void
      {
         this.panels.memoryMonitor = b;
      }
      
      public function watch(o:Object, n:String = null) : String
      {
         var className:String = getQualifiedClassName(o);
         if(!n)
         {
            n = className + "@" + getTimer();
         }
         var nn:String = this.mm.watch(o,n);
         if(!this.quiet)
         {
            this.report("Watching <b>" + className + "</b> as <p5>" + nn + "</p5>.",-1);
         }
         return nn;
      }
      
      public function unwatch(n:String) : void
      {
         this.mm.unwatch(n);
      }
      
      public function gc() : void
      {
         var ok:Boolean = false;
         var str:String = null;
         if(this.remote)
         {
            try
            {
               this.report("Sending garbage collection request to client",-1);
               this.remoter.send("gc");
            }
            catch(e:Error)
            {
               report(e,10);
            }
         }
         else
         {
            ok = this.mm.gc();
            str = "Manual garbage collection " + (!!ok ? "successful." : "FAILED. You need debugger version of flash player.");
            this.report(str,!!ok ? Number(-1) : Number(10));
         }
      }
      
      public function store(n:String, obj:Object, strong:Boolean = false) : void
      {
         this.cl.store(n,obj,strong);
      }
      
      public function map(base:DisplayObjectContainer, maxstep:uint = 0) : void
      {
         this.cl.map(base,maxstep);
      }
      
      public function get strongRef() : Boolean
      {
         return this._strongRef;
      }
      
      public function set strongRef(b:Boolean) : void
      {
         this._strongRef = b;
      }
      
      public function inspect(obj:Object, detail:Boolean = true) : void
      {
         this.cl.inspect(obj,detail);
      }
      
      public function set enabled(newB:Boolean) : void
      {
         if(this._enabled == newB)
         {
            return;
         }
         if(this._enabled && !newB)
         {
            this.report("Disabled",10);
         }
         var pre:Boolean = this._enabled;
         this._enabled = newB;
         if(!pre && newB)
         {
            this.report("Enabled",-1);
         }
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function get paused() : Boolean
      {
         return this._isPaused;
      }
      
      public function set paused(newV:Boolean) : void
      {
         if(this._isPaused == newV)
         {
            return;
         }
         if(newV)
         {
            this.report("Paused",10);
         }
         else
         {
            this.report("Resumed",-1);
         }
         this._isPaused = newV;
         this.panels.mainPanel.setPaused(newV);
      }
      
      override public function get width() : Number
      {
         return this.panels.mainPanel.width;
      }
      
      override public function set width(newW:Number) : void
      {
         this.panels.mainPanel.width = newW;
      }
      
      override public function set height(newW:Number) : void
      {
         this.panels.mainPanel.height = newW;
      }
      
      override public function get height() : Number
      {
         return this.panels.mainPanel.height;
      }
      
      override public function get x() : Number
      {
         return this.panels.mainPanel.x;
      }
      
      override public function set x(newW:Number) : void
      {
         this.panels.mainPanel.x = newW;
      }
      
      override public function set y(newW:Number) : void
      {
         this.panels.mainPanel.y = newW;
      }
      
      override public function get y() : Number
      {
         return this.panels.mainPanel.y;
      }
      
      private function _onEnterFrame(e:Event) : void
      {
         var arr:Array = null;
         var chPanel:ChannelsPanel = null;
         if(!this._enabled)
         {
            return;
         }
         var time:int = getTimer();
         this._mspf = time - this._previousTime;
         this._previousTime = time;
         if(this._needToMoveTop && this.alwaysOnTop && this.moveTopAttempts > 0 && parent)
         {
            this._needToMoveTop = false;
            --this.moveTopAttempts;
            parent.setChildIndex(this,parent.numChildren - 1);
            if(!this.quiet)
            {
               this.report("Moved console on top (alwaysOnTop enabled), " + this.moveTopAttempts + " attempts left.",-1);
            }
         }
         if(this._isRepeating)
         {
            ++this._repeated;
            if(this._repeated > this.maxRepeats && this.maxRepeats >= 0)
            {
               this._isRepeating = false;
            }
         }
         if(!this._isPaused)
         {
            arr = this.mm.update();
            if(arr.length > 0)
            {
               this.report("<b>GARBAGE COLLECTED " + arr.length + " item(s): </b>" + arr.join(", "),-2);
            }
         }
         if(visible)
         {
            this.panels.mainPanel.update(!this._isPaused && this._lineAdded);
            if(this._lineAdded)
            {
               chPanel = this.panels.getPanel(PANEL_CHANNELS) as ChannelsPanel;
               if(chPanel)
               {
                  chPanel.update();
               }
               this._lineAdded = false;
            }
         }
         if(this.remoter.remoting)
         {
            this.remoter.update(this._mspf,!!stage ? Number(stage.frameRate) : Number(0));
         }
      }
      
      public function get fps() : Number
      {
         return 1000 / this._mspf;
      }
      
      public function get mspf() : Number
      {
         return this._mspf;
      }
      
      public function get currentMemory() : uint
      {
         return !!this.remoter.isRemote ? uint(this.remoter.remoteMem) : uint(System.totalMemory);
      }
      
      public function get remoting() : Boolean
      {
         return this.remoter.remoting;
      }
      
      public function set remoting(newV:Boolean) : void
      {
         this.remoter.remoting = newV;
      }
      
      public function get remote() : Boolean
      {
         return this.remoter.isRemote;
      }
      
      public function set remote(newV:Boolean) : void
      {
         this.remoter.isRemote = newV;
         this.panels.updateMenu();
      }
      
      public function sendLogin(pass:String) : void
      {
         this.remoter.login(pass);
      }
      
      public function checkLogin(pass:String) : Boolean
      {
         return !this._remotingPassword || this._remotingPassword == pass;
      }
      
      public function set remotingPassword(str:String) : void
      {
         this._remotingPassword = str;
         this.remoter.login(str);
      }
      
      private function remoteLogSend(obj:Array) : void
      {
         var line:Object = null;
         var remoteMSPFs:Array = null;
         var fpsp:FPSPanel = null;
         var highest:Number = NaN;
         var len:int = 0;
         var i:int = 0;
         var fps:Number = NaN;
         if(!this.remoter.isRemote || !obj)
         {
            return;
         }
         var lines:Array = obj[0];
         for each(line in lines)
         {
            if(line)
            {
               this.addLine(line.text,line.p,line.c,line.r,line.s);
            }
         }
         remoteMSPFs = obj[1];
         if(remoteMSPFs)
         {
            fpsp = this.panels.getPanel(PANEL_FPS) as FPSPanel;
            if(fpsp)
            {
               highest = remoteMSPFs[0];
               fpsp.highest = highest;
               fpsp.averaging = highest;
               len = remoteMSPFs.length;
               for(i = 1; i < len; i++)
               {
                  fps = 1000 / remoteMSPFs[i];
                  if(fps > highest)
                  {
                     fps = highest;
                  }
                  fpsp.addCurrent(fps);
               }
               fpsp.updateKeyText();
               fpsp.drawGraph();
            }
         }
         this.remoter.remoteMem = obj[2];
         if(obj[3])
         {
            this.panels.mainPanel.updateCLScope(obj[3]);
         }
      }
      
      public function set viewingChannel(str:String) : void
      {
         if(str)
         {
            this.viewingChannels = [str];
         }
         else
         {
            this.viewingChannels = [GLOBAL_CHANNEL];
         }
      }
      
      public function get viewingChannel() : String
      {
         return this._viewingChannels.join(",");
      }
      
      public function get viewingChannels() : Array
      {
         return this._viewingChannels.concat();
      }
      
      public function set viewingChannels(a:Array) : void
      {
         this._viewingChannels.splice(0);
         if(a && a.length)
         {
            this._viewingChannels.push.apply(this,a);
         }
         else
         {
            this._viewingChannels.push(GLOBAL_CHANNEL);
         }
         this.panels.mainPanel.updateToBottom();
         this.panels.updateMenu();
      }
      
      public function set tracingChannels(newVar:Array) : void
      {
         this._tracingChannels = !!newVar ? newVar.concat() : [];
      }
      
      public function get tracingChannels() : Array
      {
         return this._tracingChannels;
      }
      
      public function get tracing() : Boolean
      {
         return this._tracing;
      }
      
      public function set tracing(b:Boolean) : void
      {
         this._tracing = b;
         this.panels.mainPanel.updateMenu();
      }
      
      public function set traceCall(f:Function) : void
      {
         if(f == null)
         {
            this.report("C.traceCall function setter can not be null.",10);
         }
         else
         {
            this._traceCall = f;
         }
      }
      
      public function get traceCall() : Function
      {
         return this._traceCall;
      }
      
      public function report(obj:*, priority:Number = 0, skipSafe:Boolean = true) : void
      {
         this.addLine(obj,priority,CONSOLE_CHANNEL,false,skipSafe);
      }
      
      private function addLine(obj:*, priority:Number = 0, channel:String = null, isRepeating:Boolean = false, skipSafe:Boolean = false) : void
      {
         var off:int = 0;
         if(!this._enabled)
         {
            return;
         }
         var isRepeat:Boolean = isRepeating && this._isRepeating;
         var txt:String = obj is XML || obj is XMLList ? obj.toXMLString() : String(obj);
         if(!channel || channel == GLOBAL_CHANNEL)
         {
            channel = DEFAULT_CHANNEL;
         }
         if(this._tracing && !isRepeat && (this._tracingChannels.length == 0 || this._tracingChannels.indexOf(channel) >= 0))
         {
            if(this.tracingPriority <= priority || this.tracingPriority <= 0)
            {
               this._traceCall("[" + channel + "] " + txt);
            }
         }
         if(!skipSafe)
         {
            txt = txt.replace(/</gim,"&lt;");
            txt = txt.replace(/>/gim,"&gt;");
         }
         if(this._channels.indexOf(channel) < 0)
         {
            this._channels.push(channel);
         }
         var line:Log = new Log(txt,channel,priority,isRepeating,skipSafe);
         if(isRepeat)
         {
            this._lines.pop();
            this._lines.push(line);
         }
         else
         {
            this._repeated = 0;
            this._lines.push(line);
            if(this.maxLines > 0)
            {
               off = this._lines.length - this.maxLines;
               if(off > 0)
               {
                  this._lines.shift(off);
               }
            }
         }
         this._lineAdded = true;
         this._isRepeating = isRepeating;
         if(this.remoter.remoting)
         {
            this.remoter.addLineQueue(line);
         }
      }
      
      public function lineShouldShow(line:Log) : Boolean
      {
         return (this._viewingChannels.indexOf(Console.GLOBAL_CHANNEL) >= 0 || this._viewingChannels.indexOf(line.c) >= 0 || this._filterText && this._viewingChannels.indexOf(Console.FILTERED_CHANNEL) >= 0 && line.text.toLowerCase().indexOf(this._filterText.toLowerCase()) >= 0) && (this._priority <= 0 || line.p >= this._priority);
      }
      
      public function set priority(i:int) : void
      {
         this._priority = i;
         this.panels.mainPanel.updateToBottom();
         this.panels.updateMenu();
      }
      
      public function get priority() : int
      {
         return this._priority;
      }
      
      public function set commandLine(newB:Boolean) : void
      {
         if(newB && !this._commandLineAllowed)
         {
            this.panels.updateMenu();
            this.report("CommandLine is disabled. Set commandLineAllowed from source code to allow.");
         }
         else
         {
            this.panels.mainPanel.commandLine = newB;
         }
      }
      
      public function get commandLine() : Boolean
      {
         return this.panels.mainPanel.commandLine;
      }
      
      public function set commandLineAllowed(v:Boolean) : void
      {
         this._commandLineAllowed = v;
         if(v == 0 && this.commandLine)
         {
            this.commandLine = false;
         }
      }
      
      public function get commandLineAllowed() : Boolean
      {
         return this._commandLineAllowed;
      }
      
      public function set commandBase(v:Object) : void
      {
         if(v)
         {
            this.cl.base = v;
         }
      }
      
      public function get commandBase() : Object
      {
         return this.cl.base;
      }
      
      public function runCommand(line:String) : *
      {
         if(this.remoter.isRemote)
         {
            this.report("Run command at remote: " + line,-2);
            try
            {
               this.remoter.send("runCommand",line);
            }
            catch(err:Error)
            {
               report("Command could not be sent to client: " + err,10);
            }
            return null;
         }
         return this.cl.run(line);
      }
      
      public function ch(channel:*, newLine:*, priority:Number = 2, isRepeating:Boolean = false) : void
      {
         var chn:String = null;
         if(channel is String)
         {
            chn = channel as String;
         }
         else if(channel)
         {
            chn = Utils.shortClassName(channel);
         }
         else
         {
            chn = DEFAULT_CHANNEL;
         }
         this.addLine(newLine,priority,chn,isRepeating);
      }
      
      public function add(newLine:*, priority:Number = 2, isRepeating:Boolean = false) : void
      {
         this.addLine(newLine,priority,DEFAULT_CHANNEL,isRepeating);
      }
      
      public function log(... args) : void
      {
         this.addLine(this.joinArgs(args),LOG_LEVEL);
      }
      
      public function info(... args) : void
      {
         this.addLine(this.joinArgs(args),INFO_LEVEL);
      }
      
      public function debug(... args) : void
      {
         this.addLine(this.joinArgs(args),DEBUG_LEVEL);
      }
      
      public function warn(... args) : void
      {
         this.addLine(this.joinArgs(args),WARN_LEVEL);
      }
      
      public function error(... args) : void
      {
         this.addLine(this.joinArgs(args),ERROR_LEVEL);
      }
      
      public function fatal(... args) : void
      {
         this.addLine(this.joinArgs(args),FATAL_LEVEL);
      }
      
      public function logch(channel:*, ... args) : void
      {
         this.ch(channel,this.joinArgs(args),LOG_LEVEL);
      }
      
      public function infoch(channel:*, ... args) : void
      {
         this.ch(channel,this.joinArgs(args),INFO_LEVEL);
      }
      
      public function debugch(channel:*, ... args) : void
      {
         this.ch(channel,this.joinArgs(args),DEBUG_LEVEL);
      }
      
      public function warnch(channel:*, ... args) : void
      {
         this.ch(channel,this.joinArgs(args),WARN_LEVEL);
      }
      
      public function errorch(channel:*, ... args) : void
      {
         this.ch(channel,this.joinArgs(args),ERROR_LEVEL);
      }
      
      public function fatalch(channel:*, ... args) : void
      {
         this.ch(channel,this.joinArgs(args),FATAL_LEVEL);
      }
      
      public function joinArgs(args:Array) : String
      {
         var X:* = null;
         for(X in args)
         {
            if(args[X] is XML || args[X] is XMLList)
            {
               args[X] = args[X].toXMLString();
            }
         }
         return args.join(" ");
      }
      
      public function set filterText(str:String) : void
      {
         this._filterText = str;
         if(str)
         {
            this.clear(FILTERED_CHANNEL);
            this._channels.splice(1,0,FILTERED_CHANNEL);
            this.addLine("Filtering [" + str + "]",10,FILTERED_CHANNEL);
            this.viewingChannels = [FILTERED_CHANNEL];
         }
         else if(this.viewingChannel == FILTERED_CHANNEL)
         {
            this.viewingChannels = [GLOBAL_CHANNEL];
         }
      }
      
      public function get filterText() : String
      {
         return this._filterText;
      }
      
      public function clear(channel:String = null) : void
      {
         var line:Log = null;
         var ind:int = 0;
         if(channel)
         {
            line = this._lines.first;
            while(line)
            {
               if(line.c == channel)
               {
                  this._lines.remove(line);
               }
               line = line.next;
            }
            ind = this._channels.indexOf(channel);
            if(ind >= 0)
            {
               this._channels.splice(ind,1);
            }
         }
         else
         {
            this._lines.clear();
            this._channels.splice(0);
            this._channels.push(GLOBAL_CHANNEL,DEFAULT_CHANNEL);
         }
         this.panels.mainPanel.updateToBottom();
         this.panels.updateMenu();
      }
      
      public function getLogsAsObjects() : Array
      {
         var a:Array = [];
         var line:Log = this._lines.first;
         while(line)
         {
            a.push(line.toObject());
            line = line.next;
         }
         return a;
      }
      
      public function getAllLog(splitter:String = "\n") : String
      {
         var str:String = "";
         var line:Log = this._lines.first;
         while(line)
         {
            str += line.toString() + (!!line.next ? splitter : "");
            line = line.next;
         }
         return str;
      }
   }
}
