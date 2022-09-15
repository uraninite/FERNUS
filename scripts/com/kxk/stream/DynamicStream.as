package com.kxk.stream
{
   import flash.events.NetStatusEvent;
   import flash.events.TimerEvent;
   import flash.net.NetConnection;
   import flash.net.NetStream;
   import flash.net.NetStreamPlayOptions;
   import flash.net.NetStreamPlayTransitions;
   import flash.net.SharedObject;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class DynamicStream extends NetStream
   {
       
      
      private var dsPlayList:Array;
      
      private var dsPlayListLen:int;
      
      private var dsPlayIndex:int = 0;
      
      private var dsPlayState:String;
      
      private var _nc:NetConnection;
      
      private var _maxRate:Number = 0;
      
      private var _maxBandwidth:Number = 0;
      
      private var _curStreamID:int = 0;
      
      private var _prevStreamID:int = 0;
      
      private var _curBufferTime:uint = 0;
      
      private var _previousDroppedFrames:uint = 0;
      
      private var _previousDroppedFramesTime:uint = 0;
      
      private var _bufferMode:int = 0;
      
      private var _reachedBufferTime:Boolean = false;
      
      private var _switchMode:Boolean = false;
      
      private var _preferredBufferLength:Number;
      
      private var _startBufferLength:Number;
      
      private var _aggressiveModeBufferLength:Number;
      
      private var _switchQOSTimerDelay:Number;
      
      private var _manualSwitchMode:Boolean;
      
      private var _droppedFramesLockRate:int;
      
      private var _droppedFramesLockDelay:int;
      
      private var _liveStream:Boolean;
      
      private var _liveBWErrorCount:int = 0;
      
      private var _previousMaxBandwidth:Number = 0;
      
      private var qosTimer:Timer;
      
      private var mainTimer:Timer;
      
      private var droppedFramesTimer:Timer;
      
      private const MAIN_TIMER_INTERVAL:Number = 0.15;
      
      private const DROPPED_FRAMES_TIMER_INTERVAL:uint = 300;
      
      private const DROPPED_FRAMES_LOCK_LIMIT:uint = 3;
      
      private const LIVE_ERROR_CORRECTION_LIMIT:int = 2;
      
      private const PREFERRED_BUFFERLENGTH:Number = 10;
      
      private const STARTUP_BUFFERLENGTH:Number = 2;
      
      private const EMPTY_BUFFERLENGTH:Number = 1;
      
      private const PREFERRED_BUFFERLENGTH_LIVE:Number = 6;
      
      private const BUFFER_FILLED:Number = 1;
      
      private const BUFFER_BUFFERING:Number = 2;
      
      private const DEBUG:Boolean = false;
      
      private var _lastMaxBandwidthSO:SharedObject;
      
      public const STATE_PLAYING:String = "playing";
      
      public const STATE_PAUSED:String = "paused";
      
      public const STATE_BUFFERING:String = "buffering";
      
      public const STATE_STOPPED:String = "stopped";
      
      private var bandwidthlimit:int = -1;
      
      public function DynamicStream(nc:NetConnection)
      {
         super(nc);
         this._nc = nc;
         this.dsPlayList = new Array();
         this._preferredBufferLength = this.PREFERRED_BUFFERLENGTH;
         this._switchQOSTimerDelay = this.PREFERRED_BUFFERLENGTH / 2.5;
         this._startBufferLength = this.STARTUP_BUFFERLENGTH;
         this._aggressiveModeBufferLength = this.PREFERRED_BUFFERLENGTH / 2;
         this._maxRate = 2500000;
         this._manualSwitchMode = false;
         this._droppedFramesLockRate = int.MAX_VALUE;
         this._liveStream = false;
         this._maxBandwidth = 0;
         this._lastMaxBandwidthSO = SharedObject.getLocal("AdobeDynamicStream","/",false);
         this._maxBandwidth = this._lastMaxBandwidthSO.data.maxBandwidth;
         this._curBufferTime = this._startBufferLength;
         this.mainTimer = new Timer(this.MAIN_TIMER_INTERVAL * 1000,0);
         this.mainTimer.addEventListener(TimerEvent.TIMER,this.monitorQOS);
         this.qosTimer = new Timer(this._switchQOSTimerDelay * 1000,0);
         this.qosTimer.addEventListener(TimerEvent.TIMER,this.getQOSAndSwitch);
         this.droppedFramesTimer = new Timer(this.DROPPED_FRAMES_TIMER_INTERVAL * 1000,0);
         this.droppedFramesTimer.addEventListener(TimerEvent.TIMER,this.releaseDFLock);
         this.addEventListener(NetStatusEvent.NET_STATUS,this.onNSStatus);
         this._nc.addEventListener(NetStatusEvent.NET_STATUS,this.onNSStatus);
         this._switchMode = false;
      }
      
      public function onMetaData(infoObj:Object) : void
      {
         this.debug("onMetaData called");
      }
      
      public function onPlayStatus(info:Object) : void
      {
         this.debug("onPlayStatus called with " + info.code);
         switch(info.code)
         {
            case "NetStream.Play.TransitionComplete":
               this.debug("transitioned to " + info.details);
               break;
            case "NetStream.Play.Complete":
               break;
            case "NetStream.Play.Failed":
               this._curStreamID = this._prevStreamID;
               this._switchMode = false;
         }
      }
      
      override public function play(... args) : void
      {
         var dsi:DynamicStreamItem = new DynamicStreamItem();
         dsi.addStream(String(args[0]),0);
         if(!isNaN(args[1]))
         {
            dsi.start = args[1];
         }
         if(!isNaN(args[2]))
         {
            dsi.len = args[2];
         }
         if(args[3] == false)
         {
            dsi.reset = args[3];
         }
         this.startPlay(dsi);
      }
      
      override public function play2(param:NetStreamPlayOptions) : void
      {
         throw new Error("The play2() method has been disabled for this class.  Please create a separate NetStream object to use play2().");
      }
      
      public function startPlay(dsi:DynamicStreamItem) : void
      {
         var i:int = 0;
         var j:int = 0;
         dsi.streamCount = !!isNaN(dsi.streamCount) ? int(dsi.streamCount) : int(dsi.streams.length);
         this.dsPlayList.push(dsi);
         this.dsPlayListLen = this.dsPlayList.length;
         this._curStreamID = 0;
         this._prevStreamID = 0;
         if(dsi.startRate > 0)
         {
            i = this.dsPlayList[this.dsPlayIndex].streams.length - 1;
            while(i >= 0)
            {
               if(dsi.startRate > this.dsPlayList[this.dsPlayIndex].streams[i].rate)
               {
                  this._curStreamID = i;
                  break;
               }
               i--;
            }
         }
         else
         {
            j = this.dsPlayList[this.dsPlayIndex].streams.length - 1;
            while(j >= 0 && this._maxBandwidth > 0)
            {
               if(this._maxBandwidth > this.dsPlayList[this.dsPlayIndex].streams[j].rate)
               {
                  this._curStreamID = j;
                  break;
               }
               j--;
            }
         }
         if(dsi.start == -1)
         {
            this._liveStream = true;
            this._liveBWErrorCount = 0;
            this._previousMaxBandwidth = this._maxBandwidth;
            this._preferredBufferLength = this.PREFERRED_BUFFERLENGTH_LIVE;
            this.debug("preferred buffer length " + this._preferredBufferLength);
            if(this._switchQOSTimerDelay == this.PREFERRED_BUFFERLENGTH / 2.5)
            {
               this.switchQOSTimerDelay = Math.max(this._preferredBufferLength / 5,2);
            }
            this._curBufferTime = this._preferredBufferLength;
         }
         else
         {
            this._curBufferTime = this._startBufferLength;
            this._liveStream = false;
         }
         if(dsi.reset == false)
         {
            this.playAppend(dsi.start,dsi.len,false);
         }
         else
         {
            this.bufferTime = this._curBufferTime;
            this.playAppend(dsi.start,dsi.len,true);
         }
         if(!this._liveStream)
         {
            this._maxRate = Math.max(this._maxRate,dsi.streams[dsi.streamCount - 1].rate * 1024 / 8);
         }
      }
      
      public function switchToStreamName(name:String) : void
      {
         if(name.indexOf(":") != -1)
         {
            name = name.split(":")[1];
         }
         var streamID:int = -1;
         for(var i:int = 0; i < this.dsPlayList[this.dsPlayIndex].streams.length; i++)
         {
            if(this.dsPlayList[this.dsPlayIndex].streams[i]["name"].indexOf(name) > 0)
            {
               streamID = i;
               break;
            }
         }
         if(this._manualSwitchMode && streamID >= 0)
         {
            this.switchStream(streamID);
         }
      }
      
      public function switchToStreamRate(rate:int) : void
      {
         var i:int = 0;
         var streamID:int = -1;
         for(var j:int = 0; j < this.dsPlayList[this.dsPlayIndex].streams.length; j++)
         {
            if(this.dsPlayList[this.dsPlayIndex].streams[j].rate == rate)
            {
               streamID = j;
               break;
            }
         }
         if(streamID < 0)
         {
            i = this.dsPlayList[this.dsPlayIndex].streams.length - 1;
            while(i >= 0)
            {
               if(rate > this.dsPlayList[this.dsPlayIndex].streams[i].rate)
               {
                  streamID = i;
                  break;
               }
               i--;
            }
         }
         if(this._manualSwitchMode && streamID >= 0)
         {
            this.switchStream(streamID);
         }
      }
      
      public function switchUp() : void
      {
         if(this._manualSwitchMode)
         {
            this.switchStream(this._curStreamID + 1);
         }
      }
      
      public function switchDown() : void
      {
         if(this._manualSwitchMode)
         {
            this.switchStream(this._curStreamID - 1);
         }
      }
      
      public function manualSwitchMode(mode:Boolean) : void
      {
         this._manualSwitchMode = mode;
      }
      
      public function get maxBandwidth() : Number
      {
         return this._maxBandwidth;
      }
      
      public function setBandwidthLimit(limit:Number) : void
      {
         this.bandwidthlimit = limit;
      }
      
      public function get currentStreamBitRate() : Number
      {
         return this.dsPlayList[this.dsPlayIndex].streams[this._curStreamID].rate;
      }
      
      public function get currentStreamName() : String
      {
         return this.dsPlayList[this.dsPlayIndex].streams[this._curStreamID].name;
      }
      
      public function set preferredBufferLength(length:Number) : void
      {
         this._preferredBufferLength = length;
         if(this._liveStream)
         {
            this.switchQOSTimerDelay = Math.max(this._preferredBufferLength / 5,1);
            this._curBufferTime = this._preferredBufferLength;
            this.bufferTime = this._curBufferTime;
         }
         else
         {
            this.switchQOSTimerDelay = Math.max(this._preferredBufferLength / 2.5,1);
         }
      }
      
      public function get preferredBufferLength() : Number
      {
         return this._preferredBufferLength;
      }
      
      public function set startBufferLength(length:Number) : void
      {
         this._startBufferLength = length;
      }
      
      public function get startBufferLength() : Number
      {
         return this._startBufferLength;
      }
      
      public function set aggressiveModeBufferLength(length:Number) : void
      {
         this._aggressiveModeBufferLength = length;
      }
      
      public function get aggressiveModeBufferLength() : Number
      {
         return this._aggressiveModeBufferLength;
      }
      
      public function set switchQOSTimerDelay(delay:Number) : void
      {
         this.qosTimer.delay = delay * 1000;
         this._switchQOSTimerDelay = delay;
      }
      
      public function get switchQOSTimerDelay() : Number
      {
         return this._switchQOSTimerDelay;
      }
      
      public function set droppedFramesLockDelay(delay:Number) : void
      {
         this.droppedFramesTimer.delay = delay * 1000;
         this._droppedFramesLockDelay = delay;
      }
      
      public function get droppedFramesLockDelay() : Number
      {
         return this._droppedFramesLockDelay;
      }
      
      private function playAppend(start:Number, len:Number, reset:Boolean) : void
      {
         var nso:NetStreamPlayOptions = new NetStreamPlayOptions();
         nso.streamName = this.dsPlayList[this.dsPlayIndex].streams[this._curStreamID].name;
         nso.start = start;
         nso.len = len;
         nso.transition = !!reset ? NetStreamPlayTransitions.RESET : NetStreamPlayTransitions.APPEND;
         super.play2(nso);
      }
      
      private function onNSStatus(event:NetStatusEvent) : void
      {
         this.debug("ns status: " + event.info.code);
         switch(event.info.code)
         {
            case "NetStream.Play.Stop":
               this.debug("no more QOS check");
               this.dsPlayState = this.STATE_STOPPED;
               this.mainTimer.stop();
               this.qosTimer.stop();
               break;
            case "NetStream.Play.Start":
               this.init();
               this.mainTimer.start();
               this.dsPlayState = this.STATE_PLAYING;
               break;
            case "NetStream.Buffer.Full":
               this.getMaxBandwidth();
               this.SwitchUpOnMaxBandwidth();
               this._bufferMode = this.BUFFER_FILLED;
               this.qosTimer.start();
               break;
            case "NetStream.Buffer.Empty":
               if(!this._manualSwitchMode)
               {
                  this._curStreamID = 0;
               }
               if(!this._liveStream)
               {
                  this._curBufferTime = this.EMPTY_BUFFERLENGTH;
                  this.bufferTime = this._curBufferTime;
               }
               if(!this._manualSwitchMode)
               {
                  this.switchStream();
               }
               this.qosTimer.stop();
               this.init();
               break;
            case "NetStream.Seek.Notify":
               if(!this._liveStream)
               {
                  this._curBufferTime = this._startBufferLength;
                  this.bufferTime = this._curBufferTime;
               }
               this._bufferMode = this.BUFFER_BUFFERING;
               this._reachedBufferTime = false;
               break;
            case "NetStream.Pause.Notify":
               if(this.qosTimer.running)
               {
                  this.qosTimer.stop();
               }
               if(this.mainTimer.running)
               {
                  this.mainTimer.stop();
               }
               this.dsPlayState = this.STATE_PAUSED;
               break;
            case "NetStream.Unpause.Notify":
               if(!this.qosTimer.running)
               {
                  this.qosTimer.start();
               }
               if(!this.mainTimer.running)
               {
                  this.mainTimer.start();
               }
               this.dsPlayState = this.STATE_PLAYING;
               break;
            case "NetStream.Play.Transition":
               this.debug("transition successful for " + event.info.details);
               this._switchMode = false;
               break;
            case "NetStream.Play.StreamNotFound":
               this._curStreamID = this._prevStreamID;
               this._switchMode = false;
               break;
            case "NetConnection.Connect.Closed":
               this._switchMode = false;
               this.mainTimer.stop();
               this.qosTimer.stop();
         }
      }
      
      private function getMaxBandwidth() : void
      {
         var maxbw:Number = NaN;
         if(this.info == null)
         {
            this.mainTimer.stop();
            return;
         }
         if(this.bandwidthlimit > -1)
         {
            maxbw = this.info.maxBytesPerSecond * 8 / 1024;
            if(this.bandwidthlimit > maxbw)
            {
               this._maxBandwidth = maxbw;
            }
            else
            {
               this._maxBandwidth = this.bandwidthlimit;
            }
         }
         else
         {
            this._maxBandwidth = this.info.maxBytesPerSecond * 8 / 1024;
         }
      }
      
      private function init() : void
      {
         if(this.info == null)
         {
            return;
         }
         this.debug("initializing ...");
         this._previousDroppedFrames = this.info.droppedFrames;
         this._previousDroppedFramesTime = getTimer();
         this._bufferMode = this.BUFFER_BUFFERING;
         this._reachedBufferTime = false;
      }
      
      private function monitorQOS(te:TimerEvent) : void
      {
         var curTime:Number = this.time;
         if(this.time == 0)
         {
            return;
         }
         if(this._bufferMode == this.BUFFER_BUFFERING)
         {
            return;
         }
         if(this.bufferLength >= this._preferredBufferLength)
         {
            this._reachedBufferTime = true;
         }
         this.getMaxBandwidth();
      }
      
      private function switchStream(streamID:Number = 0) : void
      {
         if(streamID < 0)
         {
            streamID = 0;
         }
         if(streamID > this.dsPlayList[this.dsPlayIndex].streams.length - 1)
         {
            streamID = this.dsPlayList[this.dsPlayIndex].streams.length - 1;
         }
         if(streamID == this._curStreamID)
         {
            return;
         }
         if(this._switchMode == true)
         {
            return;
         }
         this._prevStreamID = this._curStreamID;
         this._curStreamID = streamID;
         this.debug("Switch Mode: " + this._switchMode + " - sending switch to server to bit rate: " + this.dsPlayList[this.dsPlayIndex].streams[this._curStreamID].rate);
         var nso:NetStreamPlayOptions = new NetStreamPlayOptions();
         nso.streamName = this.dsPlayList[this.dsPlayIndex].streams[this._curStreamID].name;
         nso.transition = NetStreamPlayTransitions.SWITCH;
         nso.start = this.dsPlayList[this.dsPlayIndex].start;
         nso.len = this.dsPlayList[this.dsPlayIndex].len;
         super.play2(nso);
         this._switchMode = true;
      }
      
      private function getQOSAndSwitch(te:TimerEvent) : void
      {
         if(this.info == null)
         {
            this.qosTimer.stop();
            return;
         }
         if(this._manualSwitchMode)
         {
            return;
         }
         if(this._liveStream)
         {
            this.checkLiveQOSAndSwitch();
         }
         else
         {
            this.checkVodQOSAndSwitch();
         }
         this._lastMaxBandwidthSO.data.maxBandwidth = this._maxBandwidth;
      }
      
      private function checkLiveQOSAndSwitch() : void
      {
         var nextStreamID:int = 0;
         var i:int = 0;
         this.debug("max bw: " + this._maxBandwidth + " cur bitrate: " + this.currentStreamBitRate + " buffer: " + this.bufferLength + "\tfps: " + this.currentFPS);
         if(this.qosTimer.currentCount <= 2)
         {
            return;
         }
         if(this._maxBandwidth < this.dsPlayList[this.dsPlayIndex].streams[this._curStreamID].rate && this._liveBWErrorCount < this.LIVE_ERROR_CORRECTION_LIMIT)
         {
            this._maxBandwidth = this._previousMaxBandwidth;
            ++this._liveBWErrorCount;
         }
         else
         {
            this._liveBWErrorCount = 0;
            this._previousMaxBandwidth = this._maxBandwidth;
         }
         var nowTime:int = getTimer();
         if(this.bufferLength < this._preferredBufferLength / 2 || this._maxBandwidth < this.dsPlayList[this.dsPlayIndex].streams[this._curStreamID].rate && this._maxBandwidth != 0 || (this.info.droppedFrames - this._previousDroppedFrames) * 1000 / (nowTime - this._previousDroppedFramesTime) > this.currentFPS * 0.25)
         {
            nextStreamID = 0;
            if(this.bufferLength < this._preferredBufferLength / 2 || this._maxBandwidth < this.dsPlayList[this.dsPlayIndex].streams[this._curStreamID].rate)
            {
               i = this.dsPlayList[this.dsPlayIndex].streamCount - 1;
               while(i >= 0)
               {
                  if(this._maxBandwidth > this.dsPlayList[this.dsPlayIndex].streams[i].rate)
                  {
                     nextStreamID = i;
                     break;
                  }
                  i--;
               }
               if(nextStreamID < this._curStreamID)
               {
                  if(this._maxBandwidth < this.dsPlayList[this.dsPlayIndex].streams[this._curStreamID].rate)
                  {
                     this.debug(int(this._maxBandwidth) + " - Switching down because of maxBitrate lower than current stream bitrate");
                  }
                  else if(this.bufferLength < this._preferredBufferLength / 2)
                  {
                     this.debug("Switching down because of buffer");
                  }
               }
            }
            else
            {
               this.debug("Switching down because of dropped fps " + (this.info.droppedFrames - this._previousDroppedFrames) * 1000 / (nowTime - this._previousDroppedFramesTime) + " is greather than 0.25 of fps: " + this.currentFPS * 0.25);
               this._droppedFramesLockRate = this.dsPlayList[this.dsPlayIndex].streams[this._curStreamID].rate;
               if(this.droppedFramesTimer.currentCount < this.DROPPED_FRAMES_LOCK_LIMIT && !this.droppedFramesTimer.running)
               {
                  this.droppedFramesTimer.start();
                  this.debug("Activating lock to prevent switching to " + this._droppedFramesLockRate + " | Offense Number " + this.droppedFramesTimer.currentCount);
               }
               nextStreamID = this._curStreamID - 1;
            }
            if(nextStreamID > 0)
            {
               if(this.dsPlayList[this.dsPlayIndex].streams[nextStreamID].rate >= this._droppedFramesLockRate)
               {
                  this.debug("next rate: " + this.dsPlayList[this.dsPlayIndex].streams[nextStreamID].rate + " lock rate: " + this._droppedFramesLockRate);
                  return;
               }
            }
            if(this._curStreamID != nextStreamID)
            {
               this.switchStream(nextStreamID);
            }
            this._previousDroppedFrames = this.info.droppedFrames;
            this._previousDroppedFramesTime = getTimer();
         }
         else
         {
            this.SwitchUpOnMaxBandwidth();
         }
      }
      
      private function checkVodQOSAndSwitch() : void
      {
         var nextStreamID:int = 0;
         var i:int = 0;
         this.debug("max bw: " + this._maxBandwidth + " cur bitrate: " + this.currentStreamBitRate + " buffer: " + this.bufferLength + "fps: " + this.currentFPS);
         this._lastMaxBandwidthSO.data.maxBandwidth = this._maxBandwidth;
         var nowTime:int = getTimer();
         if(this.bufferLength < this._preferredBufferLength || this._maxBandwidth < this.dsPlayList[this.dsPlayIndex].streams[this._curStreamID].rate && this._maxBandwidth != 0 || (this.info.droppedFrames - this._previousDroppedFrames) * 1000 / (nowTime - this._previousDroppedFramesTime) > this.currentFPS * 0.25)
         {
            nextStreamID = 0;
            if(this.bufferLength < this._preferredBufferLength || this._maxBandwidth < this.dsPlayList[this.dsPlayIndex].streams[this._curStreamID].rate)
            {
               i = this.dsPlayList[this.dsPlayIndex].streamCount - 1;
               while(i >= 0)
               {
                  if(this._maxBandwidth > this.dsPlayList[this.dsPlayIndex].streams[i].rate)
                  {
                     nextStreamID = i;
                     break;
                  }
                  i--;
               }
               if(nextStreamID < this._curStreamID)
               {
                  if(this._maxBandwidth < this.dsPlayList[this.dsPlayIndex].streams[this._curStreamID].rate)
                  {
                     this.debug("Switching down because of maxBitrate lower than current stream bitrate");
                  }
                  else if(this.bufferLength < this._curBufferTime)
                  {
                     this.debug("Switching down because of buffer");
                  }
               }
               if(this.bufferLength > this._curBufferTime && this._curBufferTime != this._preferredBufferLength)
               {
                  this._curBufferTime = this._preferredBufferLength;
                  this.debug("setting buffer time to " + this._curBufferTime);
                  this.bufferTime = this._curBufferTime;
               }
            }
            else
            {
               this.debug("Switching down because of dropped fps " + (this.info.droppedFrames - this._previousDroppedFrames) * 1000 / (nowTime - this._previousDroppedFramesTime) + " is greather than 0.25 of fps: " + this.currentFPS * 0.25);
               this._droppedFramesLockRate = this.dsPlayList[this.dsPlayIndex].streams[this._curStreamID].rate;
               if(this.droppedFramesTimer.currentCount < this.DROPPED_FRAMES_LOCK_LIMIT && !this.droppedFramesTimer.running)
               {
                  this.droppedFramesTimer.start();
                  this.debug("Activating lock to prevent switching to " + this._droppedFramesLockRate + " | Offense Number " + this.droppedFramesTimer.currentCount);
               }
               nextStreamID = this._curStreamID - 1;
            }
            if(this.bufferLength < this._aggressiveModeBufferLength && this._reachedBufferTime)
            {
               this.debug("switching to the aggressive mode");
               nextStreamID = 0;
               this.qosTimer.delay = this._switchQOSTimerDelay * 1000 / 2;
            }
            if(nextStreamID > 0)
            {
               if(this.dsPlayList[this.dsPlayIndex].streams[nextStreamID].rate >= this._droppedFramesLockRate)
               {
                  return;
               }
            }
            if(this._curStreamID != nextStreamID)
            {
               this.switchStream(nextStreamID);
            }
            this._previousDroppedFrames = this.info.droppedFrames;
            this._previousDroppedFramesTime = getTimer();
         }
         else
         {
            this.SwitchUpOnMaxBandwidth();
            if(this.qosTimer.delay != this._switchQOSTimerDelay * 1000)
            {
               this.qosTimer.delay = this._switchQOSTimerDelay * 1000;
            }
         }
      }
      
      private function releaseDFLock(te:TimerEvent) : void
      {
         this.debug("Releasing dropped frames lock and setting the rate back to MAX_VALUE");
         this._droppedFramesLockRate = int.MAX_VALUE;
         this.droppedFramesTimer.stop();
      }
      
      private function SwitchUpOnMaxBandwidth() : void
      {
         if(this.info == null)
         {
            return;
         }
         if(this._manualSwitchMode)
         {
            if(this._curBufferTime != this._preferredBufferLength)
            {
               this._curBufferTime = this._preferredBufferLength;
               this.debug("setting buffer time to " + this._curBufferTime);
               this.bufferTime = this._curBufferTime;
            }
            return;
         }
         var nowTime:int = getTimer();
         var droppedFrames:int = this.info.droppedFrames;
         var nextStreamID:int = 0;
         var i:int = this.dsPlayList[this.dsPlayIndex].streamCount - 1;
         while(i >= 0)
         {
            if(this._maxBandwidth > this.dsPlayList[this.dsPlayIndex].streams[i].rate)
            {
               nextStreamID = i;
               break;
            }
            i--;
         }
         if(nextStreamID < this._curStreamID)
         {
            nextStreamID = this._curStreamID;
         }
         else if(nextStreamID > this._curStreamID)
         {
            if(this.bufferLength < this._curBufferTime)
            {
               nextStreamID = this._curStreamID;
            }
         }
         if(nextStreamID > this.dsPlayList[this.dsPlayIndex].streamCount - 1)
         {
            nextStreamID = this.dsPlayList[this.dsPlayIndex].streamCount - 1;
         }
         if(nextStreamID > 0)
         {
            if(this.dsPlayList[this.dsPlayIndex].streams[nextStreamID].rate >= this._droppedFramesLockRate)
            {
               return;
            }
         }
         if(this._curStreamID != nextStreamID)
         {
            this.switchStream(nextStreamID);
         }
         if(this._curBufferTime != this._preferredBufferLength)
         {
            this._curBufferTime = this._preferredBufferLength;
            this.debug("setting buffer time to " + this._curBufferTime);
            this.bufferTime = this._curBufferTime;
         }
      }
      
      private function debug(msg:String) : void
      {
         if(this.DEBUG)
         {
            trace(msg);
         }
      }
   }
}
