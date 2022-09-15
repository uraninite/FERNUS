package com.reyco1.multiuser
{
   import com.reyco1.multiuser.channel.ChannelManager;
   import com.reyco1.multiuser.core.Session;
   import com.reyco1.multiuser.data.UserObject;
   import com.reyco1.multiuser.debug.Logger;
   import com.reyco1.multiuser.events.ChatMessageEvent;
   import com.reyco1.multiuser.events.FileShareEvent;
   import com.reyco1.multiuser.events.P2PDispatcher;
   import com.reyco1.multiuser.events.UserStatusEvent;
   
   public class MultiUserSession
   {
       
      
      public var session:Session;
      
      public var channelManager:ChannelManager;
      
      public var onObjectRecieve:Function;
      
      public var onUserAdded:Function;
      
      public var onUserRemoved:Function;
      
      public var onUserIdle:Function;
      
      public var onUserExpired:Function;
      
      public var onConnect:Function;
      
      public var onChatMessage:Function;
      
      public var running:Boolean;
      
      public var onFileReceived:Function;
      
      public var onFileReady:Function;
      
      private var serverAddress:String;
      
      private var groupName:String;
      
      public function MultiUserSession(serverAddress:String, groupName:String = "defaultGroup")
      {
         super();
         this.serverAddress = serverAddress;
         this.groupName = groupName;
         this.running = false;
      }
      
      public function connect(userName:String, userDetails:Object = null) : void
      {
         P2PDispatcher.addEventListener(ChatMessageEvent.RECIEVE,this.handleChatMessage);
         P2PDispatcher.addEventListener(UserStatusEvent.CONNECTED,this.handleConnect);
         P2PDispatcher.addEventListener(UserStatusEvent.DISCONNECTED,this.handleClose);
         P2PDispatcher.addEventListener(UserStatusEvent.USER_ADDED,this.handleUserAdded);
         P2PDispatcher.addEventListener(UserStatusEvent.USER_REMOVED,this.handleUserRemoved);
         P2PDispatcher.addEventListener(UserStatusEvent.USER_EXPIRED,this.handleUserExpired);
         P2PDispatcher.addEventListener(UserStatusEvent.USER_IDLE,this.handleUserIdle);
         P2PDispatcher.addEventListener(FileShareEvent.RECIEVE,this.handleFileReceived);
         P2PDispatcher.addEventListener(FileShareEvent.FILE_TO_SHARE_READY,this.handleFileReadyToShare);
         Logger.log("global listeners added",this);
         this.session = new Session(this.serverAddress,this.groupName);
         this.session.connect(userName,userDetails);
      }
      
      public function sendObject(object:*) : void
      {
         this.channelManager.sendStream.send("receiveObject",this.myUser.id,object);
      }
      
      public function browseForFileToShare(autoShare:Boolean = true) : void
      {
         this.session.fileSharer.browseForFile(autoShare);
      }
      
      public function receiveObject(peerID:String, object:Object) : void
      {
         if(this.onObjectRecieve != null)
         {
            this.onObjectRecieve.call(this,peerID,object);
         }
      }
      
      public function sendChatMessage(message:String, targetUser:UserObject = null) : void
      {
         this.session.group.sendMessage(message,targetUser);
      }
      
      protected function handleChatMessage(event:ChatMessageEvent) : void
      {
         Logger.log("chat message recieved",this);
         if(this.onChatMessage != null)
         {
            this.onChatMessage(event.message);
         }
      }
      
      public function close() : void
      {
         P2PDispatcher.removeEventListener(ChatMessageEvent.RECIEVE,this.handleChatMessage);
         P2PDispatcher.removeEventListener(UserStatusEvent.CONNECTED,this.handleConnect);
         P2PDispatcher.removeEventListener(UserStatusEvent.DISCONNECTED,this.handleClose);
         P2PDispatcher.removeEventListener(UserStatusEvent.USER_ADDED,this.handleUserAdded);
         P2PDispatcher.removeEventListener(UserStatusEvent.USER_REMOVED,this.handleUserRemoved);
         P2PDispatcher.removeEventListener(UserStatusEvent.USER_EXPIRED,this.handleUserExpired);
         P2PDispatcher.removeEventListener(UserStatusEvent.USER_IDLE,this.handleUserIdle);
         Logger.log("global listeners removed",this);
         this.session.close();
      }
      
      protected function handleConnect(event:UserStatusEvent) : void
      {
         Logger.log("initializing ChannelManager",this);
         this.running = true;
         this.channelManager = new ChannelManager(this.session);
         if(this.onConnect != null)
         {
            this.onConnect(event.user);
         }
      }
      
      protected function handleClose(event:UserStatusEvent) : void
      {
         this.running = false;
      }
      
      protected function handleUserAdded(event:UserStatusEvent) : void
      {
         Logger.log("user added: " + event.user.name,this);
         if(event.user.id != this.myUser.id)
         {
            this.channelManager.addChannel(event.user.id,this);
            if(this.onUserAdded != null)
            {
               this.onUserAdded(event.user);
            }
         }
      }
      
      protected function handleUserRemoved(event:UserStatusEvent) : void
      {
         Logger.log("user removed: " + event.user.name,this);
         if(event.user.id != this.myUser.id)
         {
            this.channelManager.removeChannel(event.user.id);
            if(this.onUserRemoved != null)
            {
               this.onUserRemoved(event.user);
            }
         }
      }
      
      protected function handleUserExpired(event:UserStatusEvent) : void
      {
         Logger.log("user expired: " + event.user.name,this);
         if(this.onUserExpired != null)
         {
            this.onUserExpired(event.user);
         }
      }
      
      protected function handleUserIdle(event:UserStatusEvent) : void
      {
         Logger.log("user idle: " + event.user.name,this);
         if(this.onUserIdle != null)
         {
            this.onUserIdle(event.user);
         }
      }
      
      private function handleFileReceived(event:FileShareEvent) : void
      {
         Logger.log("File received.",this);
         if(this.onFileReceived != null)
         {
            this.onFileReceived(event.fileObject);
         }
      }
      
      private function handleFileReadyToShare(event:FileShareEvent) : void
      {
         Logger.log("File received.",this);
         if(this.onFileReady != null)
         {
            this.onFileReady(event.file);
         }
      }
      
      public function get myUser() : Object
      {
         return this.session != null ? this.session.group.myUser : {};
      }
      
      public function get userCount() : int
      {
         return this.session != null ? int(this.session.group.userCount) : 0;
      }
      
      public function get userArray() : Array
      {
         return this.session != null ? this.session.group.userArray : [];
      }
      
      public function get userList() : Object
      {
         return this.session != null ? this.session.group.userList : {};
      }
   }
}
