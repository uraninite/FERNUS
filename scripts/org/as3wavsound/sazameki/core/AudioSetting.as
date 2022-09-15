package org.as3wavsound.sazameki.core
{
   public class AudioSetting
   {
       
      
      private var _channels:uint;
      
      private var _sampleRate:uint;
      
      private var _bitRate:uint;
      
      public function AudioSetting(channels:uint = 2, sampleRate:uint = 44100, bitRate:uint = 16)
      {
         super();
         if(sampleRate != 44100 && sampleRate != 22050 && sampleRate != 11025)
         {
            throw new Error("bad sample rate. sample rate must be 44100, 22050 or 11025");
         }
         if(channels != 1 && channels != 2)
         {
            throw new Error("channels must be 1 or 2");
         }
         if(bitRate != 16 && bitRate != 8)
         {
            throw new Error("bitRate must be 8 or 16");
         }
         this._channels = channels;
         this._sampleRate = sampleRate;
         this._bitRate = bitRate;
      }
      
      public function get channels() : uint
      {
         return this._channels;
      }
      
      public function get sampleRate() : uint
      {
         return this._sampleRate;
      }
      
      public function get bitRate() : uint
      {
         return this._bitRate;
      }
   }
}
