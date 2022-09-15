package vectorrecord
{
   import com.adobe.images.PNGEncoder;
   import com.bit101.components.ComboBox;
   import com.greensock.TweenMax;
   import com.hurlant.util.Base64;
   import com.kxk.FileManager;
   import deng.fzip.FZip;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.media.Microphone;
   import flash.utils.ByteArray;
   import org.bytearray.micrecorder.MicRecorder;
   import org.bytearray.micrecorder.events.RecordingEvent;
   
   public class VectorVideo extends EventDispatcher
   {
      
      private static var _microphoneIndex:int = -1;
      
      public static var assPath:String;
      
      private static var _uploadList:Array = new Array();
       
      
      private var _mainPanel:MovieClip;
      
      private var _infoPanel:MovieClip;
      
      private var _recordState:int = 0;
      
      private var _micRecorder:MicRecorder;
      
      private var _microphone:Microphone;
      
      private var _object:Object;
      
      private var _processNo:Number = 0;
      
      private var _viewPort:Point;
      
      private var _dbData:Object;
      
      public var actObject:ActObject;
      
      public var status:Boolean = false;
      
      public var time:Number = 0;
      
      public var boardData:Array;
      
      public var showLoading:Function;
      
      public var hideLoading:Function;
      
      public var onConfirm:Function;
      
      public var onStarted:Function;
      
      public var onWarning:Function;
      
      public var onWarningClose:Function;
      
      public var onAsk:Function;
      
      private var _player:VVPlayer;
      
      private var _limitStatus:Boolean;
      
      private var _combobox:ComboBox;
      
      public function VectorVideo(_mc:MovieClip, _mc2:MovieClip, _v:Point)
      {
         super();
         this._mainPanel = _mc;
         this._infoPanel = _mc2;
         this._viewPort = _v;
         this._mainPanel.pnl1.addEventListener(MouseEvent.CLICK,this.openRecordPanel);
      }
      
      public static function dateTime() : String
      {
         var _date:Date = new Date();
         var _dateS:String = doubleDigitFormat(_date.getMonth() + 1) + "_" + doubleDigitFormat(_date.getDate()) + "_" + _date.getFullYear().toString();
         var _timeS:String = doubleDigitFormat(_date.getHours()) + "_" + doubleDigitFormat(_date.getMinutes()) + "_" + doubleDigitFormat(_date.getSeconds());
         return _dateS + "_" + _timeS;
      }
      
      private static function doubleDigitFormat(num:uint) : String
      {
         if(num < 10)
         {
            return "0" + num;
         }
         return num.toString();
      }
      
      public static function reverseByte(_ba:ByteArray) : ByteArray
      {
         var _i:int = 0;
         var _byte:ByteArray = new ByteArray();
         var _l:int = _ba.length;
         var _a:Array = new Array();
         for(_i = 0; _i < _l; _i++)
         {
            _a[_i] = _ba[_i];
         }
         _a.reverse();
         for(_i = 0; _i < _l; _i++)
         {
            _byte[_i] = _a[_i];
         }
         return _byte;
      }
      
      public function showPanel(_b:BitmapData, _p:Point, _s:Number, _f:String, _a:String, _pn:int, _i:int) : *
      {
         this.hidePanel();
         this._object = new Object();
         this._object.bitmapdata = _b;
         this._object.filename = _f;
         this._object.padding = _p;
         this._object.scale = _s;
         this._object.im = _i;
         this._object.page = _pn;
         this._mainPanel.visible = true;
         this._mainPanel.pnl2.bcheck.selected = false;
         this.checkIconStatus();
      }
      
      public function hidePanel() : *
      {
         this._mainPanel.visible = false;
         this._object = null;
         this.boardData = null;
         this._dbData = null;
         this.closeRecordPanel();
      }
      
      public function checkIconStatus() : *
      {
         this._mainPanel.pnl1.icon.gotoAndStop(1);
         if(!this._object)
         {
            return;
         }
         KXKDatabase.existsData(this._object.im,function(e:*):void
         {
            if(e)
            {
               _mainPanel.pnl1.icon.gotoAndStop(2);
            }
         });
      }
      
      private function openRecordPanel(e:MouseEvent = null) : *
      {
         KXKDatabase.existsData(this._object.im,function(e:*):void
         {
            var _a:Array = null;
            if(e)
            {
               _dbData = e[0];
               openInfoPanel();
            }
            else
            {
               _a = getMicrophoneList();
               if(_a.length == 0)
               {
                  _microphoneIndex = -1;
               }
               else if(_microphoneIndex == -1)
               {
                  _microphoneIndex = 0;
               }
               if(_microphoneIndex == -1)
               {
                  onWarning("Herhangi bir mikrofon aygıtı bulunamadı. Kayıt sessiz olarak yapılacaktır.");
               }
               _mainPanel.pnl1.visible = false;
               _mainPanel.pnl2.visible = true;
               _mainPanel.pnl1.removeEventListener(MouseEvent.CLICK,openRecordPanel);
               _mainPanel.pnl2.bclose.addEventListener(MouseEvent.CLICK,closeRecordPanel);
               _mainPanel.pnl2.bmic.addEventListener(MouseEvent.CLICK,openMicPanel);
               _recordState = 0;
               _mainPanel.pnl2.brecord.addEventListener(MouseEvent.CLICK,header_playPause);
            }
         });
      }
      
      public function closeRecordPanel(e:MouseEvent = null) : *
      {
         this._mainPanel.pnl1.visible = true;
         this._mainPanel.pnl2.visible = false;
         this._mainPanel.pnl1.addEventListener(MouseEvent.CLICK,this.openRecordPanel);
         this._mainPanel.pnl2.bclose.removeEventListener(MouseEvent.CLICK,this.closeRecordPanel);
         this._mainPanel.pnl2.bmic.removeEventListener(MouseEvent.CLICK,this.openMicPanel);
         if(this._mainPanel.pnlmic.visible == true)
         {
            this.openMicPanel();
         }
         this._mainPanel.pnl2.brecord.removeEventListener(MouseEvent.CLICK,this.header_playPause);
         this._mainPanel.pnl2.bstop.removeEventListener(MouseEvent.CLICK,this.header_stop);
         this._mainPanel.pnl2.bcheck.mouseChildren = true;
         this._mainPanel.pnl2.bcheck.mouseEnabled = true;
         this.status = false;
         this._microphone = null;
         if(this._micRecorder != null)
         {
            this._micRecorder.stop();
            this._micRecorder.removeEventListener(RecordingEvent.RECORDING,this.onRecording);
            this._micRecorder = null;
         }
         this._mainPanel.pnl2.txt.text = this.convertTime();
         this._mainPanel.pnl2.brecord.gotoAndStop(1);
         this._recordState = 0;
         this.checkIconStatus();
      }
      
      private function header_playPause(e:MouseEvent = null) : void
      {
         if(this._recordState == 0)
         {
            this._limitStatus = false;
            this.time = 0;
            this._processNo = 0;
            this.boardData = new Array();
            if(this._mainPanel.pnlmic.visible == true)
            {
               this.openMicPanel();
            }
            if(this._mainPanel.pnl2.bcheck.selected)
            {
               this._microphone = null;
            }
            else if(_microphoneIndex != -1 && !this._mainPanel.pnl2.bcheck.selected)
            {
               this._microphone = Microphone.getMicrophone(_microphoneIndex);
            }
            else if(_microphoneIndex == -1)
            {
               this._microphone = null;
            }
            this._micRecorder = new MicRecorder(1,this._microphone,50,22,0,1000);
            this._micRecorder.addEventListener(RecordingEvent.RECORDING,this.onRecording);
            this._micRecorder.record();
            this.status = true;
            this._mainPanel.pnl2.bcheck.mouseChildren = false;
            this._mainPanel.pnl2.bcheck.mouseEnabled = false;
            this._mainPanel.pnl2.brecord.gotoAndStop(2);
            this._recordState = 1;
            this._mainPanel.pnl2.bstop.addEventListener(MouseEvent.CLICK,this.header_stop);
            if(this.onStarted != null)
            {
               this.onStarted();
            }
         }
         else if(this._recordState == 1)
         {
            this._recordState = 2;
            this._mainPanel.pnl2.brecord.gotoAndStop(3);
            this._micRecorder.pause();
         }
         else if(this._recordState == 2)
         {
            this._recordState = 1;
            this._mainPanel.pnl2.brecord.gotoAndStop(2);
            this._micRecorder.resume();
         }
      }
      
      private function header_stop(e:MouseEvent = null) : void
      {
         if(this.showLoading != null)
         {
            this.showLoading();
         }
         TweenMax.delayedCall(0.1,this.header_stop2);
      }
      
      private function header_stop2(e:MouseEvent = null) : void
      {
         this._mainPanel.pnl2.bstop.removeEventListener(MouseEvent.CLICK,this.header_stop);
         this._micRecorder.stop();
         var _wavBytes:ByteArray = this._micRecorder.output;
         var _pngBytes:ByteArray = PNGEncoder.encode(this._object.bitmapdata);
         var _xaml:* = this.encryptXML(this.getOutput());
         this.closeRecordPanel();
         var _file:String = this._object.filename + "_" + dateTime();
         var _zip:FZip = new FZip();
         _zip.addFile(_file + ".wav",_wavBytes);
         _zip.addFile(_file + ".png",_pngBytes);
         _zip.addFileFromString(_file + ".xaml",_xaml,"utf-8");
         this._dbData = new Object();
         this._dbData.areaID = this._object.im;
         this._dbData.name = _file + ".zip";
         this._dbData.upload = 0;
         this._dbData.page = this._object.page;
         var _zipBytes:ByteArray = new ByteArray();
         _zip.serialize(_zipBytes);
         _zipBytes = reverseByte(_zipBytes);
         var _fileStream:FileStream = new FileStream();
         _fileStream.addEventListener(Event.CLOSE,this.fileWriteCompleteHandler);
         _fileStream.addEventListener(IOErrorEvent.IO_ERROR,this.fileErrorHandler);
         _fileStream.openAsync(new File(assPath + this._dbData.name),FileMode.WRITE);
         _fileStream.writeBytes(_zipBytes);
         _fileStream.close();
      }
      
      private function fileErrorHandler(e:Event = null) : void
      {
         this._dbData = null;
         if(this.hideLoading != null)
         {
            this.hideLoading();
         }
      }
      
      private function fileWriteCompleteHandler(e:*) : void
      {
         if(this.hideLoading != null)
         {
            this.hideLoading();
         }
         KXKDatabase.insertData(this._dbData,function():void
         {
            dispatchEvent(new KryEvent(KryEvent.VV_ADDED,_dbData));
            openInfoPanel(true);
            checkIconStatus();
         });
      }
      
      public function openInfoPanel(_stat:Boolean = false) : void
      {
         this._mainPanel.stage.addChild(this._infoPanel);
         this._infoPanel.visible = true;
         this._infoPanel.con.close.addEventListener(MouseEvent.CLICK,this.closeInfoPanel);
         this._infoPanel.con.bdelete.addEventListener(MouseEvent.CLICK,this.deleteSavedData);
         this._infoPanel.con.bwatch.addEventListener(MouseEvent.CLICK,this.watchSavedData);
         this._infoPanel.con.bsave.alpha = 0.5;
         if(_stat)
         {
            this._infoPanel.con.close.visible = false;
            this._infoPanel.con.bsave.addEventListener(MouseEvent.CLICK,this.closeInfoPanel);
            this._infoPanel.con.bsave.alpha = 1;
         }
         if(this._dbData.upload == 0)
         {
            this._infoPanel.con.bsend.alpha = 1;
            this._infoPanel.con.bsend.txt.text = "GÖNDER";
            this._infoPanel.con.bsend.addEventListener(MouseEvent.CLICK,this.sendSavedData);
         }
         else if(this._dbData.upload == 1)
         {
            this._infoPanel.con.bsend.alpha = 1;
            this._infoPanel.con.bsend.txt.text = "İPTAL ET";
            this._infoPanel.con.bsend.addEventListener(MouseEvent.CLICK,this.cancelSendSavedData);
         }
         else if(this._dbData.upload == 2)
         {
            this._infoPanel.con.bsend.alpha = 0.5;
            this._infoPanel.con.bsend.txt.text = "GÖNDERİLDİ";
         }
         VVUploader.addEventListener(KryEvent.COMPLETE,this.videoUploaded);
         if(this._limitStatus)
         {
            this._limitStatus = false;
            this.onWarning("Maksimum kayıt süresi 10 dakikadır.");
         }
      }
      
      private function closeInfoPanel(e:MouseEvent = null) : void
      {
         this._infoPanel.con.bsave.alpha = 1;
         this._infoPanel.con.close.visible = true;
         this._infoPanel.con.close.removeEventListener(MouseEvent.CLICK,this.closeInfoPanel);
         this._infoPanel.con.bdelete.removeEventListener(MouseEvent.CLICK,this.deleteSavedData);
         this._infoPanel.con.bwatch.removeEventListener(MouseEvent.CLICK,this.watchSavedData);
         this._infoPanel.con.bsend.removeEventListener(MouseEvent.CLICK,this.sendSavedData);
         this._infoPanel.con.bsend.removeEventListener(MouseEvent.CLICK,this.cancelSendSavedData);
         this._infoPanel.con.bsave.removeEventListener(MouseEvent.CLICK,this.closeInfoPanel);
         this._infoPanel.visible = false;
         VVUploader.removeEventListener(KryEvent.COMPLETE,this.videoUploaded);
      }
      
      private function deleteSavedData(e:MouseEvent = null) : void
      {
         this.onAsk(function():*
         {
            KXKDatabase.deleteData(_dbData,function(e:*):void
            {
               VVUploader.check(_dbData);
               FileManager.deleteFile(assPath + _dbData.name);
               closeInfoPanel();
               checkIconStatus();
               dispatchEvent(new KryEvent(KryEvent.VV_DELETED,_dbData));
            });
         },"Ders kaydını silmek istiyor musunuz?");
      }
      
      public function sendSavedData(e:MouseEvent = null) : void
      {
         if(!User.token)
         {
            this.closeInfoPanel();
            if(this.onConfirm != null)
            {
               this.onConfirm(null,this.sendSavedData);
               return;
            }
         }
         if(this.onWarning != null)
         {
            this.onWarning("Ders kaydı gönderilmek üzere sıraya alındı.");
         }
         this._dbData.upload = 1;
         KXKDatabase.updateData(this._dbData,function():*
         {
            VVUploader.start();
         });
         this._infoPanel.con.bsend.txt.text = "İPTAL ET";
         this._infoPanel.con.bsend.removeEventListener(MouseEvent.CLICK,this.sendSavedData);
         this._infoPanel.con.bsend.addEventListener(MouseEvent.CLICK,this.cancelSendSavedData);
         dispatchEvent(new KryEvent(KryEvent.VV_CHANGED,this._dbData));
      }
      
      private function cancelSendSavedData(e:MouseEvent = null) : void
      {
         if(this.onWarning != null)
         {
            this.onWarning("Ders kaydı gönderme işlemi iptal edildi.");
         }
         this._dbData.upload = 0;
         KXKDatabase.updateData(this._dbData,function():*
         {
            VVUploader.check(_dbData);
         });
         this._infoPanel.con.bsend.txt.text = "GÖNDER";
         this._infoPanel.con.bsend.addEventListener(MouseEvent.CLICK,this.sendSavedData);
         this._infoPanel.con.bsend.removeEventListener(MouseEvent.CLICK,this.cancelSendSavedData);
         dispatchEvent(new KryEvent(KryEvent.VV_CHANGED,this._dbData));
      }
      
      private function videoUploaded(e:KryEvent) : void
      {
         if(e.data.areaID != this._dbData.areaID)
         {
            return;
         }
         this._dbData = e.data;
         if(this._infoPanel.visible == true)
         {
            this.closeInfoPanel();
            this.openInfoPanel();
            if(this.onWarningClose != null)
            {
               this.onWarningClose();
            }
         }
      }
      
      private function watchSavedData(e:MouseEvent = null) : void
      {
         if(!new File(assPath + this._dbData.name).exists)
         {
            KXKDatabase.deleteData(this._dbData,function(e:*):void
            {
               closeInfoPanel();
            });
            return;
         }
         this.openPlayer(this._dbData.name);
      }
      
      public function openPlayer(_str:String) : void
      {
         if(!this._player)
         {
            this._player = new VVPlayer(new Point(this._viewPort.x,this._viewPort.y + 35));
            this._player.showLoading = function():*
            {
               if(showLoading != null)
               {
                  showLoading();
               }
            };
            this._player.hideLoading = function():*
            {
               if(hideLoading != null)
               {
                  hideLoading();
               }
            };
            this._player.addEventListener(Event.CLOSE,this.closePlayer);
            this._player.start(assPath,_str);
            this._mainPanel.stage.addChild(this._player);
         }
      }
      
      public function closePlayer(e:Event = null) : void
      {
         if(this._player)
         {
            this._player.clear();
            if(this._mainPanel.stage.contains(this._player))
            {
               this._mainPanel.stage.removeChild(this._player);
            }
            this._player = null;
         }
      }
      
      private function onRecording(e:RecordingEvent = null) : void
      {
         this.time = Number(e.time);
         var _str:String = this.convertTime(this.time / 1000);
         this._mainPanel.pnl2.txt.text = _str;
         if(600000 <= this.time && !this._limitStatus)
         {
            this._limitStatus = true;
            this._micRecorder.removeEventListener(RecordingEvent.RECORDING,this.onRecording);
            this.header_stop();
         }
      }
      
      public function addAct() : void
      {
         this.boardData.push(this.actObject);
      }
      
      public function getID() : Number
      {
         var _id:Number = this._processNo;
         ++this._processNo;
         return _id;
      }
      
      public function getOutput() : String
      {
         var _key:* = null;
         var _rect:Rectangle = null;
         var _po:* = null;
         var _data:* = "<data>";
         _data += "<info platform=\'air\'>" + String(this._viewPort.x) + "|" + String(this._viewPort.y) + "|" + String(1) + "|" + String(this._object.padding.x) + "|" + String(this._object.padding.y) + "</info>";
         this.boardData.sortOn("id",Array.NUMERIC);
         for(_key in this.boardData)
         {
            if(this.boardData[_key].points.length != 0)
            {
               _data += "<obj t1=\"" + String(this.boardData[_key].startTime) + "\" t2=\"" + String(this.boardData[_key].duration) + "\" act=\"" + String(this.boardData[_key].type) + "\" name=\"id" + String(this.boardData[_key].id) + "\" color=\"" + String(this.boardData[_key].color) + "\" hl=\"" + String(this.boardData[_key].highlight) + "\" thc=\"" + String(this.boardData[_key].size) + "\">";
               if(this.boardData[_key].type == ActObject.TYPE_CIRCLE)
               {
                  _rect = this.boardData[_key].points[0];
                  _data += "<rect>" + String(_rect.x) + "|" + String(_rect.y) + "|" + String(_rect.width) + "|" + String(_rect.height) + "</rect>";
               }
               else
               {
                  for(_po in this.boardData[_key].points)
                  {
                     _data += "<po>" + String(this.boardData[_key].points[_po].x) + "|" + String(this.boardData[_key].points[_po].y) + "</po>";
                  }
               }
               _data += "</obj>";
            }
            else
            {
               _data += "<obj t1=\"" + String(this.boardData[_key].startTime) + "\" t2=\"0\" act=\"" + String(this.boardData[_key].type) + "\" name=\"id" + String(this.boardData[_key].id) + "\" color=\"\" hl=\"\" thc=\"\">";
               _data += "<id>id" + String(this.boardData[_key].shapeID) + "</id>";
               _data += "</obj>";
            }
         }
         return _data + "</data>";
      }
      
      private function encryptXML(_xmlData:String) : String
      {
         _xmlData = Base64.encode(_xmlData);
         _xmlData = _xmlData.substr(0,20) + "r" + _xmlData.substr(20,_xmlData.length - 1);
         return _xmlData.substr(0,10) + "f" + _xmlData.substr(10,_xmlData.length - 1);
      }
      
      private function openMicPanel(e:MouseEvent = null) : *
      {
         if(_microphoneIndex == -1)
         {
            this.onWarning("Herhangi bir mikrofon aygıtı bulunamadı.");
            return;
         }
         if(!this.status && this._mainPanel.pnlmic.visible == false)
         {
            this._mainPanel.pnlmic.visible = true;
            this._combobox = new ComboBox(this._mainPanel.pnlmic,19,41,"",this.getMicrophoneList());
            this._combobox.width = 311;
            this._combobox.numVisibleItems = 3;
            this._combobox.selectedIndex = 0;
            this._mainPanel.pnl2.bmic.alpha = 0.35;
            if(_microphoneIndex != -1)
            {
               this._combobox.selectedIndex = _microphoneIndex;
            }
            this._combobox.addEventListener(Event.SELECT,this.onComboChange);
         }
         else
         {
            if(this._combobox != null)
            {
               if(this._mainPanel.pnlmic.contains(this._combobox))
               {
                  this._mainPanel.pnlmic.removeChild(this._combobox);
               }
               this._combobox.removeEventListener(Event.SELECT,this.onComboChange);
               this._combobox = null;
            }
            this._mainPanel.pnlmic.visible = false;
            this._mainPanel.pnl2.bmic.alpha = 1;
         }
      }
      
      private function onComboChange(e:Event) : void
      {
         _microphoneIndex = this._combobox.selectedIndex;
      }
      
      private function getMicrophoneList() : Array
      {
         var item:Object = null;
         var _list:Array = new Array();
         for(var i:int = 0; i < Microphone.names.length; i++)
         {
            item = {"label":Microphone.names[i].toString()};
            _list.push(item);
         }
         _list.fixed = true;
         return _list;
      }
      
      public function convertTime(_secs:Number = NaN) : String
      {
         var h:Number = NaN;
         var m:Number = NaN;
         var s:Number = NaN;
         if(_secs)
         {
            h = Math.floor(_secs / 3600);
            m = Math.floor(_secs % 3600 / 60);
            s = Math.floor(_secs % 3600 % 60);
            return (m < 10 ? "0" + m.toString() : m.toString()) + ":" + (s < 10 ? "0" + s.toString() : s.toString());
         }
         return "00:00";
      }
   }
}
