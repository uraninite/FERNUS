package org.as3wavsound.sazameki.format.riff
{
   import flash.utils.ByteArray;
   
   public class Chunk
   {
       
      
      protected const ENDIAN:String = "littleEndian";
      
      protected var _id:String;
      
      public function Chunk(id:String)
      {
         super();
         this.id = id;
      }
      
      public function set id(value:String) : void
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
         this._id = value;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function toByteArray() : ByteArray
      {
         var result:ByteArray = new ByteArray();
         result.endian = this.ENDIAN;
         result.writeUTFBytes(this._id);
         var data:ByteArray = this.encodeData();
         result.writeUnsignedInt(data.length);
         result.writeBytes(data);
         return result;
      }
      
      protected function encodeData() : ByteArray
      {
         throw new Error("\'encodeData()\' method must be overriden");
      }
   }
}
