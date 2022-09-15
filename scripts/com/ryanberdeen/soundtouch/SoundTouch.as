package com.ryanberdeen.soundtouch
{
   public class SoundTouch implements IFifoSamplePipe
   {
       
      
      private var _rate:Number;
      
      private var _tempo:Number;
      
      private var virtualPitch:Number;
      
      private var virtualRate:Number;
      
      private var virtualTempo:Number;
      
      private var rateTransposer:RateTransposer;
      
      private var tdStretch:Stretch;
      
      private var _inputBuffer:FifoSampleBuffer;
      
      private var intermediateBuffer:FifoSampleBuffer;
      
      private var _outputBuffer:FifoSampleBuffer;
      
      public function SoundTouch()
      {
         super();
         this.rateTransposer = new RateTransposer(false);
         this.tdStretch = new Stretch(false);
         this._inputBuffer = new FifoSampleBuffer();
         this.intermediateBuffer = new FifoSampleBuffer();
         this._outputBuffer = new FifoSampleBuffer();
         this._rate = 0;
         this.tempo = 0;
         this.virtualPitch = 1;
         this.virtualRate = 1;
         this.virtualTempo = 1;
         this.calculateEffectiveRateAndTempo();
      }
      
      public function clear() : void
      {
         this.rateTransposer.clear();
         this.tdStretch.clear();
      }
      
      public function clone() : IFifoSamplePipe
      {
         var result:SoundTouch = new SoundTouch();
         result.rate = this.rate;
         result.tempo = this.tempo;
         return result;
      }
      
      public function get rate() : Number
      {
         return this._rate;
      }
      
      public function set rate(rate:Number) : void
      {
         this.virtualRate = rate;
         this.calculateEffectiveRateAndTempo();
      }
      
      public function set rateChange(rateChange:Number) : void
      {
         this.rate = 1 + 0.01 * rateChange;
      }
      
      public function get tempo() : Number
      {
         return this._tempo;
      }
      
      public function set tempo(tempo:Number) : void
      {
         this.virtualTempo = tempo;
         this.calculateEffectiveRateAndTempo();
      }
      
      public function set tempoChange(tempoChange:Number) : void
      {
         this.tempo = 1 + 0.01 * tempoChange;
      }
      
      public function set pitch(pitch:Number) : void
      {
         this.virtualPitch = pitch;
         this.calculateEffectiveRateAndTempo();
      }
      
      public function set pitchOctaves(pitchOctaves:Number) : void
      {
         this.pitch = Math.exp(0.69314718056 * pitchOctaves);
         this.calculateEffectiveRateAndTempo();
      }
      
      public function set pitchSemitones(pitchSemitones:Number) : void
      {
         this.pitchOctaves = pitchSemitones / 12;
      }
      
      public function get inputBuffer() : FifoSampleBuffer
      {
         return this._inputBuffer;
      }
      
      public function get outputBuffer() : FifoSampleBuffer
      {
         return this._outputBuffer;
      }
      
      private function testFloatEqual(a:Number, b:Number) : Boolean
      {
         return (a > b ? a - b : b - a) > 1e-10;
      }
      
      private function calculateEffectiveRateAndTempo() : void
      {
         var previousTempo:Number = this._tempo;
         var previousRate:Number = this._rate;
         this._tempo = this.virtualTempo / this.virtualPitch;
         this._rate = this.virtualRate * this.virtualPitch;
         if(this.testFloatEqual(this._tempo,previousTempo))
         {
            this.tdStretch.tempo = this._tempo;
         }
         if(this.testFloatEqual(this._rate,previousRate))
         {
            this.rateTransposer.rate = this._rate;
         }
         if(this._rate > 1)
         {
            if(this._outputBuffer != this.rateTransposer.outputBuffer)
            {
               this.tdStretch.inputBuffer = this._inputBuffer;
               this.tdStretch.outputBuffer = this.intermediateBuffer;
               this.rateTransposer.inputBuffer = this.intermediateBuffer;
               this.rateTransposer.outputBuffer = this._outputBuffer;
            }
         }
         else if(this._outputBuffer != this.tdStretch.outputBuffer)
         {
            this.rateTransposer.inputBuffer = this._inputBuffer;
            this.rateTransposer.outputBuffer = this.intermediateBuffer;
            this.tdStretch.inputBuffer = this.intermediateBuffer;
            this.tdStretch.outputBuffer = this._outputBuffer;
         }
      }
      
      public function process() : void
      {
         if(this._rate > 1)
         {
            this.tdStretch.process();
            this.rateTransposer.process();
         }
         else
         {
            this.rateTransposer.process();
            this.tdStretch.process();
         }
      }
   }
}
