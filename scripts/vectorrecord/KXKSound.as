package vectorrecord
{
   import flash.events.Event;
   import flash.media.Sound;
   
   public class KXKSound
   {
       
      
      private var _source:Sound;
      
      private var _player:SimplePlayer;
      
      private var _tempo:Number = 1;
      
      private var _stage;
      
      public var onComplete:Function;
      
      public var onProgress:Function;
      
      public var isPlaying:Boolean = false;
      
      public function KXKSound(_source:Sound, _stage:*)
      {
         super();
         this._source = _source;
         this._stage = _stage;
         this._player = new SimplePlayer(this._source);
      }
      
      public function play() : void
      {
         this.isPlaying = true;
         this._player.addEventListener(Event.COMPLETE,this.soundChannel_complete);
         this._player.play();
         this._stage.addEventListener(Event.ENTER_FRAME,this.sound_playProgress);
      }
      
      public function pause() : void
      {
         this.isPlaying = false;
         this._player.removeEventListener(Event.COMPLETE,this.soundChannel_complete);
         this._player.pause();
         this._stage.removeEventListener(Event.ENTER_FRAME,this.sound_playProgress);
      }
      
      private function soundChannel_complete(e:Event) : void
      {
         this.pause();
         if(this.onComplete != null)
         {
            this.onComplete();
         }
      }
      
      private function sound_playProgress(e:Event = null) : void
      {
         if(this.onProgress != null)
         {
            this.onProgress();
         }
      }
      
      public function set tempo(_v:Number) : void
      {
         this._tempo = _v;
         this._player.tempo = this._tempo;
      }
      
      public function get duration() : Number
      {
         var _fullLength:Number = 0;
         if(this._source)
         {
            _fullLength = this._source.length / (this._source.bytesLoaded / this._source.bytesTotal) / 1000;
         }
         return _fullLength;
      }
      
      public function get soundTime() : Number
      {
         var _pos:Number = 0;
         if(this._player)
         {
            _pos = this._player.position / 1000;
         }
         return _pos;
      }
      
      public function set soundTime(_pos:Number) : void
      {
         this._player.position = _pos * 1000;
      }
      
      public function get volume() : Number
      {
         return this._player.volume;
      }
      
      public function set volume(_pos:Number) : void
      {
         this._player.volume = _pos;
      }
      
      public function dispose() : void
      {
         this._stage.removeEventListener(Event.ENTER_FRAME,this.sound_playProgress);
         this._source = null;
         this.onComplete = null;
         this.onProgress = null;
         this._stage = null;
         if(this._player)
         {
            this._player.pause();
            this._player.dispose();
            this._player = null;
         }
      }
   }
}
