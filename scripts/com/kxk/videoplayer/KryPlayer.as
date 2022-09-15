package com.kxk.videoplayer
{
   import com.kxk.stream.KryPlayerNetStream;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.media.SoundTransform;
   import flash.media.Video;
   import flash.net.NetStream;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class KryPlayer extends MovieClip
   {
       
      
      private var _kryPlayerNetStream:KryPlayerNetStream;
      
      private var _video:Video;
      
      private var _streamInterval:uint;
      
      private var _ns:NetStream;
      
      private var _videoData:Object;
      
      private var _soundTransform:SoundTransform;
      
      private var _videoPlayer:MovieClip;
      
      private var _volume:Number = 1;
      
      private var _isSeek:Boolean = false;
      
      private var _isFull:Boolean = false;
      
      private var _fullScreenHandler:Function;
      
      private var _isStopped:Boolean = false;
      
      public function KryPlayer(videoPlayer:MovieClip, url:String = "", fullScreenHandler:Function = null)
      {
         super();
         this._videoPlayer = videoPlayer;
         this._fullScreenHandler = fullScreenHandler;
         this._soundTransform = new SoundTransform();
         this._soundTransform.volume = this._volume;
         this._videoData = new Object();
         this._video = new Video();
         this._video.smoothing = true;
         this.setVideo();
         this._kryPlayerNetStream = new KryPlayerNetStream(url,false,this.netConnectionHandler,this.errorHandler,this.metaDataHandler,this.playPauseHandler,this.stopHandler,this.bufferHandler);
         this._kryPlayerNetStream.start();
         this._videoPlayer.mcControls.bullet.addEventListener(MouseEvent.MOUSE_DOWN,this.bulletDown);
         this._videoPlayer.mcControls.bullet.x = this._videoPlayer.mcControls.mcBar.x;
      }
      
      public function disposeAll() : *
      {
         clearInterval(this._streamInterval);
         if(this._video)
         {
            this._video.attachNetStream(null);
            this._video.clear();
         }
         this._kryPlayerNetStream.disposeAll();
         this._videoPlayer = null;
         this._isSeek = false;
         this._isFull = false;
         this._volume = 1;
         this._soundTransform = null;
         this._videoData = null;
         this._ns = null;
      }
      
      private function netConnectionHandler(e:*) : *
      {
         this._ns = this._kryPlayerNetStream.getNetStream;
         this._ns.soundTransform = this._soundTransform;
         this._streamInterval = setInterval(this.videoStatusHandler,100);
         this._video.attachNetStream(this._ns);
         this._videoPlayer.mcVideo.addChild(this._video);
      }
      
      private function errorHandler(e:*) : *
      {
      }
      
      private function metaDataHandler(e:*) : *
      {
         var key:* = null;
         this._videoData.width = this._video.width = e.width;
         this._videoData.height = this._video.height = e.height;
         this._videoData.duration = e.duration;
         this.resizeVideo();
         for(key in e)
         {
         }
      }
      
      private function stopHandler(e:*) : *
      {
         clearInterval(this._streamInterval);
         this._videoPlayer.mcControls.btnPlayPause.removeEventListener(MouseEvent.CLICK,this.playPauseControl);
         this._videoPlayer.mcControls.btnPlayPause.addEventListener(MouseEvent.CLICK,this.replayVideo);
         this._videoPlayer.mcControls.btnPlayPause.gotoAndStop(1);
         this._isStopped = true;
         this._videoPlayer.mcControls.mcBar.mcBarPlay.width = this._videoPlayer.mcControls.mcBar.mcBarBg.width;
      }
      
      private function playPauseHandler(e:*) : *
      {
         if(!this._isSeek)
         {
            if(e)
            {
               this._videoPlayer.mcControls.btnPlayPause.gotoAndStop(2);
               this.playStatus();
            }
            else
            {
               this._videoPlayer.mcControls.btnPlayPause.gotoAndStop(!!this._isStopped ? 1 : 1);
            }
         }
         trace(this._isSeek);
      }
      
      private function bufferHandler(e:*) : *
      {
         this._videoPlayer.mcBuffer.visible = e;
         if(!e)
         {
         }
      }
      
      private function videoStatusHandler() : *
      {
         this._videoPlayer.mcControls.mcBar.mcBarBuffer.scaleX = Number((this._ns.bytesLoaded / this._ns.bytesTotal).toFixed(2));
         if(this._kryPlayerNetStream.isNetStreamPlaying)
         {
            this._videoPlayer.mcControls.mcBar.mcBarPlay.scaleX = Number((this._ns.time / this._videoData.duration).toFixed(2));
            this._videoPlayer.mcControls.txtInfo.text = this.convertTime(this._ns.time) + " / " + this.convertTime(this._videoData.duration);
            this._videoPlayer.mcControls.bullet.x = this._videoPlayer.mcControls.mcBar.mcBarPlay.scaleX * this._videoPlayer.mcControls.mcBar.width + this._videoPlayer.mcControls.mcBar.x;
         }
      }
      
      private function playStatus() : *
      {
         this._isStopped = false;
         this._videoPlayer.mcControls.btnPlayPause.addEventListener(MouseEvent.CLICK,this.playPauseControl);
         this._videoPlayer.mcControls.btnPlayPause.removeEventListener(MouseEvent.CLICK,this.replayVideo);
         clearInterval(this._streamInterval);
         this._streamInterval = setInterval(this.videoStatusHandler,100);
      }
      
      private function convertTime(_secs:Number) : String
      {
         var h:Number = NaN;
         var m:Number = NaN;
         var s:Number = NaN;
         if(_secs)
         {
            h = Math.floor(_secs / 3600);
            m = Math.floor(_secs % 3600 / 60);
            s = Math.floor(_secs % 3600 % 60);
            return (h == 0 ? "" : (h < 10 ? "0" + h.toString() + ":" : h.toString() + ":")) + (m < 10 ? "0" + m.toString() : m.toString()) + ":" + (s < 10 ? "0" + s.toString() : s.toString());
         }
         return "00:00:00";
      }
      
      private function playPauseControl(e:MouseEvent) : *
      {
         if(this._kryPlayerNetStream.isNetStreamPlaying)
         {
            this._kryPlayerNetStream.pause();
         }
         else
         {
            this._kryPlayerNetStream.resume();
         }
      }
      
      private function replayVideo(e:MouseEvent) : *
      {
         this._isStopped = false;
         this._videoPlayer.mcControls.mcBar.mcBarBuffer.scaleX = this._videoPlayer.mcControls.mcBar.mcBarPlay.scaleX = 0;
         this._videoPlayer.mcControls.bullet.x = this._videoPlayer.mcControls.mcBar.x;
         this._videoPlayer.mcControls.btnPlayPause.gotoAndStop(2);
         this._videoPlayer.mcControls.btnPlayPause.addEventListener(MouseEvent.CLICK,this.playPauseControl);
         this._videoPlayer.mcControls.btnPlayPause.removeEventListener(MouseEvent.CLICK,this.replayVideo);
         this._kryPlayerNetStream.seek(0);
         this._streamInterval = setInterval(this.videoStatusHandler,100);
      }
      
      private function muteControl(e:MouseEvent) : *
      {
         var _v:Number = 0;
         if(this._soundTransform.volume == 0)
         {
            this._videoPlayer.mcControls.btnSound.gotoAndStop(1);
            _v = this._volume;
            this._videoPlayer.mcControls.btnVolumeBar.mcBar.width = _v * this._videoPlayer.mcControls.btnVolumeBar.width;
         }
         else
         {
            this._videoPlayer.mcControls.btnSound.gotoAndStop(2);
            _v = 0;
            this._videoPlayer.mcControls.btnVolumeBar.mcBar.width = _v;
         }
         this._soundTransform.volume = _v;
         this._ns.soundTransform = this._soundTransform;
      }
      
      private function volumeControlDown(e:MouseEvent) : *
      {
         this._videoPlayer.mcControls.btnVolumeBar.removeEventListener(MouseEvent.MOUSE_DOWN,this.volumeControlDown);
         this._videoPlayer.stage.addEventListener(MouseEvent.MOUSE_UP,this.volumeControlUp);
         this._videoPlayer.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.volumeCalc);
         this._videoPlayer.mcControls.btnSound.gotoAndStop(1);
         this.volumeCalc();
      }
      
      private function volumeControlUp(e:MouseEvent) : *
      {
         this._videoPlayer.mcControls.btnVolumeBar.addEventListener(MouseEvent.MOUSE_DOWN,this.volumeControlDown);
         this._videoPlayer.stage.removeEventListener(MouseEvent.MOUSE_UP,this.volumeControlUp);
         this._videoPlayer.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.volumeCalc);
      }
      
      private function volumeCalc(e:MouseEvent = null) : *
      {
         if(0 < this._videoPlayer.mcControls.btnVolumeBar.mouseX && this._videoPlayer.mcControls.btnVolumeBar.mouseX < this._videoPlayer.mcControls.btnVolumeBar.width)
         {
            this._videoPlayer.mcControls.btnVolumeBar.mcBar.width = this._videoPlayer.mcControls.btnVolumeBar.mouseX;
            this._volume = this._videoPlayer.mcControls.btnVolumeBar.mouseX / this._videoPlayer.mcControls.btnVolumeBar.width;
            this._soundTransform.volume = this._volume;
            this._ns.soundTransform = this._soundTransform;
         }
      }
      
      private function seekDownControl(e:MouseEvent) : *
      {
         this._videoPlayer.mcControls.mcBar.removeEventListener(MouseEvent.MOUSE_DOWN,this.seekDownControl);
         this._videoPlayer.stage.addEventListener(MouseEvent.MOUSE_UP,this.seekUpControl);
         this._videoPlayer.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.seekCalc);
         this._isSeek = true;
         this.seekCalc();
      }
      
      private function seekUpControl(e:MouseEvent) : *
      {
         this._videoPlayer.mcControls.mcBar.addEventListener(MouseEvent.MOUSE_DOWN,this.seekDownControl);
         this._videoPlayer.stage.removeEventListener(MouseEvent.MOUSE_UP,this.seekUpControl);
         this._videoPlayer.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.seekCalc);
         this._isSeek = false;
         this._videoPlayer.mcControls.btnPlayPause.gotoAndStop(2);
      }
      
      private function seekCalc(e:MouseEvent = null) : *
      {
         var _seekTime:Number = NaN;
         if(0 < this._videoPlayer.mcControls.mcBar.mouseX && this._videoPlayer.mcControls.mcBar.mouseX < this._videoPlayer.mcControls.mcBar.mcBarBg.width)
         {
            this._videoPlayer.mcControls.mcBar.mcBarPlay.width = this._videoPlayer.mcControls.mcBar.mouseX;
            _seekTime = this._videoPlayer.mcControls.mcBar.mouseX * this._videoData.duration / this._videoPlayer.mcControls.mcBar.mcBarBg.width;
            this._kryPlayerNetStream.seek(_seekTime);
            this._videoPlayer.mcControls.bullet.x = this._videoPlayer.mcControls.mouseX + this._videoPlayer.mcControls.mcBar.x;
         }
      }
      
      private function fullScreenControl(e:MouseEvent = null) : *
      {
         if(this._isFull)
         {
            this._isFull = false;
            this._videoPlayer.mcControls.btnFullScreen.gotoAndStop(1);
         }
         else
         {
            this._isFull = true;
            this._videoPlayer.mcControls.btnFullScreen.gotoAndStop(2);
         }
         if(this._fullScreenHandler != null)
         {
            this._fullScreenHandler(this._isFull);
         }
      }
      
      public function get videoPlayer() : *
      {
         return this._videoPlayer;
      }
      
      private function bulletDown(e:MouseEvent) : *
      {
         this._videoPlayer.mcControls.bullet.removeEventListener(MouseEvent.MOUSE_DOWN,this.bulletDown);
         this._videoPlayer.mcControls.stage.addEventListener(MouseEvent.MOUSE_UP,this.bulletUp);
         this._videoPlayer.mcControls.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.bulletMove);
         this.bulletMove();
      }
      
      private function bulletUp(e:MouseEvent) : *
      {
         this._videoPlayer.mcControls.bullet.addEventListener(MouseEvent.MOUSE_DOWN,this.bulletDown);
         this._videoPlayer.mcControls.stage.removeEventListener(MouseEvent.MOUSE_UP,this.bulletUp);
         this._videoPlayer.mcControls.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.bulletMove);
         this._isSeek = false;
      }
      
      private function bulletMove(e:MouseEvent = null) : *
      {
         if(0 < this._videoPlayer.mcControls.mcBar.mouseX && this._videoPlayer.mcControls.mcBar.mouseX < this._videoPlayer.mcControls.mcBar.mcBarBg.width)
         {
            this.seekCalc();
         }
      }
      
      private function setVideo() : *
      {
         this._videoPlayer.mcControls.mcBar.mcBarPlay.scaleX = this._videoPlayer.mcControls.mcBar.mcBarBuffer.scaleX = 0;
         this._videoPlayer.mcControls.mcBar.width = this._videoPlayer.mcBg.width - 20;
         this._videoPlayer.mcControls.btnPlayPause.addEventListener(MouseEvent.CLICK,this.playPauseControl);
         this._videoPlayer.mcControls.btnSound.addEventListener(MouseEvent.CLICK,this.muteControl);
         this._videoPlayer.mcControls.btnVolumeBar.addEventListener(MouseEvent.MOUSE_DOWN,this.volumeControlDown);
         this._videoPlayer.mcControls.mcBar.addEventListener(MouseEvent.MOUSE_DOWN,this.seekDownControl);
         this._videoPlayer.mcControls.btnFullScreen.addEventListener(MouseEvent.CLICK,this.fullScreenControl);
      }
      
      public function resizeVideo() : *
      {
         var _scale:Number = Math.min(this._videoPlayer.mcBg.width / this._video.width,this._videoPlayer.mcBg.height / this._video.height);
         this._video.width = this._video.width * _scale;
         this._video.height = this._video.height * _scale;
         this._video.x = (this._videoPlayer.mcBg.width - this._video.width) / 2;
         this._video.y = (this._videoPlayer.mcBg.height - this._video.height) / 2;
         this._videoPlayer.mcBuffer.x = (this._videoPlayer.mcBg.width - this._videoPlayer.mcBuffer.width) / 2 + this._videoPlayer.mcBg.x;
         this._videoPlayer.mcBuffer.y = (this._videoPlayer.mcBg.height - this._videoPlayer.mcBuffer.height) / 2 + this._videoPlayer.mcBg.y;
      }
   }
}
