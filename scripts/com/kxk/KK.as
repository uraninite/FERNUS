package com.kxk
{
   import com.hurlant.crypto.Crypto;
   import com.hurlant.crypto.symmetric.ICipher;
   import com.hurlant.util.Base64;
   import com.hurlant.util.Hex;
   import flash.utils.ByteArray;
   import mx.utils.Base64Decoder;
   
   public class KK
   {
       
      
      public function KK()
      {
         super();
      }
      
      public function fd1(data:String, keyStr:String, _s:Boolean = true) : String
      {
         var key:ByteArray = null;
         var dec:Base64Decoder = new Base64Decoder();
         if(_s)
         {
            data = this.fd2(data,keyStr);
         }
         dec.decode(data);
         var fileBytes:ByteArray = dec.toByteArray();
         key = Hex.toArray(Hex.fromString(keyStr));
         var aes:ICipher = Crypto.getCipher("blowfish-ecb",key,Crypto.getPad("pkcs5"));
         aes.decrypt(fileBytes);
         return fileBytes.toString();
      }
      
      private function applyXor(inputBuffer:ByteArray, key:String) : ByteArray
      {
         var inChar:int = 0;
         var outChar:* = 0;
         var bitMask:int = 0;
         var outBuffer:ByteArray = new ByteArray();
         var keysBuffer:ByteArray = new ByteArray();
         keysBuffer.writeUTFBytes(key);
         var offset:int = 0;
         while(inputBuffer.bytesAvailable)
         {
            offset = inputBuffer.position % keysBuffer.length;
            inChar = inputBuffer.readUnsignedByte();
            bitMask = keysBuffer[offset];
            outChar = bitMask ^ inChar;
            outBuffer.writeByte(outChar);
         }
         return outBuffer;
      }
      
      private function fd2(input:String, key:String) : String
      {
         var inputBuffer:ByteArray = Base64.decodeToByteArray(input.split("").reverse().join(""));
         var out:ByteArray = this.applyXor(inputBuffer,key);
         out.position = 0;
         return out.readUTFBytes(out.length);
      }
   }
}
