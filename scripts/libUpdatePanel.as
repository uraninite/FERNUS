package
{
   import com.kxk.FileManager;
   import com.kxk.KXKDownloader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.text.TextField;
   
   public dynamic class libUpdatePanel extends MovieClip
   {
       
      
      public var ani:MovieClip;
      
      public var txt:TextField;
      
      public var onError:Function;
      
      public var onComplete:Function;
      
      public var _kxk:KXKDownloader;
      
      public var _fm:FileManager;
      
      public var _mainFile:String;
      
      public var _mainFolder:String;
      
      public var _filename:String;
      
      public function libUpdatePanel()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function start(_url:String, _mainFolder:String, _mainFile:String) : *
      {
         this._mainFolder = _mainFolder;
         this._mainFile = _mainFile;
         this._filename = _url.split("/")[_url.split("/").length - 1];
         this._kxk = new KXKDownloader(_url,_mainFolder + "2-" + this._filename);
         this._kxk.addEventListener(IOErrorEvent.IO_ERROR,this.onErrorHandler);
         this._kxk.addEventListener(Event.COMPLETE,this.onCompleteHandler);
         this._kxk.addEventListener(Event.CHANGE,this.onProgressHandler);
         this._kxk.startDownload();
      }
      
      public function onProgressHandler(e:* = null) : *
      {
         this.txt.text = "İndiriliyor - %" + String(Math.floor(this._kxk.progress));
      }
      
      public function onErrorHandler(e:* = null) : *
      {
         if(this.onError != null)
         {
            this.onError();
         }
         this.disposeData();
      }
      
      public function onCompleteHandler(e:* = null) : *
      {
         this.txt.text = "Dosya kopyalanıyor";
         FileManager.moveToTrashAsync(this._mainFolder + this._mainFile,function():*
         {
            FileManager.moveFileAsync(_mainFolder + "2-" + _filename,_mainFolder + _filename,function():*
            {
               if(onComplete != null)
               {
                  onComplete();
               }
            });
         });
      }
      
      public function disposeData() : *
      {
         if(this._kxk)
         {
            this._kxk.dispose();
            this._kxk = null;
         }
         if(this._mainFolder && this._filename)
         {
            FileManager.deleteFile(this._mainFolder + "2-" + this._filename);
         }
      }
      
      function frame1() : *
      {
      }
   }
}
