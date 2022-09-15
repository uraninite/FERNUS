package org.as3wavsound.sazameki.format.wav
{
   import flash.utils.ByteArray;
   import org.as3wavsound.sazameki.core.AudioSamples;
   import org.as3wavsound.sazameki.core.AudioSetting;
   import org.as3wavsound.sazameki.format.riff.Chunk;
   import org.as3wavsound.sazameki.format.riff.RIFF;
   import org.as3wavsound.sazameki.format.wav.chunk.WavdataChunk;
   import org.as3wavsound.sazameki.format.wav.chunk.WavfmtChunk;
   
   public class Wav extends RIFF
   {
       
      
      public function Wav()
      {
         super("WAVE");
      }
      
      public function encode(samples:AudioSamples) : ByteArray
      {
         var fmt:WavfmtChunk = new WavfmtChunk();
         var data:WavdataChunk = new WavdataChunk();
         _chunks = new Vector.<Chunk>();
         _chunks.push(fmt);
         _chunks.push(data);
         data.setAudioData(samples);
         fmt.setSetting(samples.setting);
         return toByteArray();
      }
      
      public function decode(wavData:ByteArray, setting:AudioSetting) : AudioSamples
      {
         var data:AudioSamples = null;
         var obj:Object = splitList(wavData);
         var relevantSetting:AudioSetting = setting;
         if(relevantSetting == null && obj["fmt "])
         {
            relevantSetting = new WavfmtChunk().decodeData(obj["fmt "] as ByteArray);
         }
         if(obj["fmt "] && obj["data"])
         {
            data = new WavdataChunk().decodeData(obj["data"] as ByteArray,relevantSetting);
         }
         else
         {
            data = new WavdataChunk().decodeData(wavData,relevantSetting);
         }
         var needsResampling:Boolean = relevantSetting != null && relevantSetting.sampleRate != 44100;
         return !!needsResampling ? this.resampleAudioSamples(data,relevantSetting.sampleRate) : data;
      }
      
      private function resampleAudioSamples(data:AudioSamples, sourceRate:int, targetRate:int = 44100) : AudioSamples
      {
         var newSize:int = data.length * targetRate / sourceRate;
         var newData:AudioSamples = new AudioSamples(new AudioSetting(data.setting.channels,targetRate,16),newSize);
         this.resampleSamples(data.left,newData.left,newSize,sourceRate,targetRate);
         if(data.setting.channels == 2)
         {
            this.resampleSamples(data.right,newData.right,newSize,sourceRate,targetRate);
         }
         return newData;
      }
      
      private function resampleSamples(sourceSamples:Vector.<Number>, targetSamples:Vector.<Number>, newSize:int, sourceRate:int, targetRate:int = 44100) : void
      {
         var increment:Number = NaN;
         var multiplier:Number = targetRate / sourceRate;
         var measure:int = targetRate;
         var sourceIndex:int = 0;
         var targetIndex:int = 0;
         while(targetIndex < newSize)
         {
            if(measure >= sourceRate)
            {
               increment = 0;
               if(targetIndex > 0 && sourceIndex < sourceSamples.length - 1)
               {
                  increment = (sourceSamples[sourceIndex + 1] - sourceSamples[sourceIndex]) / multiplier;
               }
               var _loc11_:*;
               targetSamples[_loc11_ = targetIndex++] = sourceSamples[sourceIndex] + increment;
               measure -= sourceRate;
            }
            else
            {
               sourceIndex++;
               measure += targetRate;
            }
         }
      }
   }
}
