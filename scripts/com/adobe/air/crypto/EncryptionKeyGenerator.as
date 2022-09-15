package com.adobe.air.crypto
{
   import com.adobe.crypto.SHA256;
   import flash.data.EncryptedLocalStore;
   import flash.utils.ByteArray;
   
   public class EncryptionKeyGenerator
   {
      
      public static const ENCRYPTED_DB_PASSWORD_ERROR_ID:uint = 3138;
      
      private static const STRONG_PASSWORD_PATTERN:RegExp = /(?=^.{8,32}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/;
      
      private static const SALT_ELS_KEY:String = "com.adobe.air.crypto::EncryptedDBSalt$$$";
       
      
      public function EncryptionKeyGenerator()
      {
         super();
      }
      
      public function validateStrongPassword(password:String) : Boolean
      {
         if(password == null || password.length <= 0)
         {
            return false;
         }
         return STRONG_PASSWORD_PATTERN.test(password);
      }
      
      public function getEncryptionKey(password:String, overrideSaltELSKey:String = null) : ByteArray
      {
         var saltKey:String = null;
         if(!this.validateStrongPassword(password))
         {
            throw new ArgumentError("The password must be a strong password. It must be 8-32 characters long. It must contain at least one uppercase letter, at least one lowercase letter, and at least one number or symbol.");
         }
         if(overrideSaltELSKey != null && overrideSaltELSKey.length <= 0)
         {
            throw new ArgumentError("If an overrideSaltELSKey parameter value is specified, it can\'t be an empty String.");
         }
         var concatenatedPassword:String = this.concatenatePassword(password);
         if(overrideSaltELSKey == null)
         {
            saltKey = SALT_ELS_KEY;
         }
         else
         {
            saltKey = overrideSaltELSKey;
         }
         var salt:ByteArray = EncryptedLocalStore.getItem(saltKey);
         if(salt == null)
         {
            salt = this.makeSalt();
            EncryptedLocalStore.setItem(saltKey,salt);
         }
         var unhashedKey:ByteArray = this.xorBytes(concatenatedPassword,salt);
         var hashedKey:String = SHA256.hashBytes(unhashedKey);
         return this.generateEncryptionKey(hashedKey);
      }
      
      private function concatenatePassword(pwd:String) : String
      {
         var len:int = pwd.length;
         var targetLength:int = 32;
         if(len == targetLength)
         {
            return pwd;
         }
         var repetitions:int = Math.floor(targetLength / len);
         var excess:int = targetLength % len;
         var result:String = "";
         for(var i:uint = 0; i < repetitions; i++)
         {
            result += pwd;
         }
         return result + pwd.substr(0,excess);
      }
      
      private function makeSalt() : ByteArray
      {
         var result:ByteArray = new ByteArray();
         for(var i:uint = 0; i < 8; i++)
         {
            result.writeUnsignedInt(Math.round(Math.random() * uint.MAX_VALUE));
         }
         return result;
      }
      
      private function xorBytes(passwordString:String, salt:ByteArray) : ByteArray
      {
         var o1:uint = 0;
         var o2:uint = 0;
         var xor:uint = 0;
         var result:ByteArray = new ByteArray();
         for(var i:uint = 0; i < 32; i += 4)
         {
            o1 = passwordString.charCodeAt(i) << 24;
            o1 += passwordString.charCodeAt(i + 1) << 16;
            o1 += passwordString.charCodeAt(i + 2) << 8;
            o1 += passwordString.charCodeAt(i + 3);
            salt.position = i;
            o2 = salt.readUnsignedInt();
            xor = o1 ^ o2;
            result.writeUnsignedInt(xor);
         }
         return result;
      }
      
      private function generateEncryptionKey(hash:String) : ByteArray
      {
         var position:uint = 0;
         var hex:String = null;
         var byte:int = 0;
         var result:ByteArray = new ByteArray();
         for(var i:uint = 0; i < 32; i += 2)
         {
            position = i + 17;
            hex = hash.substr(position,2);
            byte = parseInt(hex,16);
            result.writeByte(byte);
         }
         return result;
      }
   }
}
