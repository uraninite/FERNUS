package org.as3wavsound
{
   import flash.events.SampleDataEvent;
   import flash.media.Sound;
   import flash.media.SoundTransform;
   import flash.utils.ByteArray;
   import org.as3wavsound.sazameki.core.AudioSamples;
   import org.as3wavsound.sazameki.core.AudioSetting;
   
   class WavSoundPlayer
   {
      
      public static var MAX_BUFFERSIZE:Number = 8192;
       
      
      private const sampleBuffer:AudioSamples = new AudioSamples(new AudioSetting(),MAX_BUFFERSIZE);
      
      private const playingWavSounds:Vector.<WavSoundChannel> = new Vector.<WavSoundChannel>();
      
      private const player:Sound = this.configurePlayer();
      
      function WavSoundPlayer()
      {
         super();
      }
      
      private function configurePlayer() : Sound
      {
         var player:Sound = new Sound();
         player.addEventListener(SampleDataEvent.SAMPLE_DATA,this.onSamplesCallback);
         player.play();
         return player;
      }
      
      function play(sound:WavSound, startTime:Number, loops:int, sndTransform:SoundTransform) : WavSoundChannel
      {
         var channel:WavSoundChannel = new WavSoundChannel(this,sound,startTime,loops,sndTransform);
         this.playingWavSounds.push(channel);
         return channel;
      }
      
      function stop(channel:WavSoundChannel) : void
      {
         var playingWavSound:WavSoundChannel = null;
         for each(playingWavSound in this.playingWavSounds)
         {
            if(playingWavSound == channel)
            {
               this.playingWavSounds.splice(this.playingWavSounds.lastIndexOf(playingWavSound),1);
            }
         }
      }
      
      private function onSamplesCallback(event:SampleDataEvent) : void
      {
         var playingWavSound:WavSoundChannel = null;
         var outputStream:ByteArray = null;
         var samplesLength:Number = NaN;
         var samplesLeft:Vector.<Number> = null;
         var samplesRight:Vector.<Number> = null;
         var i:int = 0;
         this.sampleBuffer.clearSamples();
         for each(playingWavSound in this.playingWavSounds)
         {
            playingWavSound.buffer(this.sampleBuffer);
         }
         outputStream = event.data;
         samplesLength = this.sampleBuffer.length;
         samplesLeft = this.sampleBuffer.left;
         samplesRight = this.sampleBuffer.right;
         for(i = 0; i < samplesLength; i++)
         {
            outputStream.writeFloat(samplesLeft[i]);
            outputStream.writeFloat(samplesRight[i]);
         }
      }
   }
}
