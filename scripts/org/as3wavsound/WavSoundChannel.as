package org.as3wavsound
{
   import flash.events.EventDispatcher;
   import flash.media.SoundTransform;
   import org.as3wavsound.sazameki.core.AudioSamples;
   import vectorrecord.KryEvent;
   
   public class WavSoundChannel extends EventDispatcher
   {
       
      
      private var player:WavSoundPlayer;
      
      private var _wavSound:WavSound;
      
      private var _soundTransform:SoundTransform;
      
      private var startPhase:Number;
      
      private var phase:Number = 0;
      
      private var _leftPeak:Number = 0;
      
      private var _rightPeak:Number = 0;
      
      private var loopsLeft:Number;
      
      private var finished:Boolean;
      
      public function WavSoundChannel(player:WavSoundPlayer, wavSound:WavSound, startTime:Number, loops:int, soundTransform:SoundTransform)
      {
         this._soundTransform = new SoundTransform();
         super();
         this.player = player;
         this._wavSound = wavSound;
         if(soundTransform != null)
         {
            this._soundTransform = soundTransform;
         }
         this.init(startTime,loops);
      }
      
      function init(startTime:Number, loops:int) : void
      {
         var startPositionInMillis:Number = Math.floor(startTime);
         var maxPositionInMillis:Number = Math.floor(this._wavSound.length);
         if(startPositionInMillis > maxPositionInMillis)
         {
            throw new Error("startTime greater than sound\'s length, max startTime is " + maxPositionInMillis);
         }
         this.phase = this.startPhase = Math.floor(startPositionInMillis * this._wavSound.samples.length / this._wavSound.length);
         this.finished = false;
         this.loopsLeft = loops;
      }
      
      public function stop() : void
      {
         this.player.stop(this);
      }
      
      function buffer(sampleBuffer:AudioSamples) : void
      {
         var i:int = 0;
         var sampleLeft:Number = NaN;
         var channelValue:Number = NaN;
         var sampleRight:Number = NaN;
         var volume:Number = this._soundTransform.volume / 1;
         var volumeLeft:Number = volume * (1 - this._soundTransform.pan) / 2;
         var volumeRight:Number = volume * (1 + this._soundTransform.pan) / 2;
         var needRightChannel:* = this._wavSound.playbackSettings.channels == 2;
         var hasRightChannel:* = this._wavSound.samples.setting.channels == 2;
         var samplesLength:Number = this._wavSound.samples.length;
         var samplesLeft:Vector.<Number> = this._wavSound.samples.left;
         var samplesRight:Vector.<Number> = this._wavSound.samples.right;
         var sampleBufferLength:Number = sampleBuffer.length;
         var sampleBufferLeft:Vector.<Number> = sampleBuffer.left;
         var sampleBufferRight:Vector.<Number> = sampleBuffer.right;
         var leftPeakRecord:Number = 0;
         var rightPeakRecord:Number = 0;
         if(!this.finished)
         {
            for(i = 0; i < sampleBufferLength; i++)
            {
               if(!this.finished)
               {
                  sampleLeft = samplesLeft[this.phase] * volumeLeft;
                  sampleBufferLeft[i] += sampleLeft;
                  leftPeakRecord += sampleLeft;
                  channelValue = needRightChannel && hasRightChannel ? Number(samplesRight[this.phase]) : Number(samplesLeft[this.phase]);
                  sampleRight = channelValue * volumeRight;
                  sampleBufferRight[i] += sampleRight;
                  rightPeakRecord += sampleRight;
                  if(++this.phase >= samplesLength)
                  {
                     this.phase = this.startPhase;
                     this.finished = this.loopsLeft-- == 0;
                  }
               }
            }
            if(this.finished)
            {
               dispatchEvent(new KryEvent(KryEvent.COMPLETE));
            }
            else
            {
               dispatchEvent(new KryEvent(KryEvent.PROGRESS,this.position));
            }
         }
         this._leftPeak = leftPeakRecord / sampleBufferLength;
         this._rightPeak = rightPeakRecord / sampleBufferLength;
      }
      
      public function get leftPeak() : Number
      {
         return this._leftPeak;
      }
      
      public function get rightPeak() : Number
      {
         return this._rightPeak;
      }
      
      public function get position() : Number
      {
         return this.phase * this._wavSound.length / this._wavSound.samples.length;
      }
      
      public function get soundTransform() : SoundTransform
      {
         return this._soundTransform;
      }
   }
}
