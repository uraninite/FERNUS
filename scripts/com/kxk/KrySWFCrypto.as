package com.kxk
{
   import flash.display.MovieClip;
   import flash.utils.ByteArray;
   
   public class KrySWFCrypto extends MovieClip
   {
       
      
      public var onComplete:Function;
      
      private var _bytes:ByteArray;
      
      private var _code:Object;
      
      public function KrySWFCrypto()
      {
         super();
      }
      
      public function decrypte(_fBytes:ByteArray, _fCode:Object) : ByteArray
      {
         this._bytes = _fBytes;
         this._code = _fCode;
         this.separateBytes(this._bytes,10000,11000,this._code.f1,this._code.f2);
         this.separateBytes(this._bytes,5000,5500,this._code.f3,this._code.f1);
         this.separateBytes(this._bytes,850,1500,this._code.f2,this._code.f3);
         this.separateBytes(this._bytes,0,300,this._code.f1,this._code.f2);
         this._bytes[this._code.f3] -= this._code.f3;
         this._bytes[this._code.f2] -= this._code.f2;
         this._bytes[this._code.f1] -= this._code.f1;
         this._bytes[2] -= this._code.f3;
         this._bytes[1] -= this._code.f2;
         this._bytes[0] -= this._code.f1;
         return this._bytes;
      }
      
      private function separateBytes(_b:ByteArray, _sIndex:int, _eIndex:int, _n1:int, _n2:int) : *
      {
         var _i:* = undefined;
         var _tempArray:Array = new Array();
         for(_i = _sIndex; _i < _eIndex + _n1 * 3; _i++)
         {
            _tempArray.push(_b[_i] - _n2);
         }
         _tempArray.reverse();
         var _k:* = 0;
         for(_i = _sIndex; _i < _eIndex + _n1 * 3; _i++)
         {
            _b[_i] = _tempArray[_k] - _n2;
            _k++;
         }
      }
   }
}
