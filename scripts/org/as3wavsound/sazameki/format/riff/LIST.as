package org.as3wavsound.sazameki.format.riff
{
   import flash.utils.ByteArray;
   
   public class LIST extends Chunk
   {
       
      
      protected var _type:String;
      
      protected var _chunks:Vector.<Chunk>;
      
      public function LIST(type:String)
      {
         this.type = type;
         super("LIST");
      }
      
      public function set type(value:String) : void
      {
         if(value.length > 4)
         {
            value = value.substr(0,4);
         }
         else if(value.length < 4)
         {
            while(value.length < 4)
            {
               value += " ";
            }
         }
         this._type = value;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      override protected function encodeData() : ByteArray
      {
         var result:ByteArray = new ByteArray();
         result.writeUTFBytes(this._type);
         for(var i:int = 0; i < this._chunks.length; i++)
         {
            result.writeBytes(this._chunks[i].toByteArray());
         }
         return result;
      }
      
      protected function splitList(bytes:ByteArray) : Object
      {
         var currentName:String = null;
         var current:int = 0;
         var tmpByte:ByteArray = null;
         var obj:Object = new Object();
         bytes.position = 0;
         bytes.endian = ENDIAN;
         if(bytes.readUTFBytes(4) == "RIFF")
         {
            bytes.readInt();
            bytes.readUTFBytes(4);
         }
         else
         {
            bytes.position = 0;
         }
         while(bytes.position < bytes.length)
         {
            currentName = bytes.readUTFBytes(4);
            current = bytes.readInt();
            if(currentName == "LIST")
            {
               currentName = bytes.readUTFBytes(4);
               current -= 4;
            }
            tmpByte = new ByteArray();
            bytes.readBytes(tmpByte,0,current);
            if(current % 2 == 1)
            {
               bytes.readByte();
            }
            obj[currentName] = tmpByte;
         }
         return obj;
      }
   }
}
