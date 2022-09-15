package com.reyco1.multiuser.filesharing
{
   import com.reyco1.multiuser.debug.Logger;
   import com.reyco1.multiuser.events.FileShareEvent;
   import com.reyco1.multiuser.events.P2PDispatcher;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.NetStatusEvent;
   import flash.net.NetGroup;
   import flash.utils.ByteArray;
   
   public class P2PFileSharer extends EventDispatcher
   {
       
      
      private var netGroup:NetGroup;
      
      private var autoShare:Boolean;
      
      public var localFileLoader:LocalFileLoader;
      
      public var p2pSharedObject:P2PSharedObject;
      
      public function P2PFileSharer(group:NetGroup)
      {
         super();
         this.netGroup = group;
         this.netGroup.addEventListener(NetStatusEvent.NET_STATUS,this.netStatus);
      }
      
      public function browseForFile(autoShare:Boolean = true) : void
      {
         this.autoShare = autoShare;
         if(!this.localFileLoader)
         {
            this.localFileLoader = new LocalFileLoader();
         }
         this.localFileLoader.addEventListener(Event.COMPLETE,this.handleFileReady);
         this.localFileLoader.browseFileSystem();
      }
      
      protected function handleFileReady(event:Event) : void
      {
         this.localFileLoader.removeEventListener(Event.COMPLETE,this.handleFileReady);
         P2PDispatcher.dispatchEvent(new FileShareEvent(FileShareEvent.FILE_TO_SHARE_READY,this.localFileLoader.p2pSharedObject,this.localFileLoader.file));
         if(this.autoShare)
         {
            this.startSharing(this.localFileLoader.p2pSharedObject);
         }
      }
      
      public function startSharing(p2pSharedObject:P2PSharedObject = null) : void
      {
         if(p2pSharedObject == null)
         {
            p2pSharedObject = this.localFileLoader.p2pSharedObject;
         }
         this.writeText("startSharing - chunks shared: " + p2pSharedObject.packetLenght);
         this.p2pSharedObject = p2pSharedObject;
         this.netGroup.addHaveObjects(0,p2pSharedObject.packetLenght);
      }
      
      public function startReceiving() : void
      {
         this.writeText("Initializing share receive...");
         this.p2pSharedObject = new P2PSharedObject();
         this.p2pSharedObject.chunks = new Object();
         this.receiveObject(0);
      }
      
      protected function netStatus(event:NetStatusEvent) : void
      {
         var i:int = 0;
         switch(event.info.code)
         {
            case "NetGroup.Replication.Fetch.SendNotify":
               this.writeText("index: " + event.info.index);
               break;
            case "NetGroup.Replication.Fetch.Failed":
               this.writeText("index: " + event.info.index);
               break;
            case "NetGroup.Replication.Fetch.Result":
               this.netGroup.addHaveObjects(event.info.index,event.info.index);
               this.p2pSharedObject.chunks[event.info.index] = event.info.object;
               if(event.info.index == 0)
               {
                  this.p2pSharedObject.packetLenght = Number(event.info.object);
                  this.writeText("p2pSharedObject.packetLenght: " + this.p2pSharedObject.packetLenght);
                  this.receiveObject(1);
               }
               else if(event.info.index + 1 < this.p2pSharedObject.packetLenght)
               {
                  this.receiveObject(event.info.index + 1);
               }
               else
               {
                  this.writeText("Receiving DONE");
                  this.writeText("p2pSharedObject.packetLenght: " + this.p2pSharedObject.packetLenght);
                  this.p2pSharedObject.data = new ByteArray();
                  for(i = 1; i < this.p2pSharedObject.packetLenght; i++)
                  {
                     this.p2pSharedObject.data.writeBytes(this.p2pSharedObject.chunks[i]);
                  }
                  this.writeText("p2pSharedObject.data.bytesAvailable: " + this.p2pSharedObject.data.bytesAvailable);
                  this.writeText("p2pSharedObject.data.length: " + this.p2pSharedObject.data.length);
                  dispatchEvent(new Event(Event.COMPLETE));
               }
               break;
            case "NetGroup.Replication.Request":
               this.netGroup.writeRequestedObject(event.info.requestID,this.p2pSharedObject.chunks[event.info.index]);
               this.writeText("ID: " + event.info.requestID + ", index: " + event.info.index);
         }
      }
      
      protected function receiveObject(index:Number) : void
      {
         this.netGroup.addWantObjects(index,index);
         this.p2pSharedObject.actualFetchIndex = index;
      }
      
      protected function writeText(str:String) : void
      {
         Logger.log(str,this);
      }
   }
}
