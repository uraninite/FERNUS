package com.greensock.loading
{
   import com.greensock.events.LoaderEvent;
   import com.greensock.loading.core.LoaderItem;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundLoaderContext;
   import flash.media.SoundTransform;
   
   public class MP3Loader extends LoaderItem
   {
      
      private static var _classActivated:Boolean = _activateClass("MP3Loader",MP3Loader,"mp3");
      
      private static var _shape:Shape = new Shape();
      
      public static const SOUND_COMPLETE:String = "soundComplete";
      
      public static const SOUND_PAUSE:String = "soundPause";
      
      public static const SOUND_PLAY:String = "soundPlay";
      
      public static const PLAY_PROGRESS:String = "playProgress";
       
      
      protected var _sound:Sound;
      
      protected var _context:SoundLoaderContext;
      
      protected var _soundPaused:Boolean;
      
      protected var _soundComplete:Boolean;
      
      protected var _position:Number;
      
      protected var _soundTransform:SoundTransform;
      
      protected var _duration:Number;
      
      protected var _dispatchPlayProgress:Boolean;
      
      protected var _initPhase:int;
      
      protected var _repeatCount:uint;
      
      public var initThreshold:uint;
      
      public var channel:SoundChannel;
      
      public function MP3Loader(urlOrRequest:*, vars:Object = null)
      {
         super(urlOrRequest,vars);
         _type = "MP3Loader";
         this._position = 0;
         this._duration = 0;
         this._soundPaused = true;
         this._soundTransform = new SoundTransform("volume" in this.vars ? Number(this.vars.volume) : Number(1));
         this.initThreshold = "initThreshold" in this.vars ? uint(uint(this.vars.initThreshold)) : uint(102400);
         this._initSound();
      }
      
      protected function _initSound() : void
      {
         if(this._sound != null)
         {
            try
            {
               this._sound.close();
            }
            catch(error:Error)
            {
            }
            this._sound.removeEventListener(ProgressEvent.PROGRESS,this._progressHandler);
            this._sound.removeEventListener(Event.COMPLETE,this._completeHandler);
            this._sound.removeEventListener("ioError",_failHandler);
            this._sound.removeEventListener(Event.ID3,this._id3Handler);
         }
         this._initPhase = -1;
         this._sound = _content = new Sound();
         this._sound.addEventListener(ProgressEvent.PROGRESS,this._progressHandler,false,0,true);
         this._sound.addEventListener(Event.COMPLETE,this._completeHandler,false,0,true);
         this._sound.addEventListener("ioError",_failHandler,false,0,true);
         this._sound.addEventListener(Event.ID3,this._id3Handler,false,0,true);
      }
      
      override protected function _load() : void
      {
         this._context = this.vars.context is SoundLoaderContext ? this.vars.context : new SoundLoaderContext(3000);
         _prepRequest();
         this._soundComplete = false;
         this._initPhase = -1;
         this._position = 0;
         this._duration = 0;
         try
         {
            this._sound.load(_request,this._context);
            if(this.vars.autoPlay != false)
            {
               this.playSound();
            }
         }
         catch(error:Error)
         {
            _errorHandler(new LoaderEvent(LoaderEvent.ERROR,this,error.message));
         }
      }
      
      override protected function _dump(scrubLevel:int = 0, newStatus:int = 0, suppressEvents:Boolean = false) : void
      {
         this.pauseSound();
         this._initSound();
         this._position = 0;
         this._duration = 0;
         this._repeatCount = 0;
         this._soundComplete = false;
         super._dump(scrubLevel,newStatus);
         _content = this._sound;
      }
      
      public function playSound(event:Event = null) : SoundChannel
      {
         this.soundPaused = false;
         return this.channel;
      }
      
      public function pauseSound(event:Event = null) : void
      {
         this.soundPaused = true;
      }
      
      public function gotoSoundTime(time:Number, forcePlay:Boolean = false, resetRepeatCount:Boolean = true) : void
      {
         if(time > this._duration)
         {
            time = this._duration;
         }
         this._position = time * 1000;
         this._soundComplete = false;
         if(resetRepeatCount)
         {
            this._repeatCount = 0;
         }
         if(!this._soundPaused || forcePlay)
         {
            this._playSound(this._position);
            if(this._soundPaused)
            {
               this._soundPaused = false;
               dispatchEvent(new LoaderEvent(SOUND_PLAY,this));
            }
         }
      }
      
      protected function _playSound(position:Number) : void
      {
         if(this.channel != null)
         {
            this.channel.removeEventListener(Event.SOUND_COMPLETE,this._soundCompleteHandler);
            this.channel.stop();
         }
         this._position = position;
         this.channel = this._sound.play(this._position,1,this.soundTransform);
         if(this.channel != null)
         {
            this.channel.addEventListener(Event.SOUND_COMPLETE,this._soundCompleteHandler);
            _shape.addEventListener(Event.ENTER_FRAME,this._enterFrameHandler,false,0,true);
         }
      }
      
      protected function _id3Handler(event:Event) : void
      {
         if(this._sound.bytesLoaded > this.initThreshold)
         {
            this._initPhase = 1;
            dispatchEvent(new LoaderEvent(LoaderEvent.INIT,this));
         }
         else
         {
            this._initPhase = 0;
         }
      }
      
      override protected function _progressHandler(event:Event) : void
      {
         if(this._initPhase == 0 && this._sound.bytesLoaded > this.initThreshold)
         {
            this._initPhase = 1;
            dispatchEvent(new LoaderEvent(LoaderEvent.INIT,this));
         }
         super._progressHandler(event);
      }
      
      protected function _soundCompleteHandler(event:Event) : void
      {
         if(uint(this.vars.repeat) > this._repeatCount || int(this.vars.repeat) == -1)
         {
            ++this._repeatCount;
            this._playSound(0);
         }
         else
         {
            this._repeatCount = 0;
            this._soundComplete = true;
            this.soundPaused = true;
            this._position = this._duration * 1000;
            this._enterFrameHandler(null);
            dispatchEvent(new LoaderEvent(SOUND_COMPLETE,this));
         }
      }
      
      protected function _enterFrameHandler(event:Event) : void
      {
         if(this._dispatchPlayProgress)
         {
            dispatchEvent(new LoaderEvent(PLAY_PROGRESS,this));
         }
      }
      
      override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false) : void
      {
         if(type == PLAY_PROGRESS)
         {
            this._dispatchPlayProgress = true;
         }
         super.addEventListener(type,listener,useCapture,priority,useWeakReference);
      }
      
      override protected function _completeHandler(event:Event = null) : void
      {
         this._duration = this._sound.length / 1000;
         if(this._initPhase != 1)
         {
            this._initPhase = 1;
            dispatchEvent(new LoaderEvent(LoaderEvent.INIT,this));
         }
         super._completeHandler(event);
      }
      
      public function get soundPaused() : Boolean
      {
         return this._soundPaused;
      }
      
      public function set soundPaused(value:Boolean) : void
      {
         var changed:Boolean = Boolean(value != this._soundPaused);
         this._soundPaused = value;
         if(!changed)
         {
            return;
         }
         if(this._soundPaused)
         {
            if(this.channel != null)
            {
               this._position = this.channel.position;
               this.channel.removeEventListener(Event.SOUND_COMPLETE,this._soundCompleteHandler);
               _shape.removeEventListener(Event.ENTER_FRAME,this._enterFrameHandler);
               this.channel.stop();
            }
         }
         else
         {
            this._playSound(this._position);
            if(this.channel == null)
            {
               return;
            }
         }
         dispatchEvent(new LoaderEvent(!!this._soundPaused ? SOUND_PAUSE : SOUND_PLAY,this));
      }
      
      public function get playProgress() : Number
      {
         return !!this._soundComplete ? Number(1) : Number(this.soundTime / this.duration);
      }
      
      public function set playProgress(value:Number) : void
      {
         if(this.duration != 0)
         {
            this.gotoSoundTime(value * this._duration,!this._soundPaused);
         }
      }
      
      public function get volume() : Number
      {
         return this.soundTransform.volume;
      }
      
      public function set volume(value:Number) : void
      {
         this._soundTransform = this.soundTransform;
         this._soundTransform.volume = value;
         if(this.channel != null)
         {
            this.channel.soundTransform = this._soundTransform;
         }
      }
      
      public function get soundTime() : Number
      {
         return !this._soundPaused && this.channel != null ? Number(this.channel.position / 1000) : Number(this._position / 1000);
      }
      
      public function set soundTime(value:Number) : void
      {
         this.gotoSoundTime(value,!this._soundPaused);
      }
      
      public function get duration() : Number
      {
         if(this._sound.bytesLoaded < this._sound.bytesTotal)
         {
            this._duration = this._sound.length / 1000 / (this._sound.bytesLoaded / this._sound.bytesTotal);
         }
         return this._duration;
      }
      
      public function get soundTransform() : SoundTransform
      {
         return this.channel != null ? this.channel.soundTransform : this._soundTransform;
      }
      
      public function set soundTransform(value:SoundTransform) : void
      {
         this._soundTransform = value;
         if(this.channel != null)
         {
            this.channel.soundTransform = value;
         }
      }
   }
}
