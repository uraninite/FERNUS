package org.as3wavsound.sazameki.format.wav.chunk
{
   import flash.utils.ByteArray;
   import org.as3wavsound.sazameki.core.AudioSamples;
   import org.as3wavsound.sazameki.core.AudioSetting;
   import org.as3wavsound.sazameki.format.riff.Chunk;
   
   public class WavdataChunk extends Chunk
   {
       
      
      private var _samples:AudioSamples;
      
      public function WavdataChunk()
      {
         super("data");
      }
      
      public function setAudioData(samples:AudioSamples) : void
      {
         this._samples = samples;
      }
      
      override protected function encodeData() : ByteArray
      {
         var i:int = 0;
         var sig:Number = NaN;
         var left:Vector.<Number> = null;
         var right:Vector.<Number> = null;
         var bytes:ByteArray = new ByteArray();
         bytes.endian = ENDIAN;
         var setting:AudioSetting = this._samples.setting;
         var len:int = this._samples.left.length;
         if(setting.channels == 2)
         {
            left = this._samples.left;
            right = this._samples.right;
            if(setting.bitRate == 16)
            {
               for(i = 0; i < len; i++)
               {
                  sig = left[i];
                  if(sig < -1)
                  {
                     bytes.writeShort(-32767);
                  }
                  else if(sig > 1)
                  {
                     bytes.writeShort(32767);
                  }
                  else
                  {
                     bytes.writeShort(sig * 32767);
                  }
                  sig = right[i];
                  if(sig < -1)
                  {
                     bytes.writeShort(-32767);
                  }
                  else if(sig > 1)
                  {
                     bytes.writeShort(32767);
                  }
                  else
                  {
                     bytes.writeShort(sig * 32767);
                  }
               }
            }
            else
            {
               for(i = 0; i < len; i++)
               {
                  sig = left[i];
                  if(sig < -1)
                  {
                     bytes.writeByte(0);
                  }
                  else if(sig > 1)
                  {
                     bytes.writeByte(255);
                  }
                  else
                  {
                     bytes.writeByte(sig * 127 + 128);
                  }
                  sig = right[i];
                  if(sig < -1)
                  {
                     bytes.writeByte(0);
                  }
                  else if(sig > 1)
                  {
                     bytes.writeByte(255);
                  }
                  else
                  {
                     bytes.writeByte(sig * 127 + 128);
                  }
               }
            }
         }
         else
         {
            left = this._samples.left;
            if(setting.bitRate == 16)
            {
               for(i = 0; i < len; i++)
               {
                  sig = left[i];
                  if(sig < -1)
                  {
                     bytes.writeShort(-32767);
                  }
                  else if(sig > 1)
                  {
                     bytes.writeShort(32767);
                  }
                  else
                  {
                     bytes.writeShort(sig * 32768);
                  }
               }
            }
            else
            {
               for(i = 0; i < len; i++)
               {
                  sig = left[i];
                  if(sig < -1)
                  {
                     bytes.writeByte(0);
                  }
                  else if(sig > 1)
                  {
                     bytes.writeByte(255);
                  }
                  else
                  {
                     bytes.writeByte(sig * 127 + 128);
                  }
               }
            }
         }
         return bytes;
      }
      
      public function decodeData(bytes:ByteArray, setting:AudioSetting) : AudioSamples
      {
         var i:int = 0;
         var left:Vector.<Number> = null;
         var right:Vector.<Number> = null;
         bytes.position = 0;
         bytes.endian = ENDIAN;
         var samples:AudioSamples = new AudioSamples(setting);
         var length:int = bytes.length / (setting.bitRate / 8) / setting.channels;
         if(setting.channels == 2)
         {
            left = samples.left;
            right = samples.right;
            if(setting.bitRate == 16)
            {
               for(i = 0; i < length; i++)
               {
                  left[i] = bytes.readShort() / 32767;
                  right[i] = bytes.readShort() / 32767;
               }
            }
            else
            {
               for(i = 0; i < length; i++)
               {
                  left[i] = bytes.readByte() / 255;
                  right[i] = bytes.readByte() / 255;
               }
            }
         }
         else
         {
            left = samples.left;
            if(setting.bitRate == 16)
            {
               for(i = 0; i < length; i++)
               {
                  left[i] = bytes.readShort() / 32767;
               }
            }
            else
            {
               for(i = 0; i < length; i++)
               {
                  left[i] = bytes.readByte() / 255;
               }
            }
         }
         return samples;
      }
   }
}
