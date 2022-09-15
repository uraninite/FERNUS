package z_kitap_kxk_fla
{
   import com.kxk.FileManager;
   import com.kxk.KXKDownloader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.filesystem.File;
   
   public dynamic class Symbol508_212 extends MovieClip
   {
       
      
      public var bg:MovieClip;
      
      public var con:MovieClip;
      
      public var onComplete:Function;
      
      public var onError:Function;
      
      public var onOnline:Function;
      
      public var object;
      
      public var folder;
      
      public var _kxk:KXKDownloader;
      
      public function Symbol508_212()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function setObject(_o:Object) : *
      {
         this.object = _o;
         this.dispose();
         this.con.txtName.text = this.object.title;
         if(this.object.type == "videolar")
         {
            this.con.icon.gotoAndStop(1);
         }
         if(this.object.type == "sesler")
         {
            this.con.icon.gotoAndStop(2);
         }
         if(this.object.type == "swf")
         {
            this.con.icon.gotoAndStop(3);
         }
         if(this.object.type == "dokumanlar")
         {
            this.con.icon.gotoAndStop(4);
         }
         if(this.object.type == "gorseller")
         {
            this.con.icon.gotoAndStop(5);
         }
         if(this.object.type == "baglanti")
         {
            this.con.icon.gotoAndStop(6);
         }
         if(this.object.type == "videolar" || this.object.type == "sesler" || this.object.type == "gorseller" || this.object.type == "swf" || this.object.type == "baglanti")
         {
            this.con.b2.alpha = 1;
            this.con.b2.addEventListener(MouseEvent.CLICK,this.goOnline);
         }
         else
         {
            this.con.b2.alpha = 0.5;
         }
         if(this.object.p == 1)
         {
            if(new File(this.folder + this.object.filename).exists)
            {
               this.con.b0.visible = true;
               this.con.b1.visible = true;
               this.con.b0.addEventListener(MouseEvent.CLICK,this.remove);
               this.con.b1.addEventListener(MouseEvent.CLICK,this.run);
               this.con.b1.text = "Çevrimdışı Aç";
            }
            else if(this.object.type != "baglanti")
            {
               this.con.b1.visible = true;
               this.con.b1.addEventListener(MouseEvent.CLICK,this.start);
               this.con.b1.text = "İndir";
            }
         }
      }
      
      public function remove(e:MouseEvent) : *
      {
         FileManager.deleteFile(this.folder + this.object.filename);
         this.con.b0.visible = false;
         this.con.b0.removeEventListener(MouseEvent.CLICK,this.remove);
         this.con.b1.removeEventListener(MouseEvent.CLICK,this.run);
         this.con.b1.addEventListener(MouseEvent.CLICK,this.start);
         this.con.b1.text = "İndir";
      }
      
      public function run(e:MouseEvent) : *
      {
         if(FileManager.exists(this.folder + this.object.filename))
         {
            if(this.onComplete != null)
            {
               this.onComplete();
            }
         }
         else if(this.onError != null)
         {
            this.onError("İşlem yapılacak dosya bulunamadı.");
         }
      }
      
      public function start(e:MouseEvent = null) : *
      {
         this.con.b1.removeEventListener(MouseEvent.CLICK,this.start);
         this.con.b1.visible = false;
         this.dispose(false);
         this.con.spinner.visible = true;
         this.con.txtPercent.visible = true;
         this._kxk = new KXKDownloader(this.object.dosya,this.folder + this.object.filename,-1);
         this._kxk.addEventListener(IOErrorEvent.IO_ERROR,this.onErrorHandler);
         this._kxk.addEventListener(Event.COMPLETE,this.onCompleteHandler);
         this._kxk.addEventListener(Event.CHANGE,this.onProgressHandler);
         this._kxk.startDownload();
         this.con.b2.alpha = 0.5;
      }
      
      public function goOnline(e:MouseEvent = null) : *
      {
         if(this.onOnline != null)
         {
            this.onOnline(true);
         }
      }
      
      public function dispose(_s:Boolean = true) : *
      {
         if(this._kxk)
         {
            this._kxk.dispose();
            this._kxk = null;
         }
         this.con.b2.removeEventListener(MouseEvent.CLICK,this.goOnline);
         this.con.b0.removeEventListener(MouseEvent.CLICK,this.remove);
         this.con.b1.removeEventListener(MouseEvent.CLICK,this.run);
         this.con.b1.removeEventListener(MouseEvent.CLICK,this.start);
         this.con.txtPercent.text = "% 0";
         this.con.spinner.visible = false;
         this.con.txtPercent.visible = false;
         this.con.b0.visible = false;
         this.con.b1.visible = false;
         this.con.b2.alpha = 0.5;
         if(_s)
         {
            this.con.txtName.text = "";
         }
      }
      
      public function onCompleteHandler(e:* = null) : *
      {
         if(this.onComplete != null)
         {
            this.onComplete();
         }
      }
      
      public function onErrorHandler(e:* = null) : *
      {
         if(this.onError != null)
         {
            this.onError("İndirme sırasında hata oluştu. Tekrar deneyin.");
         }
         FileManager.deleteFile(this.folder + this.object.filename);
      }
      
      public function onProgressHandler(e:* = null) : *
      {
         this.con.txtPercent.text = "% " + String(Math.floor(this._kxk.progress));
      }
      
      function frame1() : *
      {
      }
   }
}
