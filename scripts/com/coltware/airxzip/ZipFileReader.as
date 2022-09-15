package com.coltware.airxzip
{
   import com.coltware.airxzip.crypt.ICrypto;
   import com.coltware.airxzip.crypt.ZipCrypto;
   import com.luaye.console.C;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.utils.ByteArray;
   import flash.utils.CompressionAlgorithm;
   import flash.utils.Endian;
   import flash.utils.setTimeout;
   
   use namespace zip_internal;
   
   public class ZipFileReader extends EventDispatcher
   {
       
      
      private var _file:File;
      
      private var _stream:FileStream;
      
      private var _charset:String = "utf-8";
      
      private var _unzipStack:Array;
      
      private var _unzipWorking:Boolean = false;
      
      private var _unzipNum:int = 0;
      
      private var _endRecord:ZipEndRecord;
      
      private var _entries:Array;
      
      private var _totalEntries:uint = 0;
      
      private var _decryptors:Array;
      
      private var _password:ByteArray;
      
      public function ZipFileReader()
      {
         super();
         this._stream = new FileStream();
         this._stream.addEventListener(IOErrorEvent.IO_ERROR,this.ioError);
         this._unzipStack = new Array();
         this._entries = new Array();
         this._decryptors = new Array();
      }
      
      public function check(file:File) : Boolean
      {
         var s:FileStream = null;
         var i:int = 0;
         if(file.isDirectory)
         {
            return false;
         }
         if(file.isSymbolicLink)
         {
            return false;
         }
         try
         {
            s = new FileStream();
            s.open(file,FileMode.READ);
            s.endian = Endian.LITTLE_ENDIAN;
            s.position = 0;
            i = s.readInt();
            s.close();
            if(i == ZipHeader.HEADER_LOCAL_FILE)
            {
               return true;
            }
         }
         catch(err:Error)
         {
            return false;
         }
         return false;
      }
      
      public function open(file:File) : void
      {
         this._file = file;
         this._stream.open(this._file,FileMode.READ);
         this._stream.endian = Endian.LITTLE_ENDIAN;
         this._stream.position = this._stream.bytesAvailable - ZipEndRecord.LENGTH;
         var pos:int = 0;
         var sig:int = 0;
         while(this._stream.position > 0)
         {
            pos = this._stream.position;
            sig = this._stream.readInt();
            if(sig == ZipEndRecord.SIGNATURE)
            {
               this._endRecord = new ZipEndRecord();
               this._stream.position = pos;
               this._endRecord.read(this._stream);
               this._entries = new Array();
               this._totalEntries = this._endRecord.getTotalEntries();
               C.debug("ZipEndRecord " + pos);
               break;
            }
            if(sig == ZipHeader.HEADER_CENTRAL_DIR)
            {
               C.debug("FOUND CENTRAL " + this._stream.position);
            }
            this._stream.position = pos - 1;
         }
      }
      
      public function close() : void
      {
         if(this._stream)
         {
            this._stream.close();
         }
      }
      
      public function addDecrypto(crypto:ICrypto) : void
      {
         this._decryptors.push(crypto);
      }
      
      public function setPasswordBytes(bytes:ByteArray) : void
      {
         this._password = bytes;
         this._password.position = 0;
      }
      
      public function setPassword(password:String, charset:String = null) : void
      {
         var ba:ByteArray = new ByteArray();
         if(charset == null)
         {
            ba.writeUTFBytes(password);
         }
         else
         {
            ba.writeMultiByte(password,charset);
         }
         this._password = ba;
         this._password.position = 0;
      }
      
      public function getEntries() : Array
      {
         this.parseCentralHeaders();
         return this._entries;
      }
      
      public function unzip(entry:ZipEntry) : ByteArray
      {
         var decrypt:ICrypto = null;
         var i:int = 0;
         var _decrypt:ICrypto = null;
         C.debug("unzip(" + entry.getFilename() + ")");
         var pos:int = entry.getLocalHeaderOffset();
         this._stream.position = pos;
         var lzh:ZipHeader = new ZipHeader();
         lzh.readAuto(this._stream);
         entry._headerLocal = lzh;
         var bytes:ByteArray = new ByteArray();
         var size:int = entry.getCompressSize();
         if(size > 0)
         {
            this._stream.readBytes(bytes,0,entry.getCompressSize());
         }
         if(entry.isEncrypted())
         {
            if(this._password == null)
            {
               throw new ZipError("password is NULL");
            }
            decrypt = null;
            i = 0;
            while(i < this._decryptors.length && decrypt == null)
            {
               _decrypt = this._decryptors[i];
               if(_decrypt.checkDecrypt(entry))
               {
                  decrypt = _decrypt;
               }
               i++;
            }
            if(decrypt == null)
            {
               decrypt = new ZipCrypto();
            }
            decrypt.initDecrypt(this._password,lzh);
            bytes = decrypt.decrypt(bytes);
         }
         var method:int = entry.getCompressMethod();
         if(method != ZipEntry.METHOD_NONE)
         {
            if(method != ZipEntry.METHOD_DEFLATE)
            {
               throw new ZipError("not support compress method : " + method);
            }
            C.debug("uncompress data size is + " + bytes.length);
            bytes.uncompress(CompressionAlgorithm.DEFLATE);
         }
         return bytes;
      }
      
      public function rawdata(entry:ZipEntry) : ByteArray
      {
         var pos:int = entry.getLocalHeaderOffset();
         this._stream.position = pos;
         var lzh:ZipHeader = new ZipHeader();
         lzh.readAuto(this._stream);
         entry._headerLocal = lzh;
         var bytes:ByteArray = new ByteArray();
         var size:int = entry.getCompressSize();
         if(size > 0)
         {
            this._stream.readBytes(bytes,0,entry.getCompressSize());
         }
         bytes.position = 0;
         return bytes;
      }
      
      public function unzipAsync(entry:ZipEntry) : void
      {
         this._unzipStack.push(entry);
         if(this._unzipWorking == false)
         {
            this.execUnzip(1000);
         }
      }
      
      private function unzipAsyncTimeout(entry:ZipEntry) : void
      {
         var err:ZipErrorEvent = null;
         var decrypt:ICrypto = null;
         var i:int = 0;
         var _decrypt:ICrypto = null;
         var e:ZipErrorEvent = null;
         var event:ZipEvent = new ZipEvent(ZipEvent.ZIP_DATA_UNCOMPRESS);
         var pos:int = entry.getLocalHeaderOffset();
         this._stream.position = pos;
         this._stream.position = pos;
         var lzh:ZipHeader = new ZipHeader();
         lzh.readAuto(this._stream);
         entry._headerLocal = lzh;
         var bytes:ByteArray = new ByteArray();
         var size:int = entry.getCompressSize();
         if(size > 0)
         {
            this._stream.readBytes(bytes,0,size);
         }
         if(entry.isEncrypted())
         {
            if(this._password == null)
            {
               err = new ZipErrorEvent(ZipErrorEvent.ZIP_PASSWORD_ERROR);
               this.dispatchEvent(err);
               return;
            }
            decrypt = null;
            i = 0;
            while(i < this._decryptors.length && decrypt == null)
            {
               _decrypt = this._decryptors[i];
               if(_decrypt.checkDecrypt(entry))
               {
                  decrypt = _decrypt;
               }
               i++;
            }
            if(decrypt == null)
            {
               decrypt = new ZipCrypto();
            }
            decrypt.initDecrypt(this._password,lzh);
            try
            {
               bytes = decrypt.decrypt(bytes);
            }
            catch(ze:ZipError)
            {
               err = new ZipErrorEvent(ZipErrorEvent.ZIP_PASSWORD_ERROR);
               this.dispatchEvent(err);
            }
         }
         var method:int = entry.getCompressMethod();
         if(method != ZipEntry.METHOD_NONE)
         {
            if(method != ZipEntry.METHOD_DEFLATE)
            {
               e = new ZipErrorEvent(ZipErrorEvent.ZIP_NO_SUCH_METHOD);
               this.dispatchEvent(e);
               return;
            }
            event.$method = CompressionAlgorithm.DEFLATE;
         }
         event.$entry = entry;
         event.$data = bytes;
         this.dispatchEvent(event);
         this._unzipWorking = false;
         ++this._unzipNum;
         C.debug("unzipping " + entry.getFilename() + "..." + this._unzipNum);
         this.execUnzip();
      }
      
      private function execUnzip(delay:int = 10) : void
      {
         var entry:ZipEntry = null;
         if(this._unzipStack.length > 0)
         {
            this._unzipWorking = true;
            entry = this._unzipStack.shift();
            setTimeout(this.unzipAsyncTimeout,delay,entry);
         }
      }
      
      private function ioError(e:Event) : void
      {
         C.fatal("ioError " + e);
         this.dispatchEvent(e);
      }
      
      protected function parseCentralHeaders() : void
      {
         var sig:int = 0;
         var header:ZipHeader = null;
         var entry:ZipEntry = null;
         var offset:int = this._endRecord.getOffset();
         var size:int = this._endRecord.getSize();
         this._stream.position = offset;
         var bytes:ByteArray = new ByteArray();
         bytes.endian = Endian.LITTLE_ENDIAN;
         this._stream.readBytes(bytes,0,size);
         bytes.position = 0;
         var _tmpBytes:ByteArray = new ByteArray();
         _tmpBytes.endian = Endian.LITTLE_ENDIAN;
         while(bytes.bytesAvailable)
         {
            sig = bytes.readInt();
            header = new ZipHeader(sig);
            header.read(bytes,_tmpBytes);
            header.dumpLogInfo();
            entry = new ZipEntry(this._stream);
            entry.setHeader(header);
            this._entries.push(entry);
         }
         C.debug("parse central header end " + this._entries.length);
      }
      
      private function readStream(e:Event) : void
      {
         var sig:int = 0;
         var header:ZipHeader = null;
         var contentByteArray:ByteArray = null;
         var entry:ZipEntry = null;
         var centralHeader:ZipHeader = null;
         var bytes:ByteArray = new ByteArray();
         this._stream.endian = Endian.LITTLE_ENDIAN;
         bytes.endian = Endian.LITTLE_ENDIAN;
         while(this._stream.bytesAvailable)
         {
            sig = this._stream.readInt();
            if(sig == ZipHeader.HEADER_LOCAL_FILE)
            {
               header = new ZipHeader(sig);
               header.read(this._stream,bytes);
               contentByteArray = new ByteArray();
               if(header.getCompressSize() > 0)
               {
                  this._stream.readBytes(contentByteArray,0,header.getCompressSize());
               }
               entry = new ZipEntry(this._stream);
               entry.setHeader(header);
            }
            else
            {
               if(sig != ZipHeader.HEADER_CENTRAL_DIR)
               {
                  break;
               }
               C.debug("CENTRAL DIR.." + sig.toString(16));
               centralHeader = new ZipHeader(sig);
               centralHeader.read(this._stream,bytes);
            }
         }
      }
   }
}
