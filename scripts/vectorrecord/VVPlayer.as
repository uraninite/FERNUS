package vectorrecord
{
   import com.hurlant.util.Base64;
   import com.kxk.KryTimer;
   import deng.fzip.FZip;
   import deng.fzip.FZipFile;
   import flash.display.Bitmap;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filesystem.File;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import flash.utils.setTimeout;
   import org.as3wavsound.WavSound;
   import org.as3wavsound.WavSoundChannel;
   
   public class VVPlayer extends Sprite
   {
       
      
      private var _swf:ViewSWF;
      
      private var _fileName:String;
      
      private var _folder:String;
      
      private var _control:MovieClip;
      
      private var _close:MovieClip;
      
      private var _zip:FZip;
      
      private var _wavSoundChannel:WavSoundChannel;
      
      private var _mainArray:Array;
      
      private var _swfList:Array;
      
      private var _wavSound:WavSound;
      
      private var _kryTimer:KryTimer;
      
      private var _playingStatus:Boolean;
      
      private var _screen:Point;
      
      private var _urlLoader:URLLoader;
      
      public var showLoading:Function;
      
      public var hideLoading:Function;
      
      private var _loader;
      
      private var _isComplete:Boolean = false;
      
      public function VVPlayer(_screen:Point)
      {
         super();
         this._screen = _screen;
         this._control = new vvPlayerControl();
         this._close = new libClose();
         this.graphics.beginFill(KryCons.COLOR_BLACK);
         this.graphics.drawRect(0,0,this._screen.x,this._screen.y);
         this.graphics.endFill();
         this.addEventListener(Event.ADDED_TO_STAGE,this.addedToStage);
      }
      
      private function addedToStage(e:Event = null) : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.addedToStage);
         this._close.x = this._screen.x - this._close.width - 10;
         this._close.y = 10;
         this._control.x = 0;
         this._control.y = this._screen.y - this._control.height;
         this._control.bg.width = this._screen.x;
         var _space:int = 0;
         this._control.btnPlayPause.x = _space;
         this._control.txt.x = this._screen.x - this._control.txt.width - _space - 10;
         this._control.bar.x = this._control.btnPlayPause.x + this._control.btnPlayPause.width + _space;
         this._control.bar.width = this._control.txt.x - this._control.bar.x;
         if(this.showLoading != null)
         {
            this.showLoading();
         }
         this._close.addEventListener(MouseEvent.CLICK,this.exitPlayer);
      }
      
      public function start(_folder:String, _fileName:String) : void
      {
         this._control.bar.gotoAndStop(1);
         this._control.txt.text = this.convertTime() + "/" + this.convertTime();
         this._control.btnPlayPause.gotoAndStop(1);
         this._fileName = _fileName;
         this._folder = _folder;
         this._urlLoader = new URLLoader();
         this._urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
         this._urlLoader.addEventListener(Event.COMPLETE,function(event:Event):void
         {
            _zip = new FZip();
            _zip.addEventListener(Event.COMPLETE,zipLoaded);
            _zip.loadBytes(VectorVideo.reverseByte(URLLoader(event.target).data as ByteArray));
         });
         this._urlLoader.load(new URLRequest(new File(this._folder + this._fileName).url));
      }
      
      public function clear() : void
      {
         if(this._wavSoundChannel)
         {
            this._wavSoundChannel.stop();
            this._wavSoundChannel.removeEventListener(KryEvent.PROGRESS,this.sound_startTime);
            this._wavSoundChannel.removeEventListener(KryEvent.COMPLETE,this.sound_complete);
            this._wavSoundChannel = null;
         }
         if(this._urlLoader)
         {
            this._urlLoader.close();
            this._urlLoader = null;
         }
         if(this._zip)
         {
            this._zip.close();
            this._zip = null;
         }
         if(this._swf)
         {
            if(this.contains(this._swf))
            {
               this.removeChild(this._swf);
            }
            this._swf.pauseTween();
            this._swf.clearAllShapes();
            this._swf.dispose();
            this._swf = null;
         }
         if(this._kryTimer)
         {
            this._kryTimer.stop();
            this._kryTimer.reset();
            this._kryTimer = null;
         }
         this._swfList = null;
         this._wavSound = null;
         this._mainArray = [];
      }
      
      private function zipLoaded(e:Event) : void
      {
         var _pngZipFile:FZipFile = this._zip.getFileByName(this._fileName.split(".zip").join("") + ".png");
         this._loader = new Loader();
         this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.loadbytesComplete);
         this._loader.loadBytes(_pngZipFile.content);
      }
      
      private function loadbytesComplete(event:Event) : void
      {
         var _pro:XML = null;
         var _obj:Object = null;
         var _po:XML = null;
         var _bitmap:Bitmap = this._loader.content as Bitmap;
         _bitmap.smoothing = true;
         var _mc:MovieClip = new MovieClip();
         _mc.addChild(_bitmap);
         var _xmlZipFile:FZipFile = this._zip.getFileByName(this._fileName.split(".zip").join("") + ".xaml");
         var _wavZipFile:FZipFile = this._zip.getFileByName(this._fileName.split(".zip").join("") + ".wav");
         this._swfList = new Array();
         this._swfList[0] = {"swf":_mc};
         this._loader = null;
         this._wavSound = new WavSound(_wavZipFile.content);
         this._mainArray = new Array();
         var _xmlString:String = this.base64ToString(_xmlZipFile.getContentAsString());
         var _xml:XML = new XML(_xmlString);
         var _info:Array = _xml.info.split("|");
         var _array:Array = new Array();
         for each(_pro in _xml.obj)
         {
            _obj = new Object();
            _obj.startTime = Number(_pro.@t1 / 1000);
            _obj.duration = Number(_pro.@t2 / 1000);
            _obj.type = String(_pro.@act);
            _obj.id = String(_pro.@name);
            _obj.color = uint(_pro.@color);
            _obj.highlight = _pro.@hl;
            _obj.size = Number(_pro.@thc);
            if(_obj.type == "line" || _obj.type == "eraser" || _obj.type == "arrow" || _obj.type == "triangle" || _obj.type == "rectangle")
            {
               _obj.points = new Array();
               for each(_po in _pro.po)
               {
                  _array = _po.toString().split("|");
                  _obj.points.push({
                     "x":Number(_array[0]),
                     "y":Number(_array[1])
                  });
               }
            }
            else if(_obj.type == "circle")
            {
               _array = _pro.rect.split("|");
               _obj.rectangle = new Rectangle(Number(_array[0]),Number(_array[1]),Number(_array[2]),Number(_array[3]));
            }
            else if(_obj.type == "delete" || _obj.type == "add" || _obj.type == "scale" || _obj.type == "swf")
            {
               _obj.objectID = _pro.id;
            }
            this._mainArray.push(_obj);
         }
         this._mainArray.sortOn("startTime",Array.NUMERIC);
         this._swf = new ViewSWF(this._swfList,_info,true);
         this.addChild(this._swf);
         this.addChild(this._control);
         this.addChild(this._close);
         this.alignSWF();
         this._playingStatus = false;
         this._kryTimer = new KryTimer();
         this._wavSoundChannel = this._wavSound.play(0);
         this._wavSoundChannel.addEventListener(KryEvent.PROGRESS,this.sound_startTime);
         this._wavSoundChannel.addEventListener(KryEvent.COMPLETE,this.sound_complete);
      }
      
      private function sound_startTime(e:KryEvent) : void
      {
         if(!this._playingStatus && this._wavSoundChannel)
         {
            this._playingStatus = true;
            this._wavSoundChannel.removeEventListener(KryEvent.PROGRESS,this.sound_startTime);
            this._control.btnPlayPause.addEventListener(MouseEvent.CLICK,this.playStatus);
            this._control.bar.addEventListener(MouseEvent.CLICK,this.progressOnHit);
            this._control.btnPlayPause.gotoAndStop(2);
            this._kryTimer.onTime = this.sound_progress;
            this._kryTimer.start();
            this._swf.playTween();
            setTimeout(function():*
            {
               if(hideLoading != null)
               {
                  hideLoading();
               }
            },70);
         }
      }
      
      private function playStatus(e:Event = null) : void
      {
         var _key2:* = null;
         if(this._isComplete)
         {
            this._isComplete = false;
            this._swf.clearAllShapes();
            for(_key2 in this._mainArray)
            {
               this._mainArray[_key2].status = false;
            }
            this._control.bar.gotoAndStop(1);
            this._control.txt.text = this.convertTime(this._kryTimer.time) + "/" + this.convertTime(this._wavSound.length / 1000);
         }
         if(this._playingStatus && this._wavSoundChannel)
         {
            this._playingStatus = false;
            if(this._wavSoundChannel)
            {
               this._wavSoundChannel.stop();
               this._wavSoundChannel.removeEventListener(KryEvent.PROGRESS,this.sound_startTime);
               this._wavSoundChannel.removeEventListener(KryEvent.COMPLETE,this.sound_complete);
               this._wavSoundChannel = null;
            }
            this._control.bar.gotoAndStop(Math.floor(this._kryTimer.time / this._wavSound.length * 1000 * 100));
            this._kryTimer.onTime = null;
            this._kryTimer.stop();
            this._swf.pauseTween();
            this._control.btnPlayPause.gotoAndStop(1);
         }
         else
         {
            if(this._wavSoundChannel)
            {
               return;
            }
            if(this.showLoading != null)
            {
               this.showLoading();
            }
            this._wavSoundChannel = this._wavSound.play(this._kryTimer.time * 1000);
            this._wavSoundChannel.addEventListener(KryEvent.PROGRESS,this.sound_startTime);
            this._wavSoundChannel.addEventListener(KryEvent.COMPLETE,this.sound_complete);
         }
      }
      
      private function sound_complete(e:KryEvent = null) : void
      {
         if(this.hideLoading != null)
         {
            this.hideLoading();
         }
         this._control.txt.text = this.convertTime(this._wavSound.length / 1000) + "/" + this.convertTime(this._wavSound.length / 1000);
         this._isComplete = true;
         this._swf.pauseTween();
         this._control.bar.gotoAndStop(100);
         this._kryTimer.onTime = null;
         this._kryTimer.stop();
         this._kryTimer.reset();
         this._playingStatus = false;
         if(this._wavSoundChannel)
         {
            this._wavSoundChannel.stop();
            this._wavSoundChannel.removeEventListener(KryEvent.PROGRESS,this.sound_startTime);
            this._wavSoundChannel.removeEventListener(KryEvent.COMPLETE,this.sound_complete);
            this._wavSoundChannel = null;
         }
         this._control.btnPlayPause.gotoAndStop(1);
      }
      
      private function seekSound(_t:Number) : void
      {
         var _key1:* = null;
         var _key2:* = null;
         var _object:Object = null;
         if(this._wavSoundChannel == null)
         {
            this.playStatus();
            this.seekSound(_t);
            return;
         }
         this._swf.clearAllShapes();
         this.sound_complete();
         if(this.showLoading != null)
         {
            this.showLoading();
         }
         var _type:int = 0;
         var _time:Number = _t / 1000;
         for(_key1 in this._mainArray)
         {
            if(this._mainArray[_key1].startTime <= _time && _time <= this._mainArray[_key1].startTime + this._mainArray[_key1].duration)
            {
               _type = 1;
               _time = this._mainArray[_key1].startTime;
               break;
            }
         }
         this._kryTimer.time = _time;
         for(_key2 in this._mainArray)
         {
            if(this._mainArray[_key2].startTime < _time)
            {
               this._mainArray[_key2].status = true;
               if(this._mainArray[_key2].type == "add")
               {
                  _object = this.getObjectForAdd(this._mainArray[_key2].objectID);
                  _object.status = true;
                  this._swf.newProcess(this._mainArray[_key2],true,_object);
               }
               else
               {
                  this._swf.newProcess(this._mainArray[_key2],true);
               }
            }
            else
            {
               this._mainArray[_key2].status = false;
            }
         }
         this._wavSoundChannel = this._wavSound.play(this._kryTimer.time * 1000);
         this._wavSoundChannel.addEventListener(KryEvent.PROGRESS,this.sound_startTime);
         this._wavSoundChannel.addEventListener(KryEvent.COMPLETE,this.sound_complete);
      }
      
      private function sound_progress(e:*) : void
      {
         var _key:* = null;
         var _object:Object = null;
         var _time:Number = this._kryTimer.time;
         this._control.bar.gotoAndStop(Math.floor(_time / this._wavSound.length * 1000 * 100));
         this._control.txt.text = this.convertTime(this._kryTimer.time) + "/" + this.convertTime(this._wavSound.length / 1000);
         for(_key in this._mainArray)
         {
            if(!this._mainArray[_key].status && this._mainArray[_key].startTime <= _time)
            {
               this._mainArray[_key].status = true;
               if(this._mainArray[_key].type == "add")
               {
                  _object = this.getObjectForAdd(this._mainArray[_key].objectID);
                  _object.status = true;
                  this._swf.newProcess(this._mainArray[_key],true,_object);
               }
               else
               {
                  this._swf.newProcess(this._mainArray[_key],this._mainArray[_key].duration == 0 ? true : false);
               }
            }
         }
      }
      
      private function progressOnHit(e:MouseEvent = null) : void
      {
         this.seekSound(this._control.bar.mouseX / this._control.bar.bg.width * this._wavSound.length);
      }
      
      private function exitPlayer(e:MouseEvent = null) : void
      {
         this.dispatchEvent(new Event(Event.CLOSE));
      }
      
      private function alignSWF() : void
      {
         var _scale:Number = Math.min(this._screen.x / this._swf.width,(this._screen.y - this._control.height) / this._swf.height);
         this._swf.scaleX = this._swf.scaleY = _scale;
         this._swf.x = (this._screen.x - this._swf.width) / 2;
         this._swf.y = (this._screen.y - this._control.height - this._swf.height) / 2;
      }
      
      private function getObjectForAdd(_id:String) : Object
      {
         var _object:Object = null;
         var _key:* = null;
         for(_key in this._mainArray)
         {
            if(_id == this._mainArray[_key].id)
            {
               _object = this._mainArray[_key];
               break;
            }
         }
         return _object;
      }
      
      private function convertTime(_secs:Number = NaN) : String
      {
         var h:* = undefined;
         var m:Number = NaN;
         var s:Number = NaN;
         if(_secs)
         {
            h = Math.floor(_secs / 3600);
            m = Math.floor((_secs / 3600 - h) * 60);
            s = Math.floor(((_secs / 3600 - h) * 60 - m) * 60);
            return (m < 10 ? "0" + m.toString() : m.toString()) + ":" + (s < 10 ? "0" + s.toString() : s.toString());
         }
         return "00:00";
      }
      
      private function base64ToString(_xml:String) : String
      {
         var _strings:Array = _xml.split("");
         _strings.splice(10,1);
         _strings.splice(20,1);
         return Base64.decode(_strings.join(""));
      }
      
      public function dispose() : void
      {
         this.clear();
         this._control = null;
         this._close = null;
      }
   }
}
