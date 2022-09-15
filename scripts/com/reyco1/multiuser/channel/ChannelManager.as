package com.reyco1.multiuser.channel
{
   import com.reyco1.multiuser.core.Session;
   import flash.events.EventDispatcher;
   import flash.media.Camera;
   import flash.media.Microphone;
   import flash.net.NetStream;
   
   public class ChannelManager extends EventDispatcher
   {
       
      
      public var channels:Vector.<RealtimeChannel>;
      
      private var session:Session;
      
      public var sendStream:NetStream;
      
      public var streamMethod:String;
      
      public var myCamera:Camera;
      
      public var myMic:Microphone;
      
      public function ChannelManager(session:Session, streamMethod:String = "directConnections")
      {
         super();
         this.session = session;
         this.streamMethod = streamMethod;
         this.channels = new Vector.<RealtimeChannel>();
         this.initializeSendStream();
      }
      
      private function initializeSendStream() : void
      {
         this.sendStream = new NetStream(this.session.connection,this.streamMethod);
         this.sendStream.publish("media");
         var sendStreamClient:Object = new Object();
         sendStreamClient.onPeerConnect = function(callerns:NetStream):Boolean
         {
            return true;
         };
         this.sendStream.client = sendStreamClient;
      }
      
      public function sendCamera(snapshotMilliseconds:int = -1) : Camera
      {
         this.myCamera = Camera.getCamera();
         this.sendStream.attachCamera(this.myCamera,snapshotMilliseconds);
         return this.myCamera;
      }
      
      public function stopCamera() : void
      {
         this.sendStream.attachCamera(null);
         this.myCamera = null;
      }
      
      public function sendAudio() : Microphone
      {
         this.myMic = Microphone.getEnhancedMicrophone();
         this.sendStream.attachAudio(this.myMic);
         return this.myMic;
      }
      
      public function stopAudio() : void
      {
         this.sendStream.attachAudio(null);
         this.myMic = null;
      }
      
      public function addChannel(peerID:String, clientObject:Object) : void
      {
         var realtimeChannel:RealtimeChannel = new RealtimeChannel(this.session.connection,peerID,this.session.group.myUser.id,clientObject);
         this.channels.push(realtimeChannel);
      }
      
      public function getChannelByPeerID(peerID:String) : RealtimeChannel
      {
         var channel:RealtimeChannel = null;
         for(var a:int = 0; a < this.channels.length; a++)
         {
            if(this.channels[a].peerID == peerID)
            {
               channel = this.channels[a];
               break;
            }
         }
         return channel;
      }
      
      public function removeChannel(peerID:String) : void
      {
         for(var i:uint = 0; i < this.channels.length; i++)
         {
            if(this.channels[i].peerID == peerID)
            {
               this.channels[i].close();
               this.channels.splice(i,1);
               break;
            }
         }
      }
   }
}
