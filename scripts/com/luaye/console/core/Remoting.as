package com.luaye.console.core
{
   import com.luaye.console.Console;
   import flash.events.EventDispatcher;
   import flash.events.SecurityErrorEvent;
   import flash.events.StatusEvent;
   import flash.net.LocalConnection;
   import flash.system.Security;
   
   public class Remoting extends EventDispatcher
   {
      
      public static const REMOTE_PREFIX:String = "R";
      
      public static const CLIENT_PREFIX:String = "C";
       
      
      private var _master:Console;
      
      private var _logsend:Function;
      
      private var _isRemoting:Boolean;
      
      private var _isRemote:Boolean;
      
      private var _sharedConnection:LocalConnection;
      
      private var _remoteLinesQueue:Array;
      
      private var _mspfsForRemote:Array;
      
      private var _remoteDelayed:int;
      
      private var _lastLogin:String = "";
      
      private var _loggedIn:Boolean;
      
      public var remoteMem:int;
      
      public function Remoting(m:Console, logsend:Function)
      {
         super();
         this._master = m;
         this._logsend = logsend;
      }
      
      public function addLineQueue(line:Log) : void
      {
         if(!this._loggedIn)
         {
            return;
         }
         this._remoteLinesQueue.push(line.toObject());
         var maxlines:int = this._master.maxLines;
         if(this._remoteLinesQueue.length > maxlines && maxlines > 0)
         {
            this._remoteLinesQueue.splice(0,1);
         }
      }
      
      public function update(mspf:Number, sFR:Number = NaN) : void
      {
         var frames:int = 0;
         var newQueue:Array = null;
         ++this._remoteDelayed;
         if(!this._loggedIn)
         {
            return;
         }
         this._mspfsForRemote.push(mspf);
         if(sFR)
         {
            frames = Math.floor(mspf / (1000 / sFR));
            if(frames > Console.FPS_MAX_LAG_FRAMES)
            {
               frames = Console.FPS_MAX_LAG_FRAMES;
            }
            while(frames > 1)
            {
               this._mspfsForRemote.push(mspf);
               frames--;
            }
         }
         if(this._remoteDelayed >= this._master.remoteDelay)
         {
            this._remoteDelayed = 0;
            newQueue = new Array();
            if(this._remoteLinesQueue.length > 20)
            {
               newQueue = this._remoteLinesQueue.splice(20);
               this._remoteDelayed = this._master.remoteDelay;
            }
            this.send("logSend",[this._remoteLinesQueue,this._mspfsForRemote,this._master.currentMemory,this._master.cl.scopeString]);
            this._remoteLinesQueue = newQueue;
            this._mspfsForRemote = [!!sFR ? sFR : 30];
         }
      }
      
      public function send(command:String, ... args) : void
      {
         var target:String = Console.REMOTING_CONN_NAME + (!!this._isRemote ? CLIENT_PREFIX : REMOTE_PREFIX);
         args = [target,command].concat(args);
         try
         {
            this._sharedConnection.send.apply(this,args);
         }
         catch(e:Error)
         {
         }
      }
      
      public function get remoting() : Boolean
      {
         return this._isRemoting;
      }
      
      public function set remoting(newV:Boolean) : void
      {
         this._remoteLinesQueue = null;
         this._mspfsForRemote = null;
         if(newV)
         {
            this._isRemote = false;
            this._remoteDelayed = 0;
            this._mspfsForRemote = [30];
            this._remoteLinesQueue = new Array();
            this.startSharedConnection();
            this._sharedConnection.addEventListener(StatusEvent.STATUS,this.onRemotingStatus);
            this._sharedConnection.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onRemotingSecurityError);
            try
            {
               this._sharedConnection.connect(Console.REMOTING_CONN_NAME + CLIENT_PREFIX);
               this._master.report("<b>Remoting started.</b> " + this.getInfo(),-1);
               this._isRemoting = true;
               this._loggedIn = this._master.checkLogin("");
               if(this._loggedIn)
               {
                  this._remoteLinesQueue = this._master.getLogsAsObjects();
                  this.send("loginSuccess");
               }
               else
               {
                  this.send("requestLogin");
               }
            }
            catch(error:Error)
            {
               _master.report("Could not create client service. You will not be able to control this console with remote.",10);
            }
         }
         else
         {
            this._isRemoting = false;
            this.close();
         }
      }
      
      private function onRemotingStatus(e:StatusEvent) : void
      {
      }
      
      private function onRemotingSecurityError(e:SecurityErrorEvent) : void
      {
         this._master.report("Sandbox security error.",10);
         this.printHowToGlobalSetting();
      }
      
      public function get isRemote() : Boolean
      {
         return this._isRemote;
      }
      
      public function set isRemote(newV:Boolean) : void
      {
         var sdt:String = null;
         this._isRemote = newV;
         if(newV)
         {
            this._isRemoting = false;
            this.startSharedConnection();
            this._sharedConnection.addEventListener(StatusEvent.STATUS,this.onRemoteStatus);
            this._sharedConnection.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onRemotingSecurityError);
            try
            {
               this._sharedConnection.connect(Console.REMOTING_CONN_NAME + REMOTE_PREFIX);
               this._master.report("<b>Remote started.</b> " + this.getInfo(),-1);
               sdt = Security.sandboxType;
               if(sdt == Security.LOCAL_WITH_FILE || sdt == Security.LOCAL_WITH_NETWORK)
               {
                  this._master.report("Untrusted local sandbox. You may not be able to listen for logs properly.",10);
                  this.printHowToGlobalSetting();
               }
               this.login(this._lastLogin);
            }
            catch(error:Error)
            {
               _isRemoting = false;
               _master.report("Could not create remote service. You might have a console remote already running.",10);
            }
         }
         else
         {
            this.close();
         }
      }
      
      private function onRemoteStatus(e:StatusEvent) : void
      {
         if(this._isRemote && e.level == "error")
         {
            this._master.report("Problem communicating to client.",10);
         }
      }
      
      private function getInfo() : String
      {
         return "</p5>channel:<p5>" + Console.REMOTING_CONN_NAME + " (" + Security.sandboxType + ")";
      }
      
      private function printHowToGlobalSetting() : void
      {
         this._master.report("Make sure your flash file is \'trusted\' in Global Security Settings.",-2);
         this._master.report("Go to Settings Manager [<a href=\'event:settings\'>click here</a>] &gt; \'Global Security Settings Panel\' (on left) &gt; add the location of the local flash (swf) file.",-2);
      }
      
      private function startSharedConnection() : void
      {
         this.close();
         this._sharedConnection = new LocalConnection();
         this._sharedConnection.allowDomain("*");
         this._sharedConnection.allowInsecureDomain("*");
         this._sharedConnection.client = {
            "login":this.login,
            "requestLogin":this.requestLogin,
            "loginFail":this.loginFail,
            "loginSuccess":this.loginSuccess,
            "logSend":this._logsend,
            "gc":this._master.gc,
            "runCommand":this._master.runCommand
         };
      }
      
      public function loginFail() : void
      {
         this._master.report("Login Failed",10);
         this._master.panels.mainPanel.requestLogin();
      }
      
      public function loginSuccess() : void
      {
         this._master.report("Login Successful",-1);
      }
      
      public function requestLogin() : void
      {
         if(this._lastLogin)
         {
            this.login(this._lastLogin);
         }
         else
         {
            this._master.panels.mainPanel.requestLogin();
         }
      }
      
      public function login(pass:String = null) : void
      {
         if(this._isRemote)
         {
            this._lastLogin = pass;
            this._master.report("Attempting to login...",-1);
            this.send("login",pass);
         }
         else if(this._loggedIn || this._master.checkLogin(pass))
         {
            this._loggedIn = true;
            this._remoteLinesQueue = this._master.getLogsAsObjects();
            this.send("loginSuccess");
         }
         else
         {
            this.send("loginFail");
         }
      }
      
      public function close() : void
      {
         if(this._sharedConnection)
         {
            try
            {
               this._sharedConnection.close();
            }
            catch(error:Error)
            {
               _master.report("Remote.close: " + error,10);
            }
         }
         this._sharedConnection = null;
      }
   }
}
