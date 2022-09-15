package com.reyco1.multiuser.filesharing
{
   import com.reyco1.multiuser.debug.Logger;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.FileReference;
   import flash.utils.ByteArray;
   
   public class LocalFileLoader extends EventDispatcher
   {
       
      
      public var file:FileReference;
      
      public var p2pSharedObject:P2PSharedObject;
      
      public function LocalFileLoader()
      {
         super();
      }
      
      public function browseFileSystem() : void
      {
         this.file = new FileReference();
         this.file.addEventListener(Event.SELECT,this.selectHandler);
         this.file.addEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
         this.file.addEventListener(ProgressEvent.PROGRESS,this.progressHandler);
         this.file.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.securityErrorHandler);
         this.file.addEventListener(Event.COMPLETE,this.completeHandler);
         this.file.browse();
      }
      
      protected function selectHandler(event:Event) : void
      {
         this.writeText("fileChosen");
         this.writeText(this.file.name + " | " + this.file.size);
         this.file.load();
      }
      
      protected function ioErrorHandler(event:IOErrorEvent) : void
      {
         this.writeText("ioErrorHandler: " + event);
      }
      
      protected function securityErrorHandler(event:SecurityErrorEvent) : void
      {
         this.writeText("securityError: " + event);
      }
      
      protected function progressHandler(event:ProgressEvent) : void
      {
         var file:FileReference = FileReference(event.target);
         this.writeText("progressHandler: bytesLoaded=" + event.bytesLoaded + "/" + event.bytesTotal);
      }
      
      protected function completeHandler(event:Event) : void
      {
         this.writeText("completeHandler");
         this.p2pSharedObject = new P2PSharedObject();
         this.p2pSharedObject.size = this.file.size;
         this.p2pSharedObject.packetLenght = Math.floor(this.file.size / 64000) + 1;
         this.p2pSharedObject.data = this.file.data;
         this.p2pSharedObject.chunks = new Object();
         this.p2pSharedObject.chunks[0] = this.p2pSharedObject.packetLenght + 1;
         for(var i:int = 1; i < this.p2pSharedObject.packetLenght; i++)
         {
            this.p2pSharedObject.chunks[i] = new ByteArray();
            this.p2pSharedObject.data.readBytes(this.p2pSharedObject.chunks[i],0,64000);
         }
         this.p2pSharedObject.chunks[this.p2pSharedObject.packetLenght] = new ByteArray();
         this.p2pSharedObject.data.readBytes(this.p2pSharedObject.chunks[i],0,this.p2pSharedObject.data.bytesAvailable);
         this.p2pSharedObject.packetLenght += 1;
         this.writeText("----- p2pSharedObject -----");
         this.writeText("packetLenght: " + this.p2pSharedObject.packetLenght);
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      protected function writeText(str:String) : void
      {
         Logger.log(str,this);
      }
   }
}
