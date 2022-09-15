package com.coltware.airxzip
{
   import com.luaye.console.C;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   use namespace zip_internal;
   
   public class ZipHeader
   {
      
      public static var HEADER_LOCAL_FILE:uint = 67324752;
      
      public static var HEADER_CENTRAL_DIR:uint = 33639248;
      
      public static var HEADER_END_CENTRAL_DIR:uint = 101010256;
      
      public static var WIN_DIR:int = 16;
      
      public static var WIN_FILE:int = 32;
      
      public static var UNIX_DIR:int = 16384;
      
      public static var UNIX_FILE:int = 32768;
       
      
      zip_internal var _signature:uint;
      
      zip_internal var _version:uint;
      
      zip_internal var _bitFlag:uint;
      
      zip_internal var _compressMethod:uint;
      
      zip_internal var _lastModTime:int;
      
      zip_internal var _lastModDate:int;
      
      zip_internal var _crc32:uint;
      
      zip_internal var _compressSize:uint;
      
      zip_internal var _uncompressSize:uint;
      
      zip_internal var _filenameLength:uint;
      
      zip_internal var _extraFieldLength:uint;
      
      zip_internal var _filename:ByteArray;
      
      zip_internal var _extraField:ByteArray;
      
      zip_internal var _versionBy:uint;
      
      zip_internal var _commentLength:uint;
      
      zip_internal var _diskNumber:uint = 0;
      
      zip_internal var _internalFileAttrs:uint = 0;
      
      zip_internal var _externalFileAttrs:uint = 0;
      
      zip_internal var _offsetLocalHeader:uint;
      
      zip_internal var _comment:ByteArray;
      
      public function ZipHeader(sig:uint = 67324752)
      {
         super();
         this._signature = sig;
      }
      
      public function read(stream:IDataInput, bytes:ByteArray) : void
      {
         if(this._signature == HEADER_LOCAL_FILE)
         {
            this.readLocalHeader(stream,bytes);
         }
         else if(this._signature == HEADER_CENTRAL_DIR)
         {
            this.readCentralHeader(stream,bytes);
         }
      }
      
      public function readAuto(stream:IDataInput) : void
      {
         var bytes:ByteArray = new ByteArray();
         bytes.endian = Endian.LITTLE_ENDIAN;
         this._signature = stream.readInt();
         this.read(stream,bytes);
      }
      
      public function getCompressMethod() : uint
      {
         return this._compressMethod;
      }
      
      public function getUncompressSize() : uint
      {
         return this._uncompressSize;
      }
      
      public function getCompressSize() : uint
      {
         return this._compressSize;
      }
      
      public function isDirectory() : Boolean
      {
         var num:uint = 0;
         if(this._uncompressSize == 0)
         {
            if(this._externalFileAttrs == 0)
            {
               return false;
            }
            if(this._externalFileAttrs & 16)
            {
               return true;
            }
            num = this._externalFileAttrs >> 16 & 65535;
            if(num & ZipHeader.UNIX_DIR)
            {
               return true;
            }
         }
         return false;
      }
      
      public function getCompressRate() : Number
      {
         if(this._uncompressSize == 0)
         {
            return 0;
         }
         var num:Number = this._compressSize / this._uncompressSize;
         return 1 - num;
      }
      
      public function getDate() : Date
      {
         var sec:* = this._lastModTime & 31;
         var min:* = (this._lastModTime & 2016) >> 5;
         var hour:* = (this._lastModTime & 63488) >> 11;
         var day:* = this._lastModDate & 31;
         var month:* = (this._lastModDate & 480) >> 5;
         var year:int = ((this._lastModDate & 65024) >> 9) + 1980;
         return new Date(year,month - 1,day,hour,min,sec,0);
      }
      
      public function getLocalHeaderOffset() : int
      {
         return this._offsetLocalHeader;
      }
      
      public function getFilename(charset:String = null) : String
      {
         if(this._filenameLength < 1)
         {
            return "";
         }
         if(charset == null)
         {
            if(this._versionBy >> 8 == 3)
            {
               charset = "utf-8";
            }
            else
            {
               charset = "shift_jis";
            }
         }
         var _char:String = charset.toLowerCase();
         if(_char == "utf-8")
         {
            return this.getFilenameUTF8();
         }
         this._filename.position = 0;
         return this._filename.readMultiByte(this._filename.bytesAvailable,charset);
      }
      
      public function getLocalHeaderSize() : int
      {
         return 30 + this._filenameLength + this._extraFieldLength;
      }
      
      protected function readLocalHeader(stream:IDataInput, bytes:ByteArray) : void
      {
         stream.readBytes(bytes,0,26);
         bytes.position = 0;
         this._version = bytes.readUnsignedShort();
         bytes.position = 2;
         this._bitFlag = bytes.readUnsignedShort();
         bytes.position = 4;
         this._compressMethod = bytes.readUnsignedShort();
         bytes.position = 6;
         this._lastModTime = bytes.readUnsignedShort();
         bytes.position = 8;
         this._lastModDate = bytes.readUnsignedShort();
         bytes.position = 10;
         this._crc32 = bytes.readUnsignedInt();
         bytes.position = 14;
         this._compressSize = bytes.readUnsignedInt();
         bytes.position = 18;
         this._uncompressSize = bytes.readUnsignedInt();
         bytes.position = 22;
         this._filenameLength = bytes.readShort();
         bytes.position = 24;
         this._extraFieldLength = bytes.readShort();
         if(this._signature == HEADER_LOCAL_FILE)
         {
            stream.readBytes(bytes,26,this._filenameLength + this._extraFieldLength);
            bytes.position = 26;
            this._filename = new ByteArray();
            bytes.readBytes(this._filename,0,this._filenameLength);
            if(this._extraFieldLength > 0)
            {
               this._extraField = new ByteArray();
               bytes.readBytes(this._extraField,0,this._extraFieldLength);
            }
         }
      }
      
      public function writeLocalHeader(stream:IDataOutput) : void
      {
         this.writeHeader(stream,false);
      }
      
      public function writeCentralHeader(stream:IDataOutput) : void
      {
         this.writeHeader(stream,true);
      }
      
      protected function writeHeader(stream:IDataOutput, isCentral:Boolean = false) : void
      {
         if(isCentral)
         {
            this._signature = HEADER_CENTRAL_DIR;
            stream.writeUnsignedInt(HEADER_CENTRAL_DIR);
            stream.writeShort(this._versionBy);
         }
         else
         {
            this._signature = HEADER_LOCAL_FILE;
            stream.writeUnsignedInt(HEADER_LOCAL_FILE);
         }
         stream.writeShort(this._version);
         stream.writeShort(this._bitFlag);
         stream.writeShort(this._compressMethod);
         stream.writeShort(this._lastModTime);
         stream.writeShort(this._lastModDate);
         stream.writeUnsignedInt(this._crc32);
         stream.writeUnsignedInt(this._compressSize);
         stream.writeUnsignedInt(this._uncompressSize);
         stream.writeShort(this._filenameLength);
         stream.writeShort(this._extraFieldLength);
         if(this._extraFieldLength > 0)
         {
            this._extraField.position = 0;
            stream.writeBytes(this._extraField);
         }
         if(isCentral)
         {
            stream.writeShort(this._commentLength);
            stream.writeShort(this._diskNumber);
            stream.writeShort(this._internalFileAttrs);
            stream.writeUnsignedInt(this._externalFileAttrs);
            stream.writeUnsignedInt(this._offsetLocalHeader);
         }
         this._filename.position = 0;
         stream.writeBytes(this._filename);
         if(this._extraFieldLength > 0)
         {
         }
      }
      
      protected function readCentralHeader(stream:IDataInput, bytes:ByteArray) : void
      {
         stream.readBytes(bytes,0,42);
         bytes.position = 0;
         this._versionBy = bytes.readUnsignedShort();
         bytes.position = 2;
         this._version = bytes.readUnsignedShort();
         bytes.position = 4;
         this._bitFlag = bytes.readUnsignedShort();
         bytes.position = 6;
         this._compressMethod = bytes.readUnsignedShort();
         bytes.position = 8;
         this._lastModTime = bytes.readUnsignedShort();
         bytes.position = 10;
         this._lastModDate = bytes.readUnsignedShort();
         bytes.position = 12;
         this._crc32 = bytes.readUnsignedInt();
         bytes.position = 16;
         this._compressSize = bytes.readUnsignedInt();
         bytes.position = 20;
         this._uncompressSize = bytes.readUnsignedInt();
         bytes.position = 24;
         this._filenameLength = bytes.readShort();
         bytes.position = 26;
         this._extraFieldLength = bytes.readShort();
         bytes.position = 28;
         this._commentLength = bytes.readUnsignedShort();
         bytes.position = 30;
         this._diskNumber = bytes.readUnsignedShort();
         bytes.position = 32;
         this._internalFileAttrs = bytes.readUnsignedShort();
         bytes.position = 34;
         this._externalFileAttrs = bytes.readUnsignedInt();
         bytes.position = 38;
         this._offsetLocalHeader = bytes.readUnsignedInt();
         var len:int = this._filenameLength + this._extraFieldLength + this._commentLength;
         stream.readBytes(bytes,42,len);
         bytes.position = 42;
         if(this._filenameLength > 0)
         {
            this._filename = new ByteArray();
            bytes.readBytes(this._filename,0,this._filenameLength);
         }
         if(this._extraFieldLength > 0)
         {
            this._extraField = new ByteArray();
            bytes.readBytes(this._extraField,0,this._extraFieldLength);
         }
         if(this._commentLength > 0)
         {
            this._comment = new ByteArray();
            bytes.readBytes(this._comment,0,this._commentLength);
         }
      }
      
      protected function getFilenameUTF8() : String
      {
         var ch:int = 0;
         var ch1:int = 0;
         var ch2:int = 0;
         if(!this._filename)
         {
            return "";
         }
         this._filename.position = 0;
         var ba:ByteArray = new ByteArray();
         var ret:String = "";
         while(this._filename.bytesAvailable)
         {
            ch = this._filename.readUnsignedByte();
            if(ch >= 0 && ch <= 127)
            {
               ba.writeByte(ch);
            }
            else if(ch >= 192 && ch <= 223)
            {
               ba.writeByte(ch);
               ba.writeByte(this._filename.readUnsignedByte());
            }
            else if(ch >= 224 && ch <= 239)
            {
               ch1 = this._filename.readUnsignedByte();
               ch2 = this._filename.readUnsignedByte();
               if(ch == 227 && ch1 == 130 && ch2 == 153)
               {
                  --ba.position;
                  ch = ba.readUnsignedByte() + 1;
                  --ba.position;
                  ba.writeByte(ch);
               }
               else if(ch == 227 && ch1 == 130 && ch2 == 154)
               {
                  --ba.position;
                  ch = ba.readUnsignedByte() + 2;
                  --ba.position;
                  ba.writeByte(ch);
               }
               else
               {
                  ba.writeByte(ch);
                  ba.writeByte(ch1);
                  ba.writeByte(ch2);
               }
            }
            else if(ch >= 240 && ch <= 247)
            {
               ba.writeByte(ch);
               ba.writeByte(this._filename.readUnsignedByte());
               ba.writeByte(this._filename.readUnsignedByte());
               ba.writeByte(this._filename.readUnsignedByte());
            }
         }
         ba.position = 0;
         return ba.readMultiByte(ba.bytesAvailable,"utf-8");
      }
      
      public function getVersion() : int
      {
         return this._versionBy & 255;
      }
      
      public function dumpLogInfo() : void
      {
         C.debug("[" + this._signature.toString(16) + "]*************** " + this.getFilename() + " ****************");
         C.debug("signature(4) : " + this._signature);
         C.debug("version(2)   : " + this._version);
         C.debug("bit flag(2)  : " + this._bitFlag.toString(2));
         C.debug("method(2)    : " + this._compressMethod);
         C.debug("last mod time(2) : " + this._lastModTime);
         C.debug("last mod date(2) : " + this._lastModDate);
         C.debug("date  : " + this.getDate());
         C.debug("crc32(4)     : " + this._crc32.toString(16));
         C.debug("compress size(4)        : " + this._compressSize);
         C.debug("un-compress size(4)     : " + this._uncompressSize);
         C.debug("filename length(2)      : " + this._filenameLength);
         C.debug("extra length(2)         : " + this._extraFieldLength);
         if(this._extraFieldLength > 0)
         {
            this._extraField.position = 0;
            C.debug("extra field : " + this._extraField.toString());
         }
         if(this._signature == HEADER_CENTRAL_DIR)
         {
            C.debug("version by1 " + (this._versionBy >> 8));
            C.debug("version by2 " + (this._versionBy & 255));
            C.debug("comment size " + this._commentLength);
            C.debug("disk number  " + this._diskNumber);
            C.debug("internal file attrs " + this._internalFileAttrs);
            C.debug("external file attrs " + this._externalFileAttrs);
            C.debug("offset local header " + this._offsetLocalHeader);
            if(this.isDirectory())
            {
               C.debug("is dir");
            }
            else
            {
               C.debug("is file");
            }
         }
      }
   }
}
