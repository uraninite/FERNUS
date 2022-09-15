package com.reyco1.multiuser.channel
{
   import flash.media.SoundTransform;
   import flash.media.Video;
   import flash.net.NetConnection;
   import flash.net.NetStream;
   
   public class RealtimeChannel
   {
       
      
      public var peerID:String;
      
      private var receiveStream:NetStream;
      
      private var myPeerID:String;
      
      private var client:Object;
      
      public function RealtimeChannel(connection:NetConnection, peerID:String, myPeerID:String, client:Object)
      {
         super();
         this.peerID = peerID;
         this.myPeerID = myPeerID;
         this.client = client;
         this.receiveStream = new NetStream(connection,peerID);
         this.receiveStream.client = client;
         this.receiveStream.play("media");
      }
      
      public function close() : void
      {
         this.receiveStream.close();
      }
      
      public function receiveAudio(value:Boolean) : void
      {
         this.receiveStream.receiveAudio(value);
      }
      
      public function setVolume(value:Number) : void
      {
         var volume:Number = NaN;
         var st:SoundTransform = null;
         if(this.receiveStream)
         {
            volume = value;
            st = new SoundTransform(volume);
            this.receiveStream.soundTransform = st;
         }
      }
      
      public function receiveVideo(value:Boolean, videoObject:Video = null) : void
      {
         this.receiveStream.receiveVideo(value);
         if(videoObject)
         {
            videoObject.attachNetStream(this.receiveStream);
         }
      }
   }
}
