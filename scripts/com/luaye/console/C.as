package com.luaye.console
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class C
   {
      
      private static const ERROR_EXISTS:String = "[CONSOLE] already exists. Will keep using the previously created console. If you want to create a fresh 1, C.remove() first.";
      
      private static var _console:Console;
       
      
      public function C()
      {
         super();
         throw new Error("[CONSOLE] Do not construct class. Please use C.start(mc:DisplayObjectContainer, password:String=\'\')");
      }
      
      public static function start(mc:DisplayObjectContainer, pass:String = "", skin:int = 1) : void
      {
         if(_console)
         {
            trace(ERROR_EXISTS);
         }
         else
         {
            _console = new Console(pass,skin);
            if(mc != null)
            {
               mc.addChild(_console);
            }
         }
      }
      
      public static function startOnStage(mc:DisplayObject, pass:String = "", skin:int = 1) : void
      {
         if(_console)
         {
            trace(ERROR_EXISTS);
         }
         else if(mc != null && mc.stage != null)
         {
            start(mc.stage,pass,skin);
         }
         else
         {
            _console = new Console(pass,skin);
            if(mc != null)
            {
               mc.addEventListener(Event.ADDED_TO_STAGE,addedToStageHandle);
            }
         }
      }
      
      public static function add(str:*, priority:Number = 2, isRepeating:Boolean = false) : void
      {
         if(_console)
         {
            _console.add(str,priority,isRepeating);
         }
      }
      
      public static function ch(channel:*, str:*, priority:Number = 2, isRepeating:Boolean = false) : void
      {
         if(_console)
         {
            _console.ch(channel,str,priority,isRepeating);
         }
      }
      
      public static function log(... args) : void
      {
         if(_console)
         {
            _console.log.apply(null,args);
         }
      }
      
      public static function info(... args) : void
      {
         if(_console)
         {
            _console.info.apply(null,args);
         }
      }
      
      public static function debug(... args) : void
      {
         if(_console)
         {
            _console.debug.apply(null,args);
         }
      }
      
      public static function warn(... args) : void
      {
         if(_console)
         {
            _console.warn.apply(null,args);
         }
      }
      
      public static function error(... args) : void
      {
         if(_console)
         {
            _console.error.apply(null,args);
         }
      }
      
      public static function fatal(... args) : void
      {
         if(_console)
         {
            _console.fatal.apply(null,args);
         }
      }
      
      public static function logch(channel:*, ... args) : void
      {
         if(_console)
         {
            _console.logch.apply(null,[channel].concat(args));
         }
      }
      
      public static function infoch(channel:*, ... args) : void
      {
         if(_console)
         {
            _console.infoch.apply(null,[channel].concat(args));
         }
      }
      
      public static function debugch(channel:*, ... args) : void
      {
         if(_console)
         {
            _console.debugch.apply(null,[channel].concat(args));
         }
      }
      
      public static function warnch(channel:*, ... args) : void
      {
         if(_console)
         {
            _console.warnch.apply(null,[channel].concat(args));
         }
      }
      
      public static function errorch(channel:*, ... args) : void
      {
         if(_console)
         {
            _console.errorch.apply(null,[channel].concat(args));
         }
      }
      
      public static function fatalch(channel:*, ... args) : void
      {
         if(_console)
         {
            _console.fatalch.apply(null,[channel].concat(args));
         }
      }
      
      public static function remove() : void
      {
         if(_console)
         {
            if(_console.parent != null)
            {
               _console.parent.removeChild(_console);
            }
            _console.destroy();
            _console = null;
         }
      }
      
      public static function get paused() : Boolean
      {
         return getter("paused") as Boolean;
      }
      
      public static function set paused(v:Boolean) : void
      {
         setter("paused",v);
      }
      
      public static function get enabled() : Boolean
      {
         return getter("enabled") as Boolean;
      }
      
      public static function set enabled(v:Boolean) : void
      {
         setter("enabled",v);
      }
      
      public static function clear(channel:String = null) : void
      {
         if(_console)
         {
            _console.clear(channel);
         }
      }
      
      public static function get viewingChannel() : String
      {
         return getter("viewingChannel") as String;
      }
      
      public static function set viewingChannel(v:String) : void
      {
         setter("viewingChannel",v);
      }
      
      public static function get viewingChannels() : Array
      {
         return getter("viewingChannels") as Array;
      }
      
      public static function set viewingChannels(v:Array) : void
      {
         setter("viewingChannels",v);
      }
      
      public static function get filterText() : String
      {
         return getter("filterText") as String;
      }
      
      public static function set filterText(v:String) : void
      {
         setter("filterText",v);
      }
      
      public static function get prefixChannelNames() : Boolean
      {
         return getter("prefixChannelNames") as Boolean;
      }
      
      public static function set prefixChannelNames(v:Boolean) : void
      {
         setter("prefixChannelNames",v);
      }
      
      public static function get maxLines() : int
      {
         return getter("maxLines") as int;
      }
      
      public static function set maxLines(v:int) : void
      {
         setter("maxLines",v);
      }
      
      public static function get maxRepeats() : Number
      {
         return getter("maxRepeats") as Number;
      }
      
      public static function set maxRepeats(v:Number) : void
      {
         setter("maxRepeats",v);
      }
      
      public static function get tracing() : Boolean
      {
         return getter("tracing") as Boolean;
      }
      
      public static function set tracing(v:Boolean) : void
      {
         setter("tracing",v);
      }
      
      public static function get tracingChannels() : Array
      {
         return getter("tracingChannels") as Array;
      }
      
      public static function set tracingChannels(v:Array) : void
      {
         setter("tracingChannels",v);
      }
      
      public static function get tracingPriority() : int
      {
         return getter("tracingChannels") as int;
      }
      
      public static function set tracingPriority(v:int) : void
      {
         setter("tracingPriority",v);
      }
      
      public static function get traceCall() : Function
      {
         return getter("traceCall") as Function;
      }
      
      public static function set traceCall(f:Function) : void
      {
         setter("traceCall",f);
      }
      
      public static function setPanelArea(panelname:String, rect:Rectangle) : void
      {
         if(_console)
         {
            _console.setPanelArea(panelname,rect);
         }
      }
      
      public static function get fpsMonitor() : Boolean
      {
         return getter("fpsMonitor") as Boolean;
      }
      
      public static function set fpsMonitor(v:Boolean) : void
      {
         setter("fpsMonitor",v);
      }
      
      public static function get memoryMonitor() : Boolean
      {
         return getter("memoryMonitor") as Boolean;
      }
      
      public static function set memoryMonitor(v:Boolean) : void
      {
         setter("memoryMonitor",v);
      }
      
      public static function get displayRoller() : Boolean
      {
         return getter("displayRoller") as Boolean;
      }
      
      public static function set displayRoller(v:Boolean) : void
      {
         setter("displayRoller",v);
      }
      
      public static function get rulerHidesMouse() : Boolean
      {
         return getter("rulerHidesMouse") as Boolean;
      }
      
      public static function set rulerHidesMouse(v:Boolean) : void
      {
         setter("rulerHidesMouse",v);
      }
      
      public static function get width() : Number
      {
         return getter("width") as Number;
      }
      
      public static function set width(v:Number) : void
      {
         setter("width",v);
      }
      
      public static function get height() : Number
      {
         return getter("height") as Number;
      }
      
      public static function set height(v:Number) : void
      {
         setter("height",v);
      }
      
      public static function get scaleX() : Number
      {
         return getter("scaleX") as Number;
      }
      
      public static function set scaleX(v:Number) : void
      {
         setter("scaleX",v);
      }
      
      public static function get scaleY() : Number
      {
         return getter("scaleY") as Number;
      }
      
      public static function set scaleY(v:Number) : void
      {
         setter("scaleY",v);
      }
      
      public static function get x() : Number
      {
         return getter("x") as Number;
      }
      
      public static function set x(v:Number) : void
      {
         setter("x",v);
      }
      
      public static function get y() : Number
      {
         return getter("y") as Number;
      }
      
      public static function set y(v:Number) : void
      {
         setter("y",v);
      }
      
      public static function get visible() : Boolean
      {
         return getter("visible") as Boolean;
      }
      
      public static function set visible(v:Boolean) : void
      {
         setter("visible",v);
      }
      
      public static function get quiet() : Boolean
      {
         return getter("quiet") as Boolean;
      }
      
      public static function set quiet(v:Boolean) : void
      {
         setter("quiet",v);
      }
      
      public static function get alwaysOnTop() : Boolean
      {
         return getter("alwaysOnTop") as Boolean;
      }
      
      public static function set alwaysOnTop(v:Boolean) : void
      {
         setter("alwaysOnTop",v);
      }
      
      public static function get remoting() : Boolean
      {
         return getter("remoting") as Boolean;
      }
      
      public static function set remoting(v:Boolean) : void
      {
         setter("remoting",v);
      }
      
      public static function get remote() : Boolean
      {
         return getter("remote") as Boolean;
      }
      
      public static function set remote(v:Boolean) : void
      {
         setter("remote",v);
      }
      
      public static function get remoteDelay() : int
      {
         return getter("remoteDelay") as int;
      }
      
      public static function set remoteDelay(v:int) : void
      {
         setter("remoteDelay",v);
      }
      
      public static function set remotingPassword(v:String) : void
      {
         setter("remotingPassword",v);
      }
      
      public static function inspect(obj:Object, detail:Boolean = true) : void
      {
         if(_console)
         {
            _console.inspect(obj,detail);
         }
      }
      
      public static function get commandLine() : Boolean
      {
         return getter("commandLine") as Boolean;
      }
      
      public static function set commandLine(v:Boolean) : void
      {
         setter("commandLine",v);
      }
      
      public static function get commandLineAllowed() : Boolean
      {
         return getter("commandLineAllowed") as Boolean;
      }
      
      public static function set commandLineAllowed(b:Boolean) : void
      {
         setter("commandLineAllowed",b);
      }
      
      public static function get commandBase() : Object
      {
         return getter("commandBase") as Object;
      }
      
      public static function set commandBase(v:Object) : void
      {
         setter("commandBase",v);
      }
      
      public static function get strongRef() : Boolean
      {
         return getter("strongRef") as Boolean;
      }
      
      public static function set strongRef(v:Boolean) : void
      {
         setter("strongRef",v);
      }
      
      public static function store(n:String, obj:Object, strong:Boolean = false) : void
      {
         if(_console)
         {
            _console.store(n,obj,strong);
         }
      }
      
      public static function map(base:DisplayObjectContainer, maxstep:uint = 0) : void
      {
         if(_console)
         {
            _console.map(base,maxstep);
         }
      }
      
      public static function runCommand(str:String) : *
      {
         if(_console)
         {
            return _console.runCommand(str);
         }
         return null;
      }
      
      public static function watch(obj:Object, n:String = null) : String
      {
         if(_console)
         {
            return _console.watch(obj,n);
         }
         return null;
      }
      
      public static function unwatch(n:String) : void
      {
         if(_console)
         {
            _console.unwatch(n);
         }
      }
      
      public static function gc() : void
      {
         if(_console)
         {
            _console.gc();
         }
      }
      
      public static function addGraph(n:String, obj:Object, prop:String, col:Number = -1, key:String = null, rect:Rectangle = null, inverse:Boolean = false) : void
      {
         if(_console)
         {
            _console.addGraph(n,obj,prop,col,key,rect,inverse);
         }
      }
      
      public static function fixGraphRange(n:String, min:Number = NaN, max:Number = NaN) : void
      {
         if(_console)
         {
            _console.fixGraphRange(n,min,max);
         }
      }
      
      public static function removeGraph(n:String, obj:Object = null, prop:String = null) : void
      {
         if(_console)
         {
            _console.removeGraph(n,obj,prop);
         }
      }
      
      public static function bindKey(char:String, ctrl:Boolean = false, alt:Boolean = false, shift:Boolean = false, fun:Function = null, args:Array = null) : void
      {
         if(_console)
         {
            _console.bindKey(char,ctrl,alt,shift,fun,args);
         }
      }
      
      public static function setRollerCaptureKey(char:String, ctrl:Boolean = false, alt:Boolean = false, shift:Boolean = false) : void
      {
         if(_console)
         {
            _console.setRollerCaptureKey(char,ctrl,alt,shift);
         }
      }
      
      public static function get exists() : Boolean
      {
         return Boolean(!!_console ? true : false);
      }
      
      private static function addedToStageHandle(e:Event) : void
      {
         var mc:DisplayObjectContainer = e.currentTarget as DisplayObjectContainer;
         mc.removeEventListener(Event.ADDED_TO_STAGE,addedToStageHandle);
         if(_console && _console.parent == null)
         {
            mc.stage.addChild(_console);
         }
      }
      
      private static function getter(str:String) : *
      {
         if(_console)
         {
            return _console[str];
         }
         return null;
      }
      
      private static function setter(str:String, v:*) : void
      {
         if(_console)
         {
            _console[str] = v;
         }
      }
      
      public static function getAllLog(splitter:String = "\n") : String
      {
         if(_console)
         {
            return _console.getAllLog(splitter);
         }
         return "";
      }
      
      public static function get instance() : Console
      {
         return _console;
      }
   }
}
