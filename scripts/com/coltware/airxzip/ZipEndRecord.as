package com.coltware.airxzip
{
   import com.luaye.console.C;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class ZipEndRecord
   {
      
      public static var LENGTH:int = 22;
      
      public static var SIGNATURE:uint = 101010256;
       
      
      private var _signature:int;
      
      private var _numberDisk:uint;
      
      private var _numberDiskStartCentralDir:uint;
      
      private var _totalEntriesDisk:uint;
      
      private var _totalEntries:uint;
      
      private var _sizeCentralDir:uint;
      
      private var _offsetCentralDir:uint;
      
      private var _commentLength:uint;
      
      private var _comment:ByteArray;
      
      public function ZipEndRecord()
      {
         super();
      }
      
      public function write(data:IDataOutput, fileNum:int, offset:int, centralDirSize:int) : void
      {
         this._signature = SIGNATURE;
         this._numberDisk = 0;
         this._totalEntries = fileNum;
         this._commentLength = 0;
         this._sizeCentralDir = centralDirSize;
         this._offsetCentralDir = offset;
         data.writeUnsignedInt(SIGNATURE);
         data.writeShort(this._numberDisk);
         data.writeShort(0);
         data.writeShort(this._totalEntries);
         data.writeShort(this._totalEntries);
         data.writeUnsignedInt(this._sizeCentralDir);
         data.writeUnsignedInt(this._offsetCentralDir);
         data.writeShort(this._commentLength);
      }
      
      public function read(data:IDataInput) : void
      {
         var bytes:ByteArray = new ByteArray();
         bytes.endian = Endian.LITTLE_ENDIAN;
         data.readBytes(bytes,0,LENGTH);
         bytes.position = 0;
         this._signature = bytes.readInt();
         bytes.position = 4;
         this._numberDisk = bytes.readUnsignedShort();
         bytes.position = 6;
         this._numberDiskStartCentralDir = bytes.readUnsignedShort();
         bytes.position = 8;
         this._totalEntriesDisk = bytes.readShort();
         bytes.position = 10;
         this._totalEntries = bytes.readShort();
         bytes.position = 12;
         this._sizeCentralDir = bytes.readInt();
         bytes.position = 16;
         this._offsetCentralDir = bytes.readInt();
         bytes.position = 20;
         this._commentLength = bytes.readUnsignedShort();
         if(this._commentLength > 0)
         {
            data.readBytes(bytes,LENGTH,this._commentLength);
         }
      }
      
      public function getOffset() : int
      {
         return this._offsetCentralDir;
      }
      
      public function getSize() : int
      {
         return this._sizeCentralDir;
      }
      
      public function getTotalEntries() : uint
      {
         return this._totalEntries;
      }
      
      public function dumpLogInfo() : void
      {
         C.debug("*************** END OF RECORD DIRECTORY RECORD **************** " + this._signature.toString(16));
         C.debug("number of this disk : " + this._numberDisk);
         C.debug("Number of the disk with the start of the central directory : " + this._numberDiskStartCentralDir);
         C.debug("Total number of entries in the central dir on this disk : " + this._totalEntriesDisk);
         C.debug("Total number of entries in the central dir : " + this._totalEntries);
         C.debug("Size of the central directory : " + this._sizeCentralDir);
         C.debug("Offset of start of central directory with respect to the starting disk numbe : " + this._offsetCentralDir);
         C.debug("zipfile comment length : " + this._commentLength);
      }
   }
}
