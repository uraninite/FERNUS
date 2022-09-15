package com.coltware.airxzip
{
   import flash.events.EventDispatcher;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   use namespace zip_internal;
   
   public class ZipEntry extends EventDispatcher
   {
      
      public static var METHOD_NONE:int = 0;
      
      public static var METHOD_DEFLATE:int = 8;
       
      
      zip_internal var _header:ZipHeader;
      
      zip_internal var _headerLocal:ZipHeader;
      
      private var _content:ByteArray;
      
      private var _stream:IDataInput;
      
      public function ZipEntry(stream:IDataInput)
      {
         super();
         this._stream = stream;
      }
      
      public function setHeader(h:ZipHeader) : void
      {
         this._header = h;
      }
      
      public function getHeader() : ZipHeader
      {
         return this._header;
      }
      
      public function getCompressMethod() : int
      {
         return this._header.getCompressMethod();
      }
      
      public function isCompressed() : Boolean
      {
         var method:int = this._header.getCompressMethod();
         if(method == 0)
         {
            return false;
         }
         return true;
      }
      
      public function getFilename(charset:String = null) : String
      {
         return this._header.getFilename(charset);
      }
      
      public function isDirectory() : Boolean
      {
         return this._header.isDirectory();
      }
      
      public function getCompressRate() : Number
      {
         return this._header.getCompressRate();
      }
      
      public function getUncompressSize() : int
      {
         return this._header.getUncompressSize();
      }
      
      public function getCompressSize() : int
      {
         return this._header.getCompressSize();
      }
      
      public function getDate() : Date
      {
         return this._header.getDate();
      }
      
      public function getVersion() : int
      {
         return this._header._version;
      }
      
      public function getHostVersion() : int
      {
         return this._header.getVersion();
      }
      
      public function getCrc32() : String
      {
         return this._header._crc32.toString(16);
      }
      
      public function isEncrypted() : Boolean
      {
         if(this._header._bitFlag & 1)
         {
            return true;
         }
         return false;
      }
      
      public function getLocalHeaderOffset() : int
      {
         return this._header.getLocalHeaderOffset();
      }
      
      public function getLocalHeaderSize() : int
      {
         return this._header.getLocalHeaderSize();
      }
      
      zip_internal function dumpLogInfo() : void
      {
         this._header.dumpLogInfo();
      }
   }
}
