package com.greensock.loading
{
   public class BinaryDataLoader extends DataLoader
   {
      
      private static var _classActivated:Boolean = _activateClass("BinaryDataLoader",BinaryDataLoader,"zip");
       
      
      public function BinaryDataLoader(urlOrRequest:*, vars:Object = null)
      {
         super(urlOrRequest,vars);
         _loader.dataFormat = "binary";
         _type = "BinaryDataLoader";
      }
   }
}
