package com.kxk.mp3player
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.events.ProgressEvent;
   import flash.events.SampleDataEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundLoaderContext;
   import flash.media.SoundTransform;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class KryMp3Player extends MovieClip
   {
       
      
      private var _mp3Player:MovieClip;
      
      private var _sound:Sound;
      
      private var _soundContext:SoundLoaderContext;
      
      private var _soundChannel:SoundChannel;
      
      private var _soundTransform:SoundTransform;
      
      private var _interval:uint;
      
      private var _isPlaying:Boolean = false;
      
      private var _isSeek:Boolean = false;
      
      private var _volume:Number = 1;
      
      private var _soundPosition:Number = 0;
      
      private var _line:Sprite;
      
      private var _bytes:ByteArray;
      
      private var _plotHeight:Number;
      
      private var _channelLength:Number;
      
      public function KryMp3Player(mp3Player:MovieClip, url:String = "")
      {
         super();
         this._mp3Player = mp3Player;
         this._mp3Player.mcBar.mcBarPlay.scaleX = 0;
         this._mp3Player.mcBar.mcBarBuffer.scaleX = 0;
         this._mp3Player.txtInfo.text = this.convertTime() + " / " + this.convertTime();
         this._mp3Player.btnSound.addEventListener(MouseEvent.CLICK,this.muteHandler);
         this._mp3Player.btnVolumeBar.addEventListener(MouseEvent.MOUSE_DOWN,this.volumeControlDown);
         this._bytes = new ByteArray();
         this._line = new Sprite();
         this._sound = new Sound();
         this._soundContext = new SoundLoaderContext();
         this._soundChannel = new SoundChannel();
         this._soundTransform = new SoundTransform(this._volume);
         this._sound.addEventListener(Event.COMPLETE,this.soundCompleteHandler);
         this._sound.addEventListener(IOErrorEvent.IO_ERROR,this.soundErrorHandler);
         this._sound.addEventListener(ProgressEvent.PROGRESS,this.soundProgressHandler);
         this._sound.addEventListener(Event.OPEN,this.soundOpenHandler);
         this._sound.addEventListener(SampleDataEvent.SAMPLE_DATA,this.soundSampleDataHandler);
         this._sound.addEventListener(Event.ID3,this.id3Handler);
         this._soundChannel.soundTransform = this._soundTransform;
         this._sound.load(new URLRequest(url),this._soundContext);
         this._soundChannel = this._sound.play(this._soundPosition);
         this._soundChannel.addEventListener(Event.SOUND_COMPLETE,this.soundChannelCompleteHandler);
         this._mp3Player.bullet.x = 0;
      }
      
      public function disposeAll() : void
      {
         this._isPlaying = false;
         this._isSeek = false;
         clearInterval(this._interval);
         this._interval = NaN;
         this._plotHeight = NaN;
         this._channelLength = NaN;
         this._volume = 1;
         this._soundPosition = 0;
         if(this._line)
         {
            this._line.graphics.clear();
            this._line = null;
         }
         if(!this._mp3Player)
         {
         }
         if(this._bytes)
         {
            this._bytes.clear();
            this._bytes = null;
         }
         if(this._soundChannel)
         {
            this._soundChannel.stop();
            this._soundChannel.removeEventListener(Event.SOUND_COMPLETE,this.soundChannelCompleteHandler);
            this._soundChannel = null;
         }
         if(this._sound)
         {
            this._sound.removeEventListener(Event.COMPLETE,this.soundCompleteHandler);
            this._sound.removeEventListener(IOErrorEvent.IO_ERROR,this.soundErrorHandler);
            this._sound.removeEventListener(ProgressEvent.PROGRESS,this.soundProgressHandler);
            this._sound.removeEventListener(Event.OPEN,this.soundOpenHandler);
            this._sound.removeEventListener(SampleDataEvent.SAMPLE_DATA,this.soundSampleDataHandler);
            this._sound.removeEventListener(Event.ID3,this.id3Handler);
            this._sound = null;
         }
         if(this._soundContext)
         {
            this._soundContext = null;
         }
         if(this._soundTransform)
         {
            this._soundTransform = null;
         }
      }
      
      private function id3Handler(e:Event) : void
      {
         var _id3:Object = e.target.id3;
         trace("Album: " + _id3.album);
         trace("Song: " + _id3.songName);
         trace("Artist: " + _id3.artist);
         trace("Track: " + _id3.track);
         trace("Year: " + _id3.year);
         trace("Comment: " + _id3.comment);
         if(_id3.songName != null)
         {
         }
      }
      
      private function soundCompleteHandler(e:Event) : *
      {
         trace(e);
      }
      
      private function soundErrorHandler(e:IOErrorEvent) : *
      {
         trace(e);
      }
      
      private function soundProgressHandler(e:ProgressEvent) : *
      {
         this._mp3Player.mcBar.mcBarBuffer.scaleX = Number((this._sound.bytesLoaded / this._sound.bytesTotal).toFixed(2));
      }
      
      private function soundOpenHandler(e:Event) : *
      {
         this._isPlaying = true;
         this._mp3Player.btnPlayPause.gotoAndStop(2);
         this._mp3Player.btnPlayPause.addEventListener(MouseEvent.CLICK,this.playPauseHandler);
         this._mp3Player.mcBar.addEventListener(MouseEvent.MOUSE_DOWN,this.seekDownControl);
         this._mp3Player.bullet.addEventListener(MouseEvent.MOUSE_DOWN,this.bulletDown);
         this._interval = setInterval(this.statusProgress,100);
         trace(e);
      }
      
      private function soundSampleDataHandler(e:SampleDataEvent) : *
      {
         trace(e);
      }
      
      private function soundChannelCompleteHandler(e:Event) : *
      {
         this._isPlaying = false;
         clearInterval(this._interval);
         this._mp3Player.btnPlayPause.gotoAndStop(3);
         this._mp3Player.btnPlayPause.removeEventListener(MouseEvent.CLICK,this.playPauseHandler);
         this._mp3Player.btnPlayPause.addEventListener(MouseEvent.CLICK,this.soundRewind);
      }
      
      private function statusProgress() : *
      {
         var _fullLength:Number = Math.ceil(this._sound.length / (this._sound.bytesLoaded / this._sound.bytesTotal));
         this._mp3Player.mcBar.mcBarPlay.scaleX = Number((this._soundChannel.position / _fullLength).toFixed(2));
         this._mp3Player.txtInfo.text = this.convertTime(this._soundChannel.position / 1000) + " / " + this.convertTime(_fullLength / 1000);
         this._mp3Player.bullet.x = this._mp3Player.mcBar.mcBarPlay.scaleX * this._mp3Player.mcBar.width;
      }
      
      private function playSound(_pos:Number) : *
      {
         clearInterval(this._interval);
         this._soundChannel.stop();
         this._soundChannel = null;
         this._soundChannel = this._sound.play(_pos);
         this._soundChannel.addEventListener(Event.SOUND_COMPLETE,this.soundChannelCompleteHandler);
         this._soundTransform.volume = this._volume;
         this._soundChannel.soundTransform = this._soundTransform;
         this._mp3Player.btnVolumeBar.mcBar.width = this._volume * this._mp3Player.btnVolumeBar.width;
         this._isPlaying = true;
         this._mp3Player.btnSound.gotoAndStop(1);
         this._interval = setInterval(this.statusProgress,100);
      }
      
      private function soundRewind(e:Event) : *
      {
         this._mp3Player.btnPlayPause.gotoAndStop(2);
         this._mp3Player.btnPlayPause.addEventListener(MouseEvent.CLICK,this.playPauseHandler);
         this._mp3Player.btnPlayPause.removeEventListener(MouseEvent.CLICK,this.soundRewind);
         this._soundPosition = 0;
         this.playSound(this._soundPosition);
      }
      
      private function seekDownControl(e:MouseEvent) : *
      {
         this._mp3Player.mcBar.removeEventListener(MouseEvent.MOUSE_DOWN,this.seekDownControl);
         this._mp3Player.stage.addEventListener(MouseEvent.MOUSE_UP,this.seekUpControl);
         this._mp3Player.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.seekCalc);
         this._isSeek = true;
         this.seekCalc();
      }
      
      private function seekUpControl(e:MouseEvent) : *
      {
         this._mp3Player.mcBar.addEventListener(MouseEvent.MOUSE_DOWN,this.seekDownControl);
         this._mp3Player.stage.removeEventListener(MouseEvent.MOUSE_UP,this.seekUpControl);
         this._mp3Player.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.seekCalc);
         this._isSeek = false;
      }
      
      private function seekCalc(e:MouseEvent = null) : *
      {
         var _seekTime:Number = NaN;
         var _fullLength:Number = NaN;
         if(0 < this._mp3Player.mcBar.mouseX && this._mp3Player.mcBar.mouseX < this._mp3Player.mcBar.mcBarBg.width && this._mp3Player.mcBar.mouseX < this._mp3Player.mcBar.mcBarBuffer.width)
         {
            this._mp3Player.mcBar.mcBarPlay.width = this._mp3Player.mcBar.mouseX;
            this._mp3Player.bullet.x = this._mp3Player.mouseX;
            _seekTime = this._mp3Player.mcBar.mouseX / this._mp3Player.mcBar.mcBarBg.width;
            _fullLength = Math.ceil(this._sound.length / (this._sound.bytesLoaded / this._sound.bytesTotal));
            this._soundPosition = _seekTime * _fullLength;
            this.playSound(this._soundPosition);
            this._mp3Player.btnPlayPause.gotoAndStop(2);
         }
      }
      
      private function playPauseHandler(e:MouseEvent) : *
      {
         if(this._isPlaying)
         {
            this._isPlaying = false;
            this._mp3Player.btnPlayPause.gotoAndStop(1);
            this._soundPosition = this._soundChannel.position;
            this._soundChannel.stop();
            clearInterval(this._interval);
         }
         else
         {
            this._isPlaying = true;
            this._mp3Player.btnPlayPause.gotoAndStop(2);
            this.playSound(this._soundPosition);
         }
      }
      
      private function muteHandler(e:MouseEvent) : *
      {
         var _v:Number = 0;
         if(this._soundTransform.volume == 0)
         {
            this._mp3Player.btnSound.gotoAndStop(1);
            _v = this._volume;
            this._mp3Player.btnVolumeBar.mcBar.width = _v * this._mp3Player.btnVolumeBar.width;
         }
         else
         {
            this._mp3Player.btnSound.gotoAndStop(2);
            _v = 0;
            this._mp3Player.btnVolumeBar.mcBar.width = _v;
         }
         this._soundTransform.volume = _v;
         this._soundChannel.soundTransform = this._soundTransform;
      }
      
      private function bulletDown(e:MouseEvent) : *
      {
         this._mp3Player.bullet.removeEventListener(MouseEvent.MOUSE_DOWN,this.bulletDown);
         this._mp3Player.stage.addEventListener(MouseEvent.MOUSE_UP,this.bulletUp);
         this._mp3Player.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.bulletMove);
         this._isSeek = true;
         this.bulletMove();
      }
      
      private function bulletUp(e:MouseEvent) : *
      {
         this._mp3Player.bullet.addEventListener(MouseEvent.MOUSE_DOWN,this.bulletDown);
         this._mp3Player.stage.removeEventListener(MouseEvent.MOUSE_UP,this.bulletUp);
         this._mp3Player.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.bulletMove);
         this._isSeek = false;
      }
      
      private function bulletMove(e:MouseEvent = null) : *
      {
         if(0 < this._mp3Player.mouseX && this._mp3Player.mouseX < this._mp3Player.mcBar.width)
         {
            this.seekCalc();
         }
      }
      
      private function volumeControlDown(e:MouseEvent) : *
      {
         this._mp3Player.btnVolumeBar.removeEventListener(MouseEvent.MOUSE_DOWN,this.volumeControlDown);
         this._mp3Player.stage.addEventListener(MouseEvent.MOUSE_UP,this.volumeControlUp);
         this._mp3Player.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.volumeCalc);
         this._mp3Player.btnSound.gotoAndStop(1);
         this.volumeCalc();
      }
      
      private function volumeControlUp(e:MouseEvent) : *
      {
         this._mp3Player.btnVolumeBar.addEventListener(MouseEvent.MOUSE_DOWN,this.volumeControlDown);
         this._mp3Player.stage.removeEventListener(MouseEvent.MOUSE_UP,this.volumeControlUp);
         this._mp3Player.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.volumeCalc);
      }
      
      private function volumeCalc(e:MouseEvent = null) : *
      {
         if(0 < this._mp3Player.btnVolumeBar.mouseX && this._mp3Player.btnVolumeBar.mouseX < this._mp3Player.btnVolumeBar.width)
         {
            this._mp3Player.btnVolumeBar.mcBar.width = this._mp3Player.btnVolumeBar.mouseX;
            this._volume = this._mp3Player.btnVolumeBar.mouseX / this._mp3Player.btnVolumeBar.width;
            this._soundTransform.volume = this._volume;
            this._soundChannel.soundTransform = this._soundTransform;
         }
      }
      
      private function convertTime(_secs:Number = NaN) : String
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
   }
}
