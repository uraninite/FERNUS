package com.reyco1.multiuser.group
{
   import com.reyco1.multiuser.data.KeepAliveObject;
   import com.reyco1.multiuser.data.ListRoutingObject;
   import com.reyco1.multiuser.data.UserObject;
   import com.reyco1.multiuser.debug.Logger;
   import com.reyco1.multiuser.events.P2PDispatcher;
   import com.reyco1.multiuser.events.UserStatusEvent;
   import flash.events.NetStatusEvent;
   import flash.events.TimerEvent;
   import flash.net.NetConnection;
   import flash.net.NetGroup;
   import flash.net.NetGroupReplicationStrategy;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   
   public class UserGroup extends NetGroup
   {
      
      public static var EXPIRE_TIMEOUT:Number = 20000;
      
      public static var IDEL_TIMEOUT:Number = 10000;
      
      public static var KEEP_ALIVE_INTERVAL:int = 3000;
      
      public static var EXPIRED_INTERVAL:int = 3000;
       
      
      public var myUser:UserObject;
      
      public var userList:Object;
      
      private var connection:NetConnection;
      
      protected var userName:String;
      
      protected var userDetails:Object;
      
      protected var nearID:String;
      
      protected var groupAddress:String;
      
      protected var neighbored:Boolean;
      
      protected var keepAliveTimer:Timer;
      
      protected var expiredTimer:Timer;
      
      public function UserGroup(connection:NetConnection, groupspec:String, userName:String, userDetails:Object)
      {
         super(connection,groupspec);
         this.userList = new Object();
         this.userName = userName;
         this.userDetails = userDetails;
         this.neighbored = false;
         connection.addEventListener(NetStatusEvent.NET_STATUS,this.createOwnUser);
         addEventListener(NetStatusEvent.NET_STATUS,this.netStatusHandler);
         this.connection = connection;
      }
      
      override public function close() : void
      {
         this.connection.removeEventListener(NetStatusEvent.NET_STATUS,this.createOwnUser);
         removeEventListener(NetStatusEvent.NET_STATUS,this.netStatusHandler);
         if(this.keepAliveTimer)
         {
            this.keepAliveTimer.stop();
            this.keepAliveTimer.removeEventListener(TimerEvent.TIMER,this.announceSelf);
         }
         if(this.expiredTimer)
         {
            this.expiredTimer.stop();
            this.expiredTimer.removeEventListener(TimerEvent.TIMER,this.invalidateUserList);
         }
         this.connection = null;
         super.close();
      }
      
      protected function netStatusHandler(event:NetStatusEvent) : void
      {
         var user:* = null;
         var temp:UserObject = null;
         Logger.log(event.info.code,this,true);
         switch(event.info.code)
         {
            case "NetGroup.Connect.Success":
               replicationStrategy = NetGroupReplicationStrategy.LOWEST_FIRST;
               break;
            case "NetGroup.Neighbor.Connect":
               if(!this.neighbored)
               {
                  this.neighbored = true;
                  this.initializeTimers();
                  this.announceSelf();
                  this.requestUserList(event.info.neighbor);
                  setTimeout(this.announceSelf,15000);
               }
               break;
            case "NetGroup.Posting.Notify":
               if(event.info.message.type != null && event.info.message.type == "keepAlive")
               {
                  this.resolveUserKeepAliveRequest(event.info.message);
               }
               break;
            case "NetGroup.Neighbor.Disconnect":
               for(user in this.userList)
               {
                  if(this.userList[user].id == event.info.peerID)
                  {
                     temp = this.userList[user];
                     delete this.userList[user];
                     P2PDispatcher.dispatchEvent(new UserStatusEvent(UserStatusEvent.USER_REMOVED,temp));
                  }
               }
               break;
            case "NetGroup.SendTo.Notify":
               this.processRoutedNotification(event.info);
         }
      }
      
      protected function requestUserList(neighborID:String) : void
      {
         var request:ListRoutingObject = new ListRoutingObject();
         request.destination = neighborID;
         request.sender = this.groupAddress;
         request.type = ListRoutingObject.REQEUST;
         sendToNearest(request,request.destination);
      }
      
      protected function processRoutedNotification(info:Object) : void
      {
         var response:ListRoutingObject = null;
         var users:Object = null;
         var neighborsTime:Number = NaN;
         var neighborsAge:Number = NaN;
         var localAge:Number = NaN;
         var user:* = null;
         var temp:UserObject = null;
         if(info.message.destination == this.groupAddress)
         {
            if(info.message.type == ListRoutingObject.REQEUST)
            {
               response = new ListRoutingObject();
               response.type = ListRoutingObject.RESPONSE;
               response.userList = this.userList;
               response.destination = info.message.sender;
               response.time = getTimer();
               sendToNearest(response,response.destination);
            }
            if(info.message.type == ListRoutingObject.RESPONSE)
            {
               users = info.message.userList;
               neighborsTime = info.message.time;
               neighborsAge = 0;
               localAge = 0;
               for(user in users)
               {
                  neighborsAge = neighborsTime - users[user].stamp + 1000;
                  if(this.userList[user] == null)
                  {
                     temp = new UserObject();
                     temp.stamp = getTimer() - neighborsAge;
                     temp.address = users[user].address;
                     temp.details = users[user].details;
                     temp.id = users[user].id;
                     temp.name = users[user].name;
                     this.userList[user] = temp;
                     P2PDispatcher.dispatchEvent(new UserStatusEvent(UserStatusEvent.USER_ADDED,temp));
                  }
                  else
                  {
                     localAge = getTimer() - this.userList[user].stamp;
                     if(neighborsAge < localAge)
                     {
                        this.userList[user].stamp = getTimer() - neighborsAge;
                     }
                  }
               }
            }
         }
         else if(!info.fromLocal)
         {
            sendToNearest(info.message,info.message.destination);
         }
      }
      
      protected function resolveUserKeepAliveRequest(user:Object) : void
      {
         var temp:UserObject = null;
         user.stamp = getTimer();
         if(this.userList[user.id] == null)
         {
            temp = new UserObject();
            temp.address = user.address;
            temp.details = user.details;
            temp.id = user.id;
            temp.name = user.name;
            temp.stamp = user.stamp;
            this.userList[user.id] = temp;
            P2PDispatcher.dispatchEvent(new UserStatusEvent(UserStatusEvent.USER_ADDED,temp));
         }
         this.userList[user.id].stamp = getTimer();
      }
      
      protected function initializeTimers() : void
      {
         this.keepAliveTimer = new Timer(KEEP_ALIVE_INTERVAL);
         this.keepAliveTimer.addEventListener(TimerEvent.TIMER,this.announceSelf);
         this.keepAliveTimer.start();
         this.expiredTimer = new Timer(EXPIRED_INTERVAL);
         this.expiredTimer.addEventListener(TimerEvent.TIMER,this.invalidateUserList);
         this.expiredTimer.start();
      }
      
      protected function announceSelf(event:TimerEvent = null) : void
      {
         var keepAliveObject:KeepAliveObject = new KeepAliveObject();
         keepAliveObject.serialNumber = getTimer();
         keepAliveObject.name = this.userName;
         keepAliveObject.id = this.nearID;
         keepAliveObject.stamp = this.myUser.stamp;
         keepAliveObject.address = this.myUser.address;
         keepAliveObject.details = this.myUser.details;
         post(keepAliveObject);
         this.myUser.stamp = getTimer();
      }
      
      protected function invalidateUserList(event:TimerEvent = null) : void
      {
         var user:* = null;
         var currentTimeStamp:int = getTimer();
         var userAge:int = 0;
         for(user in this.userList)
         {
            if(this.userList[user].id != this.nearID)
            {
               userAge = currentTimeStamp - this.userList[user].stamp;
               if(userAge > EXPIRE_TIMEOUT)
               {
                  P2PDispatcher.dispatchEvent(new UserStatusEvent(UserStatusEvent.USER_EXPIRED,this.userList[user]));
                  delete this.userList[user];
               }
               else if(userAge > IDEL_TIMEOUT)
               {
                  P2PDispatcher.dispatchEvent(new UserStatusEvent(UserStatusEvent.USER_IDLE,this.userList[user]));
               }
            }
         }
      }
      
      protected function createOwnUser(event:NetStatusEvent) : void
      {
         if(event.info.code == "NetGroup.Connect.Success")
         {
            replicationStrategy = NetGroupReplicationStrategy.LOWEST_FIRST;
            (event.target as NetConnection).removeEventListener(NetStatusEvent.NET_STATUS,this.createOwnUser);
            this.myUser = new UserObject();
            this.myUser.id = this.nearID = (event.target as NetConnection).nearID;
            this.myUser.address = this.groupAddress = convertPeerIDToGroupAddress(this.myUser.id);
            this.myUser.name = this.userName;
            this.myUser.details = this.userDetails;
            this.myUser.stamp = getTimer();
            this.myUser.address = this.groupAddress;
            this.userList[this.nearID] = this.myUser;
            P2PDispatcher.dispatchEvent(new UserStatusEvent(UserStatusEvent.CONNECTED,this.userList[this.nearID]));
         }
      }
      
      public function get userArray() : Array
      {
         var user:* = null;
         var arr:Array = [];
         for(user in this.userList)
         {
            arr.push(this.userList[user]);
         }
         return arr;
      }
      
      public function get userCount() : int
      {
         return this.userArray.length;
      }
   }
}
