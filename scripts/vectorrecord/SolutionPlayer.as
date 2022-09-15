package vectorrecord
{
   import com.greensock.events.LoaderEvent;
   import com.greensock.loading.LoaderMax;
   import com.greensock.loading.MP3Loader;
   import com.greensock.loading.SWFLoader;
   import com.greensock.loading.XMLLoader;
   import com.hurlant.util.Base64;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class SolutionPlayer extends Sprite
   {
       
      
      private var _data:Object;
      
      private var _queue:LoaderMax;
      
      private var _mainArray:Array;
      
      private var _swf:ViewSWF;
      
      private var _fullStatus:Boolean;
      
      private var _swfDir:String = "";
      
      private var onError:Function;
      
      private var _ui:MovieClip;
      
      private var _screen:Point;
      
      public var fullScreenHandler:Function;
      
      private var _swfList:Array;
      
      private var _kxkSound:KXKSound;
      
      private var _tempo:Number = 1;
      
      private var _selectedTempoIndex:int = 2;
      
      private var _tempoArray:Array;
      
      private var _isCompleted:Boolean = false;
      
      private var _volume:Number = 1;
      
      private var _firstData:Object;
      
      public function SolutionPlayer(_data:Object, _e:Function, _ui:MovieClip, _screen:Point, f:Function)
      {
         this.onError = new Function();
         this._tempoArray = [0.5,0.75,1,1.25,1.5,1.75,2];
         super();
         this._data = _data;
         this._ui = _ui.ui;
         this._screen = _screen;
         this.onError = _e;
         this.fullScreenHandler = f;
         if(this._data.swf && this._data.mp3 && this._data.xml)
         {
            this.startApp();
         }
         else
         {
            this.onError();
         }
         this._ui.mcControls.btnTempo.visible = true;
         this._ui.mcControls.btnTempo.b.icon.gotoAndStop(this._selectedTempoIndex + 1);
      }
      
      public function dispose() : void
      {
         if(this._kxkSound)
         {
            this._kxkSound.dispose();
            this._kxkSound = null;
         }
         if(this._swf)
         {
            this._swf.dispose();
            this._swf = null;
         }
         if(this._queue)
         {
            this._queue.dispose();
            this._queue = null;
         }
         this._mainArray = null;
      }
      
      private function startApp(e:Event = null) : void
      {
         var _k:* = null;
         var _o:Object = null;
         this._queue = new LoaderMax({
            "name":"mainQueue",
            "onProgress":this.loader_progressSWFHandler,
            "onComplete":this.loader_completeSWFHandler,
            "onError":this.loader_errorSWFHandler
         });
         this._queue.append(new MP3Loader(this._swfDir + this._data.mp3,{
            "name":"mp3",
            "autoPlay":false
         }));
         this._queue.append(new XMLLoader(this._swfDir + this._data.xml,{"name":"xml"}));
         this._swfList = new Array();
         var _a:Array = String(this._data.swf).split(",");
         for(_k in _a)
         {
            _o = new Object();
            _o.url = _a[_k];
            this._queue.append(new SWFLoader(_o.url,{
               "name":_k,
               "autoPlay":false
            }));
            this._swfList.push(_o);
         }
         this._queue.load(true);
      }
      
      private function loader_progressSWFHandler(event:LoaderEvent) : void
      {
         this._ui.mcControls.txtPercent.text = "% " + Math.floor(event.target.progress * 100).toString();
      }
      
      private function loader_errorSWFHandler(event:LoaderEvent) : void
      {
         trace(this,"error occured with " + event.target + ": " + event.text);
         this.onError();
      }
      
      private function loader_completeSWFHandler(event:LoaderEvent = null) : void
      {
         var _pro:XML = null;
         var _k:* = null;
         var _obj:Object = null;
         var _po:XML = null;
         this._ui.mcControls.txtPercent.text = "";
         this._mainArray = new Array();
         var _pass:Object = JSON.parse("{\"crypt_key\": \"10|20|f|r\"}");
         var _xmlString:String = this.base64ToString(String(this._queue.getContent("xml")),_pass.crypt_key);
         var _xml:XML = new XML(_xmlString.split(",").join("."));
         var _info:Array = _xml.info.split("|");
         var _array:Array = new Array();
         for each(_pro in _xml.obj)
         {
            _obj = new Object();
            _obj.startTime = Number(_pro.@t1 / 1000);
            _obj.duration = Number(_pro.@t2 / 1000) / this._tempo;
            _obj.type = String(_pro.@act);
            _obj.id = String(_pro.@name);
            _obj.color = uint(_pro.@color);
            _obj.highlight = _pro.@hl;
            _obj.size = Number(_pro.@thc);
            _obj.dashed = String(_pro.@dashed);
            _obj.fill = String(_pro.@fill);
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
         for(_k in this._swfList)
         {
            this._swfList[_k].swf = DisplayObject(SWFLoader(this._queue.getLoader(_k)).rawContent);
         }
         this._swf = new ViewSWF(this._swfList,_info,_xml.info.@platform == "air");
         this._ui.mcVideo.addChild(this._swf);
         this._ui.mcControls.mcBar.mcBarPlay.scaleX = 0;
         this._ui.mcBuffer.visible = false;
         this.resizeSWF();
         this._ui.mcControls.btnFullScreen.addEventListener(MouseEvent.CLICK,this.videoPlayerStateHandler);
         this._ui.mcControls.btnPlayPause.gotoAndStop(2);
         this._ui.mcControls.btnPlayPause.addEventListener(MouseEvent.CLICK,this.playStatus);
         this._ui.mcControls.btnSound.addEventListener(MouseEvent.CLICK,this.muteStatus);
         this._ui.mcControls.mcBar.addEventListener(MouseEvent.CLICK,this.progressOnHit);
         this._ui.mcControls.btnVolumeBar.addEventListener(MouseEvent.CLICK,this.volumeProgressOnHit);
         this._ui.mcControls.bullet.addEventListener(MouseEvent.MOUSE_DOWN,this.bulletDown);
         this._ui.mcControls.mcBar.addEventListener(MouseEvent.MOUSE_DOWN,this.seekDownControl);
         this._ui.mcControls.btnVolumeBar.addEventListener(MouseEvent.MOUSE_DOWN,this.volumeControlDown);
         this._ui.mcControls.bullet.x = this._ui.mcControls.mcBar.x;
         this._ui.mcControls.btnTempo.b.addEventListener(MouseEvent.CLICK,this.buttonOpenTempo);
         this._ui.mcControls.btnTempo.b.icon.gotoAndStop(this._selectedTempoIndex + 1);
         this._kxkSound = new KXKSound(this._queue.getLoader("mp3").content,this);
         this._kxkSound.tempo = this._tempo;
         this._kxkSound.onProgress = this.sound_playProgress;
         this._kxkSound.onComplete = this.sound_complete;
         this._kxkSound.play();
      }
      
      private function buttonOpenTempo(e:Object = null) : void
      {
         if(this._ui.mcControls.btnTempo.buttons.visible)
         {
            this._ui.mcControls.btnTempo.b.icon.gotoAndStop(this._selectedTempoIndex + 1);
            this._ui.mcControls.btnTempo.buttons.visible = false;
            this._ui.mcControls.btnTempo.buttons.b0.removeEventListener(MouseEvent.CLICK,this.button_tempo);
            this._ui.mcControls.btnTempo.buttons.b1.removeEventListener(MouseEvent.CLICK,this.button_tempo);
            this._ui.mcControls.btnTempo.buttons.b2.removeEventListener(MouseEvent.CLICK,this.button_tempo);
            this._ui.mcControls.btnTempo.buttons.b3.removeEventListener(MouseEvent.CLICK,this.button_tempo);
            this._ui.mcControls.btnTempo.buttons.b4.removeEventListener(MouseEvent.CLICK,this.button_tempo);
            this._ui.mcControls.btnTempo.buttons.b5.removeEventListener(MouseEvent.CLICK,this.button_tempo);
            this._ui.mcControls.btnTempo.buttons.b6.removeEventListener(MouseEvent.CLICK,this.button_tempo);
         }
         else
         {
            this._ui.mcControls.btnTempo.b.icon.gotoAndStop(8);
            this._ui.mcControls.btnTempo.buttons.visible = true;
            this._ui.mcControls.btnTempo.buttons.b0.addEventListener(MouseEvent.CLICK,this.button_tempo);
            this._ui.mcControls.btnTempo.buttons.b1.addEventListener(MouseEvent.CLICK,this.button_tempo);
            this._ui.mcControls.btnTempo.buttons.b2.addEventListener(MouseEvent.CLICK,this.button_tempo);
            this._ui.mcControls.btnTempo.buttons.b3.addEventListener(MouseEvent.CLICK,this.button_tempo);
            this._ui.mcControls.btnTempo.buttons.b4.addEventListener(MouseEvent.CLICK,this.button_tempo);
            this._ui.mcControls.btnTempo.buttons.b5.addEventListener(MouseEvent.CLICK,this.button_tempo);
            this._ui.mcControls.btnTempo.buttons.b6.addEventListener(MouseEvent.CLICK,this.button_tempo);
         }
      }
      
      private function button_tempo(e:Object = null) : void
      {
         this._selectedTempoIndex = int(e.currentTarget.name.substr(1,1));
         this._tempo = this._tempoArray[this._selectedTempoIndex];
         var _t:* = this._ui.mcControls.mcBar.mcBarPlay.scaleX;
         this.buttonOpenTempo();
         this.clear();
         this.loader_completeSWFHandler();
         this.seekSound(_t);
      }
      
      private function clear(e:Object = null) : void
      {
         if(this._kxkSound)
         {
            this._kxkSound.dispose();
            this._kxkSound = null;
         }
         if(this._swf)
         {
            if(this._ui.mcVideo.contains(this._swf))
            {
               this._ui.mcVideo.removeChild(this._swf);
            }
            this._swf.dispose();
            this._swf = null;
         }
         this._mainArray = null;
         this._ui.mcControls.btnFullScreen.removeEventListener(MouseEvent.CLICK,this.videoPlayerStateHandler);
         this._ui.mcControls.btnPlayPause.removeEventListener(MouseEvent.CLICK,this.playStatus);
         this._ui.mcControls.btnSound.removeEventListener(MouseEvent.CLICK,this.muteStatus);
         this._ui.mcControls.mcBar.removeEventListener(MouseEvent.CLICK,this.progressOnHit);
         this._ui.mcControls.btnVolumeBar.removeEventListener(MouseEvent.CLICK,this.volumeProgressOnHit);
         this._ui.mcControls.bullet.removeEventListener(MouseEvent.MOUSE_DOWN,this.bulletDown);
         this._ui.mcControls.mcBar.removeEventListener(MouseEvent.MOUSE_DOWN,this.seekDownControl);
         this._ui.mcControls.btnVolumeBar.removeEventListener(MouseEvent.MOUSE_DOWN,this.volumeControlDown);
         this._ui.mcControls.btnTempo.b.removeEventListener(MouseEvent.CLICK,this.buttonOpenTempo);
      }
      
      private function sound_playProgress(e:Object = null) : void
      {
         var _key:* = null;
         var _object:Object = null;
         this._ui.mcControls.mcBar.mcBarPlay.scaleX = this._kxkSound.soundTime / this._kxkSound.duration;
         this._ui.mcControls.txtInfo.text = this.convertTime(this._kxkSound.soundTime) + "/" + this.convertTime(this._kxkSound.duration);
         this._ui.mcControls.bullet.x = this._ui.mcControls.mcBar.mcBarPlay.scaleX * this._ui.mcControls.mcBar.width + this._ui.mcControls.mcBar.x;
         for(_key in this._mainArray)
         {
            if(!this._mainArray[_key].status && this._mainArray[_key].startTime <= this._kxkSound.soundTime)
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
      
      private function sound_complete(e:Object = null) : void
      {
         this._ui.mcControls.mcBar.mcBarPlay.scaleX = this._kxkSound.soundTime / this._kxkSound.duration;
         this._ui.mcControls.txtInfo.text = this.convertTime(this._kxkSound.soundTime) + "/" + this.convertTime(this._kxkSound.duration);
         this._ui.mcControls.btnPlayPause.gotoAndStop(1);
         this._isCompleted = true;
         if(this._kxkSound.isPlaying)
         {
            this._kxkSound.pause();
         }
      }
      
      private function seekSound(_scaleX:Number) : void
      {
         var _key1:* = null;
         var _key2:* = null;
         var _kxkTime:Number = NaN;
         var _object:Object = null;
         this._swf.clearAllShapes();
         var _type:int = 0;
         var _time:Number = _scaleX * this._kxkSound.duration;
         for(_key1 in this._mainArray)
         {
            if(this._mainArray[_key1].startTime <= _time && _time <= this._mainArray[_key1].startTime + this._mainArray[_key1].duration)
            {
               _type = 1;
               _time = this._mainArray[_key1].startTime;
               break;
            }
         }
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
         _kxkTime = _time - 0.1;
         if(_kxkTime < 0)
         {
            _kxkTime = 0;
         }
         this._kxkSound.soundTime = _kxkTime;
         if(!this._kxkSound.isPlaying)
         {
            this._kxkSound.play();
         }
         this._ui.mcControls.btnPlayPause.gotoAndStop(2);
      }
      
      private function bulletDown(e:MouseEvent) : *
      {
         this._ui.mcControls.bullet.removeEventListener(MouseEvent.MOUSE_DOWN,this.bulletDown);
         this._ui.mcControls.stage.addEventListener(MouseEvent.MOUSE_UP,this.bulletUp);
         this._ui.mcControls.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.bulletMove);
         this.bulletMove();
      }
      
      private function bulletUp(e:MouseEvent) : *
      {
         this._ui.mcControls.bullet.addEventListener(MouseEvent.MOUSE_DOWN,this.bulletDown);
         this._ui.mcControls.stage.removeEventListener(MouseEvent.MOUSE_UP,this.bulletUp);
         this._ui.mcControls.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.bulletMove);
      }
      
      private function bulletMove(e:MouseEvent = null) : *
      {
         if(0 < this._ui.mcControls.mcBar.mouseX && this._ui.mcControls.mcBar.mouseX < this._ui.mcControls.mcBar.mcBarBg.width)
         {
            this.seekSound(this._ui.mcControls.mcBar.mouseX / this._ui.mcControls.mcBar.width);
         }
      }
      
      private function seekDownControl(e:MouseEvent) : *
      {
         this._ui.mcControls.mcBar.removeEventListener(MouseEvent.MOUSE_DOWN,this.seekDownControl);
         this._ui.stage.addEventListener(MouseEvent.MOUSE_UP,this.seekUpControl);
         this._ui.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.seekCalc);
         this.seekCalc();
      }
      
      private function seekUpControl(e:MouseEvent) : *
      {
         this._ui.mcControls.mcBar.addEventListener(MouseEvent.MOUSE_DOWN,this.seekDownControl);
         this._ui.stage.removeEventListener(MouseEvent.MOUSE_UP,this.seekUpControl);
         this._ui.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.seekCalc);
         this._ui.mcControls.btnPlayPause.gotoAndStop(2);
      }
      
      private function seekCalc(e:MouseEvent = null) : *
      {
         if(0 < this._ui.mcControls.mcBar.mouseX && this._ui.mcControls.mcBar.mouseX < this._ui.mcControls.mcBar.mcBarBg.width - 10)
         {
            this.seekSound(this._ui.mcControls.mcBar.mouseX / this._ui.mcControls.mcBar.width);
         }
      }
      
      private function volumeProgressOnHit(e:MouseEvent = null) : void
      {
         this._volume = this._ui.mcControls.btnVolumeBar.mouseX / this._ui.mcControls.btnVolumeBar.width;
         this._ui.mcControls.btnVolumeBar.mcBar.scaleX = this._volume;
         this._kxkSound.volume = this._volume;
         this._ui.mcControls.btnSound.gotoAndStop(1);
      }
      
      private function volumeControlDown(e:MouseEvent) : *
      {
         this._ui.mcControls.btnVolumeBar.removeEventListener(MouseEvent.MOUSE_DOWN,this.volumeControlDown);
         this._ui.stage.addEventListener(MouseEvent.MOUSE_UP,this.volumeControlUp);
         this._ui.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.volumeCalc);
         this._ui.mcControls.btnSound.gotoAndStop(1);
         this.volumeCalc();
      }
      
      private function volumeControlUp(e:MouseEvent) : *
      {
         this._ui.mcControls.btnVolumeBar.addEventListener(MouseEvent.MOUSE_DOWN,this.volumeControlDown);
         this._ui.stage.removeEventListener(MouseEvent.MOUSE_UP,this.volumeControlUp);
         this._ui.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.volumeCalc);
      }
      
      private function volumeCalc(e:MouseEvent = null) : *
      {
         if(0 < this._ui.mcControls.btnVolumeBar.mouseX && this._ui.mcControls.btnVolumeBar.mouseX < this._ui.mcControls.btnVolumeBar.width)
         {
            this.volumeProgressOnHit();
         }
      }
      
      private function progressOnHit(e:MouseEvent = null) : void
      {
         this.seekSound(this._ui.mcControls.mcBar.mouseX / this._ui.mcControls.mcBar.mcBarBuffer.width);
      }
      
      private function playStatus(e:Event = null) : void
      {
         if(this._isCompleted)
         {
            this._isCompleted = false;
            this.seekSound(0);
            return;
         }
         if(this._kxkSound.isPlaying)
         {
            this._kxkSound.pause();
            this._swf.pauseTween();
            this._ui.mcControls.btnPlayPause.gotoAndStop(1);
         }
         else
         {
            this._kxkSound.play();
            this._swf.playTween();
            this._ui.mcControls.btnPlayPause.gotoAndStop(2);
         }
      }
      
      private function muteStatus(e:Event = null) : void
      {
         if(this._kxkSound.volume != 0)
         {
            this._kxkSound.volume = 0;
            this._ui.mcControls.btnSound.gotoAndStop(2);
         }
         else
         {
            this._kxkSound.volume = this._volume;
            this._ui.mcControls.btnSound.gotoAndStop(1);
         }
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
      
      public function get fullStatus() : Boolean
      {
         return this._fullStatus;
      }
      
      private function videoPlayerStateHandler(e:MouseEvent = null) : *
      {
         if(this._fullStatus)
         {
            this._fullStatus = false;
            this._ui.mcControls.btnFullScreen.gotoAndStop(1);
         }
         else
         {
            this._fullStatus = true;
            this._ui.mcControls.btnFullScreen.gotoAndStop(2);
         }
         if(this.fullScreenHandler != null)
         {
            this.fullScreenHandler(this._fullStatus);
         }
      }
      
      public function resizeSWF() : void
      {
         var _rectangle:Rectangle = new Rectangle(this._ui.mcBg.x,this._ui.mcBg.y,this._ui.mcBg.width,this._ui.mcBg.height);
         this._swf.scaleX = this._swf.scaleY = 1;
         var _scale:Number = Math.min(_rectangle.width / this._swf.width,_rectangle.height / this._swf.height);
         this._swf.scaleX = this._swf.scaleY = _scale;
         this._swf.x = (_rectangle.width - this._swf.width) / 2;
         this._swf.y = (_rectangle.height - this._swf.height) / 2;
         this._ui.mcControls.y = _rectangle.height + _rectangle.y;
         this._ui.mcControls.mcBg.width = _rectangle.width;
         this._ui.mcControls.mcBar.width = _rectangle.width - 20;
         this._ui.mcControls.btnFullScreen.x = this._ui.mcBg.width - this._ui.mcControls.btnFullScreen.width - 10;
         this._ui.mcControls.txtInfo.x = this._ui.mcControls.btnFullScreen.x - this._ui.mcControls.txtInfo.width - 10;
      }
      
      private function base64ToString(_xml:String, _key:String) : String
      {
         var _strings:Array = _xml.split("");
         var _keys:Array = _key.split("|");
         _strings.splice(_keys[0],1);
         _strings.splice(_keys[1],1);
         return Base64.decode(_strings.join(""));
      }
      
      private function convertTime(_secs:Number = NaN) : String
      {
         var h:Number = NaN;
         var m:Number = NaN;
         var s:Number = NaN;
         if(_secs)
         {
            h = Math.floor(_secs / 3600);
            m = Math.floor(_secs % 3600 / 60);
            s = Math.floor(_secs % 3600 % 60);
            return (h == 0 ? "" : (h < 10 ? "0" + h.toString() + ":" : h.toString() + ":")) + (m < 10 ? "0" + m.toString() : m.toString()) + ":" + (s < 10 ? "0" + s.toString() : s.toString());
         }
         return "00:00";
      }
   }
}
