package com.coltware.airxzip
{
   import flash.events.Event;
   import flash.utils.ByteArray;
   
   use namespace zip_internal;
   
   public class ZipEvent extends Event
   {
      
      public static var ZIP_LOAD_DATA:String = "zipLoadData";
      
      public static var ZIP_DATA_UNCOMPRESS:String = "zipDataUncompress";
      
      public static var ZIP_DATA_COMPRESS:String = "zipDataCompress";
      
      public static var ZIP_FILE_CREATED:String = "zipFileCreated";
       
      
      zip_internal var $entry:ZipEntry;
      
      zip_internal var $data:ByteArray;
      
      zip_internal var $method:String;
      
      public function ZipEvent(type:String)
      {
         super(type);
      }
      
      public function get entry() : ZipEntry
      {
         return this.$entry;
      }
      
      public function get data() : ByteArray
      {
         if(this.$method)
         {
            this.$data.uncompress(this.$method);
         }
         return this.$data;
      }
   }
}
