package vectorrecord
{
   import com.ryanberdeen.soundtouch.SimpleFilter;
   import com.ryanberdeen.soundtouch.SoundTouch;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.SampleDataEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class SimplePlayer extends EventDispatcher
   {
       
      
      private var channelOffset:Number;
      
      private var filterChangedOutputPosition:Number;
      
      private var filterChangedPosition:Number;
      
      private var soundTouch:SoundTouch;
      
      private var sound:Sound;
      
      private var filter:SimpleFilter;
      
      private var outputSound:Sound;
      
      private var soundChannel:SoundChannel;
      
      private var _volume = 1;
      
      public function SimplePlayer(sound:Sound)
      {
         super();
         this.sound = sound;
         this.soundTouch = new SoundTouch();
         this.filter = new SimpleFilter(sound,this.soundTouch);
         this.outputSound = new Sound();
         this.outputSound.addEventListener(SampleDataEvent.SAMPLE_DATA,this.filter.handleSampleData);
         this.channelOffset = 0;
         this.filterChangedOutputPosition = 0;
         this.filterChangedPosition = 0;
      }
      
      public function get volume() : Number
      {
         return this._volume;
      }
      
      public function set volume(_pos:Number) : void
      {
         this._volume = _pos;
         if(this.soundChannel)
         {
            this.soundChannel.soundTransform = new SoundTransform(this._volume);
         }
      }
      
      public function get rate() : Number
      {
         return this.soundTouch.rate;
      }
      
      public function set rate(rate:Number) : void
      {
         this.beforeUpdateFilter();
         this.soundTouch.rate = rate;
      }
      
      public function get tempo() : Number
      {
         return this.soundTouch.tempo;
      }
      
      public function set tempo(tempo:Number) : void
      {
         this.beforeUpdateFilter();
         this.soundTouch.tempo = tempo;
      }
      
      public function set pitchOctaves(pitchOctaves:Number) : void
      {
         this.beforeUpdateFilter();
         this.soundTouch.pitchOctaves = pitchOctaves;
      }
      
      private function beforeUpdateFilter() : void
      {
         this.filterChangedPosition = this.position;
         this.filterChangedOutputPosition = this.outputPosition;
      }
      
      public function get position() : Number
      {
         var outputDelta:Number = this.outputPosition - this.filterChangedOutputPosition;
         var positionDelta:Number = outputDelta * this.soundTouch.tempo * this.soundTouch.rate;
         return this.filterChangedPosition + positionDelta;
      }
      
      public function set position(sourcePosition:Number) : void
      {
         var resume:Boolean = this.playing;
         this.pause();
         this.filter.sourcePosition = sourcePosition * 44.1;
         this.filterChangedPosition = sourcePosition;
         this.filterChangedOutputPosition = this.outputPosition;
         if(resume)
         {
            this.play();
         }
      }
      
      private function get outputPosition() : Number
      {
         return this.channelOffset + (this.soundChannel != null ? this.soundChannel.position : 0);
      }
      
      public function get playing() : Boolean
      {
         return this.soundChannel != null;
      }
      
      public function play() : void
      {
         if(!this.playing)
         {
            this.soundChannel = this.outputSound.play();
            this.soundChannel.soundTransform = new SoundTransform(this._volume);
            this.soundChannel.addEventListener(Event.SOUND_COMPLETE,this.soundCompleteHandler);
            dispatchEvent(new Event("play"));
         }
      }
      
      private function soundCompleteHandler(e:Event) : void
      {
         this.pause();
         dispatchEvent(new Event("complete"));
      }
      
      public function pause() : void
      {
         if(this.playing)
         {
            this.filter.position = this.outputPosition * 44.1;
            this.channelOffset += this.soundChannel.position;
            this.soundChannel.stop();
            this.soundChannel = null;
            dispatchEvent(new Event("pause"));
         }
      }
      
      public function togglePlayPause() : void
      {
         if(!this.playing)
         {
            this.play();
         }
         else
         {
            this.pause();
         }
      }
      
      public function dispose() : void
      {
         if(this.soundTouch)
         {
            this.soundTouch.clear();
            this.soundTouch = null;
         }
         if(this.filter)
         {
            this.filter.clear();
            this.filter = null;
         }
         if(this.soundChannel)
         {
            this.soundChannel.stop();
            this.soundChannel = null;
         }
         if(this.outputSound)
         {
            this.outputSound = null;
         }
         if(this.sound)
         {
            this.sound = null;
         }
      }
   }
}
