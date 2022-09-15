package com.reyco1.multiuser.data
{
   public class MessageObject
   {
       
      
      public var type:String = "chat";
      
      public var pm:Boolean = false;
      
      public var sender:String;
      
      public var user:String;
      
      public var text:String;
      
      public var destination:String;
      
      public function MessageObject()
      {
         super();
      }
      
      public static function make(message:Object) : MessageObject
      {
         var property:* = null;
         var msg:MessageObject = new MessageObject();
         for(property in message)
         {
            msg[property] = message[property];
         }
         return msg;
      }
   }
}
