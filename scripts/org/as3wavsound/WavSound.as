package org.as3wavsound
{
   import flash.media.SoundTransform;
   import flash.utils.ByteArray;
   import org.as3wavsound.sazameki.core.AudioSamples;
   import org.as3wavsound.sazameki.core.AudioSetting;
   import org.as3wavsound.sazameki.format.wav.Wav;
   
   public class WavSound
   {
      
      private static const player:WavSoundPlayer = new WavSoundPlayer();
       
      
      private var _bytesTotal:Number;
      
      private var _samples:AudioSamples;
      
      private var _playbackSettings:AudioSetting;
      
      private var _length:Number;
      
      public function WavSound(wavData:ByteArray, audioSettings:AudioSetting = null)
      {
         super();
         this.load(wavData,audioSettings);
      }
      
      function load(wavData:ByteArray, audioSettings:AudioSetting = null) : void
      {
         this._bytesTotal = wavData.length;
         this._samples = new Wav().decode(wavData,audioSettings);
         this._playbackSettings = audioSettings != null ? audioSettings : new AudioSetting();
         this._length = this.samples.length / this.samples.setting.sampleRate * 1000;
      }
      
      public function play(startTime:Number = 0, loops:int = 0, sndTransform:SoundTransform = null) : WavSoundChannel
      {
         return player.play(this,startTime,loops,sndTransform);
      }
      
      public function extract(target:ByteArray, length:Number, startPosition:Number = -1) : Number
      {
         var start:Number = Math.max(startPosition,0);
         var end:Number = Math.min(length,this.samples.length);
         for(var i:Number = start; i < end; i++)
         {
            target.writeFloat(this.samples.left[i]);
            if(this.samples.setting.channels == 2)
            {
               target.writeFloat(this.samples.right[i]);
            }
            else
            {
               target.writeFloat(this.samples.left[i]);
            }
         }
         return this.samples.length;
      }
      
      public function get bytesLoaded() : uint
      {
         return this._bytesTotal;
      }
      
      public function get bytesTotal() : int
      {
         return this._bytesTotal;
      }
      
      public function get length() : Number
      {
         return this._length;
      }
      
      function get samples() : AudioSamples
      {
         return this._samples;
      }
      
      function get playbackSettings() : AudioSetting
      {
         return this._playbackSettings;
      }
   }
}
