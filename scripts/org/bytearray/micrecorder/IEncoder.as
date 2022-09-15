package org.bytearray.micrecorder
{
   import flash.utils.ByteArray;
   
   public interface IEncoder
   {
       
      
      function encode(param1:ByteArray, param2:int = 2, param3:int = 16, param4:int = 44100) : ByteArray;
   }
}
