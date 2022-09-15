package org.as3wavsound.sazameki.format.wav.chunk
{
   import flash.utils.ByteArray;
   import org.as3wavsound.sazameki.core.AudioSetting;
   import org.as3wavsound.sazameki.format.riff.Chunk;
   
   public class WavfmtChunk extends Chunk
   {
       
      
      private var _setting:AudioSetting;
      
      public function WavfmtChunk()
      {
         super("fmt ");
      }
      
      public function setSetting(setting:AudioSetting) : void
      {
         this._setting = setting;
      }
      
      override protected function encodeData() : ByteArray
      {
         var result:ByteArray = new ByteArray();
         result.endian = ENDIAN;
         result.writeShort(1);
         result.writeShort(this._setting.channels);
         result.writeInt(this._setting.sampleRate);
         result.writeInt(this._setting.sampleRate * this._setting.channels * (this._setting.bitRate / 8));
         result.writeShort(this._setting.bitRate / 8 * this._setting.channels);
         result.writeShort(this._setting.bitRate);
         return result;
      }
      
      public function decodeData(bytes:ByteArray) : AudioSetting
      {
         bytes.position = 0;
         bytes.endian = ENDIAN;
         bytes.readShort();
         var channels:int = bytes.readShort();
         var smplRate:int = bytes.readInt();
         bytes.readInt();
         bytes.readShort();
         var bit:int = bytes.readShort();
         this._setting = new AudioSetting(channels,smplRate,bit);
         return this._setting;
      }
   }
}
