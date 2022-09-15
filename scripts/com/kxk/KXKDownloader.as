package com.kxk
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   import flash.utils.ByteArray;
   
   public class KXKDownloader extends EventDispatcher
   {
       
      
      private var _fileName:String;
      
      private var _url:String;
      
      private var _urlStream:URLStream;
      
      private var _file:File;
      
      private var _fileStream:FileStream;
      
      private var _percent:int;
      
      private var _fileSize:Number;
      
      private var _downloadedSize:Number;
      
      public var progress:Number = 0;
      
      public function KXKDownloader(_url:String, _fileName:String, _fileSize:Number = -1)
      {
         super();
         this._url = _url;
         this._fileName = _fileName;
         this._fileSize = _fileSize;
         this._downloadedSize = 0;
      }
      
      public function startDownload() : void
      {
         var _urlRequest:URLRequest = new URLRequest(this._url);
         _urlRequest.useCache = false;
         this._file = new File(this._fileName);
         this._urlStream = new URLStream();
         this._fileStream = new FileStream();
         this._urlStream.addEventListener(Event.COMPLETE,this.urlstream_complete);
         this._urlStream.addEventListener(ProgressEvent.PROGRESS,this.urlstream_progress);
         this._urlStream.addEventListener(IOErrorEvent.IO_ERROR,this.urlstream_error);
         this._urlStream.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.urlstream_error,false,int.MIN_VALUE,true);
         Network.addEventListener(Event.CHANGE,this.urlstream_error);
         this._fileStream.open(this._file,FileMode.WRITE);
         this._urlStream.load(_urlRequest);
      }
      
      private function urlstream_error(e:* = null) : void
      {
         this.dispose();
         this.dispatchEvent(new IOErrorEvent(IOErrorEvent.IO_ERROR));
      }
      
      private function urlstream_progress(e:ProgressEvent = null) : void
      {
         var _byte:ByteArray = new ByteArray();
         this._urlStream.readBytes(_byte,0,this._urlStream.bytesAvailable);
         this._fileStream.writeBytes(_byte,0,_byte.length);
         this._downloadedSize += _byte.length;
         if(e)
         {
            this._percent = Math.round(e.bytesLoaded / e.bytesTotal * 100);
            this.progress = this._percent;
            this.dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      private function urlstream_complete(e:Event = null) : void
      {
         this.urlstream_progress();
         this.dispose();
         trace(this._fileSize,this._downloadedSize);
         if(this._fileSize == -1)
         {
            this.dispatchEvent(new Event(Event.COMPLETE));
            return;
         }
         if(this._fileSize == this._downloadedSize)
         {
            this.dispatchEvent(new Event(Event.COMPLETE));
         }
         else
         {
            this.urlstream_error();
         }
      }
      
      public function dispose() : void
      {
         Network.removeEventListener(Event.CHANGE,this.urlstream_error);
         if(this._urlStream)
         {
            this._urlStream.removeEventListener(Event.COMPLETE,this.urlstream_complete);
            this._urlStream.removeEventListener(ProgressEvent.PROGRESS,this.urlstream_progress);
            this._urlStream.removeEventListener(IOErrorEvent.IO_ERROR,this.urlstream_error);
            this._urlStream.close();
            this._urlStream.stop();
            this._urlStream = null;
         }
         if(this._fileStream)
         {
            this._fileStream.close();
            this._fileStream = null;
         }
         this._file = null;
      }
   }
}
