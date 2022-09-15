package com.reyco1.multiuser.core
{
   import com.reyco1.multiuser.debug.Logger;
   import com.reyco1.multiuser.events.FileShareEvent;
   import com.reyco1.multiuser.events.P2PDispatcher;
   import com.reyco1.multiuser.events.UserStatusEvent;
   import com.reyco1.multiuser.filesharing.P2PFileSharer;
   import com.reyco1.multiuser.group.ChatGroup;
   import flash.events.Event;
   import flash.events.NetStatusEvent;
   import flash.net.GroupSpecifier;
   import flash.net.NetConnection;
   
   public class Session
   {
       
      
      public var connection:NetConnection;
      
      public var group:ChatGroup;
      
      public var userName:String;
      
      public var userDetails:Object;
      
      public var fileSharer:P2PFileSharer;
      
      private var serverAddress:String;
      
      private var groupName:String;
      
      private var groupspec:GroupSpecifier;
      
      private var isWifiOnly:Boolean;
      
      public function Session(serverAddress:String, groupName:String)
      {
         super();
         this.serverAddress = serverAddress;
         this.groupName = groupName;
         this.groupspec = new GroupSpecifier(groupName);
         this.groupspec.objectReplicationEnabled = true;
         this.groupspec.multicastEnabled = true;
         this.groupspec.postingEnabled = true;
         this.groupspec.serverChannelEnabled = true;
         this.groupspec.routingEnabled = true;
         Logger.log("group specs with auth",this);
      }
      
      public function connect(userName:String, userDetails:Object = null) : void
      {
         Logger.log("connecting...",this);
         this.userName = userName;
         this.userDetails = userDetails;
         this.connection = new NetConnection();
         this.connection.addEventListener(NetStatusEvent.NET_STATUS,this.handleNetStatusEvent);
         this.connection.connect(this.serverAddress);
      }
      
      protected function handleNetStatusEvent(event:NetStatusEvent) : void
      {
         Logger.log(event.info.code,this,true);
         switch(event.info.code)
         {
            case "NetConnection.Connect.Success":
               this.joinGroup();
               break;
            case "NetGroup.Connect.Failed":
            case "NetConnection.Connect.Rejected":
            case "NetConnection.Connect.AppShutdown":
            case "NetConnection.Connect.InvalidApp":
            case "NetConnection.Connect.Closed":
               P2PDispatcher.dispatchEvent(new UserStatusEvent(UserStatusEvent.DISCONNECTED));
         }
      }
      
      private function joinGroup() : void
      {
         Logger.log("connected. joining group...",this);
         this.group = new ChatGroup(this.connection,this.groupspec.groupspecWithAuthorizations(),this.userName,this.userDetails);
         this.group.addEventListener(NetStatusEvent.NET_STATUS,this.handleNetStatusEvent);
         this.fileSharer = new P2PFileSharer(this.group);
         this.fileSharer.addEventListener(Event.COMPLETE,this.handleFileTransferReceived);
      }
      
      protected function handleFileTransferReceived(event:Event) : void
      {
         P2PDispatcher.dispatchEvent(new FileShareEvent(FileShareEvent.RECIEVE,this.fileSharer.p2pSharedObject));
      }
      
      public function close() : void
      {
         Logger.log("closing session...",this);
         this.connection.close();
         this.connection = null;
         if(this.group)
         {
            this.group.removeEventListener(NetStatusEvent.NET_STATUS,this.handleNetStatusEvent);
            this.group.close();
         }
      }
   }
}
