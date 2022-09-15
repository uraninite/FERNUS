package com.reyco1.multiuser.group
{
   import com.reyco1.multiuser.data.MessageObject;
   import com.reyco1.multiuser.data.UserObject;
   import com.reyco1.multiuser.debug.Logger;
   import com.reyco1.multiuser.events.ChatMessageEvent;
   import com.reyco1.multiuser.events.P2PDispatcher;
   import flash.events.NetStatusEvent;
   import flash.net.NetConnection;
   
   public class ChatGroup extends UserGroup
   {
       
      
      public function ChatGroup(connection:NetConnection, groupspec:String, userName:String, userDetails:Object)
      {
         super(connection,groupspec,userName,userDetails);
      }
      
      override protected function netStatusHandler(event:NetStatusEvent) : void
      {
         super.netStatusHandler(event);
         switch(event.info.code)
         {
            case "NetGroup.Posting.Notify":
               if(event.info.message.type == "chat")
               {
                  this.receiveMessage(event.info.message);
               }
               break;
            case "NetGroup.SendTo.Notify":
               if(event.info.fromLocal)
               {
                  if(event.info.message.type == "chat")
                  {
                     this.receiveMessage(event.info.message);
                  }
               }
               else
               {
                  sendToNearest(event.info.message,event.info.message.destination);
               }
         }
      }
      
      public function sendMessage(messageStr:String, targetUser:UserObject = null) : void
      {
         var message:MessageObject = null;
         Logger.log("sending message",this);
         message = new MessageObject();
         message.type = "chat";
         message.sender = convertPeerIDToGroupAddress(myUser.id);
         message.user = myUser.name;
         message.text = messageStr;
         if(targetUser)
         {
            message.destination = convertPeerIDToGroupAddress(targetUser.id);
            sendToNearest(message,message.destination);
         }
         else
         {
            post(message);
         }
         P2PDispatcher.dispatchEvent(new ChatMessageEvent(ChatMessageEvent.RECIEVE,message));
      }
      
      protected function receiveMessage(msg:Object) : void
      {
         Logger.log("message recieved",this);
         var message:MessageObject = MessageObject.make(msg);
         if(message.destination != null)
         {
            message.pm = true;
            P2PDispatcher.dispatchEvent(new ChatMessageEvent(ChatMessageEvent.RECIEVE,message));
         }
         else
         {
            P2PDispatcher.dispatchEvent(new ChatMessageEvent(ChatMessageEvent.RECIEVE,message));
         }
      }
   }
}
