package org.bytearray.micrecorder.encoder
{
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import org.bytearray.micrecorder.IEncoder;
   
   public class WaveEncoder implements IEncoder
   {
      
      private static const RIFF:String = "RIFF";
      
      private static const WAVE:String = "WAVE";
      
      private static const FMT:String = "fmt ";
      
      private static const DATA:String = "data";
       
      
      private var _bytes:ByteArray;
      
      private var _buffer:ByteArray;
      
      private var _volume:Number;
      
      public function WaveEncoder(volume:Number = 1)
      {
         this._bytes = new ByteArray();
         this._buffer = new ByteArray();
         super();
         this._volume = volume;
      }
      
      public function encode(samples:ByteArray, channels:int = 2, bits:int = 16, rate:int = 44100) : ByteArray
      {
         var data:ByteArray = this.create(samples);
         this._bytes.length = 0;
         this._bytes.endian = Endian.LITTLE_ENDIAN;
         this._bytes.writeUTFBytes(WaveEncoder.RIFF);
         this._bytes.writeInt(uint(data.length + 44));
         this._bytes.writeUTFBytes(WaveEncoder.WAVE);
         this._bytes.writeUTFBytes(WaveEncoder.FMT);
         this._bytes.writeInt(uint(16));
         this._bytes.writeShort(uint(1));
         this._bytes.writeShort(channels);
         this._bytes.writeInt(rate);
         this._bytes.writeInt(uint(rate * channels * (bits >> 3)));
         this._bytes.writeShort(uint(channels * (bits >> 3)));
         this._bytes.writeShort(bits);
         this._bytes.writeUTFBytes(WaveEncoder.DATA);
         this._bytes.writeInt(data.length);
         this._bytes.writeBytes(data);
         this._bytes.position = 0;
         return this._bytes;
      }
      
      private function create(bytes:ByteArray) : ByteArray
      {
         this._buffer.endian = Endian.LITTLE_ENDIAN;
         this._buffer.length = 0;
         bytes.position = 0;
         while(bytes.bytesAvailable)
         {
            this._buffer.writeShort(bytes.readFloat() * (32767 * this._volume));
         }
         return this._buffer;
      }
   }
}
