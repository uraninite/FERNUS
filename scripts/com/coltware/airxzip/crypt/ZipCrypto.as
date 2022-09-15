package com.coltware.airxzip.crypt
{
   import com.coltware.airxzip.ZipCRC32;
   import com.coltware.airxzip.ZipEntry;
   import com.coltware.airxzip.ZipError;
   import com.coltware.airxzip.ZipHeader;
   import com.coltware.airxzip.zip_internal;
   import flash.utils.ByteArray;
   
   use namespace zip_internal;
   
   public class ZipCrypto implements ICrypto
   {
      
      private static var CRYPTHEADLEN:int = 12;
      
      private static var S_KEY1:int = 305419896;
      
      private static var S_KEY2:int = 591751049;
      
      private static var S_KEY3:int = 878082192;
       
      
      private var _key:Array;
      
      private var _password:ByteArray;
      
      private var _header:ZipHeader;
      
      private var _outBytes:ByteArray;
      
      public function ZipCrypto()
      {
         super();
      }
      
      public function initEncrypt(password:ByteArray, header:ZipHeader) : void
      {
         var crc32:uint = header._crc32;
         this._outBytes = new ByteArray();
         this._initEncrypt(password,crc32);
         header._compressSize += CRYPTHEADLEN;
      }
      
      private function _initEncrypt(password:ByteArray, crc32:uint) : void
      {
         var d:uint = 0;
         var n:uint = 0;
         crc32 >>= 24;
         var ret:ByteArray = this._outBytes;
         this._key = new Array(3);
         this._key[0] = S_KEY1;
         this._key[1] = S_KEY2;
         this._key[2] = S_KEY3;
         password.position = 0;
         while(password.bytesAvailable > 0)
         {
            n = password.readUnsignedByte();
            this.updateKeys(n);
         }
         for(var i:int = 0; i < CRYPTHEADLEN; i++)
         {
            if(i == CRYPTHEADLEN - 1)
            {
               d = uint(crc32 & 255);
            }
            else
            {
               d = uint(crc32 >> 32 & 255);
            }
            d = this.zencode(d);
            ret.writeByte(d);
         }
      }
      
      public function encrypt(data:ByteArray) : ByteArray
      {
         var n:uint = 0;
         data.position = 0;
         while(data.bytesAvailable)
         {
            n = data.readUnsignedByte();
            this._outBytes.writeByte(this.zencode(n));
         }
         this._outBytes.position = 0;
         return this._outBytes;
      }
      
      public function checkDecrypt(entry:ZipEntry) : Boolean
      {
         return true;
      }
      
      public function initDecrypt(password:ByteArray, header:ZipHeader) : void
      {
         this._password = password;
         this._header = header;
      }
      
      public function decrypt(data:ByteArray) : ByteArray
      {
         var check1:uint = this._header._crc32 >>> 24;
         var cryptoHeader:ByteArray = new ByteArray();
         data.readBytes(cryptoHeader,0,CRYPTHEADLEN);
         var check2:uint = this._initDecrypt(this._password,cryptoHeader);
         check2 &= 65535;
         if(check1 == check2)
         {
            return this._decrypt(data);
         }
         throw new ZipError("password is not match");
      }
      
      private function _initDecrypt(password:ByteArray, cryptHeader:ByteArray) : uint
      {
         var n:uint = 0;
         var b:uint = 0;
         var ret:ByteArray = new ByteArray();
         this._key = new Array(3);
         this._key[0] = S_KEY1;
         this._key[1] = S_KEY2;
         this._key[2] = S_KEY3;
         password.position = 0;
         while(password.bytesAvailable > 0)
         {
            n = password.readUnsignedByte();
            this.updateKeys(n);
         }
         cryptHeader.position = 0;
         for(var i:int = 0; i < CRYPTHEADLEN; i++)
         {
            b = cryptHeader.readUnsignedByte();
            b = this.zdecode(b);
         }
         return b;
      }
      
      private function _decrypt(data:ByteArray) : ByteArray
      {
         var n:uint = 0;
         var out:ByteArray = new ByteArray();
         while(data.bytesAvailable > 0)
         {
            n = data.readUnsignedByte();
            n = this.zdecode(n);
            out.writeByte(n);
         }
         out.position = 0;
         return out;
      }
      
      protected function zdecode(n:uint) : uint
      {
         var t:uint = n;
         var d:uint = this.decryptByte();
         n ^= d;
         this.updateKeys(n);
         return n;
      }
      
      protected function zencode(n:uint) : uint
      {
         var t:uint = this.decryptByte();
         this.updateKeys(n);
         return t ^ n;
      }
      
      protected function decryptByte() : int
      {
         var temp:uint = this._key[2] & 65535 | 2;
         return temp * (temp ^ 1) >> 8 & 255;
      }
      
      protected function updateKeys(uchar:uint) : void
      {
         this._key[0] = ZipCRC32.getCRC32(this._key[0],uchar);
         this._key[1] += this._key[0] & 255;
         var k2:int = this._key[1];
         var b1:int = 134775000;
         var b2:int = 813;
         var t:int = uint(k2 * b1) + uint(k2 * b2) + 1;
         this._key[1] = t;
         var k3:int = this._key[1];
         var tmp:* = this._key[1] >> 24;
         this._key[2] = int(ZipCRC32.getCRC32(this._key[2],tmp));
      }
   }
}
