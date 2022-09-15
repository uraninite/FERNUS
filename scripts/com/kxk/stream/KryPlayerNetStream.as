package com.kxk.stream
{
   import flash.display.MovieClip;
   import flash.events.AsyncErrorEvent;
   import flash.events.NetStatusEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.NetConnection;
   
   public class KryPlayerNetStream extends MovieClip
   {
       
      
      private var _streamURL:String;
      
      private var _dynamicStream:DynamicStream;
      
      private var _netConnection:NetConnection;
      
      private var _onError:Function;
      
      private var _onNetConnectionSuccess:Function;
      
      private var _onMetaData:Function;
      
      private var _onPlayPause:Function;
      
      private var _onBuffering:Function;
      
      private var _onStop:Function;
      
      private var _isLive:Boolean;
      
      private var _isNetStreamPlaying:Boolean;
      
      private var _bufferTime:Number = 2;
      
      private var _duration:Number;
      
      public function KryPlayerNetStream(streamURL:String = null, isLive:Boolean = false, onNetConnectionSuccess:Function = null, onError:Function = null, onMetaData:Function = null, onPlayPause:Function = null, onStop:Function = null, onBuffering:Function = null)
      {
         super();
         this._streamURL = streamURL;
         this._isLive = isLive;
         this._onError = onError;
         this._onNetConnectionSuccess = onNetConnectionSuccess;
         this._onPlayPause = onPlayPause;
         this._onBuffering = onBuffering;
         this._onMetaData = onMetaData;
         this._onStop = onStop;
         this._isNetStreamPlaying = false;
      }
      
      public function start() : *
      {
         this._netConnection = new NetConnection();
         this._netConnection.addEventListener(NetStatusEvent.NET_STATUS,this.netConnectionStatusHandler);
         this._netConnection.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.securityErrorHandler);
         this._netConnection.addEventListener(AsyncErrorEvent.ASYNC_ERROR,this.asyncErrorHandler);
         this._netConnection.connect(null);
      }
      
      private function netConnectionStatusHandler(e:NetStatusEvent) : void
      {
         var _client:Object = null;
         var _dsi:DynamicStreamItem = null;
         switch(e.info.code)
         {
            case "NetConnection.Connect.Rejected":
               if(this._onError != null)
               {
                  this._onError("NetConnection.Connect.Rejected");
               }
               break;
            case "NetConnection.Connect.Closed":
               if(this._onError != null)
               {
                  this._onError("NetConnection.Connect.Closed");
               }
               break;
            case "NetConnection.Connect.Failed":
               if(this._onError != null)
               {
                  this._onError("NetConnection.Connect.Failed");
               }
               break;
            case "NetConnection.Connect.Success":
               this._dynamicStream = new DynamicStream(this._netConnection);
               this._dynamicStream.addEventListener(NetStatusEvent.NET_STATUS,this.netStreamStatusHandler);
               this._dynamicStream.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.securityErrorHandler);
               this._dynamicStream.addEventListener(AsyncErrorEvent.ASYNC_ERROR,this.asyncErrorHandler);
               _client = new Object();
               _client.onMetaData = this.onMetaDataHandler;
               _client.onCuePoint = this.onCuePointHandler;
               this._dynamicStream.client = _client;
               _dsi = new DynamicStreamItem();
               _dsi.addStream(this._streamURL,10400);
               _dsi.startRate = 20000;
               this._dynamicStream.bufferTime = this._bufferTime;
               this._dynamicStream.preferredBufferLength = this._bufferTime;
               this._dynamicStream.startPlay(_dsi);
               if(this._onNetConnectionSuccess != null)
               {
                  this._onNetConnectionSuccess(true);
               }
         }
         trace(e.info.code);
      }
      
      private function netStreamStatusHandler(e:NetStatusEvent) : void
      {
         switch(e.info.code)
         {
            case "NetStream.Play.StreamNotFound":
               this._isNetStreamPlaying = false;
               if(this._onPlayPause != null)
               {
                  this._onPlayPause(this._isNetStreamPlaying);
               }
               break;
            case "NetStream.Play.Failed":
               this._isNetStreamPlaying = false;
               if(this._onPlayPause != null)
               {
                  this._onPlayPause(this._isNetStreamPlaying);
               }
               break;
            case "NetStream.Play.Stop":
               this._isNetStreamPlaying = false;
               if(this._onBuffering != null)
               {
                  this._onBuffering(false);
               }
               if(this._onPlayPause != null)
               {
                  this._onPlayPause(this._isNetStreamPlaying);
               }
               if(this._onStop != null)
               {
                  this._onStop(this._isNetStreamPlaying);
               }
               break;
            case "NetStream.Play.Start":
               this._isNetStreamPlaying = true;
               if(this._onBuffering != null)
               {
                  this._onBuffering(true);
               }
               if(this._onPlayPause != null)
               {
                  this._onPlayPause(this._isNetStreamPlaying);
               }
               break;
            case "NetStream.Pause.Notify":
               this._isNetStreamPlaying = false;
               if(this._onPlayPause != null)
               {
                  this._onPlayPause(this._isNetStreamPlaying);
               }
               break;
            case "NetStream.Unpause.Notify":
               this._isNetStreamPlaying = true;
               if(this._onPlayPause != null)
               {
                  this._onPlayPause(this._isNetStreamPlaying);
               }
               break;
            case "NetStream.Buffer.Empty":
               if(this._onBuffering != null && this._isNetStreamPlaying)
               {
                  this._onBuffering(true);
               }
               this._dynamicStream.pause();
               break;
            case "NetStream.Buffer.Flush":
               if(this._onBuffering != null)
               {
                  this._onBuffering(false);
               }
               break;
            case "NetStream.Buffer.Full":
               if(this._onBuffering != null)
               {
                  this._onBuffering(false);
               }
               this._dynamicStream.resume();
               break;
            case "NetStream.Seek.Notify":
               if(this._onBuffering != null)
               {
                  this._onBuffering(true);
               }
               break;
            case "NetStream.Seek.InvalidTime":
               if(this._onBuffering != null)
               {
                  this._onBuffering(true);
               }
               this.seek(e.info.details);
               break;
            case "NetStream.Seek.Complete":
               break;
            case "NetStream.Seek.Failed":
               break;
            case "NetStream.SeekStart.Notify":
         }
         trace(e.info.code);
      }
      
      private function onMetaDataHandler(_d:Object) : void
      {
         if(this._onMetaData != null)
         {
            this._onMetaData(_d);
         }
         this._duration = _d.duration;
         if(this._duration < this._bufferTime)
         {
            this._dynamicStream.bufferTime = 1;
         }
      }
      
      private function onCuePointHandler(_d:Object) : void
      {
         var key:* = null;
         for(key in _d)
         {
            trace("onCue " + key + "---" + _d[key]);
         }
      }
      
      public function disposeAll() : *
      {
         this._streamURL = null;
         this._isLive = false;
         this._onError = null;
         this._onNetConnectionSuccess = null;
         this._onPlayPause = null;
         this._onBuffering = null;
         this._onMetaData = null;
         this._onStop = null;
         this._isNetStreamPlaying = false;
         this._duration = 0;
         if(this._netConnection)
         {
            this._netConnection.removeEventListener(NetStatusEvent.NET_STATUS,this.netConnectionStatusHandler);
            this._netConnection.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.securityErrorHandler);
            this._netConnection.removeEventListener(AsyncErrorEvent.ASYNC_ERROR,this.asyncErrorHandler);
            this._netConnection.close();
            this._netConnection = null;
         }
         if(this._dynamicStream)
         {
            this._dynamicStream.removeEventListener(NetStatusEvent.NET_STATUS,this.netStreamStatusHandler);
            this._dynamicStream.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.securityErrorHandler);
            this._dynamicStream.removeEventListener(AsyncErrorEvent.ASYNC_ERROR,this.asyncErrorHandler);
            this._dynamicStream.close();
            this._dynamicStream.dispose();
            this._dynamicStream = null;
         }
      }
      
      public function pause() : *
      {
         this.isNetStreamPlaying = false;
         this._dynamicStream.pause();
      }
      
      public function resume() : *
      {
         this.isNetStreamPlaying = true;
         this._dynamicStream.resume();
      }
      
      public function seek(_num:Number) : *
      {
         this.isNetStreamPlaying = true;
         this._dynamicStream.seek(_num);
      }
      
      public function get isLive() : Boolean
      {
         return this._isLive;
      }
      
      public function get netConnectionStatus() : Boolean
      {
         return this._netConnection.connected;
      }
      
      public function get getNetStream() : DynamicStream
      {
         return this._dynamicStream;
      }
      
      public function get isNetStreamPlaying() : Boolean
      {
         return this._isNetStreamPlaying;
      }
      
      public function set isNetStreamPlaying(_b:Boolean) : *
      {
         this._isNetStreamPlaying = _b;
      }
      
      public function securityErrorHandler(e:SecurityErrorEvent) : void
      {
         if(this._onError != null)
         {
            this._onError(e.text);
         }
      }
      
      public function asyncErrorHandler(e:AsyncErrorEvent) : void
      {
         if(this._onError != null)
         {
            this._onError(e.text);
         }
      }
   }
}
