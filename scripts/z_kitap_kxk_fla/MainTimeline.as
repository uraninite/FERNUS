package z_kitap_kxk_fla
{
   import adobe.utils.*;
   import com.adobe.images.PNGEncoder;
   import com.coltware.airxzip.ZipEntry;
   import com.coltware.airxzip.ZipFileReader;
   import com.greensock.TweenMax;
   import com.greensock.easing.*;
   import com.greensock.events.LoaderEvent;
   import com.greensock.layout.AutoFitArea;
   import com.greensock.loading.BinaryDataLoader;
   import com.greensock.loading.DataLoader;
   import com.greensock.loading.ImageLoader;
   import com.greensock.loading.LoaderMax;
   import com.greensock.loading.SWFLoader;
   import com.greensock.loading.XMLLoader;
   import com.greensock.loading.core.DisplayObjectLoader;
   import com.greensock.plugins.*;
   import com.hurlant.util.Base64;
   import com.kxk.*;
   import com.kxk.keyboard.KryKeyboard;
   import com.kxk.mp3player.KryMp3Player;
   import com.kxk.videoplayer.KryPlayer;
   import com.motiondraw.LineGeneralization;
   import com.motiondraw.geometry.CatmullRomSpline;
   import com.reyco1.multiuser.MultiUserSession;
   import com.reyco1.multiuser.data.UserObject;
   import fl.motion.Color;
   import flash.accessibility.*;
   import flash.desktop.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filesystem.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.globalization.*;
   import flash.media.*;
   import flash.net.*;
   import flash.net.drm.*;
   import flash.permissions.PermissionStatus;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.sampler.*;
   import flash.sensors.*;
   import flash.system.*;
   import flash.text.*;
   import flash.text.engine.*;
   import flash.text.ime.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import org.gestouch.events.GestureEvent;
   import org.gestouch.gestures.TransformGesture;
   import vectorrecord.*;
   
   public dynamic class MainTimeline extends MovieClip
   {
       
      
      public var _curtain:MovieClip;
      
      public var _note:MovieClip;
      
      public var _unitHolder:MovieClip;
      
      public var bilgiPanel:MovieClip;
      
      public var btnDate:MovieClip;
      
      public var btnSnm:MovieClip;
      
      public var calcPanel:MovieClip;
      
      public var cloudDownloader:MovieClip;
      
      public var cloudSettings:MovieClip;
      
      public var fernusTanitim:MovieClip;
      
      public var footer:MovieClip;
      
      public var kayitPanel:MovieClip;
      
      public var linkPanel:MovieClip;
      
      public var loading:MovieClip;
      
      public var loadingText:MovieClip;
      
      public var mcAniPanel:MovieClip;
      
      public var mcAsk:MovieClip;
      
      public var mcBg:MovieClip;
      
      public var mcEbaPanel:MovieClip;
      
      public var mcLoading:MovieClip;
      
      public var mcSnm:MovieClip;
      
      public var mcUsers:MovieClip;
      
      public var panelAccount:MovieClip;
      
      public var panelAh:MovieClip;
      
      public var panelAhSave:MovieClip;
      
      public var panelAhStatus:MovieClip;
      
      public var panelBG:MovieClip;
      
      public var panelCast:MovieClip;
      
      public var panelChronometer:MovieClip;
      
      public var panelConfirmation:MovieClip;
      
      public var panelGeoGebra:MovieClip;
      
      public var panelGeoGebraOpener:MovieClip;
      
      public var panelMeeting:MovieClip;
      
      public var panelMeetingAdd:MovieClip;
      
      public var panelMeetingInfo:MovieClip;
      
      public var panelNums:MovieClip;
      
      public var panelStudent:MovieClip;
      
      public var panelVV:MovieClip;
      
      public var panelVector:MovieClip;
      
      public var panelVectorVideoInfo:MovieClip;
      
      public var panelVideoSolution:MovieClip;
      
      public var panelWebview:MovieClip;
      
      public var panelZoom:MovieClip;
      
      public var pnlConnect:MovieClip;
      
      public var pnlKey:MovieClip;
      
      public var pnlPop:MovieClip;
      
      public var preRecordPanel:MovieClip;
      
      public var searchPanel:MovieClip;
      
      public var sidePanel:MovieClip;
      
      public var silPanel:MovieClip;
      
      public var soruPanel:MovieClip;
      
      public var toolBar:MovieClip;
      
      public var toolZeng:MovieClip;
      
      public var _serverAdress:String;
      
      public var _overColor:uint;
      
      public var _bookdataName:String;
      
      public var _maskdataName:String;
      
      public var _maskChecker:Boolean;
      
      public var _scale:Number;
      
      public var _joints:String;
      
      public var _fSnm:String;
      
      public var _fernusKey:String;
      
      public var _empBoolean:Boolean;
      
      public var _objArray:Array;
      
      public var _urlLoader:URLLoader;
      
      public var _loader:Loader;
      
      public var _xml:XML;
      
      public var _empString:String;
      
      public var _bookName:String;
      
      public var _zoomBg:uint;
      
      public var _zoomAlpha:Number;
      
      public var _int:int;
      
      public var _empArray:Array;
      
      public var _pages:Array;
      
      public var _canvas:MovieClip;
      
      public var _book:MovieClip;
      
      public var _maskBook:MovieClip;
      
      public var _maskLayer:MovieClip;
      
      public var _empMovieClip:MovieClip;
      
      public var _jump:int;
      
      public var activeColor:uint;
      
      public var activeTool:int;
      
      public var isNote:Boolean;
      
      public var myColorTransform;
      
      public var activeLineWidth:Number;
      
      public var _firstScale:Number;
      
      public var _empPoint:Point;
      
      public var _firstPos:Point;
      
      public var guncelSayfa:int;
      
      public var tempLayer:MovieClip;
      
      public var itemMc:MovieClip;
      
      public var startPoint;
      
      public var lastPoint;
      
      public var _activities:Array;
      
      public var selectItems:Array;
      
      public var drawAreas:Array;
      
      public var pageItems:Array;
      
      public var _masks:Array;
      
      public var _tweenTime:Number;
      
      public var _num:Number;
      
      public var mcEraser:MovieClip;
      
      public var verticalPanel:Boolean;
      
      public var proB:Boolean;
      
      public var tempShape:Shape;
      
      public var isIm:Boolean;
      
      public var isSelectDrawing:Boolean;
      
      public var isSquareDrawing:Boolean;
      
      public var isTriangeDrawing:Boolean;
      
      public var isCircleDrawing:Boolean;
      
      public var isErasing:Boolean;
      
      public var isArrowDrawing:Boolean;
      
      public var isLineDrawing:Boolean;
      
      public var isDrawing:Boolean;
      
      public var isMarking:Boolean;
      
      public var currentPoint:Point;
      
      public var silgiler:Array;
      
      public var silinecek:Array;
      
      public var brushAreas:Array;
      
      public var brushLayer:int;
      
      public var imMode:int;
      
      public var _mcNo:int;
      
      public var _selectBg:Sprite;
      
      public var _blockErase:Boolean;
      
      public var _blankBg:Sprite;
      
      public var _kapBl:Boolean;
      
      public var _rect:Rectangle;
      
      public var noteSizes:Array;
      
      public var drawAreas2:Array;
      
      public var guncelNotlar:Array;
      
      public var hangiNot:int;
      
      public var mcEraser2:MovieClip;
      
      public var resizeB:Boolean;
      
      public var rectX:Rectangle;
      
      public var rectY:Rectangle;
      
      public var brushAreas2:Array;
      
      public var brushLayer2:int;
      
      public var itemMask:Sprite;
      
      public var _blankWhite:Sprite;
      
      public var _isWhite:Boolean;
      
      public var zengIm:Boolean;
      
      public var guncelIm:int;
      
      public var _white:Sprite;
      
      public var curtainItems:Array;
      
      public var _bytes:ByteArray;
      
      public var _mcObj:Array;
      
      public var _byteArr:Array;
      
      public var _orjMcData:Vector.<IGraphicsData>;
      
      public var _obj:Object;
      
      public var _xCoor:Number;
      
      public var _yCoor:Number;
      
      public var _swf:Array;
      
      public var _page:int;
      
      public var _empBitmap:Bitmap;
      
      public var _bmpDataT:BitmapData;
      
      public var _bmpDataS:BitmapData;
      
      public var _ySpace:Number;
      
      public var _mcBlank:MovieClip;
      
      public var _coorsS1:Point;
      
      public var _coorsS2:Point;
      
      public var _tScale:Number;
      
      public var _bmpMatrix:Matrix;
      
      public var _silB:Boolean;
      
      public var _autoB:Boolean;
      
      public var _assPath:String;
      
      public var _objArr:Array;
      
      public var _gData1:GraphicsSolidFill;
      
      public var _gData2:GraphicsPath;
      
      public var _gData3:GraphicsEndFill;
      
      public var _solid:IGraphicsFill;
      
      public var _gData4:GraphicsStroke;
      
      public var _gData6:GraphicsGradientFill;
      
      public var _gData7:GraphicsShaderFill;
      
      public var _matrix:Matrix;
      
      public var boundsRect:Rectangle;
      
      public var _unitStatus:Boolean;
      
      public var tempLayerZeng:MovieClip;
      
      public var _currMc:MovieClip;
      
      public var zengImGuncel:int;
      
      public var zenbB:Boolean;
      
      public var _blackBg:MovieClip;
      
      public var xmlZeng:XML;
      
      public var _file:String;
      
      public var ilkPath:String;
      
      public var _dosyaPath:String;
      
      public var isSelectDrawingZeng:Boolean;
      
      public var hangiIslem:int;
      
      public var kayitB:int;
      
      public var kayitB2:int;
      
      public var _addObj:MovieClip;
      
      public var _glowF:GlowFilter;
      
      public var _objZeng:Array;
      
      public var _intZeng:Array;
      
      public var _nameInt:int;
      
      public var icn:int;
      
      public var _bilgiler:Array;
      
      public var _icnPage:Array;
      
      public var _themeB:Boolean;
      
      public var _color:uint;
      
      public var _sndChannel:SoundChannel;
      
      public var _sndTransform:SoundTransform;
      
      public var _snd:Sound;
      
      public var _function:Function;
      
      public var _date:Date;
      
      public var _timer:Timer;
      
      public var _bigErase:Boolean;
      
      public var _na:int;
      
      public var _form:Object;
      
      public var _conts:Array;
      
      public var _format:TextFormat;
      
      public var _txtSize:int;
      
      public var lineGeneral:LineGeneralization;
      
      public var pointler:Array;
      
      public var sayac:int;
      
      public var lastLine:Array;
      
      public var _pageValue;
      
      public var _urlManager:URLManager;
      
      public var _connection:MultiUserSession;
      
      public var _user:Object;
      
      public var _users:Array;
      
      public var _connectionObj:Object;
      
      public var _connectStat:Boolean;
      
      public var _writing:Boolean;
      
      public var _permissionStat:Boolean;
      
      public var _permission:Boolean;
      
      public var _lockStat:Boolean;
      
      public var _locked:Boolean;
      
      public var _dataType:String;
      
      public var _interval:uint;
      
      public var _panelSelectAnswer:libPanelSelectAnswer;
      
      public var _alertPanel:MovieClip;
      
      public var _queue:LoaderMax;
      
      public var _fileManager;
      
      public var _nameStr:String;
      
      public var _aniMasks:Array;
      
      public var _currAniObject:Object;
      
      public var _sidePanelStatus:Boolean;
      
      public var _boundsK:Rectangle;
      
      public var _scrollMc2:MovieClip;
      
      public var tk1:uint;
      
      public var tk2:uint;
      
      public var yk1:Number;
      
      public var yk2:Number;
      
      public var ykOverlap:Number;
      
      public var ykOffset:Number;
      
      public var _mouseDownCoor:Point;
      
      public var trs:TransformGesture;
      
      public var _kxkDownloader:KXKDownloader;
      
      public var _soGeoGebra:SharedObject;
      
      public var sekilB:int;
      
      public var _eraseLayer:int;
      
      public var mcObjectPanel:MovieClip;
      
      public var _objectLoader:DisplayObjectLoader;
      
      public var _objectFullStatus:Boolean;
      
      public var _area:AutoFitArea;
      
      public var _displayObject:DisplayObject;
      
      public var _firstObjectData:Object;
      
      public var _resizeButton:Object;
      
      public var _mp3Player:KryMp3Player;
      
      public var _mp3PlayerUI:libMp3Player;
      
      public var _videoPlayer:KryPlayer;
      
      public var _solutionPlayer:SolutionPlayer;
      
      public var _videoPlayerUI:libVideoPlayer;
      
      public var _firstData:Object;
      
      public var _resizeButton2:Object;
      
      public var _nativeProcessVideo:NativeProcess;
      
      public var _nativeProcessAudio:NativeProcess;
      
      public var myFont;
      
      public var _txtPadding:int;
      
      public var _popformat1:TextFormat;
      
      public var _poptxtfield:TextField;
      
      public var _txtShape:Shape;
      
      public var _fileSelect:File;
      
      public var _dictionary:Array;
      
      public var _studentSize:int;
      
      public var _statusInterval:uint;
      
      public var _statusStr:String;
      
      public var _typeCheck:Boolean;
      
      public var _windowList:Array;
      
      public var _snmName:String;
      
      public var _snmStat:Boolean;
      
      public var _windowId:String;
      
      public var _uint:uint;
      
      public var _bannerData:Object;
      
      public var _bannerLoader:ImageLoader;
      
      public var _bannerMc:MovieClip;
      
      public var _bannerCloser:MovieClip;
      
      public var _mainKeyboard:KryKeyboard;
      
      public var _mainTF:TextField;
      
      public var _keyboardContainer:libMainKBCon;
      
      public var _kbInterval:uint;
      
      public var _chroTotalTime:int;
      
      public var _kryTimerChronometer:KryTimer;
      
      public var _chroType:String;
      
      public var _arrayTF:Array;
      
      public var _spriteTF:Sprite;
      
      public var _infoBar:libInfoBar;
      
      public var _tfStatus:Boolean;
      
      public var _keyboard:KryKeyboard;
      
      public var _kbCon:libKeyboardCon;
      
      public var _inputLayer:MovieClip;
      
      public var _canvasIndex:int;
      
      public var _footerIndex:int;
      
      public var _tempTF:TextField;
      
      public var _inputTool:libInputTool;
      
      public var _trsStat:Boolean;
      
      public var _inputTextStatus;
      
      public var _fmZipMove:FileManager;
      
      public var _zipFileReader:ZipFileReader;
      
      public var _fileList:Array;
      
      public var _fmArray:Array;
      
      public var _zipFileCounter:int;
      
      public var _targetPath:String;
      
      public var _zipFunc:Function;
      
      public var _ebaList:Array;
      
      public var _xmlLoader:XMLLoader;
      
      public var _ebaArray:Array;
      
      public var _mainCat:String;
      
      public var _treeArray:Array;
      
      public var _videoPageNo:int;
      
      public var _perPage:int;
      
      public var _lastPageNo:int;
      
      public var _videoList:Array;
      
      public var _videoMainList:Array;
      
      public var _videoQueue:LoaderMax;
      
      public var _sortSet:String;
      
      public var _selectedVideo:Object;
      
      public var _dragStatus:Boolean;
      
      public var _ebaIcon:MovieClip;
      
      public var _ebaLoadStatus;
      
      public var _selectetCloudObject;
      
      public var _vvStatusArray:Array;
      
      public var _spriteAhSelect:Sprite;
      
      public var _ahData:Object;
      
      public var _selectedAh:Object;
      
      public var _ahDateSort:int;
      
      public var _ahPageSort:int;
      
      public var _bitmapAh:Bitmap;
      
      public var _ahList:Array;
      
      public var _imageLoaderAh:ImageLoader;
      
      public var _ahSelectStatus;
      
      public var _meetingData:Object;
      
      public var _selectedMeeting:Object;
      
      public var _zoomInterval:uint;
      
      public var _meetingDateSort:int;
      
      public var _zoomJson:KryJSON;
      
      public var _zoomFunc;
      
      public var _vectorVideo:VectorVideo;
      
      public var _imPadding;
      
      public var _windowUpdate:NativeWindow;
      
      public var _panelUpdate:libUpdatePanel;
      
      public var _activityPanel:MovieClip;
      
      public var _activityLoader:Loader;
      
      public var _activityDataLoader:DataLoader;
      
      public var _selectedActivity:Object;
      
      public var _operatingSystem:String;
      
      public var _appLanguage:String;
      
      public var _pkxkname:String;
      
      public var _publisher:String;
      
      public var _fernusCode;
      
      public var _passwordStatus:Boolean;
      
      public var _cloudBase:String;
      
      public var _fernusLink:String;
      
      public var _publisherApi:String;
      
      public var _dateLimit:Date;
      
      public var _introVideoFile:String;
      
      public var _soKXKKey:String;
      
      public var _soKXKBlackKey:String;
      
      public var _soBookKXK:SharedObject;
      
      public var _mainFolderPath:String;
      
      public var _tempPath:String;
      
      public var _mainFilename:String;
      
      public var _tempAppFolder:String;
      
      public var _invokeS;
      
      public var _realScale:Number;
      
      public var _capX:Number;
      
      public var _capY:Number;
      
      public var _capYOffset:Number;
      
      public var _stageBounds:Point;
      
      public var _windowBounds:Point;
      
      public var _logoClass:Class;
      
      public var _kkObject:Object;
      
      public var _appType:String;
      
      public var _proMode;
      
      public var _geoGebra;
      
      public var _macwindowBounds:Point;
      
      public var _kxkPath:String;
      
      public var _microphoneCheck:Microphone;
      
      public var _macoptions:NativeWindowInitOptions;
      
      public var _macwindow:NativeWindow;
      
      public var _windowDisplayState;
      
      public var _window:NativeWindow;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function addStage(_obj:DisplayObject) : *
      {
         stage.addChild(_obj);
      }
      
      public function removeStage(_obj:DisplayObject) : *
      {
         if(stage.contains(_obj))
         {
            stage.removeChild(_obj);
         }
      }
      
      public function stageAlignCenter(_obj:DisplayObject) : *
      {
         _obj.x = (this._capX - _obj.width) / 2;
         _obj.y = (this._capY - _obj.height) / 2;
      }
      
      public function objectAlignCenter(_obj1:DisplayObject, _obj2:DisplayObject) : *
      {
         _obj1.x = (_obj2.width - _obj1.width) / 2 + _obj2.x;
         _obj1.y = (_obj2.height - _obj1.height) / 2 + _obj2.y;
      }
      
      public function stageFill(_obj:DisplayObject) : *
      {
         _obj.width = this._capX;
         _obj.height = this._capY;
      }
      
      public function stageCoor(_obj:Object, _x:Number, _y:Number) : *
      {
         _obj.x = _x;
         _obj.y = _y;
      }
      
      public function showLoading() : *
      {
         this.addStage(this.loading);
         this.loading.visible = true;
      }
      
      public function hideLoading() : *
      {
         this.loading.visible = false;
      }
      
      public function ck(myKey:String) : *
      {
         var totKey:int = 0;
         var charsArray:Array = "ABCDEFGHJKLMNPRSTVYZ123456789".split("");
         var kArr:Array = myKey.toUpperCase().split("");
         if(myKey.split("").length >= 8)
         {
            totKey = myKey.charCodeAt(0) + myKey.charCodeAt(3) + myKey.charCodeAt(4) + myKey.charCodeAt(5) + myKey.charCodeAt(7);
            if(charsArray[totKey % (int(this._kkObject.f1) - this._pkxkname.length)] == kArr[1] && charsArray[totKey % (int(this._kkObject.f2) - this._pkxkname.length)] == kArr[2] && charsArray[totKey % (int(this._kkObject.f3) - this._pkxkname.length)] == kArr[6])
            {
               return true;
            }
            return false;
         }
         return false;
      }
      
      public function toUpperCase(evt:Event) : void
      {
         evt.target.text = evt.target.text.toUpperCase();
      }
      
      public function exitApp(e:MouseEvent) : *
      {
         this.ask(this.closeApp,"Uygulamadan çıkmak istiyor musunuz?");
      }
      
      public function closeApp(e:MouseEvent = null) : *
      {
         NativeApplication.nativeApplication.exit();
      }
      
      public function minApp(e:MouseEvent) : *
      {
         this._window.minimize();
      }
      
      public function randomNumber(param1:Number = NaN, param2:Number = NaN) : Number
      {
         param1 = param1;
         param2 = param2;
         if(isNaN(param1))
         {
            throw new Error("low must be defined");
         }
         if(isNaN(param2))
         {
            throw new Error("high must be defined");
         }
         return Math.round(Math.random() * (param2 - param1)) + param1;
      }
      
      public function sendLog() : *
      {
         var _urlRequest:URLRequest = new URLRequest(this._fernusLink + "&action=zkitap_log&key=" + this._fernusKey + "&book=" + this._bookName);
         _urlRequest.method = URLRequestMethod.GET;
         var _json:* = new KryJSON(_urlRequest,true);
         _json.start();
      }
      
      public function checkCenter() : *
      {
         this._urlManager = new URLManager();
         this._urlManager.onComplete = this.checkComplete;
         this._urlManager.getHtmlSource(this._fernusLink + "&action=check_key_status&key=" + this._fernusKey + "&book=" + this._bookName);
      }
      
      public function checkComplete(_data:String) : *
      {
         var _arr:Array = null;
         _arr = _data.split("|");
         if(_arr[1] == "1")
         {
            TweenMax.delayedCall(2,function():*
            {
               warning(String(_arr[5]));
            });
         }
         if(_arr[3] == "1")
         {
            navigateToURL(new URLRequest(String(_arr[6])));
         }
         if(_arr[4] == "1")
         {
            TweenMax.delayedCall(1,function():*
            {
               FileManager.deleteFile(_tempPath + _soKXKKey);
               FileManager.deleteFileAsync(_soKXKBlackKey,function():*
               {
                  var _fm:FileManager = new FileManager();
                  _fm.writeUTFFile(_soKXKBlackKey,_fernusKey.toUpperCase());
               });
            });
         }
         if(_arr[7] == "1")
         {
            FileManager.deleteFile(this._soKXKBlackKey);
         }
         if(_arr[2] == "1")
         {
            FileManager.deleteFile(this._tempPath + this._soKXKKey);
         }
         if(_arr[0] == "1")
         {
            TweenMax.delayedCall(4,function():*
            {
               NativeApplication.nativeApplication.exit();
            });
         }
      }
      
      public function canvasScale() : *
      {
         this._canvas.scaleX = 1;
         this._canvas.scaleY = 1;
         this._scale = Math.min(this._capX / this._canvas.width,(this._capY - this._capYOffset) / this._canvas.height);
         this._canvas.scaleX = this._scale;
         this._canvas.scaleY = this._scale;
         this._firstScale = this._scale;
         this._canvas.x = (this._capX - this._canvas.width) / 2;
         this._canvas.y = (this._capY - this._capYOffset - this._canvas.height) / 2;
         this._firstPos.x = this._canvas.x;
         this._firstPos.y = this._canvas.y;
      }
      
      public function buyukHarf(bul:String) : String
      {
         var bak:Object = null;
         var pat:RegExp = /i/g;
         var den:Array = bul.toUpperCase().split("");
         while(bak = pat.exec(bul))
         {
            den[bak.index] = bak.toString();
         }
         return den.join("").replace(pat,"İ");
      }
      
      public function polarAngle(point:Point, center:Point = null) : Number
      {
         if(!center)
         {
            center = new Point(0,0);
         }
         return Math.atan2(point.y - center.y,point.x - center.x) * 180 / Math.PI;
      }
      
      public function removeItems(_obj:MovieClip) : void
      {
         while(_obj.numChildren > 0)
         {
            _obj.removeChildAt(0);
         }
      }
      
      public function getClass(obj:Object) : Class
      {
         return Class(getDefinitionByName(getQualifiedClassName(obj)));
      }
      
      public function countArray(liste:Array) : *
      {
         var key:* = null;
         var sayi:Number = 0;
         for(key in liste)
         {
            sayi++;
         }
         return sayi;
      }
      
      public function objectCache(_mc:MovieClip) : *
      {
         _mc.cacheAsBitmap = true;
      }
      
      public function warning(_str:String) : *
      {
         this.soruPanel.visible = true;
         this.soruPanel.txt.text = _str;
         this.addStage(this._blackBg);
         this.addStage(this.soruPanel);
         this._blackBg.alpha = 1;
         this.soruPanel.alpha = 1;
         this.soruPanel.bgir.addEventListener(MouseEvent.CLICK,this.warningClose);
      }
      
      public function warningClose(event:MouseEvent = null) : *
      {
         this.soruPanel.visible = false;
         this.removeStage(this._blackBg);
         this.soruPanel.bgir.removeEventListener(MouseEvent.CLICK,this.warningClose);
      }
      
      public function ask(_funcF:Function, _strF:String) : *
      {
         this.mcAsk.con.txt.text = _strF;
         this.mcAsk.visible = true;
         this._function = _funcF;
         this.mcAsk.con.btnYes.addEventListener(MouseEvent.CLICK,this.askStat);
         this.mcAsk.con.btnNo.addEventListener(MouseEvent.CLICK,this.askStat);
         this.addStage(this.mcAsk);
      }
      
      public function askStat(e:MouseEvent) : *
      {
         if(e.currentTarget.name == "btnYes")
         {
            this._function();
         }
         this.mcAsk.visible = false;
         this.mcAsk.con.btnYes.removeEventListener(MouseEvent.CLICK,this.askStat);
         this.mcAsk.con.btnNo.removeEventListener(MouseEvent.CLICK,this.askStat);
      }
      
      public function txtResize(txt:TextField) : void
      {
         this._format = txt.getTextFormat();
         while(txt.textHeight > 81)
         {
            this._format.size = int(this._format.size) - 1;
            txt.setTextFormat(this._format);
         }
      }
      
      public function showAlert(_t1:*, _t2:*) : *
      {
         this.closeAlert();
         this._alertPanel = new libAlertPanel();
         this._alertPanel.con.txtTitle.text = _t1;
         this._alertPanel.con.txtInfo.text = _t2;
         this.stageFill(this._alertPanel.bg);
         this.stageAlignCenter(this._alertPanel.con);
         this._alertPanel.con.close.addEventListener(MouseEvent.CLICK,this.closeAlert);
         this.addStage(this._alertPanel);
      }
      
      public function closeAlert(e:MouseEvent = null) : *
      {
         if(this._alertPanel)
         {
            this.removeStage(this._alertPanel);
            this._alertPanel = null;
         }
      }
      
      public function openLoading() : *
      {
         this.objectCache(this.mcLoading.mcBg);
         this.objectCache(this.mcLoading.mcAni);
         this.stageCoor(this.mcLoading,0,0);
         this.stageFill(this.mcLoading.mcBg);
         this.stageAlignCenter(this.mcLoading.mcAni);
         this.addStage(this.mcLoading);
      }
      
      public function align() : *
      {
         var _k:* = null;
         this.stageFill(this.mcBg);
         this.objectCache(this.mcBg);
         this.stageCoor(this.mcBg,0,0);
         this.stageCoor(this.toolBar,200,(this._capY - this.toolBar.height) / 2);
         this.objectCache(this.toolBar.mcBg);
         this.objectCache(this.sidePanel.mcBg);
         this.stageCoor(this.toolZeng,-this.toolZeng.width,(this._capY - this.toolZeng.height) / 2);
         this.objectCache(this.toolZeng.mcBg);
         this.objectCache(this.toolZeng.b_0);
         this.objectCache(this.toolZeng.b_1);
         this.objectCache(this.toolZeng.b_2);
         this.objectCache(this.toolZeng.b_3);
         this.objectCache(this.toolZeng.b_4);
         this.objectCache(this.toolZeng.b_5);
         this.objectCache(this.toolZeng.b_6);
         this.objectCache(this.footer.pPage);
         this.objectCache(this.footer.nPage);
         this.objectCache(this.footer.previousIm);
         this.objectCache(this.footer.nextIm);
         this.objectCache(this.footer.closeZoom);
         this.objectCache(this.sidePanel.btnAddInput);
         this.objectCache(this.footer.btnEba);
         this.objectCache(this.footer.btnBos);
         this.objectCache(this.footer.tools);
         this.sidePanel.x = -this.sidePanel.width;
         this.sidePanel.y = 0;
         this.sidePanel.btnCloudAdmin.visible = false;
         this.objectCache(this.mcEbaPanel.mcBg);
         this.mcEbaPanel.visible = false;
         this.stageCoor(this.mcEbaPanel,this._capX,0);
         this.stageCoor(this.panelVV,this._capX,0);
         this.stageCoor(this.panelAh,this._capX,0);
         this.stageCoor(this.panelMeeting,this._capX,0);
         this.stageCoor(this.panelVideoSolution,this._capX,0);
         this.mcEbaPanel.mcSearchHeader.visible = false;
         this.mcEbaPanel.mcCatHeader.visible = false;
         this.mcEbaPanel.mcLoading1.visible = false;
         this.mcEbaPanel.btnBack.visible = false;
         this.mcEbaPanel.mcSearchHeader.txt.text = "";
         this.mcEbaPanel.mcP1.txt.text = this.mcEbaPanel.mcP2.txt.text = this.mcEbaPanel.mcP3.txt.text = this.mcEbaPanel.mcP4.txt.text = this.mcEbaPanel.mcP5.txt.text = this.mcEbaPanel.mcP6.txt.text = this.mcEbaPanel.mcP7.txt.text = "";
         this.panelConfirmation.visible = false;
         this.cloudSettings.visible = false;
         this.cloudDownloader.visible = false;
         this.panelConfirmation.con.pnl1.txt.displayAsPassword = true;
         this.panelConfirmation.con.pnl2.txt.displayAsPassword = true;
         this.panelConfirmation.x = this.panelConfirmation.y = 0;
         this.cloudSettings.x = this.cloudSettings.y = 0;
         this.cloudDownloader.x = this.cloudDownloader.y = 0;
         this.panelWebview.x = this.panelWebview.y = 0;
         this.stageFill(this.panelConfirmation.bg);
         this.stageFill(this.cloudSettings.bg);
         this.stageFill(this.cloudDownloader.bg);
         this.stageFill(this.panelWebview.bg);
         this.stageFill(this.mcUsers.bg);
         this.stageAlignCenter(this.panelConfirmation.con);
         this.stageAlignCenter(this.cloudSettings.con);
         this.stageAlignCenter(this.cloudDownloader.con);
         this.stageAlignCenter(this.panelWebview.con);
         this.stageAlignCenter(this.mcUsers.con);
         this.footer.visible = true;
         this.footer.bg.width = this._capX;
         this.stageCoor(this.footer,0,this._capY - this._capYOffset);
         this.footer.closeZoom.x = (this._capX - this.footer.closeZoom.width) / 2;
         this.footer.pnlPageNum.x = (this._capX - this.footer.pnlPageNum.width) / 2;
         this._int = 5;
         this.footer.pPage.x = this.footer.pnlPageNum.x - this.footer.pPage.width - this._int;
         this.footer.nPage.x = this.footer.pnlPageNum.x + this.footer.pnlPageNum.width + this._int;
         this.footer.previousIm.x = this.footer.pnlPageNum.x - this.footer.previousIm.width - this._int;
         this.footer.nextIm.x = this.footer.pnlPageNum.x + this.footer.pnlPageNum.width + this._int;
         var _fbtn:Array = new Array();
         var _fx:Number = this._capX;
         if(this.footer.btnAccount.visible)
         {
            _fbtn.push(this.footer.btnAccount);
         }
         if(this.footer.btnMeeting.visible)
         {
            _fbtn.push(this.footer.btnMeeting);
         }
         if(this.footer.btnAH.visible)
         {
            _fbtn.push(this.footer.btnAH);
         }
         if(this.footer.btnDO.visible)
         {
            _fbtn.push(this.footer.btnDO);
         }
         if(this.footer.btnEba.visible)
         {
            _fbtn.push(this.footer.btnEba);
         }
         if(this.footer.btnSolution.visible)
         {
            _fbtn.push(this.footer.btnSolution);
         }
         for(_k in _fbtn)
         {
            _fx = _fx - _fbtn[_k].width - this._int;
            _fbtn[_k].x = _fx;
         }
         if(this._capX < 1160 && 5 < _fbtn.length)
         {
            this.footer.nPage.x = this.footer.btnSolution.x - this.footer.nPage.width - this._int;
            this.footer.nextIm.x = this.footer.btnSolution.x - this.footer.nextIm.width - this._int;
            this.footer.pnlPageNum.x = this.footer.nextIm.x - this.footer.pnlPageNum.width - this._int;
            this.footer.pPage.x = this.footer.pnlPageNum.x - this.footer.pPage.width - this._int;
            this.footer.previousIm.x = this.footer.pnlPageNum.x - this.footer.previousIm.width - this._int;
         }
         this.stageCoor(this.panelCast,10,this.footer.y - 10 - this.panelCast.height);
         this.stageCoor(this.mcUsers,0,0);
         this._int = 10;
         this.stageCoor(this.btnSnm,this._int,this.footer.btnZeng.y - this._int - this.btnSnm.height);
         this.objectCache(this.footer.btnZeng);
         this.objectCache(this.preRecordPanel.btnSaveAns);
         this.objectCache(this.preRecordPanel.btnAns);
         this.objectCache(this.preRecordPanel.btnNavi);
         this.preRecordPanel.bg.width = 38;
         this.preRecordPanel.x = this._capX - this.preRecordPanel.bg.width - 10;
         this.preRecordPanel.y = this.footer.y - this._int - this.preRecordPanel.height;
         this.stageCoor(this.panelVector,this._capX - this.panelVector.width - this._int,this._int);
         this.stageFill(this.loadingText.bg);
         this.stageFill(this.loading.bg);
         this.stageAlignCenter(this.mcLoading.mcAni);
         this.stageAlignCenter(this.loadingText.ani);
         this.loading.ani.x = (this._capX - 75) / 2;
         this.loading.ani.y = (this._capY - 75) / 2;
         this.stageCoor(this.panelStudent,0,0);
         this.stageCoor(this.loading,0,0);
         this.stageCoor(this.loadingText,0,0);
         this.stageFill(this.panelVectorVideoInfo.bg);
         this.stageFill(this.panelAhSave.bg);
         this.stageFill(this.panelGeoGebra.bg);
         this.stageFill(this.panelGeoGebraOpener.bg);
         this.stageFill(this.panelMeetingInfo.bg);
         this.stageFill(this.panelMeetingAdd.bg);
         this.stageFill(this.panelZoom.bg);
         this.stageFill(this.panelAhStatus.bg);
         this.stageFill(this.panelAccount.bg);
         this.stageFill(this.panelBG.bg);
         this.stageAlignCenter(this.panelVectorVideoInfo.con);
         this.stageAlignCenter(this.panelAhSave.con);
         this.stageAlignCenter(this.panelGeoGebra.con);
         this.stageAlignCenter(this.panelGeoGebraOpener.con);
         this.stageAlignCenter(this.panelMeetingInfo.con);
         this.stageAlignCenter(this.panelMeetingAdd.con);
         this.stageAlignCenter(this.panelZoom.con);
         this.stageAlignCenter(this.panelAhStatus.con);
         this.stageAlignCenter(this.panelAccount.con);
         this.stageAlignCenter(this.panelBG.con);
         this.stageCoor(this.panelVectorVideoInfo,0,0);
         this.stageCoor(this.panelAhSave,0,0);
         this.stageCoor(this.panelGeoGebra,0,0);
         this.stageCoor(this.panelGeoGebraOpener,0,0);
         this.stageCoor(this.panelMeetingInfo,0,0);
         this.stageCoor(this.panelMeetingAdd,0,0);
         this.stageCoor(this.panelZoom,0,0);
         this.stageCoor(this.panelAhStatus,0,0);
         this.stageCoor(this.panelAccount,0,0);
         this.stageCoor(this.panelBG,0,0);
         this._curtain.width = this._capX;
         this._curtain.height = this._capY - this._capYOffset;
         this._curtain.x = 0;
         this._curtain.y = 0;
         this._curtain.visible = false;
         this.objectCache(this.preRecordPanel.btnGoster);
         this.stageCoor(this.panelNums,0,0);
         this.stageFill(this.panelNums.bg);
         this.stageAlignCenter(this.panelNums.pnl);
         this.objectCache(this.panelNums.bg);
         this.objectCache(this.panelNums.pnl.mcBg);
         this.objectCache(this.panelNums.pnl.b_0);
         this.objectCache(this.panelNums.pnl.b_1);
         this.objectCache(this.panelNums.pnl.b_2);
         this.objectCache(this.panelNums.pnl.b_3);
         this.objectCache(this.panelNums.pnl.b_4);
         this.objectCache(this.panelNums.pnl.b_5);
         this.objectCache(this.panelNums.pnl.b_6);
         this.objectCache(this.panelNums.pnl.b_7);
         this.objectCache(this.panelNums.pnl.b_8);
         this.objectCache(this.panelNums.pnl.b_9);
         this.objectCache(this.panelNums.pnl.close);
         this.objectCache(this.panelNums.pnl.openNum);
         this.stageCoor(this.kayitPanel,this._capX,(this._capY - this.kayitPanel.height) / 2);
         this.objectCache(this.kayitPanel.mcBg);
         this.objectCache(this.kayitPanel.simge);
         this.objectCache(this.kayitPanel.btnKay);
         this.objectCache(this.kayitPanel.btnVaz);
         this.objectCache(this.kayitPanel.pir);
         this.stageCoor(this.silPanel,this._capX,(this._capY - this.silPanel.height) / 2);
         this.objectCache(this.silPanel.mcBg);
         this.objectCache(this.silPanel.simge);
         this.objectCache(this.silPanel.btnSil);
         this.objectCache(this.silPanel.btnGoster);
         this.stageCoor(this.bilgiPanel,(this._capX - this.bilgiPanel.width) / 2,-this.bilgiPanel.height);
         this.objectCache(this.bilgiPanel);
         this.stageAlignCenter(this.linkPanel);
         this.objectCache(this.linkPanel.mcBg);
         this.objectCache(this.linkPanel.bgir);
         this.objectCache(this.linkPanel.biptal);
         this.stageAlignCenter(this.searchPanel);
         this.objectCache(this.searchPanel.mover);
         this.objectCache(this.searchPanel.close);
         this.objectCache(this.calcPanel.mover);
         this.objectCache(this.calcPanel.closeC);
         this.objectCache(this.calcPanel.sci_button);
         this.objectCache(this.calcPanel.sci_panel);
         this.stageCoor(this._note,this._capX - 350,40);
         this.stageAlignCenter(this.pnlConnect);
         this.objectCache(this.pnlConnect.mcBg);
         this.toolBar.fernusColorPalette.visible = false;
         this.toolBar.fernusLinePalette.visible = false;
         this.toolBar.fernusGrapsPalette.visible = false;
         this.pnlPageNumClose();
         this.searchPanel.word.text = "";
         this.searchPanel.stat.mouseEnabled = false;
         this.searchPanel.visible = false;
         this.searchPanel.word.restrict = "A-Za-z 0-9ĞÜŞİÖÇIığüşiöç";
         this.panelNums.pnl.pageNum.maxChars = 10;
         this.panelNums.pnl.pageNum.restrict = "0-9";
         this.mcEraser.visible = false;
         this.mcEraser.mouseChildren = false;
         this.mcEraser.mouseEnabled = false;
         this.objectCache(this.toolBar.btnBrush.mcBg);
         this.objectCache(this.toolBar.btnMark.mcBg);
         this.objectCache(this.toolBar.btnErase.mcBg);
         this.objectCache(this.toolBar.btnBack.mcBg);
         this.objectCache(this.sidePanel.btnRecord.mcBg);
         this.objectCache(this.footer.btnList.mcBg);
         this.objectCache(this.sidePanel.btnNote.mcBg);
         this.objectCache(this.sidePanel.btnChronometer.mcBg);
         this.objectCache(this.sidePanel.btnCalc.mcBg);
         this.objectCache(this.toolBar.btnCleanScreen.mcBg);
         this.objectCache(this.toolBar.btnGraps.mcBg);
      }
      
      public function compareDate(date1:Date, date2:Date) : Number
      {
         var date1Timestamp:Number = date1.getTime();
         var date2Timestamp:Number = date2.getTime();
         var result:Number = -1;
         trace(date1Timestamp - date2Timestamp);
         if(date1Timestamp == date2Timestamp)
         {
            result = 0;
         }
         else if(date1Timestamp > date2Timestamp)
         {
            result = 0;
         }
         else if(date1Timestamp < date2Timestamp)
         {
            result = 1;
         }
         return result;
      }
      
      public function startApp() : *
      {
         var _dataLoader:DataLoader = null;
         var _logoPath:String = new File(this._mainFolderPath + "pdata.kxk").url;
         if(FileManager.exists(_logoPath))
         {
            _dataLoader = new DataLoader(_logoPath,{
               "name":"logo",
               "format":"binary",
               "onComplete":function():*
               {
                  var _bytes:* = new ByteArray();
                  var _data:* = new Array();
                  _bytes = _dataLoader.content as ByteArray;
                  _data = _bytes.readObject() as Array;
                  _bytes = Base64.decodeToByteArray(_data[2] as String);
                  _bytes.position = 0;
                  var _bmpData:* = new BitmapData(500,200,true);
                  _bmpData.setPixels(new Rectangle(0,0,500,200),_bytes);
                  var _logo1:* = new Bitmap(_bmpData,"auto",true);
                  var _logo2:* = new Bitmap(_bmpData,"auto",true);
                  var _logo3:* = new Bitmap(_bmpData,"auto",true);
                  var _logo4:* = new Bitmap(_bmpData,"auto",true);
                  _logo1.width = _logo2.width = _logo3.width = _logo4.width = 300;
                  _logo1.height = _logo2.height = _logo3.height = _logo4.height = 120;
                  removeItems(pnlKey.con.mcLogo);
                  removeItems(mcLoading.mcAni.mcLogo);
                  removeItems(toolBar.logo);
                  removeItems(toolZeng.mcBg.logo);
                  pnlKey.con.mcLogo.addChild(_logo1);
                  mcLoading.mcAni.mcLogo.addChild(_logo2);
                  toolBar.logo.addChild(_logo3);
                  toolZeng.mcBg.logo.addChild(_logo4);
                  checkKeyCode();
               },
               "onError":function():*
               {
                  checkKeyCode();
               }
            });
            _dataLoader.load(true);
         }
         else
         {
            this.checkKeyCode();
         }
      }
      
      public function checkKeyCode() : *
      {
         var _mc:MovieClip = null;
         var _logo:MovieClip = null;
         var _textFormat:TextFormat = null;
         var _tf:TextField = null;
         if(this._dateLimit)
         {
            if(this.compareDate(this._dateLimit,new Date()) == 1)
            {
               _mc = new MovieClip();
               _logo = new this._logoClass();
               _textFormat = new TextFormat();
               _textFormat.size = 20;
               _textFormat.font = new Font1().fontName;
               _tf = new TextField();
               _tf.defaultTextFormat = _textFormat;
               _tf.textColor = 4342338;
               _tf.autoSize = TextFieldAutoSize.LEFT;
               _tf.border = false;
               _tf.embedFonts = true;
               _tf.needsSoftKeyboard = false;
               _tf.selectable = false;
               _tf.text = "Uygulama kullanım süreniz dolmuştur.";
               _mc.addChild(_logo);
               _mc.addChild(_tf);
               _logo.x = (_tf.width - _logo.width) / 2;
               _tf.y = _logo.height + 35;
               this.stageAlignCenter(_mc);
               this.addStage(_mc);
               return;
            }
         }
         this.objectCache(this.pnlKey.mcBg);
         this.objectCache(this.pnlKey.con.mcLogo);
         this.objectCache(this.pnlKey.con.bExit);
         this.objectCache(this.pnlKey.con.bEnter);
         this.objectCache(this.pnlKey.con.mcSerial);
         this.stageAlignCenter(this.pnlKey.con);
         this.stageCoor(this.pnlKey,0,0);
         this.stageFill(this.pnlKey.mcBg);
         this.pnlKey.con.mcSerial.txtKey.text = "";
         this.pnlKey.con.mcSerial.btnClear.visible = false;
         this.pnlKey.con.mcSerial.txtKey.displayAsPassword = true;
         this.addStage(this.pnlKey);
         this.stageFill(this._blackBg);
         this.stageFill(this.mcAsk.bg);
         this.stageCoor(this.mcAsk,0,0);
         this.stageAlignCenter(this.soruPanel);
         this.objectCache(this.soruPanel.mcBg);
         this.objectCache(this.soruPanel.bgir);
         this.stageAlignCenter(this.mcAsk.con);
         this.objectCache(this.mcAsk.con.mcBg);
         this.objectCache(this.mcAsk.con.btnYes);
         this.objectCache(this.mcAsk.con.btnNo);
         this.stageFill(this.mcBg);
         this.objectCache(this.mcBg);
         if(this._passwordStatus)
         {
            if(this._mainFilename.split("_")[1])
            {
               if(this.ck(this._mainFilename.split("_")[1].substr(0,8)) == true)
               {
                  this._fernusKey = this._mainFilename.split("_")[1].substr(0,8);
                  this.correctKey();
               }
               else
               {
                  this.checkSavedKey();
               }
            }
            else
            {
               this.checkSavedKey();
            }
         }
         else
         {
            this._fernusKey = "kxk";
            this.correctKey();
         }
      }
      
      public function checkSavedKey() : *
      {
         var _ul:URLLoader = null;
         if(FileManager.exists(this._tempPath + this._soKXKKey))
         {
            _ul = new URLLoader();
            _ul.addEventListener(Event.COMPLETE,function(ev:*):*
            {
               _ul.close();
               _ul = null;
               enterKey();
               var valueKey:String = ev.target.data;
               pnlKey.con.mcSerial.txtKey.text = valueKey;
               pnlKey.con.mcSerial.btnClear.visible = true;
               pnlKey.con.mcSerial.btnClear.addEventListener(MouseEvent.CLICK,function():*
               {
                  pnlKey.con.mcSerial.btnClear.visible = false;
                  pnlKey.con.mcSerial.txtKey.text = "";
                  FileManager.deleteFile(_tempPath + _soKXKKey);
               });
            });
            _ul.load(new URLRequest(new File(this._tempPath + this._soKXKKey).url));
         }
         else
         {
            this.enterKey();
         }
      }
      
      public function enterKey() : *
      {
         this.pnlKey.con.txtStat.text = "z - Kitap uygulamasına erişmek için verilen anahtar kodu aşağıdaki panele girin.";
         this.pnlKey.con.bExit.addEventListener(MouseEvent.CLICK,this.exitApp);
         this.pnlKey.con.mcSerial.visible = true;
         this.pnlKey.con.bEnter.addEventListener(MouseEvent.CLICK,this.checkKey);
         this.pnlKey.con.mcSerial.txtKey.addEventListener(Event.CHANGE,this.toUpperCase);
      }
      
      public function checkKey(e:MouseEvent) : *
      {
         if(this.pnlKey.con.mcSerial.txtKey.text != "")
         {
            if(this.ck(this.pnlKey.con.mcSerial.txtKey.text) == true)
            {
               this.pnlKey.con.mcSerial.txtStat.text = "";
               this.pnlKey.con.mcSerial.visible = false;
               this._fernusKey = this.pnlKey.con.mcSerial.txtKey.text;
               this.correctKey();
            }
            else
            {
               this.pnlKey.con.mcSerial.txtStat.text = "Anahtar yanlış.";
            }
         }
      }
      
      public function correctKey() : *
      {
         var _ul:URLLoader = null;
         this.pnlKey.con.mcSerial.visible = false;
         this.pnlKey.con.bEnter.removeEventListener(MouseEvent.CLICK,this.checkKey);
         this.pnlKey.con.mcSerial.txtKey.removeEventListener(Event.CHANGE,this.toUpperCase);
         TweenMax.delayedCall(1,function():*
         {
            FileManager.deleteFileAsync(_tempPath + _soKXKKey,function():*
            {
               var _fm:FileManager = new FileManager();
               _fm.writeUTFFile(_tempPath + _soKXKKey,_fernusKey.toUpperCase());
            });
         });
         if(FileManager.exists(this._soKXKBlackKey))
         {
            _ul = new URLLoader();
            _ul.addEventListener(Event.COMPLETE,function(ev:*):*
            {
               var valueKey:String = ev.target.data;
               if(valueKey.toUpperCase() == _fernusKey)
               {
                  pnlKey.con.txtStat.text = "Girdiğiniz anahtar kod yasaklanmıştır. Lütfen yayıncı veya bayiniz ile irtibat kurunuz.";
                  pnlKey.con.bExit.addEventListener(MouseEvent.CLICK,exitApp);
                  pnlKey.con.bEnter.visible = false;
                  TweenMax.delayedCall(1.5,function():*
                  {
                     FileManager.deleteFile(_tempPath + _soKXKKey);
                  });
                  checkCenter();
               }
               else
               {
                  loadData();
               }
            });
            _ul.load(new URLRequest(new File(this._soKXKBlackKey).url));
         }
         else
         {
            this.loadData();
         }
      }
      
      public function loadData() : *
      {
         this.pnlKey.con.bExit.removeEventListener(MouseEvent.CLICK,this.exitApp);
         this.removeStage(this.pnlKey);
         this.openLoading();
         if(!new File(this._tempPath + "sysd.dll").exists)
         {
            this.warning("Bazı dosyalar eksik. Kitabı tekrar indirmeyi deneyin.");
            return;
         }
         this._urlLoader.addEventListener(Event.COMPLETE,this.xmlComplete);
         this._urlLoader.load(new URLRequest(new File(this._tempPath + "sysd.dll").url));
      }
      
      public function xmlComplete(e:Event) : void
      {
         var page:XML = null;
         var unitItem:XML = null;
         var selectItem:XML = null;
         var game:XML = null;
         var item:XML = null;
         var _file:File = null;
         var curtainItem:XML = null;
         var maskItem:XML = null;
         var _item:XML = null;
         var _obj:Object = null;
         var _r:XML = null;
         var _kk:* = new KK();
         var _w:* = _kk.fd1(e.target.data,"pub1isher1l0O");
         this._xml = new XML(_w);
         this._urlLoader.removeEventListener(Event.COMPLETE,this.xmlComplete);
         this._bookName = this._xml.settings.bookName;
         for each(page in this._xml.pages.page)
         {
            this._pages[this._int] = new Array();
            this._pages[this._int]["no"] = page.pageNum;
            this._pages[this._int]["content"] = page.pageCon;
            ++this._int;
         }
         this._int = 0;
         for each(unitItem in this._xml.units.anUnit)
         {
            this._empArray[this._int] = new unitButton();
            this._empArray[this._int].y = this._int * 35;
            this._empArray[this._int].name = "gp_" + unitItem.uSayfa;
            this._empArray[this._int].button_text.text = unitItem.uTanim;
            this._empArray[this._int].button_page.text = unitItem.uSayfa;
            this._empArray[this._int].addEventListener(MouseEvent.CLICK,this.unitClicked);
            this.objectCache(this._empArray[this._int]);
            this._unitHolder.unitMc.addChild(this._empArray[this._int]);
            ++this._int;
         }
         ScrollClass.add(this._unitHolder.unitMc,this._unitHolder.maske);
         if(this._int == 0)
         {
            this._unitHolder.durum.text = "Bu kitapta içindekiler kısmı bulunmamaktadır.";
            this._unitStatus = false;
         }
         this._jump = int(this._xml.settings.jump);
         this._zoomBg = this._xml.settings.zoomBgColor;
         this._zoomAlpha = this._xml.settings.zoomBgAlpha;
         this._snmName = this._bookName + "-snm";
         this._zoomBg = 0;
         this._zoomAlpha = 0.8;
         if(this._xml.settings.maskData == true)
         {
            this._maskChecker = true;
         }
         else
         {
            this._maskChecker = false;
         }
         this._int = 0;
         for each(selectItem in this._xml.selects.select)
         {
            this.selectItems[this._int] = new Array();
            this.selectItems[this._int]["page"] = int(selectItem.page) + this._jump;
            this.selectItems[this._int]["rect"] = new Rectangle(Number(selectItem.rect.split("/")[0].split(",")[0]),Number(selectItem.rect.split("/")[0].split(",")[1]),Number(selectItem.rect.split("/")[1].split(",")[0]),Number(selectItem.rect.split("/")[1].split(",")[1]));
            if(selectItem.hasOwnProperty("answer"))
            {
               this.selectItems[this._int]["answer"] = selectItem.answer;
            }
            this.selectItems[this._int]["imCoor"] = new Point(Number(selectItem.imCoor.split(",")[0]),Number(selectItem.imCoor.split(",")[1]));
            ++this._int;
         }
         this.selectItems[this._int] = new Array();
         this.selectItems[this._int]["im"] = new sIm();
         this.selectItems[this._int]["im"].visible = false;
         this.selectItems[this._int]["im"].mouseEnabled = false;
         this.selectItems[this._int]["im"].mouseChildren = false;
         this.selectItems[this._int]["im"].alpha = 0;
         this.selectItems[this._int]["im"].cacheAsBitmap = true;
         this.selectItems[this._int]["im"].name = "IM_" + this._int;
         this.selectItems[this._int]["rect"] = new Rectangle(25,25,300,300);
         this.selectItems[this._int]["imCoor"] = new Point(0,0);
         this.selectItems[this._int]["im"].addEventListener(MouseEvent.CLICK,this.autoSelect);
         if(this._int != 0)
         {
            this.selectItems[this._int]["page"] = int(selectItem.page) + this._jump;
         }
         else
         {
            this.selectItems[this._int]["page"] = 1;
         }
         if(0 < this._xml.curtain.length())
         {
            if(this._xml.curtain != "")
            {
               this.curtainItems = new Array();
               this._int = 0;
               for each(curtainItem in this._xml.curtain.item)
               {
                  this.curtainItems[this._int] = new Array();
                  this.curtainItems[this._int]["page"] = int(curtainItem.page) + this._jump;
                  this.curtainItems[this._int]["rect"] = new Rectangle(Number(curtainItem.rect.split("/")[0].split(",")[0]),Number(curtainItem.rect.split("/")[0].split(",")[1]),Number(curtainItem.rect.split("/")[1].split(",")[0]),Number(curtainItem.rect.split("/")[1].split(",")[1]));
                  ++this._int;
               }
            }
         }
         this._int = 0;
         if(this._maskChecker)
         {
            this._int = 0;
            for each(maskItem in this._xml.masks.mask)
            {
               this._masks[this._int] = new Array();
               this._masks[this._int]["page"] = int(maskItem.page) + this._jump;
               this._masks[this._int]["rect"] = new Rectangle(Number(maskItem.rect.split("/")[0].split(",")[0]),Number(maskItem.rect.split("/")[0].split(",")[1]),Number(maskItem.rect.split("/")[1].split(",")[0]),Number(maskItem.rect.split("/")[1].split(",")[1]));
               this._masks[this._int]["coor"] = new Point();
               this._masks[this._int]["coor"].x = maskItem.imCoor.split(",")[0];
               this._masks[this._int]["coor"].y = maskItem.imCoor.split(",")[1];
               ++this._int;
            }
         }
         if(this._maskChecker)
         {
            this._int = 0;
            this._aniMasks = new Array();
            for each(_item in this._xml.kry.item)
            {
               _obj = new Object();
               _obj.page = _item.@page;
               _obj.mc = new im_txt();
               _obj.mc.x = _item.@x;
               _obj.mc.y = _item.@y;
               _obj.mc.name = "kry_" + this._int.toString();
               _obj.num = 0;
               _obj.shapes = new Array();
               _obj.rects = new Array();
               for each(_r in _item.rect)
               {
                  _obj.rects.push(new Rectangle(_r.@x,_r.@y,_r.@width,_r.@height));
               }
               this._aniMasks[this._int] = _obj;
               ++this._int;
            }
         }
         this._int = 0;
         for each(game in this._xml.games.item)
         {
            if(!this._activities)
            {
               this._activities = new Array();
            }
            this._activities[this._int] = new Object();
            this._activities[this._int].page = int(game.page) + this._jump;
            this._activities[this._int].file = game.aFile;
            this._activities[this._int].type = game.aType;
            this._activities[this._int].x = game.coordinates.split(",")[0];
            this._activities[this._int].y = game.coordinates.split(",")[1];
            ++this._int;
         }
         this._int = 0;
         for each(item in this._xml.actions.item)
         {
            if(!this.pageItems[int(item.page) + this._jump])
            {
               this.pageItems[int(item.page) + this._jump] = new MovieClip();
            }
            this._conts[this._int] = new Array();
            switch(String(item.aType))
            {
               case "video":
                  this._conts[this._int]["im"] = new im_video();
                  this._conts[this._int]["im"].addEventListener(MouseEvent.CLICK,this._actionVideo);
                  this._conts[this._int]["source"] = item.aFile;
                  this._conts[this._int]["im"].name = "con_" + this._int;
                  break;
               case "app":
                  this._conts[this._int]["im"] = new im_app();
                  this._conts[this._int]["im"].addEventListener(MouseEvent.CLICK,this._actionApp);
                  this._conts[this._int]["source"] = item.aFile;
                  this._conts[this._int]["im"].name = "con_" + this._int;
                  break;
               case "answer_app":
                  this._conts[this._int]["im"] = new im_txt();
                  this._conts[this._int]["im"].addEventListener(MouseEvent.CLICK,this._actionApp);
                  this._conts[this._int]["source"] = item.aFile;
                  this._conts[this._int]["im"].name = "con_" + this._int;
                  break;
               case "sound":
                  this._conts[this._int]["im"] = new im_sound();
                  this._conts[this._int]["im"].addEventListener(MouseEvent.CLICK,this._actionSound);
                  this._conts[this._int]["source"] = item.aFile;
                  this._conts[this._int]["im"].name = "con_" + this._int;
                  break;
               case "image":
                  this._conts[this._int]["im"] = new im_photo();
                  this._conts[this._int]["im"].addEventListener(MouseEvent.CLICK,this._actionImage);
                  this._conts[this._int]["source"] = item.aFile;
                  this._conts[this._int]["im"].name = "con_" + this._int;
                  break;
               case "link":
                  this._conts[this._int]["im"] = new im_link();
                  this._conts[this._int]["im"].addEventListener(MouseEvent.CLICK,this._actionLink);
                  this._conts[this._int]["source"] = item.aFile;
                  this._conts[this._int]["im"].name = "con_" + this._int;
                  break;
               case "document":
                  this._conts[this._int]["im"] = new im_document();
                  this._conts[this._int]["im"].addEventListener(MouseEvent.CLICK,this._actionDoc);
                  this._conts[this._int]["source"] = item.aFile;
                  this._conts[this._int]["im"].name = "con_" + this._int;
                  break;
               case "answer":
                  this._conts[this._int]["im"] = new im_txt();
                  this._conts[this._int]["im"].cacheAsBitmap = true;
                  this._conts[this._int]["im"].addEventListener(MouseEvent.CLICK,this._actionText);
                  this._conts[this._int]["im"].name = "con_" + this._int;
                  this._conts[this._int]["source"] = item.aFile;
                  break;
               case "webvideo":
                  this._conts[this._int]["im"] = new im_webvideo();
                  this._conts[this._int]["im"].cacheAsBitmap = true;
                  this._conts[this._int]["im"].name = "con_" + this._int;
                  this._conts[this._int]["source"] = item.aFile;
                  break;
               case "html5":
                  this._conts[this._int]["im"] = new im_app();
                  this._conts[this._int]["im"].addEventListener(MouseEvent.CLICK,this._actionHtml5);
                  this._conts[this._int]["source"] = item.aFile;
                  this._conts[this._int]["im"].name = "con_" + this._int;
                  break;
            }
            if(this._conts[this._int]["im"])
            {
               if(item.hasOwnProperty("scale"))
               {
                  this._conts[this._int]["im"].scaleX = this._conts[this._int]["im"].scaleY = Number(item.scale);
               }
               this._conts[this._int]["page"] = int(item.page) + this._jump;
               this._conts[this._int]["im"].x = item.coordinates.split(",")[0];
               this._conts[this._int]["im"].y = item.coordinates.split(",")[1];
               this._conts[this._int]["im"].buttonMode = true;
               this.pageItems[int(item.page) + this._jump].addChild(this._conts[this._int]["im"]);
            }
            ++this._int;
         }
         this._soBookKXK = SharedObject.getLocal(this._pkxkname + this._bookName);
         this._cloudBase = this._cloudBase + "&book=" + this._bookName;
         if(this._operatingSystem == "windows")
         {
            _file = new File(this._mainFolderPath + this._pkxkname + "-" + this._bookName);
         }
         else
         {
            _file = new File(this._mainFolderPath + this._bookName);
         }
         if(!_file.exists)
         {
            _file.createDirectory();
         }
         this._assPath = _file.url + "/";
         VectorVideo.assPath = this._assPath;
         VVUploader.assPath = this._assPath;
         KXKDatabase.assPath = this._assPath;
         AHFileUploader.assPath = this._assPath;
         AHFileUploader.url = this._cloudBase;
         VVUploader.url = this._cloudBase;
         this.panelVideoSolution.urlBase = this._cloudBase;
         this._vectorVideo = new VectorVideo(this.panelVector,this.panelVectorVideoInfo,new Point(this._capX,this._capY - this._capYOffset));
         this._vectorVideo.showLoading = this.showLoadingText;
         this._vectorVideo.hideLoading = this.hideLoadingText;
         this._vectorVideo.onStarted = this.onStartedVV;
         this._vectorVideo.onWarning = this.warning;
         this._vectorVideo.onWarningClose = this.warningClose;
         this._vectorVideo.onConfirm = this.accountHandler;
         this._vectorVideo.onAsk = this.ask;
         KXKDatabase.addEventListener(Event.COMPLETE,this.checkzeng);
         KXKDatabase.initialize();
         this.sendLog();
         this.checkCenter();
      }
      
      public function checkzeng(e:Event) : *
      {
         KXKDatabase.removeEventListener(Event.COMPLETE,this.checkzeng);
         KXKDatabase.getEnrichmentData("xml",function(_d:*):*
         {
            if(_d)
            {
               xmlZeng = new XML(Base64.decode(_d[0].data));
               xmlCompleteZeng();
            }
            else
            {
               dataFunction(_bookdataName,loadMask,"sys1.dll");
            }
         });
      }
      
      public function xmlCompleteZeng(e:Event = null) : void
      {
         var itemSelect:XML = null;
         var item:XML = null;
         this.icn = 0;
         for each(itemSelect in this.xmlZeng.selects.select)
         {
            this._objZeng[this.icn][this._intZeng[this.icn]] = new Array();
            this._objZeng[this.icn][this._intZeng[this.icn]]["mc"] = new sIm();
            this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].cacheAsBitmap = true;
            this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].name = "im_" + this._nameInt + "_" + this.icn;
            this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].x = itemSelect.imCoor.split(",")[0];
            this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].y = itemSelect.imCoor.split(",")[1];
            this._objZeng[this.icn][this._intZeng[this.icn]]["pn"] = int(itemSelect.page);
            this._objZeng[this.icn][this._intZeng[this.icn]]["rc"] = new Rectangle(itemSelect.rect.split("/")[0].split(",")[0],itemSelect.rect.split("/")[0].split(",")[1],itemSelect.rect.split("/")[1].split(",")[0],itemSelect.rect.split("/")[1].split(",")[1]);
            if(!this._icnPage[int(itemSelect.page)])
            {
               this._icnPage[int(itemSelect.page)] = new MovieClip();
            }
            if(!this.pageItems[int(itemSelect.page)])
            {
               this.pageItems[int(itemSelect.page)] = new MovieClip();
            }
            this.pageItems[int(itemSelect.page)].addChild(this._objZeng[this.icn][this._intZeng[this.icn]]["mc"]);
            this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].addEventListener(MouseEvent.CLICK,this.autoSelectZeng);
            ++this.kayitB;
            ++this._nameInt;
            ++this._intZeng[this.icn];
         }
         for each(item in this.xmlZeng.actions.item)
         {
            if(item.aType == "image")
            {
               this.icn = 1;
               this._objZeng[this.icn][this._intZeng[this.icn]] = new Array();
               this._objZeng[this.icn][this._intZeng[this.icn]]["mc"] = new im_photo();
               this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].addEventListener(MouseEvent.CLICK,this._actionImage2);
            }
            if(item.aType == "sound")
            {
               this.icn = 2;
               this._objZeng[this.icn][this._intZeng[this.icn]] = new Array();
               this._objZeng[this.icn][this._intZeng[this.icn]]["mc"] = new im_sound();
               this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].addEventListener(MouseEvent.CLICK,this._actionSound2);
            }
            if(item.aType == "video")
            {
               this.icn = 3;
               this._objZeng[this.icn][this._intZeng[this.icn]] = new Array();
               this._objZeng[this.icn][this._intZeng[this.icn]]["mc"] = new im_video();
               this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].addEventListener(MouseEvent.CLICK,this._actionVideo2);
            }
            if(item.aType == "app")
            {
               this.icn = 4;
               this._objZeng[this.icn][this._intZeng[this.icn]] = new Array();
               this._objZeng[this.icn][this._intZeng[this.icn]]["mc"] = new im_app();
               this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].addEventListener(MouseEvent.CLICK,this._actionApp2);
            }
            if(item.aType == "document")
            {
               this.icn = 5;
               this._objZeng[this.icn][this._intZeng[this.icn]] = new Array();
               this._objZeng[this.icn][this._intZeng[this.icn]]["mc"] = new im_document();
               this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].addEventListener(MouseEvent.CLICK,this._actionDoc2);
            }
            if(item.aType == "link")
            {
               this.icn = 6;
               this._objZeng[this.icn][this._intZeng[this.icn]] = new Array();
               this._objZeng[this.icn][this._intZeng[this.icn]]["mc"] = new im_link();
               this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].addEventListener(MouseEvent.CLICK,this._actionLink2);
            }
            if(item.aType == "answer")
            {
               this.icn = 7;
               this._objZeng[this.icn][this._intZeng[this.icn]] = new Array();
               this._objZeng[this.icn][this._intZeng[this.icn]]["mc"] = new im_txt();
               this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].addEventListener(MouseEvent.CLICK,this._actionText2);
            }
            if(item.aType == "cloud")
            {
               this.icn = 8;
               this._objZeng[this.icn][this._intZeng[this.icn]] = new Array();
               this._objZeng[this.icn][this._intZeng[this.icn]]["mc"] = new im_eba();
               this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].addEventListener(MouseEvent.CLICK,this._actionEba2);
               this._objZeng[this.icn][this._intZeng[this.icn]]["type"] = item.@type;
               this._objZeng[this.icn][this._intZeng[this.icn]]["title"] = item.title;
               this._objZeng[this.icn][this._intZeng[this.icn]]["id"] = item.@id;
               this._objZeng[this.icn][this._intZeng[this.icn]]["online"] = item.@online;
               this._objZeng[this.icn][this._intZeng[this.icn]]["f"] = item.@f;
               this._objZeng[this.icn][this._intZeng[this.icn]]["p"] = item.@p;
               if(this._objZeng[this.icn][this._intZeng[this.icn]]["online"] == "true")
               {
                  this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].gotoAndStop(2);
               }
            }
            this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].cacheAsBitmap = true;
            this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].name = "im_" + this._nameInt + "_" + this.icn;
            this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].x = item.coordinates.split(",")[0];
            this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].y = item.coordinates.split(",")[1];
            this._objZeng[this.icn][this._intZeng[this.icn]]["pn"] = int(item.page);
            this._objZeng[this.icn][this._intZeng[this.icn]]["fl"] = item.aFile;
            if(!this._icnPage[int(item.page)])
            {
               this._icnPage[int(item.page)] = new MovieClip();
            }
            if(!this.pageItems[int(item.page)])
            {
               this.pageItems[int(item.page)] = new MovieClip();
            }
            this.pageItems[int(item.page)].addChild(this._objZeng[this.icn][this._intZeng[this.icn]]["mc"]);
            ++this.kayitB;
            ++this._nameInt;
            ++this._intZeng[this.icn];
         }
         this.dataFunction(this._bookdataName,this.loadMask,"sys1.dll");
      }
      
      public function dataFunction(_p:String, _f:Function, _fN:String) : void
      {
         var _swfLoader:* = undefined;
         if(!new File(this._tempPath + _p).exists)
         {
            this.warning("Bazı dosyalar eksik. Kitabı tekrar indirmeyi deneyin.");
            return;
         }
         try
         {
            _swfLoader = new BinaryDataLoader(new File(this._tempPath + _p).url,{
               "name":"swf",
               "autoPlay":false,
               "onComplete":function(e:LoaderEvent):*
               {
                  var _kry:* = new KrySWFCrypto();
                  _fileManager = new FileManager();
                  _fileManager.addEventListener(Event.COMPLETE,_f);
                  _fileManager.writeFile(File.applicationStorageDirectory.resolvePath(_fN).url,_kry.decrypte(_swfLoader.content,_kkObject));
                  _swfLoader.dispose(true);
                  _swfLoader = null;
               }
            });
            _swfLoader.load(true);
         }
         catch(e:*)
         {
         }
      }
      
      public function loadMask(e:Event) : void
      {
         if(this._maskChecker)
         {
            this.dataFunction(this._maskdataName,this.maskSwfWriteComplete,"sys2.dll");
         }
         else
         {
            this.maskSwfWriteComplete();
         }
      }
      
      public function maskSwfWriteComplete(e:Event = null) : *
      {
         var _lc:LoaderContext = new LoaderContext(true,new ApplicationDomain(),SecurityDomain.currentDomain);
         this._queue = new LoaderMax({
            "name":"mainQueue",
            "context":_lc,
            "onComplete":this.bookLoadingCompleted
         });
         this._queue.append(new SWFLoader(File.applicationStorageDirectory.resolvePath("sys1.dll").url,{
            "name":"bookdata",
            "autoPlay":false
         }));
         if(this._maskChecker)
         {
            this._queue.append(new SWFLoader(File.applicationStorageDirectory.resolvePath("sys2.dll").url,{
               "name":"maskdata",
               "autoPlay":false
            }));
         }
         this._queue.load(true);
      }
      
      public function bookLoadingCompleted(e:LoaderEvent = null) : void
      {
         var key3:String = null;
         this._book = this._queue.getContent("bookdata").rawContent;
         if(this._maskChecker)
         {
            this._maskBook = this._queue.getContent("maskdata").rawContent;
            this._maskBook.mask = this._maskLayer;
         }
         if(File.applicationStorageDirectory.resolvePath("sys1.dll").exists)
         {
            File.applicationStorageDirectory.resolvePath("sys1.dll").deleteFile();
         }
         if(File.applicationStorageDirectory.resolvePath("sys2.dll").exists)
         {
            File.applicationStorageDirectory.resolvePath("sys2.dll").deleteFile();
         }
         this.removeStage(this.mcLoading);
         this.align();
         this._int = 0;
         this._num = this._book.totalFrames;
         while(this._int < this._num)
         {
            ++this._int;
            this.drawAreas[this._int] = new Sprite();
            this.drawAreas[this._int].graphics.clear();
            this.drawAreas[this._int].graphics.beginFill(16777215,0.01);
            this.drawAreas[this._int].graphics.drawRect(0,0,this._book.width,this._book.height);
            this.drawAreas[this._int].graphics.endFill();
            this.guncelNotlar[this._int] = new int();
            this.drawAreas2[this._int] = new Array();
            this.noteSizes[this._int] = new Array();
            this.drawAreas2[this._int][0] = new Sprite();
            this.drawAreas2[this._int][0].graphics.clear();
            this.drawAreas2[this._int][0].graphics.beginFill(16777215,0.01);
            this.drawAreas2[this._int][0].graphics.drawRect(0,0,300,650);
            this.drawAreas2[this._int][0].graphics.endFill();
            this.noteSizes[this._int][0] = new Point();
            this.noteSizes[this._int][0].x = 300;
            this.noteSizes[this._int][0].y = 650;
         }
         for(this._int = 1; this._int < this._book.totalFrames - this._jump + 1; ++this._int)
         {
            if(this._maskChecker)
            {
               for(key3 in this._aniMasks)
               {
                  if(this._aniMasks[key3].page == this._int + this._jump)
                  {
                     if(!this.pageItems[this._int + this._jump])
                     {
                        this.pageItems[this._int + this._jump] = new MovieClip();
                     }
                     this.pageItems[this._int + this._jump].addChild(this._aniMasks[key3].mc);
                     this._aniMasks[key3].mc.addEventListener(MouseEvent.CLICK,this.openMaskAni);
                  }
               }
            }
         }
         this.mcEraser.width = this.mcEraser.height = 10;
         this.mcEraser.x = this.mcEraser.y = 100;
         this._canvas.addChild(this._book);
         if(this._maskChecker)
         {
            this._canvas.addChild(this._maskBook);
            this._canvas.addChild(this._maskLayer);
         }
         this._canvas.addChild(this._blankWhite);
         this._canvas.addChild(this._white);
         this._canvas.addChild(this.tempLayer);
         this._canvas.addChild(this._inputLayer);
         this._canvas.addChild(this.itemMc);
         this._canvas.addChild(this.mcEraser);
         this._canvas.addChild(this.itemMask);
         this._note.tempLayer2.addChild(this.mcEraser2);
         this.mcEraser2.visible = false;
         this.footer.nPage.addEventListener(MouseEvent.CLICK,this._nextPage);
         this.footer.pPage.addEventListener(MouseEvent.CLICK,this._previousPage);
         this.toolBar.nPage.addEventListener(MouseEvent.CLICK,this._nextPage);
         this.toolBar.pPage.addEventListener(MouseEvent.CLICK,this._previousPage);
         this.toolBar.btnMode.mcicon.gotoAndStop(2);
         this.toolBar.btnMode.mcTxt.text = "İŞLEMSEL";
         this.trs.enabled = true;
         this.goActiveTool(4);
         this.activated(this.toolBar.btnMove);
         this.openAllEvent();
         this.addStage(this._canvas);
         this.addStage(this._curtain);
         this.addStage(this.panelCast);
         this.addStage(this.toolBar);
         this.addStage(this._unitHolder);
         this.addStage(this.panelChronometer);
         this.addStage(this.panelStudent);
         this.addStage(this.panelNums);
         this.addStage(this.calcPanel);
         this.addStage(this.preRecordPanel);
         this.addStage(this.panelVector);
         this.addStage(this.footer);
         this.addStage(this.sidePanel);
         if(this._fSnm == "snm")
         {
            this.btnSnm.visible = true;
            this.btnSnm.addEventListener(MouseEvent.CLICK,this.openSnm);
            this.addStage(this.btnSnm);
         }
         else
         {
            this.btnSnm.visible = false;
         }
         this._pageValue = 1;
         if(this._soBookKXK.data.pageHistory)
         {
            this._pageValue = this._soBookKXK.data.pageHistory;
         }
         this.goToThePage(this._pageValue);
         this.openPageNote();
         this.checkOnlineEnrichment();
         this.checkSavedTextfields();
         this.checkBanner();
         this.checkBookUpdate();
         this.checkAutoLogin();
         if(0 < this._xml.settings.extract.length())
         {
            if(this._xml.settings.extract != "")
            {
               this.unzipFile(this._tempPath + this._xml.settings.extract,this._tempPath);
            }
         }
         this._xml = null;
         KXKDatabase.get_background(function(_d:*):*
         {
            var _mainBgIndex:* = undefined;
            if(_d)
            {
               _mainBgIndex = int(_d[0].data);
               panelBG.con.thumbs.mc.x = DisplayObject(panelBG.con.thumbs.getChildAt(_mainBgIndex - 1)).x;
               panelBG.con.thumbs.mc.y = DisplayObject(panelBG.con.thumbs.getChildAt(_mainBgIndex - 1)).y;
               mcBg.gotoAndStop(_mainBgIndex);
            }
         });
         stage.addEventListener(KeyboardEvent.KEY_UP,this.stage_keyboard);
      }
      
      public function stage_keyboard(e:KeyboardEvent) : void
      {
         var key1:* = undefined;
         if(e.keyCode == Keyboard.LEFT || e.keyCode == Keyboard.DOWN || e.keyCode == Keyboard.PAGE_UP)
         {
            this._previousPage();
         }
         else if(e.keyCode == Keyboard.RIGHT || e.keyCode == Keyboard.UP || e.keyCode == Keyboard.PAGE_DOWN)
         {
            this._nextPage();
         }
         else if(e.keyCode == Keyboard.F5)
         {
            if(!this.zenbB && !this._inputTextStatus && !this._ahSelectStatus)
            {
               for(key1 in this.selectItems)
               {
                  if(int(key1) != this.selectItems.length - 1)
                  {
                     if(this.selectItems[key1]["page"] == this.guncelSayfa && this.selectItems[key1]["im"])
                     {
                        this.selectItems[key1]["im"].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                        break;
                     }
                  }
               }
            }
         }
         else if(e.keyCode == Keyboard.ESCAPE || e.keyCode == Keyboard.B)
         {
            if(this.isIm && this.footer.closeZoom.visible)
            {
               this._closeZoom();
            }
         }
      }
      
      public function _actionHtml5(e:MouseEvent) : void
      {
         var _zip:String = null;
         _zip = String(this._conts[e.currentTarget.name.split("_")[1]]["source"]);
         this.unzipFile(this._tempPath + _zip,this._tempPath,function():*
         {
            new File(_tempPath + _zip.split(".zip")[0] + "/index.html").openWithDefaultApplication();
         });
      }
      
      public function createMasks(rect:Rectangle) : *
      {
         this._masks[this._nameStr]["shape"] = new Shape();
         this._masks[this._nameStr]["shape"].graphics.beginFill(16711680,0);
         this._masks[this._nameStr]["shape"].graphics.drawRect(rect.x,rect.y,rect.width,rect.height);
         this._masks[this._nameStr]["shape"].graphics.endFill();
         this._maskLayer.addChild(this._masks[this._nameStr]["shape"]);
      }
      
      public function openMask(e:MouseEvent) : *
      {
         this._nameStr = e.currentTarget.name.split("_")[1];
         if(!this._masks[this._nameStr]["stat"])
         {
            this.objectTint(this._masks[this._nameStr]["im"],0);
            this._masks[this._nameStr]["stat"] = true;
            this.createMasks(this._masks[this._nameStr]["rect"]);
         }
         else
         {
            this.stopColorize(this._masks[this._nameStr]["im"]);
            this._masks[this._nameStr]["stat"] = false;
            this._masks[this._nameStr]["shape"].graphics.clear();
         }
      }
      
      public function openMaskAni(e:MouseEvent) : *
      {
         this.closeAniPanel();
         this._currAniObject = this._aniMasks[e.currentTarget.name.split("_")[1]];
         this.objectTint(this._currAniObject.mc,0);
         if(this.isIm)
         {
            this.stageCoor(this.mcAniPanel,this._capX / 2,this.footer.closeZoom.y - this.mcAniPanel.height - 10);
         }
         else
         {
            this.stageCoor(this.mcAniPanel,(this._capX - this.mcAniPanel.width) / 2,this.footer.closeZoom.y - this.mcAniPanel.height - 10);
         }
         this.addStage(this.mcAniPanel);
         this.mcAniPanel.visible = true;
         this.updateButtons();
         this.mcAniPanel.btnMove.addEventListener(MouseEvent.MOUSE_DOWN,this.startDragAniPanel);
         this.mcAniPanel.btnClose.addEventListener(MouseEvent.CLICK,this.closeAniPanel);
         this.mcAniPanel.btnNext.addEventListener(MouseEvent.CLICK,this.controlMaskAni);
         this.mcAniPanel.btnPrevious.addEventListener(MouseEvent.CLICK,this.controlMaskAni);
         this.mcAniPanel.btnShow.addEventListener(MouseEvent.CLICK,this.controlMaskAni);
      }
      
      public function closeAniPanel(e:MouseEvent = null) : *
      {
         this.mcAniPanel.btnMove.removeEventListener(MouseEvent.MOUSE_DOWN,this.startDragAniPanel);
         this.mcAniPanel.btnClose.removeEventListener(MouseEvent.CLICK,this.closeAniPanel);
         this.mcAniPanel.btnNext.removeEventListener(MouseEvent.CLICK,this.controlMaskAni);
         this.mcAniPanel.btnPrevious.removeEventListener(MouseEvent.CLICK,this.controlMaskAni);
         this.mcAniPanel.btnShow.removeEventListener(MouseEvent.CLICK,this.controlMaskAni);
         if(this._currAniObject)
         {
            this.stopColorize(this._currAniObject.mc);
         }
         this._currAniObject = null;
         this.mcAniPanel.visible = false;
      }
      
      public function controlMaskAni(e:MouseEvent) : *
      {
         switch(e.currentTarget.name)
         {
            case "btnNext":
               if(this._currAniObject.rects.length != this._currAniObject.num)
               {
                  this.nextMaskAni();
               }
               break;
            case "btnPrevious":
               if(0 != this._currAniObject.num)
               {
                  this.previousMaskAni();
               }
               break;
            case "btnShow":
               this.showAllMaskAni();
         }
         this.updateButtons();
      }
      
      public function nextMaskAni() : *
      {
         var _s:Shape = this.drawRectangle(this._currAniObject.rects[this._currAniObject.num]);
         this._currAniObject.shapes.push(_s);
         this._maskLayer.addChild(_s);
         this.updateButtons();
         ++this._currAniObject.num;
      }
      
      public function previousMaskAni() : *
      {
         --this._currAniObject.num;
         this._maskLayer.removeChild(this._currAniObject.shapes[this._currAniObject.num]);
         this._currAniObject.shapes.pop();
         this.updateButtons();
      }
      
      public function showAllMaskAni() : *
      {
         var i:int = 0;
         var k:int = 0;
         if(this.mcAniPanel.btnShow.txt.text == "Tümünü Göster")
         {
            for(i = this._currAniObject.num; i < this._currAniObject.rects.length; i++)
            {
               this.nextMaskAni();
            }
         }
         else
         {
            for(k = this._currAniObject.num - 1; -1 < k; k--)
            {
               this.previousMaskAni();
            }
         }
      }
      
      public function updateButtons() : *
      {
         if(this._currAniObject.rects.length == this._currAniObject.num)
         {
            this.mcAniPanel.btnNext.alpha = 0.5;
            this.mcAniPanel.btnNext.removeEventListener(MouseEvent.CLICK,this.controlMaskAni);
         }
         else
         {
            this.mcAniPanel.btnNext.alpha = 1;
            this.mcAniPanel.btnNext.addEventListener(MouseEvent.CLICK,this.controlMaskAni);
         }
         if(0 == this._currAniObject.num)
         {
            this.mcAniPanel.btnPrevious.alpha = 0.5;
            this.mcAniPanel.btnPrevious.removeEventListener(MouseEvent.CLICK,this.controlMaskAni);
         }
         else
         {
            this.mcAniPanel.btnPrevious.alpha = 1;
            this.mcAniPanel.btnPrevious.addEventListener(MouseEvent.CLICK,this.controlMaskAni);
         }
         if(this._currAniObject.rects.length == this._currAniObject.num)
         {
            this.mcAniPanel.btnShow.txt.text = "Tümünü Kapat";
         }
         else
         {
            this.mcAniPanel.btnShow.txt.text = "Tümünü Göster";
         }
      }
      
      public function drawRectangle(_r:Rectangle) : Shape
      {
         var _s:Shape = new Shape();
         _s.graphics.beginFill(16711680,0);
         _s.graphics.drawRect(_r.x,_r.y,_r.width,_r.height);
         _s.graphics.endFill();
         return _s;
      }
      
      public function startDragAniPanel(e:MouseEvent) : *
      {
         this.mcAniPanel.btnMove.removeEventListener(MouseEvent.MOUSE_DOWN,this.startDragAniPanel);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.stopDragAniPanel);
         this.mcAniPanel.startDrag();
         this.addStage(this.mcAniPanel);
      }
      
      public function stopDragAniPanel(e:MouseEvent) : *
      {
         this.mcAniPanel.btnMove.addEventListener(MouseEvent.MOUSE_DOWN,this.startDragAniPanel);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.stopDragAniPanel);
         this.mcAniPanel.stopDrag();
      }
      
      public function _fernusColorPicker(e:MouseEvent) : void
      {
         if(this.toolBar.fernusColorPalette.visible)
         {
            this.toolBar.fernusColorPalette.visible = false;
            this.toolBar.fernusColorPalette.removeEventListener(MouseEvent.CLICK,this._fernusColorPalette);
         }
         else
         {
            this.toolBar.fernusColorPalette.visible = true;
            this.toolBar.fernusColorPalette.addEventListener(MouseEvent.CLICK,this._fernusColorPalette);
         }
         this.toolBar.fernusLinePalette.visible = false;
         this.toolBar.fernusGrapsPalette.visible = false;
         this.playSound("b");
      }
      
      public function _fernusColorPalette(e:MouseEvent) : void
      {
         if(e.target.parent.name.split("_")[1])
         {
            this.toolBar.fernusColorPalette.removeEventListener(MouseEvent.CLICK,this._fernusColorPalette);
            this.activeColor = uint("0x" + e.target.parent.name.split("_")[1]);
            this.myColorTransform.color = this.activeColor;
            this.toolBar.fernusColorPicker.mcicon.pickedColor.transform.colorTransform = this.myColorTransform;
            this.toolBar.fernusColorPalette.visible = false;
            this.playSound("b");
         }
         else
         {
            this.toolBar.fernusColorPalette.visible = false;
         }
      }
      
      public function _fernusLinePicker(e:MouseEvent) : void
      {
         if(this.toolBar.fernusLinePalette.visible)
         {
            this.toolBar.fernusLinePalette.visible = false;
            this.toolBar.fernusLinePalette.removeEventListener(MouseEvent.CLICK,this._fernusLinePalette);
         }
         else
         {
            this.toolBar.fernusLinePalette.visible = true;
            this.toolBar.fernusLinePalette.addEventListener(MouseEvent.CLICK,this._fernusLinePalette);
         }
         this.toolBar.fernusGrapsPalette.visible = false;
         this.toolBar.fernusColorPalette.visible = false;
         this.playSound("b");
      }
      
      public function _fernusLinePalette(e:MouseEvent) : void
      {
         if(e.target.parent.name.split("_")[1])
         {
            this.toolBar.fernusLinePalette.removeEventListener(MouseEvent.CLICK,this._fernusLinePalette);
            if(Number(e.target.parent.name.split("_")[1]) == 1)
            {
               this.activeLineWidth = 0.5;
            }
            else
            {
               this.activeLineWidth = Number(e.target.parent.name.split("_")[1]) - 1;
            }
            this.toolBar.fernusLinePicker.mcicon.lineCircle.width = this.toolBar.fernusLinePicker.mcicon.lineCircle.height = Number(e.target.parent.name.split("_")[1]) * 3;
            this.toolBar.fernusLinePalette.visible = false;
            this.playSound("b");
         }
         else
         {
            this.toolBar.fernusLinePalette.visible = false;
         }
      }
      
      public function _btnGraps(e:MouseEvent) : void
      {
         if(this.toolBar.fernusGrapsPalette.visible)
         {
            this.toolBar.fernusGrapsPalette.visible = false;
            this.toolBar.fernusGrapsPalette.removeEventListener(MouseEvent.CLICK,this._fernusGrapsPalette);
         }
         else
         {
            this.toolBar.fernusGrapsPalette.visible = true;
            this.toolBar.fernusGrapsPalette.addEventListener(MouseEvent.CLICK,this._fernusGrapsPalette);
         }
         this.toolBar.fernusLinePalette.visible = false;
         this.toolBar.fernusColorPalette.visible = false;
         this.playSound("b");
      }
      
      public function _fernusGrapsPalette(e:MouseEvent) : void
      {
         this.toolBar.fernusGrapsPalette.removeEventListener(MouseEvent.CLICK,this._fernusGrapsPalette);
         this.toolBar.fernusGrapsPalette.visible = false;
         if(Number(e.target.parent.name.split("_")[1]))
         {
            this.openGraps(MovieClip(e.target.parent));
         }
         this.playSound("b");
      }
      
      public function openGraps(o:MovieClip) : *
      {
         this.trs.enabled = false;
         this.goActiveTool(o.name.split("_")[1]);
         this.activated(this.toolBar.btnGraps);
         this.toolBar.btnGraps.mcicon.maske.gotoAndStop(2);
         this.toolBar.btnGraps.mcicon.gotoAndStop(o.name.split("_")[2]);
      }
      
      public function _btnMove(e:MouseEvent) : void
      {
         this.activated(e.currentTarget);
         this.toolBar.fernusColorPalette.visible = false;
         this.toolBar.fernusLinePalette.visible = false;
         this.toolBar.fernusGrapsPalette.visible = false;
         if(!this.trs.enabled)
         {
            this.trs.enabled = true;
            this.goActiveTool(4);
         }
         this.kapKontrol();
         this.closeBtnLock();
      }
      
      public function _zoomIn(e:MouseEvent) : void
      {
         if(this.isIm && this.imMode == 0)
         {
            this.changeImPercent("in");
            return;
         }
         this._empPoint.x = this._canvas.width;
         this._empPoint.y = this._canvas.height;
         this._canvas.height *= 1.2;
         this._canvas.scaleX = this._canvas.scaleY;
         this._canvas.x -= (this._canvas.width - this._empPoint.x) / 2;
         this._canvas.y -= (this._canvas.height - this._empPoint.y) / 2;
         this.openCloseZoom(true);
         this.playSound("b");
         this.closeBtnLock();
      }
      
      public function _zoomOut(e:MouseEvent) : void
      {
         if(this.isIm && this.imMode == 0)
         {
            this.changeImPercent("out");
            return;
         }
         this._empPoint.x = this._canvas.width;
         this._empPoint.y = this._canvas.height;
         this._canvas.height /= 1.2;
         this._canvas.scaleX = this._canvas.scaleY;
         this._canvas.x -= (this._canvas.width - this._empPoint.x) / 2;
         this._canvas.y -= (this._canvas.height - this._empPoint.y) / 2;
         this.openCloseZoom(true);
         this.playSound("b");
         this.closeBtnLock();
      }
      
      public function _btnBrush(e:MouseEvent) : void
      {
         this.trs.enabled = false;
         this.goActiveTool(1);
         this.activated(e.currentTarget);
      }
      
      public function _btnLine(e:MouseEvent) : void
      {
         this.trs.enabled = false;
         this.goActiveTool(2);
         this.activated(e.currentTarget);
      }
      
      public function _btnSelect(e:MouseEvent) : void
      {
         this.trs.enabled = false;
         this.goActiveTool(8);
         this._closeZoom();
         this.activated(e.currentTarget);
      }
      
      public function _btnMark(e:MouseEvent) : void
      {
         this.trs.enabled = false;
         this.goActiveTool(9);
         this.activated(e.currentTarget);
      }
      
      public function _btnErase(e:MouseEvent) : void
      {
         this.trs.enabled = false;
         this.goActiveTool(7);
         this.activated(e.currentTarget);
      }
      
      public function activated(o:Object) : *
      {
         this.stopColorize(this.toolBar.btnBrush);
         this.stopColorize(this.toolBar.zoomTool.btnSelect);
         this.stopColorize(this.toolBar.btnMark);
         this.stopColorize(this.toolBar.btnErase);
         this.stopColorize(this.toolBar.btnGraps);
         this.stopColorize(this.toolBar.btnMove);
         this.toolBar.btnGraps.mcicon.gotoAndStop(1);
         this.toolBar.btnGraps.mcicon.maske.gotoAndStop(1);
         this.colorize(o,this._overColor);
         this.playSound("b");
      }
      
      public function goActiveTool(tId:int) : void
      {
         this.toolBar.fernusColorPalette.visible = false;
         this.toolBar.fernusLinePalette.visible = false;
         this.toolBar.fernusGrapsPalette.visible = false;
         if(tId == 1)
         {
            this._canvas.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartDraw);
            this._note.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartDraw2);
         }
         else
         {
            this._canvas.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartDraw);
            this._note.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartDraw2);
         }
         if(tId == 2)
         {
            this._canvas.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartLine);
            this._note.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartLine2);
         }
         else
         {
            this._canvas.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartLine);
            this._note.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartLine2);
         }
         if(tId == 3)
         {
            this._canvas.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartCircle);
            this._note.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartCircle2);
         }
         else
         {
            this._canvas.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartCircle);
            this._note.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartCircle2);
         }
         if(tId == 5)
         {
            this._canvas.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartSquare);
            this._note.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartSquare2);
         }
         else
         {
            this._canvas.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartSquare);
            this._note.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartSquare2);
         }
         if(tId == 6)
         {
            this._canvas.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartArrow);
            this._note.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartArrow2);
         }
         else
         {
            this._canvas.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartArrow);
            this._note.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartArrow2);
         }
         if(tId == 7)
         {
            this._canvas.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartErase);
            this._note.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartErase2);
         }
         else
         {
            this._canvas.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartErase);
            this._note.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartErase2);
         }
         if(tId == 8)
         {
            this._canvas.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartSelect);
         }
         else
         {
            this._canvas.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartSelect);
         }
         if(tId == 9)
         {
            this._canvas.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartMark);
            this._note.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartMark2);
         }
         else
         {
            this._canvas.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartMark);
            this._note.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartMark2);
         }
         if(tId == 10)
         {
            this._canvas.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartTriangle);
            this._note.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartTriangle2);
         }
         else
         {
            this._canvas.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartTriangle);
            this._note.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartTriangle2);
         }
         this.activeTool = tId;
      }
      
      public function simplify(o:Object, q1:Number, q2:Number) : *
      {
         var lookAhead:* = 1;
         var tolerance:* = 2;
         var simplifiedLine:* = this.lineGeneral.simplifyLang(lookAhead,tolerance,this.lastLine);
         this.lastLine = simplifiedLine;
         o.graphics.clear();
         o.graphics.lineStyle(this.activeLineWidth * q1,this.activeColor,q2);
         var spline:CatmullRomSpline = new CatmullRomSpline(this.lastLine);
         var approxDist:* = 5;
         var points:* = spline.getAllPoints(approxDist);
         o.graphics.moveTo(points[0].x,points[0].y);
         for(var i:* = 1; i < points.length; i++)
         {
            o.graphics.lineTo(points[i].x,points[i].y);
         }
      }
      
      public function onFrame(e:MouseEvent) : void
      {
         this.currentPoint = new Point(this._canvas.mouseX,this._canvas.mouseY);
         this.currentPoint = new Point(this.currentPoint.x,this.lastPoint.y + (this.currentPoint.y - this.lastPoint.y) * 0.5);
         if(this.isDrawing && this._canvas.hitTestPoint(mouseX,mouseY,true))
         {
            var _loc2_:* = this.sayac++;
            this.pointler[_loc2_] = {
               "x":this.currentPoint.x,
               "y":this.currentPoint.y
            };
            this.brushAreas[this.brushLayer].graphics.lineTo(this.currentPoint.x,this.currentPoint.y);
            this.lastPoint = this.currentPoint;
            if(this._vectorVideo.status)
            {
               this._vectorVideo.actObject.points.push(this._canvas.localToGlobal(new Point(this.currentPoint.x,this.currentPoint.y)));
            }
         }
      }
      
      public function onStartDraw(e:MouseEvent) : void
      {
         this._canvas.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartDraw);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onStopDraw);
         if(!this.isDrawing && this._canvas.hitTestPoint(mouseX,mouseY,true))
         {
            this.degisiklikKontrol();
            this.pointler = [];
            this.sayac = 0;
            ++this.brushLayer;
            if(this.isIm && this.imMode == 0)
            {
               this.silinecek.push(this.brushLayer);
            }
            this.brushAreas[this.brushLayer] = new Sprite();
            this.drawAreas[this.guncelSayfa].addChild(this.brushAreas[this.brushLayer]);
            this.brushAreas[this.brushLayer].graphics.lineStyle(this.activeLineWidth,this.activeColor,1);
            this.isDrawing = true;
            this.lastPoint = new Point(this._canvas.mouseX,this._canvas.mouseY);
            var _loc2_:* = this.sayac++;
            this.pointler[_loc2_] = {
               "x":this._canvas.mouseX,
               "y":this._canvas.mouseY
            };
            this.brushAreas[this.brushLayer].graphics.moveTo(this.lastPoint.x,this.lastPoint.y);
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onFrame);
            if(this._vectorVideo.status)
            {
               this._vectorVideo.actObject = new ActObject();
               this.currentPoint = new Point(this._canvas.mouseX,this._canvas.mouseY);
               this._vectorVideo.actObject.points.push(this._canvas.localToGlobal(new Point(this.currentPoint.x,this.currentPoint.y)));
               this._vectorVideo.actObject.startTime = this._vectorVideo.time;
            }
         }
      }
      
      public function onStopDraw(e:MouseEvent) : void
      {
         this._canvas.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartDraw);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStopDraw);
         this.isDrawing = false;
         if(this._canvas.hitTestPoint(mouseX,mouseY,true))
         {
            this.currentPoint = new Point(this._canvas.mouseX,this._canvas.mouseY);
            if(this.currentPoint.x == this.lastPoint.x && this.currentPoint.y == this.lastPoint.y)
            {
               this.currentPoint.x += 0.2;
               this.brushAreas[this.brushLayer].graphics.lineTo(this.currentPoint.x,this.currentPoint.y);
            }
            else
            {
               this.lastLine = this.pointler;
               this.simplify(this.brushAreas[this.brushLayer],1,1);
            }
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onFrame);
            this.sendData(false);
            if(this._vectorVideo.status)
            {
               this._vectorVideo.actObject.id = this._vectorVideo.getID();
               this._vectorVideo.actObject.points.push(this._canvas.localToGlobal(new Point(this.currentPoint.x,this.currentPoint.y)));
               this._vectorVideo.actObject.type = ActObject.TYPE_LINE;
               this._vectorVideo.actObject.duration = this._vectorVideo.time - this._vectorVideo.actObject.startTime;
               this._vectorVideo.actObject.size = this.activeLineWidth * this._canvas.scaleX;
               this._vectorVideo.actObject.color = "0x" + this.activeColor.toString(16);
               this._vectorVideo.actObject.sprite = this.brushAreas[this.brushLayer];
               this._vectorVideo.addAct();
            }
         }
      }
      
      public function onMarkFrame(e:MouseEvent) : void
      {
         this.currentPoint = new Point(this._canvas.mouseX,this._canvas.mouseY);
         this.currentPoint = new Point(this.currentPoint.x,this.lastPoint.y + (this.currentPoint.y - this.lastPoint.y) * 0.5);
         if(this.isMarking && this._canvas.hitTestPoint(mouseX,mouseY,true))
         {
            var _loc2_:* = this.sayac++;
            this.pointler[_loc2_] = {
               "x":this.currentPoint.x,
               "y":this.currentPoint.y
            };
            this.brushAreas[this.brushLayer].graphics.lineTo(this.currentPoint.x,this.currentPoint.y);
            this.lastPoint = this.currentPoint;
            if(this._vectorVideo.status)
            {
               this._vectorVideo.actObject.points.push(this._canvas.localToGlobal(new Point(this.currentPoint.x,this.currentPoint.y)));
            }
         }
      }
      
      public function onStartMark(e:MouseEvent) : void
      {
         this._canvas.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartMark);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onStopMark);
         if(!this.isMarking && this._canvas.hitTestPoint(mouseX,mouseY,true))
         {
            this.degisiklikKontrol();
            this.pointler = [];
            this.sayac = 0;
            ++this.brushLayer;
            if(this.isIm && this.imMode == 0)
            {
               this.silinecek.push(this.brushLayer);
            }
            this.brushAreas[this.brushLayer] = new Sprite();
            this.drawAreas[this.guncelSayfa].addChild(this.brushAreas[this.brushLayer]);
            this.brushAreas[this.brushLayer].graphics.lineStyle(this.activeLineWidth * 5,this.activeColor,0.3);
            this.isMarking = true;
            this.lastPoint = new Point(this._canvas.mouseX,this._canvas.mouseY);
            this.brushAreas[this.brushLayer].graphics.moveTo(this.lastPoint.x,this.lastPoint.y);
            var _loc2_:* = this.sayac++;
            this.pointler[_loc2_] = {
               "x":this._canvas.mouseX,
               "y":this._canvas.mouseY
            };
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMarkFrame);
            if(this._vectorVideo.status)
            {
               this._vectorVideo.actObject = new ActObject();
               this.currentPoint = new Point(this._canvas.mouseX,this._canvas.mouseY);
               this._vectorVideo.actObject.points.push(this._canvas.localToGlobal(new Point(this.currentPoint.x,this.currentPoint.y)));
               this._vectorVideo.actObject.startTime = this._vectorVideo.time;
            }
         }
      }
      
      public function onStopMark(e:MouseEvent) : void
      {
         this._canvas.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartMark);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStopMark);
         this.currentPoint = new Point(this._canvas.mouseX,this._canvas.mouseY);
         this.isMarking = false;
         if(this._canvas.hitTestPoint(mouseX,mouseY,true))
         {
            if(this.currentPoint.x == this.lastPoint.x && this.currentPoint.y == this.lastPoint.y)
            {
               this.currentPoint.x += 0.2;
               this.brushAreas[this.brushLayer].graphics.lineTo(this.currentPoint.x,this.currentPoint.y);
            }
            else
            {
               this.lastLine = this.pointler;
               this.simplify(this.brushAreas[this.brushLayer],5,0.3);
            }
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMarkFrame);
            this.sendData(false);
            if(this._vectorVideo.status)
            {
               this._vectorVideo.actObject.id = this._vectorVideo.getID();
               this._vectorVideo.actObject.points.push(this._canvas.localToGlobal(new Point(this.currentPoint.x,this.currentPoint.y)));
               this._vectorVideo.actObject.type = ActObject.TYPE_LINE;
               this._vectorVideo.actObject.duration = this._vectorVideo.time - this._vectorVideo.actObject.startTime;
               this._vectorVideo.actObject.size = this.activeLineWidth * this._canvas.scaleX * 5;
               this._vectorVideo.actObject.color = "0x" + this.activeColor.toString(16);
               this._vectorVideo.actObject.highlight = true;
               this._vectorVideo.actObject.sprite = this.brushAreas[this.brushLayer];
               this._vectorVideo.addAct();
            }
         }
      }
      
      public function lineOnFrame(e:MouseEvent) : void
      {
         if(this.isLineDrawing && this._canvas.hitTestPoint(mouseX,mouseY,true))
         {
            this.tempShape.graphics.clear();
            this.tempShape.graphics.lineStyle(this.activeLineWidth,this.activeColor,1,true,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
            this.tempShape.graphics.moveTo(this.startPoint.x,this.startPoint.y);
            this.tempShape.graphics.lineTo(this._canvas.mouseX,this._canvas.mouseY);
            this._canvas.addChild(this.tempShape);
         }
      }
      
      public function onStartLine(e:MouseEvent) : void
      {
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onStopLine);
         this._canvas.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartLine);
         this.isLineDrawing = true;
         if(this._canvas.hitTestPoint(mouseX,mouseY,true))
         {
            this.degisiklikKontrol();
            this.startPoint = new Point(this._canvas.mouseX,this._canvas.mouseY);
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.lineOnFrame);
            if(this._vectorVideo.status)
            {
               this._vectorVideo.actObject = new ActObject();
               this._vectorVideo.actObject.startTime = this._vectorVideo.time;
            }
         }
      }
      
      public function onStopLine(e:MouseEvent) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStopLine);
         this._canvas.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartLine);
         this.tempShape.graphics.clear();
         this.isLineDrawing = false;
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.lineOnFrame);
         this.lastPoint = new Point(this._canvas.mouseX,this._canvas.mouseY);
         if(this._canvas.hitTestPoint(mouseX,mouseY,true))
         {
            ++this.brushLayer;
            if(this.isIm && this.imMode == 0)
            {
               this.silinecek.push(this.brushLayer);
            }
            this.brushAreas[this.brushLayer] = new Sprite();
            this.brushAreas[this.brushLayer].graphics.lineStyle(this.activeLineWidth,this.activeColor,1,true,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
            this.brushAreas[this.brushLayer].graphics.beginFill(this.activeColor);
            this.brushAreas[this.brushLayer].graphics.moveTo(this.startPoint.x,this.startPoint.y);
            this.brushAreas[this.brushLayer].graphics.lineTo(this.lastPoint.x,this.lastPoint.y);
            this.drawAreas[this.guncelSayfa].addChild(this.brushAreas[this.brushLayer]);
            this.sendData(false);
            if(this._vectorVideo.status)
            {
               this._vectorVideo.actObject.id = this._vectorVideo.getID();
               this._vectorVideo.actObject.points.push(this._canvas.localToGlobal(new Point(this.startPoint.x,this.startPoint.y)));
               this._vectorVideo.actObject.points.push(this._canvas.localToGlobal(new Point(this.lastPoint.x,this.lastPoint.y)));
               this._vectorVideo.actObject.type = ActObject.TYPE_LINE;
               this._vectorVideo.actObject.duration = this._vectorVideo.time - this._vectorVideo.actObject.startTime;
               this._vectorVideo.actObject.size = this.activeLineWidth * this._canvas.scaleX;
               this._vectorVideo.actObject.color = "0x" + this.activeColor.toString(16);
               this._vectorVideo.actObject.sprite = this.brushAreas[this.brushLayer];
               this._vectorVideo.addAct();
            }
         }
      }
      
      public function eraseOnFrame(e:MouseEvent) : void
      {
         this.currentPoint = new Point(this._canvas.mouseX,this._canvas.mouseY);
         this.currentPoint = new Point(this.currentPoint.x,this.lastPoint.y + (this.currentPoint.y - this.lastPoint.y) * 0.5);
         if(this.isErasing && this._canvas.hitTestPoint(mouseX,mouseY,true))
         {
            this.mcEraser.x = this.currentPoint.x;
            this.mcEraser.y = this.currentPoint.y;
            this.brushAreas[this.brushLayer].graphics.lineTo(this.currentPoint.x,this.currentPoint.y);
            this.brushAreas[this.brushLayer].blendMode = BlendMode.ERASE;
            this.lastPoint = this.currentPoint;
            if(this._vectorVideo.status)
            {
               this._vectorVideo.actObject.points.push(this._canvas.localToGlobal(new Point(this.currentPoint.x,this.currentPoint.y)));
            }
         }
      }
      
      public function onStartErase(e:MouseEvent) : void
      {
         this._canvas.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartErase);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onStopErase);
         this.mcEraser.x = this._canvas.mouseX;
         this.mcEraser.y = this._canvas.mouseY;
         this.mcEraser.visible = true;
         this.mcEraser.width = this.mcEraser.height = (this.activeLineWidth + 1) * 10;
         if(!this.isErasing && this._canvas.hitTestPoint(mouseX,mouseY,true))
         {
            this.degisiklikKontrol();
            ++this.brushLayer;
            if(this.isIm && this.imMode == 0)
            {
               this.silinecek.push(this.brushLayer);
               this.silgiler.push(this.brushLayer);
            }
            this.brushAreas[this.brushLayer] = new Sprite();
            this.drawAreas[this.guncelSayfa].addChild(this.brushAreas[this.brushLayer]);
            this.drawAreas[this.guncelSayfa].blendMode = BlendMode.LAYER;
            this.brushAreas[this.brushLayer].graphics.lineStyle((this.activeLineWidth + 1) * 10,16777215,1);
            this.isErasing = true;
            this.lastPoint = new Point(this._canvas.mouseX,this._canvas.mouseY);
            this.brushAreas[this.brushLayer].graphics.moveTo(this.lastPoint.x,this.lastPoint.y);
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.eraseOnFrame);
            if(this._vectorVideo.status)
            {
               this._vectorVideo.actObject = new ActObject();
               this.currentPoint = new Point(this._canvas.mouseX,this._canvas.mouseY);
               this._vectorVideo.actObject.points.push(this._canvas.localToGlobal(new Point(this.currentPoint.x,this.currentPoint.y)));
               this._vectorVideo.actObject.startTime = this._vectorVideo.time;
            }
         }
      }
      
      public function onStopErase(e:MouseEvent) : void
      {
         this._canvas.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartErase);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStopErase);
         this.mcEraser.visible = false;
         this.currentPoint = new Point(this._canvas.mouseX,this._canvas.mouseY);
         if(this.isErasing)
         {
            this.isErasing = false;
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.eraseOnFrame);
            this.sendData(true);
            if(this._vectorVideo.status)
            {
               this._vectorVideo.actObject.id = this._vectorVideo.getID();
               this._vectorVideo.actObject.points.push(this._canvas.localToGlobal(new Point(this.currentPoint.x,this.currentPoint.y)));
               this._vectorVideo.actObject.type = ActObject.TYPE_ERASER;
               this._vectorVideo.actObject.duration = this._vectorVideo.time - this._vectorVideo.actObject.startTime;
               this._vectorVideo.actObject.size = (this.activeLineWidth + 1) * 10 * this._canvas.scaleX;
               this._vectorVideo.actObject.color = "0x" + this.activeColor.toString(16);
               this._vectorVideo.actObject.sprite = this.brushAreas[this.brushLayer];
               this._vectorVideo.addAct();
            }
         }
      }
      
      public function arrowOnFrame(e:MouseEvent) : void
      {
         var _angleDegree:Number = NaN;
         var _size:Number = NaN;
         var _angle:Number = NaN;
         var _w:Number = NaN;
         var _h:Number = NaN;
         var _angleDeg:Number = NaN;
         if(this.isArrowDrawing && this._canvas.hitTestPoint(mouseX,mouseY,true))
         {
            _angleDegree = 45;
            _size = this.activeLineWidth;
            _angle = this.polarAngle(new Point(this._canvas.mouseX,this._canvas.mouseY),new Point(this.startPoint.x,this.startPoint.y));
            this.tempShape.graphics.clear();
            this.tempShape.graphics.lineStyle(this.activeLineWidth,this.activeColor,1,false,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
            this.tempShape.graphics.moveTo(this.startPoint.x,this.startPoint.y);
            this.tempShape.graphics.lineTo(this._canvas.mouseX,this._canvas.mouseY);
            _w = 7 + Math.ceil(this.activeLineWidth / 7);
            _h = 11 + Math.ceil(this.activeLineWidth / 11);
            _angleDeg = 37;
            _size = _size * 5 / 2;
            this.tempShape.graphics.moveTo(this._canvas.mouseX + 0 * Math.cos(_angle * Math.PI / 180),this._canvas.mouseY + 0 * Math.sin(_angle * Math.PI / 180));
            this.tempShape.graphics.lineTo(this._canvas.mouseX - _size * Math.cos((_angle - _angleDegree) * Math.PI / 180),this._canvas.mouseY - _size * Math.sin((_angle - _angleDegree) * Math.PI / 180));
            this.tempShape.graphics.moveTo(this._canvas.mouseX + 0 * Math.cos(_angle * Math.PI / 180),this._canvas.mouseY + 0 * Math.sin(_angle * Math.PI / 180));
            this.tempShape.graphics.lineTo(this._canvas.mouseX - _size * Math.cos((_angle + _angleDegree) * Math.PI / 180),this._canvas.mouseY - _size * Math.sin((_angle + _angleDegree) * Math.PI / 180));
            this._canvas.addChild(this.tempShape);
         }
      }
      
      public function onStartArrow(e:MouseEvent) : void
      {
         this._canvas.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartArrow);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onStopArrow);
         if(this._canvas.hitTestPoint(mouseX,mouseY,true))
         {
            this.degisiklikKontrol();
            this.startPoint = new Point(this._canvas.mouseX,this._canvas.mouseY);
            this.isArrowDrawing = true;
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.arrowOnFrame);
            if(this._vectorVideo.status)
            {
               this._vectorVideo.actObject = new ActObject();
               this._vectorVideo.actObject.startTime = this._vectorVideo.time;
            }
         }
      }
      
      public function onStopArrow(e:MouseEvent) : void
      {
         var _angleDegree:Number = NaN;
         var _size:Number = NaN;
         var _angle:Number = NaN;
         var _w:Number = NaN;
         var _h:Number = NaN;
         var _angleDeg:Number = NaN;
         this._canvas.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartArrow);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStopArrow);
         this.tempShape.graphics.clear();
         this.isArrowDrawing = false;
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.arrowOnFrame);
         this.lastPoint = new Point(this._canvas.mouseX,this._canvas.mouseY);
         if(this._canvas.hitTestPoint(mouseX,mouseY,true))
         {
            ++this.brushLayer;
            if(this.isIm && this.imMode == 0)
            {
               this.silinecek.push(this.brushLayer);
            }
            this.brushAreas[this.brushLayer] = new Sprite();
            _angleDegree = 45;
            _size = this.activeLineWidth;
            _angle = this.polarAngle(new Point(this._canvas.mouseX,this._canvas.mouseY),new Point(this.startPoint.x,this.startPoint.y));
            this.brushAreas[this.brushLayer].graphics.lineStyle(this.activeLineWidth,this.activeColor,1,false,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
            this.brushAreas[this.brushLayer].graphics.moveTo(this.startPoint.x,this.startPoint.y);
            this.brushAreas[this.brushLayer].graphics.lineTo(this._canvas.mouseX,this._canvas.mouseY);
            _w = 7 + Math.ceil(this.activeLineWidth / 7);
            _h = 11 + Math.ceil(this.activeLineWidth / 11);
            _angleDeg = 37;
            _size = _size * 5 / 2;
            this.brushAreas[this.brushLayer].graphics.moveTo(this._canvas.mouseX + 0 * Math.cos(_angle * Math.PI / 180),this._canvas.mouseY + 0 * Math.sin(_angle * Math.PI / 180));
            this.brushAreas[this.brushLayer].graphics.lineTo(this._canvas.mouseX - _size * Math.cos((_angle - _angleDegree) * Math.PI / 180),this._canvas.mouseY - _size * Math.sin((_angle - _angleDegree) * Math.PI / 180));
            this.brushAreas[this.brushLayer].graphics.moveTo(this._canvas.mouseX + 0 * Math.cos(_angle * Math.PI / 180),this._canvas.mouseY + 0 * Math.sin(_angle * Math.PI / 180));
            this.brushAreas[this.brushLayer].graphics.lineTo(this._canvas.mouseX - _size * Math.cos((_angle + _angleDegree) * Math.PI / 180),this._canvas.mouseY - _size * Math.sin((_angle + _angleDegree) * Math.PI / 180));
            this.drawAreas[this.guncelSayfa].addChild(this.brushAreas[this.brushLayer]);
            this.sendData(false);
            if(this._vectorVideo.status)
            {
               this._vectorVideo.actObject.id = this._vectorVideo.getID();
               this._vectorVideo.actObject.points.push(this._canvas.localToGlobal(new Point(this.startPoint.x,this.startPoint.y)));
               this._vectorVideo.actObject.points.push(this._canvas.localToGlobal(new Point(this.lastPoint.x,this.lastPoint.y)));
               this._vectorVideo.actObject.type = ActObject.TYPE_ARROW;
               this._vectorVideo.actObject.duration = this._vectorVideo.time - this._vectorVideo.actObject.startTime;
               this._vectorVideo.actObject.size = this.activeLineWidth * this._canvas.scaleX;
               this._vectorVideo.actObject.color = "0x" + this.activeColor.toString(16);
               this._vectorVideo.actObject.sprite = this.brushAreas[this.brushLayer];
               this._vectorVideo.addAct();
            }
         }
      }
      
      public function circleOnFrame(e:MouseEvent) : void
      {
         if(this.isCircleDrawing && this._canvas.hitTestPoint(mouseX,mouseY,true))
         {
            this.tempShape.graphics.clear();
            this.tempShape.graphics.lineStyle(this.activeLineWidth,this.activeColor,1);
            this.tempShape.graphics.drawEllipse(this.startPoint.x,this.startPoint.y,this._canvas.mouseX - this.startPoint.x,this._canvas.mouseY - this.startPoint.y);
            this._canvas.addChild(this.tempShape);
         }
      }
      
      public function onStartCircle(e:MouseEvent) : void
      {
         this._canvas.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartCircle);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onStopCircle);
         if(this._canvas.hitTestPoint(mouseX,mouseY,true))
         {
            this.degisiklikKontrol();
            this.startPoint = new Point(this._canvas.mouseX,this._canvas.mouseY);
            this.isCircleDrawing = true;
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.circleOnFrame);
            if(this._vectorVideo.status)
            {
               this._vectorVideo.actObject = new ActObject();
               this._vectorVideo.actObject.startTime = this._vectorVideo.time;
            }
         }
      }
      
      public function onStopCircle(e:MouseEvent) : void
      {
         this._canvas.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartCircle);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStopCircle);
         this.tempShape.graphics.clear();
         this.isCircleDrawing = false;
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.circleOnFrame);
         this.lastPoint = new Point(this._canvas.mouseX,this._canvas.mouseY);
         if(this._canvas.hitTestPoint(mouseX,mouseY,true) && this.startPoint.x != this.lastPoint.x && this.startPoint.y != this.lastPoint.y)
         {
            ++this.brushLayer;
            if(this.isIm && this.imMode == 0)
            {
               this.silinecek.push(this.brushLayer);
            }
            this.brushAreas[this.brushLayer] = new Sprite();
            this.brushAreas[this.brushLayer].graphics.lineStyle(this.activeLineWidth,this.activeColor,1);
            this.brushAreas[this.brushLayer].graphics.drawEllipse(this.startPoint.x,this.startPoint.y,this._canvas.mouseX - this.startPoint.x,this._canvas.mouseY - this.startPoint.y);
            this.drawAreas[this.guncelSayfa].addChild(this.brushAreas[this.brushLayer]);
            this.sendData(false);
            if(this._vectorVideo.status)
            {
               this._vectorVideo.actObject.id = this._vectorVideo.getID();
               this._vectorVideo.actObject.points.push(this.brushAreas[this.brushLayer].getBounds(stage));
               this._vectorVideo.actObject.type = ActObject.TYPE_CIRCLE;
               this._vectorVideo.actObject.duration = this._vectorVideo.time - this._vectorVideo.actObject.startTime;
               this._vectorVideo.actObject.size = this.activeLineWidth * this._canvas.scaleX;
               this._vectorVideo.actObject.color = "0x" + this.activeColor.toString(16);
               this._vectorVideo.actObject.sprite = this.brushAreas[this.brushLayer];
               this._vectorVideo.addAct();
            }
         }
      }
      
      public function squareOnFrame(e:MouseEvent) : void
      {
         if(this.isSquareDrawing && this._canvas.hitTestPoint(mouseX,mouseY,true))
         {
            this.tempShape.graphics.clear();
            this.tempShape.graphics.lineStyle(this.activeLineWidth,this.activeColor,1,true,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
            this.tempShape.graphics.drawRect(this.startPoint.x,this.startPoint.y,this._canvas.mouseX - this.startPoint.x,this._canvas.mouseY - this.startPoint.y);
            this._canvas.addChild(this.tempShape);
         }
      }
      
      public function onStartSquare(e:MouseEvent) : void
      {
         this._canvas.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartSquare);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onStopSquare);
         if(this._canvas.hitTestPoint(mouseX,mouseY,true))
         {
            this.degisiklikKontrol();
            this.startPoint = new Point(this._canvas.mouseX,this._canvas.mouseY);
            this.isSquareDrawing = true;
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.squareOnFrame);
            if(this._vectorVideo.status)
            {
               this._vectorVideo.actObject = new ActObject();
               this._vectorVideo.actObject.startTime = this._vectorVideo.time;
            }
         }
      }
      
      public function onStopSquare(e:MouseEvent) : void
      {
         this._canvas.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartSquare);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStopSquare);
         this.tempShape.graphics.clear();
         this.lastPoint = new Point(this._canvas.mouseX,this._canvas.mouseY);
         this.isSquareDrawing = false;
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.squareOnFrame);
         if(this._canvas.hitTestPoint(mouseX,mouseY,true) && this.startPoint.x != this.lastPoint.x && this.startPoint.y != this.lastPoint.y)
         {
            ++this.brushLayer;
            if(this.isIm && this.imMode == 0)
            {
               this.silinecek.push(this.brushLayer);
            }
            this.brushAreas[this.brushLayer] = new Sprite();
            this.brushAreas[this.brushLayer].graphics.lineStyle(this.activeLineWidth,this.activeColor,1,true,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
            this.brushAreas[this.brushLayer].graphics.drawRect(this.startPoint.x,this.startPoint.y,this._canvas.mouseX - this.startPoint.x,this._canvas.mouseY - this.startPoint.y);
            this.drawAreas[this.guncelSayfa].addChild(this.brushAreas[this.brushLayer]);
            this.sendData(false);
            if(this._vectorVideo.status)
            {
               this._vectorVideo.actObject.id = this._vectorVideo.getID();
               this._vectorVideo.actObject.points.push(this._canvas.localToGlobal(new Point(this.startPoint.x,this.startPoint.y)));
               this._vectorVideo.actObject.points.push(this._canvas.localToGlobal(new Point(this.lastPoint.x,this.startPoint.y)));
               this._vectorVideo.actObject.points.push(this._canvas.localToGlobal(new Point(this.lastPoint.x,this.lastPoint.y)));
               this._vectorVideo.actObject.points.push(this._canvas.localToGlobal(new Point(this.startPoint.x,this.lastPoint.y)));
               this._vectorVideo.actObject.points.push(this._canvas.localToGlobal(new Point(this.startPoint.x,this.startPoint.y)));
               this._vectorVideo.actObject.type = ActObject.TYPE_SQUARE;
               this._vectorVideo.actObject.duration = this._vectorVideo.time - this._vectorVideo.actObject.startTime;
               this._vectorVideo.actObject.size = this.activeLineWidth * this._canvas.scaleX;
               this._vectorVideo.actObject.color = "0x" + this.activeColor.toString(16);
               this._vectorVideo.actObject.sprite = this.brushAreas[this.brushLayer];
               this._vectorVideo.addAct();
            }
         }
      }
      
      public function distanceTwoPoints(x1:Number, y1:Number, x2:Number, y2:Number) : Number
      {
         var dx:Number = x1 - x2;
         var dy:Number = y1 - y2;
         return Math.sqrt(dx * dx + dy * dy);
      }
      
      public function triangleOnFrame(e:MouseEvent) : void
      {
         var _distance1:Number = NaN;
         var _x:Number = NaN;
         var _y:Number = NaN;
         var _p:Array = null;
         var _pm:MovieClip = this._book;
         if(this.isIm && this.imMode == 0)
         {
            _pm = this._canvas;
         }
         if(this.isTriangeDrawing && _pm.hitTestPoint(mouseX,mouseY,true))
         {
            this.currentPoint = new Point(this._canvas.mouseX,this._canvas.mouseY);
            _distance1 = this.distanceTwoPoints(this.startPoint.x,this.startPoint.y,this.currentPoint.x,this.currentPoint.y) / 2;
            _x = Math.abs(this.startPoint.x - this.currentPoint.x);
            _y = Math.abs(this.startPoint.y - this.currentPoint.y);
            _p = new Array();
            _p[0] = {
               "x":this.startPoint.x,
               "y":this.startPoint.y
            };
            if(_x >= _y)
            {
               _p[1] = new Object();
               _p[1].x = this.currentPoint.x;
               _p[1].y = this.currentPoint.y - _distance1;
               _p[2] = new Object();
               _p[2].x = this.currentPoint.x;
               _p[2].y = this.currentPoint.y + _distance1;
               if(!(_p[2].y < _pm.height && 0 < _p[1].y))
               {
                  return;
               }
            }
            else
            {
               _p[1] = new Object();
               _p[1].x = this.currentPoint.x - _distance1;
               _p[1].y = this.currentPoint.y;
               _p[2] = new Object();
               _p[2].x = this.currentPoint.x + _distance1;
               _p[2].y = this.currentPoint.y;
               if(!(_p[2].x < _pm.width && 0 < _p[1].x))
               {
                  return;
               }
            }
            _p[3] = new Object();
            _p[3].x = _p[0].x;
            _p[3].y = _p[0].y;
            this.tempShape.graphics.clear();
            this.tempShape.graphics.lineStyle(this.activeLineWidth,this.activeColor,1,true,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
            this.tempShape.graphics.moveTo(_p[0].x,_p[0].y);
            this.tempShape.graphics.lineTo(_p[1].x,_p[1].y);
            this.tempShape.graphics.lineTo(_p[2].x,_p[2].y);
            this.tempShape.graphics.lineTo(_p[3].x,_p[3].y);
            this._canvas.addChild(this.tempShape);
         }
      }
      
      public function onStartTriangle(e:MouseEvent) : void
      {
         this._canvas.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartTriangle);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onStopTriangle);
         if(this._canvas.hitTestPoint(mouseX,mouseY,true))
         {
            this.degisiklikKontrol();
            this.startPoint = new Point(this._canvas.mouseX,this._canvas.mouseY);
            this.isTriangeDrawing = true;
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.triangleOnFrame);
            if(this._vectorVideo.status)
            {
               this._vectorVideo.actObject = new ActObject();
               this._vectorVideo.actObject.startTime = this._vectorVideo.time;
            }
         }
      }
      
      public function onStopTriangle(e:MouseEvent) : void
      {
         var _distance1:Number = NaN;
         var _x:Number = NaN;
         var _y:Number = NaN;
         var _p:Array = null;
         this._canvas.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartTriangle);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStopTriangle);
         this.tempShape.graphics.clear();
         this.lastPoint = new Point(this._canvas.mouseX,this._canvas.mouseY);
         this.isTriangeDrawing = false;
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.triangleOnFrame);
         var _pm:MovieClip = this._book;
         if(this.isIm && this.imMode == 0)
         {
            _pm = this._canvas;
         }
         if(_pm.hitTestPoint(mouseX,mouseY,true) && this.startPoint.x != this.lastPoint.x && this.startPoint.y != this.lastPoint.y)
         {
            _distance1 = this.distanceTwoPoints(this.startPoint.x,this.startPoint.y,this.lastPoint.x,this.lastPoint.y) / 2;
            _x = Math.abs(this.startPoint.x - this.lastPoint.x);
            _y = Math.abs(this.startPoint.y - this.lastPoint.y);
            _p = new Array();
            _p[0] = {
               "x":this.startPoint.x,
               "y":this.startPoint.y
            };
            if(_x >= _y)
            {
               _p[1] = new Object();
               _p[1].x = this.lastPoint.x;
               _p[1].y = this.lastPoint.y - _distance1;
               _p[2] = new Object();
               _p[2].x = this.lastPoint.x;
               _p[2].y = this.lastPoint.y + _distance1;
               if(!(_p[2].y < _pm.height && 0 < _p[1].y))
               {
                  return;
               }
            }
            else
            {
               _p[1] = new Object();
               _p[1].x = this.lastPoint.x - _distance1;
               _p[1].y = this.lastPoint.y;
               _p[2] = new Object();
               _p[2].x = this.lastPoint.x + _distance1;
               _p[2].y = this.lastPoint.y;
               if(!(_p[2].x < _pm.width && 0 < _p[1].x))
               {
                  return;
               }
            }
            _p[3] = new Object();
            _p[3].x = _p[0].x;
            _p[3].y = _p[0].y;
            ++this.brushLayer;
            if(this.isIm && this.imMode == 0)
            {
               this.silinecek.push(this.brushLayer);
            }
            this.brushAreas[this.brushLayer] = new Sprite();
            this.brushAreas[this.brushLayer].graphics.clear();
            this.brushAreas[this.brushLayer].graphics.lineStyle(this.activeLineWidth,this.activeColor,1,true,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
            this.brushAreas[this.brushLayer].graphics.moveTo(_p[0].x,_p[0].y);
            this.brushAreas[this.brushLayer].graphics.lineTo(_p[1].x,_p[1].y);
            this.brushAreas[this.brushLayer].graphics.lineTo(_p[2].x,_p[2].y);
            this.brushAreas[this.brushLayer].graphics.lineTo(_p[3].x,_p[3].y);
            this.drawAreas[this.guncelSayfa].addChild(this.brushAreas[this.brushLayer]);
            this.sendData(false);
            if(this._vectorVideo.status)
            {
               this._vectorVideo.actObject.id = this._vectorVideo.getID();
               this._vectorVideo.actObject.points.push(this._canvas.localToGlobal(new Point(_p[0].x,_p[0].y)));
               this._vectorVideo.actObject.points.push(this._canvas.localToGlobal(new Point(_p[1].x,_p[1].y)));
               this._vectorVideo.actObject.points.push(this._canvas.localToGlobal(new Point(_p[2].x,_p[2].y)));
               this._vectorVideo.actObject.points.push(this._canvas.localToGlobal(new Point(_p[3].x,_p[3].y)));
               this._vectorVideo.actObject.type = ActObject.TYPE_TRIANGLE;
               this._vectorVideo.actObject.duration = this._vectorVideo.time - this._vectorVideo.actObject.startTime;
               this._vectorVideo.actObject.size = this.activeLineWidth * this._canvas.scaleX;
               this._vectorVideo.actObject.color = "0x" + this.activeColor.toString(16);
               this._vectorVideo.actObject.sprite = this.brushAreas[this.brushLayer];
               this._vectorVideo.addAct();
            }
         }
      }
      
      public function selectOnFrame(e:MouseEvent) : void
      {
         if(this.isSelectDrawing && this._canvas.hitTestPoint(mouseX,mouseY,true))
         {
            this.tempShape.graphics.clear();
            this.tempShape.graphics.beginFill(0,0.1);
            this.tempShape.graphics.drawRect(this.startPoint.x,this.startPoint.y,this._canvas.mouseX - this.startPoint.x,this._canvas.mouseY - this.startPoint.y);
            this.tempShape.graphics.endFill();
            this._canvas.addChild(this.tempShape);
         }
      }
      
      public function onStartSelect(e:MouseEvent) : void
      {
         if(!this._kapBl)
         {
            this._canvas.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartSelect);
            stage.addEventListener(MouseEvent.MOUSE_UP,this.onStopSelect);
            if(!this.isSelectDrawing && this._canvas.hitTestPoint(mouseX,mouseY,true))
            {
               this.startPoint = new Point(this._canvas.mouseX,this._canvas.mouseY);
               this.isSelectDrawing = true;
               stage.addEventListener(MouseEvent.MOUSE_MOVE,this.selectOnFrame);
            }
         }
      }
      
      public function selectCalc(_rectangle:Rectangle, _numF:Number) : *
      {
         this._selectBg.graphics.clear();
         this._selectBg.graphics.beginFill(this._zoomBg,this._zoomAlpha);
         this._selectBg.graphics.drawRect(0,0,this._book.width,this._book.height);
         this._selectBg.graphics.endFill();
         this.tempShape.graphics.clear();
         this.tempShape.graphics.drawRect(_rectangle.x,_rectangle.y,_rectangle.width,_rectangle.height);
         if(_rectangle.width >= _rectangle.height)
         {
            this._scale = this._capX / _rectangle.width;
         }
         else if(_rectangle.width < _rectangle.height)
         {
            this._scale = (this._capY - this._capYOffset) / _rectangle.height;
         }
         this.tempShape.scaleX = this._scale;
         this.tempShape.scaleY = this._scale;
         if(this.tempShape.width > this._capX)
         {
            this._scale = this._capX / _rectangle.width;
         }
         if(this.tempShape.height > this._capY - this._capYOffset)
         {
            this._scale = (this._capY - this._capYOffset) / _rectangle.height;
         }
         this._scale *= _numF;
         this.tempShape.scaleX = this._scale;
         this.tempShape.scaleY = this._scale;
         this._empPoint.x = (this._capX - this.tempShape.width) / 2;
         this._empPoint.y = (this._capY - this._capYOffset - this.tempShape.height) / 2;
         this.tempShape.scaleX = 1;
         this.tempShape.scaleY = 1;
         this.tempShape.graphics.clear();
         this._blankBg.width = _rectangle.width;
         this._blankBg.height = _rectangle.height;
         this._blankBg.x = _rectangle.x;
         this._blankBg.y = _rectangle.y;
         this._canvas.addChild(this._selectBg);
         this._kapBl = true;
         this.openCloseZoom(false);
         this._canvas.x = this._empPoint.x - _rectangle.x * this._scale;
         this._canvas.y = this._empPoint.y - _rectangle.y * this._scale;
         this._canvas.scaleX = this._scale;
         this._canvas.scaleY = this._scale;
      }
      
      public function onStopSelect(e:MouseEvent) : void
      {
         this._canvas.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartSelect);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStopSelect);
         this.lastPoint = new Point(this._canvas.mouseX,this._canvas.mouseY);
         this.isSelectDrawing = false;
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.selectOnFrame);
         if(!this._kapBl && this._canvas.hitTestPoint(mouseX,mouseY,true) && this.startPoint.x != this.lastPoint.x && this.startPoint.y != this.lastPoint.y && this._scale < 500)
         {
            if(this.startPoint.x < this.lastPoint.x)
            {
               if(this.startPoint.y < this.lastPoint.y)
               {
                  this._rect = new Rectangle(this.startPoint.x,this.startPoint.y,this.tempShape.width,this.tempShape.height);
               }
               else
               {
                  this._rect = new Rectangle(this.startPoint.x,this.startPoint.y - this.tempShape.height,this.tempShape.width,this.tempShape.height);
               }
            }
            else if(this.startPoint.y < this.lastPoint.y)
            {
               this._rect = new Rectangle(this.startPoint.x - this.tempShape.width,this.startPoint.y,this.tempShape.width,this.tempShape.height);
            }
            else
            {
               this._rect = new Rectangle(this.startPoint.x - this.tempShape.width,this.startPoint.y - this.tempShape.height,this.tempShape.width,this.tempShape.height);
            }
            this._num = 0.85;
            this.selectCalc(this._rect,this._num);
            if(this.footer.previousIm.visible)
            {
               this.footer.previousIm.visible = false;
               this.footer.nextIm.visible = false;
               this.footer.previousIm.removeEventListener(MouseEvent.CLICK,this.imJump);
               this.footer.nextIm.removeEventListener(MouseEvent.CLICK,this.imJump);
            }
         }
         else
         {
            this.tempShape.graphics.clear();
         }
      }
      
      public function goBack(e:MouseEvent = null) : void
      {
         if(this.brushLayer != 0 && this.drawAreas[this.guncelSayfa].contains(this.brushAreas[this.brushLayer]))
         {
            if(this.isIm && this.imMode == 0 && this._eraseLayer != this.brushLayer)
            {
               this.eraseLayer();
            }
            else if(!this.isIm)
            {
               this.eraseLayer();
            }
            else if(this.isIm && this.imMode == 1)
            {
               this.eraseLayer();
            }
         }
      }
      
      public function eraseLayer() : *
      {
         var i:* = null;
         var _k:* = null;
         if(this._vectorVideo.status)
         {
            for(_k in this._vectorVideo.boardData)
            {
               if(this.brushAreas[this.brushLayer] == this._vectorVideo.boardData[_k].sprite)
               {
                  this._vectorVideo.actObject = new ActObject();
                  this._vectorVideo.actObject.id = this._vectorVideo.getID();
                  this._vectorVideo.actObject.startTime = this._vectorVideo.time;
                  this._vectorVideo.actObject.type = ActObject.TYPE_DELETE;
                  this._vectorVideo.actObject.shapeID = this._vectorVideo.boardData[_k].id;
                  this._vectorVideo.addAct();
                  break;
               }
            }
         }
         this.degisiklikKontrol();
         if(this.drawAreas[this.guncelSayfa].contains(this.brushAreas[this.brushLayer]))
         {
            this.drawAreas[this.guncelSayfa].removeChild(this.brushAreas[this.brushLayer]);
         }
         for(i in this.silgiler)
         {
            if(this.brushLayer == this.silgiler[i])
            {
               this.silgiler.splice(i,1);
            }
         }
         --this.brushLayer;
         if(this.isIm && this.imMode == 0)
         {
            this.silinecek.pop();
         }
         if(this._mcNo != 0)
         {
            --this._mcNo;
         }
         this.sendBackData();
      }
      
      public function openCalc(e:MouseEvent = null) : *
      {
         if(this.calcPanel.visible == false)
         {
            this.stageAlignCenter(this.calcPanel);
            this.colorize(this.sidePanel.btnCalc,this._overColor);
            this.calcPanel.mover.addEventListener(MouseEvent.MOUSE_DOWN,this.dragCalc);
            this.calcPanel.closeC.addEventListener(MouseEvent.CLICK,this.kapatC);
            this.calcPanel.visible = true;
            this.addStage(this.calcPanel);
         }
         else
         {
            this.stopColorize(this.sidePanel.btnCalc);
            this.calcPanel.mover.removeEventListener(MouseEvent.MOUSE_DOWN,this.dragCalc);
            this.calcPanel.closeC.removeEventListener(MouseEvent.CLICK,this.kapatC);
            this.calcPanel.visible = false;
         }
      }
      
      public function kapatC(e:MouseEvent) : void
      {
         this.sidePanel.btnCalc.gotoAndStop(1);
         this.stopColorize(this.sidePanel.btnCalc);
         this.calcPanel.mover.removeEventListener(MouseEvent.MOUSE_DOWN,this.dragCalc);
         this.calcPanel.closeC.removeEventListener(MouseEvent.CLICK,this.kapatC);
         this.calcPanel.visible = false;
      }
      
      public function dragCalc(e:MouseEvent) : void
      {
         this.playSound("b");
         this.addStage(this.calcPanel);
         this.calcPanel.mover.removeEventListener(MouseEvent.MOUSE_DOWN,this.dragCalc);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.dropCalc);
         this.calcPanel.startDrag();
      }
      
      public function dropCalc(e:MouseEvent) : void
      {
         this.calcPanel.mover.addEventListener(MouseEvent.MOUSE_DOWN,this.dragCalc);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.dropCalc);
         this.calcPanel.stopDrag();
      }
      
      public function openAllEvent() : *
      {
         this.toolBar.fernusColorPicker.addEventListener(MouseEvent.CLICK,this._fernusColorPicker);
         this.toolBar.fernusLinePicker.addEventListener(MouseEvent.CLICK,this._fernusLinePicker);
         this.toolBar.btnGraps.addEventListener(MouseEvent.CLICK,this._btnGraps);
         this.sidePanel.btnCalc.addEventListener(MouseEvent.CLICK,this.openCalc);
         this.toolBar.zoomTool.btnSelect.addEventListener(MouseEvent.CLICK,this._btnSelect);
         this.footer.pnlPageNum.addEventListener(MouseEvent.CLICK,this.numPanel);
         this.toolBar.zoomTool.zoomIn.addEventListener(MouseEvent.CLICK,this._zoomIn);
         this.toolBar.zoomTool.zoomOut.addEventListener(MouseEvent.CLICK,this._zoomOut);
         this.toolBar.btnMove.addEventListener(MouseEvent.CLICK,this._btnMove);
         this.sidePanel.btnRecord.addEventListener(MouseEvent.CLICK,this.search);
         this.footer.btnList.addEventListener(MouseEvent.CLICK,this._btnList);
         this.sidePanel.btnChronometer.addEventListener(MouseEvent.CLICK,this.showChronometer);
         this.sidePanel.btnStudent.addEventListener(MouseEvent.CLICK,this.studentPanelHandler);
         this.sidePanel.btnBG.addEventListener(MouseEvent.CLICK,this.mainBGHandler);
         this.sidePanel.btnCurtain.addEventListener(MouseEvent.CLICK,this.openCurtain);
         if(this._jump < this.guncelSayfa)
         {
            this.sidePanel.btnNote.addEventListener(MouseEvent.CLICK,this.openNote);
         }
         this.toolBar.mcBg.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartDrag);
         this.toolBar.toolBarHider.addEventListener(MouseEvent.CLICK,this.hideToolBar);
         this.toolBar.btnTurn.addEventListener(MouseEvent.CLICK,this._btnTurn);
         this.toolBar.btnBrush.addEventListener(MouseEvent.CLICK,this._btnBrush);
         this.toolBar.btnMark.addEventListener(MouseEvent.CLICK,this._btnMark);
         this.toolBar.btnErase.addEventListener(MouseEvent.CLICK,this._btnErase);
         this.toolBar.btnBack.addEventListener(MouseEvent.CLICK,this.goBack);
         this.toolBar.btnMode.addEventListener(MouseEvent.CLICK,this.changeMode);
         this.footer.btnBos.addEventListener(MouseEvent.CLICK,this.openEmptyIm);
         this.footer.btnDO.addEventListener(MouseEvent.CLICK,this.vvPanelHandler);
         this.footer.btnAH.addEventListener(MouseEvent.CLICK,this.openPanelAh);
         this.footer.btnMeeting.addEventListener(MouseEvent.CLICK,this.openPanelMeeting);
         this.footer.btnAccount.addEventListener(MouseEvent.CLICK,this.accountHandler);
         this.footer.btnSolution.addEventListener(MouseEvent.CLICK,this.videoSolutionHandler);
         this.preRecordPanel.btnSaveAns.addEventListener(MouseEvent.CLICK,this.saveData);
         this.preRecordPanel.btnAns.addEventListener(MouseEvent.CLICK,this.datYukle);
         this.footer.btnZeng.addEventListener(MouseEvent.CLICK,this.zengModu);
         this.footer.btnEba.addEventListener(MouseEvent.CLICK,this.openEbaList);
         this.toolBar.btnCleanScreen.addEventListener(MouseEvent.CLICK,this.eraseScreen);
         this.sidePanel.btnMessage.addEventListener(MouseEvent.CLICK,this.messagePanelHandler);
         this.sidePanel.btnAddInput.addEventListener(MouseEvent.CLICK,this.addInputToBook);
         this.sidePanel.btnHelp.addEventListener(MouseEvent.CLICK,this.openHelp);
         this.footer.tools.addEventListener(MouseEvent.CLICK,this.openSidePanel);
         this.sidePanel.btnGeoGebra.addEventListener(MouseEvent.CLICK,this.button_geogebra);
      }
      
      public function openSidePanel(e:MouseEvent = null) : void
      {
         TweenMax.killTweensOf(this.sidePanel);
         if(!this._sidePanelStatus)
         {
            this._sidePanelStatus = true;
            this.sidePanel.visible = true;
            TweenMax.to(this.sidePanel,this._tweenTime,{"x":0});
            this.sidePanel.bclose.addEventListener(MouseEvent.CLICK,this.openSidePanel);
         }
         else
         {
            this._sidePanelStatus = false;
            TweenMax.to(this.sidePanel,this._tweenTime,{
               "x":-this.sidePanel.width,
               "visible":false
            });
            this.sidePanel.bclose.removeEventListener(MouseEvent.CLICK,this.openSidePanel);
         }
      }
      
      public function goToThePage(pNum:int) : void
      {
         var key1:* = null;
         var keyCurtain:* = null;
         var key:* = null;
         var _tfKey:* = null;
         var _key4:* = null;
         var key2:* = null;
         var key3:* = null;
         var _key5:* = null;
         this.playSound("p");
         this.closeCloseZoom();
         this.kapKontrol();
         this.vazgecF();
         this._book.gotoAndStop(pNum);
         if(this._maskChecker)
         {
            this._maskBook.gotoAndStop(pNum);
            this.removeItems(this._maskLayer);
         }
         var _pstr:* = pNum - this._jump;
         this.footer.pnlPageNum.sayfaNum.text = _pstr < 1 ? "-" : String(_pstr);
         if(this._maskChecker)
         {
            for(_key4 in this._aniMasks)
            {
               this._aniMasks[_key4].num = 0;
               this._aniMasks[_key4].shapes = [];
               if(this._aniMasks[_key4].page == this.guncelSayfa)
               {
                  this._aniMasks[_key4].mc.removeEventListener(MouseEvent.CLICK,this.openMaskAni);
                  this.stopColorize(this._aniMasks[_key4].mc);
                  this._aniMasks[_key4].mc.gotoAndStop(1);
               }
            }
         }
         for(key1 in this.selectItems)
         {
            if(int(key1) != this.selectItems.length - 1)
            {
               if(this.selectItems[key1]["page"] == this.guncelSayfa && this.selectItems[key1]["im"])
               {
                  if(this.pageItems[this.guncelSayfa])
                  {
                     if(this.pageItems[this.guncelSayfa].contains(this.selectItems[key1]["im"]))
                     {
                        this.pageItems[this.guncelSayfa].removeChild(this.selectItems[key1]["im"]);
                     }
                     this.selectItems[key1]["im"] = null;
                  }
               }
            }
         }
         if(this._activities)
         {
            for(key1 in this._activities)
            {
               if(this._activities[key1].page == this.guncelSayfa && this._activities[key1].im)
               {
                  if(this.pageItems[this.guncelSayfa])
                  {
                     if(this.pageItems[this.guncelSayfa].contains(this._activities[key1].im))
                     {
                        this.pageItems[this.guncelSayfa].removeChild(this._activities[key1].im);
                     }
                     this._activities[key1].im = null;
                  }
               }
            }
         }
         for(keyCurtain in this.curtainItems)
         {
            if(this.curtainItems[keyCurtain]["page"] == this.guncelSayfa && this.curtainItems[keyCurtain]["im"])
            {
               if(this.pageItems[this.guncelSayfa].contains(this.curtainItems[keyCurtain]["im"]))
               {
                  this.pageItems[this.guncelSayfa].removeChild(this.curtainItems[keyCurtain]["im"]);
               }
               if(this._canvas.contains(this.curtainItems[keyCurtain]["shape"]))
               {
                  this._canvas.removeChild(this.curtainItems[keyCurtain]["shape"]);
               }
               this.curtainItems[keyCurtain]["im"] = null;
               this.curtainItems[keyCurtain]["shape"] = null;
            }
         }
         if(this._maskChecker)
         {
            for(key2 in this._masks)
            {
               if(this._masks[key2]["page"] == this.guncelSayfa && this._masks[key2]["im"])
               {
                  if(this.pageItems[this.guncelSayfa].contains(this._masks[key2]["im"]))
                  {
                     this.pageItems[this.guncelSayfa].removeChild(this._masks[key2]["im"]);
                  }
                  this._masks[key2]["im"] = null;
                  this._masks[key2]["stat"] = false;
               }
            }
         }
         this.guncelSayfa = pNum;
         for(key in this.selectItems)
         {
            if(int(key) != this.selectItems.length - 1)
            {
               if(this.selectItems[key]["page"] == this.guncelSayfa)
               {
                  this.selectItems[key]["im"] = new sIm();
                  this.selectItems[key]["im"].cacheAsBitmap = true;
                  this.selectItems[key]["im"].name = "IM_" + key;
                  this.selectItems[key]["im"].addEventListener(MouseEvent.CLICK,this.autoSelect);
                  if(!this.pageItems[this.guncelSayfa])
                  {
                     this.pageItems[this.guncelSayfa] = new MovieClip();
                  }
                  if(this.selectItems.length - 1 != int(key))
                  {
                     this.pageItems[this.guncelSayfa].addChild(this.selectItems[key]["im"]);
                  }
                  if(this.selectItems[key]["imCoor"].x == 0 && this.selectItems[key]["imCoor"].y == 0)
                  {
                     this.selectItems[key]["im"].x = this.selectItems[key]["rect"].x - this.selectItems[key]["im"].width / 2;
                     this.selectItems[key]["im"].y = this.selectItems[key]["rect"].y + this.selectItems[key]["im"].height / 2;
                  }
                  else
                  {
                     this.selectItems[key]["im"].x = this.selectItems[key]["imCoor"].x;
                     this.selectItems[key]["im"].y = this.selectItems[key]["imCoor"].y;
                  }
               }
            }
         }
         for(keyCurtain in this.curtainItems)
         {
            if(this.curtainItems[keyCurtain]["page"] == this.guncelSayfa)
            {
               this.curtainItems[keyCurtain]["im"] = new im_curtain();
               this.curtainItems[keyCurtain]["im"].cacheAsBitmap = true;
               this.curtainItems[keyCurtain]["im"].name = keyCurtain;
               this.curtainItems[keyCurtain]["im"].addEventListener(MouseEvent.CLICK,this.showRectangleCurtain);
               if(!this.pageItems[this.guncelSayfa])
               {
                  this.pageItems[this.guncelSayfa] = new MovieClip();
               }
               this.pageItems[this.guncelSayfa].addChild(this.curtainItems[keyCurtain]["im"]);
               this.curtainItems[keyCurtain]["im"].x = this.curtainItems[keyCurtain]["rect"].x - this.curtainItems[keyCurtain]["im"].width / 2;
               this.curtainItems[keyCurtain]["im"].y = this.curtainItems[keyCurtain]["rect"].y + this.curtainItems[keyCurtain]["im"].height / 2;
               this.curtainItems[keyCurtain]["shape"] = new Shape();
               this.curtainItems[keyCurtain]["shape"].graphics.beginFill(16777215);
               this.curtainItems[keyCurtain]["shape"].graphics.drawRect(this.curtainItems[keyCurtain]["rect"].x,this.curtainItems[keyCurtain]["rect"].y,this.curtainItems[keyCurtain]["rect"].width,this.curtainItems[keyCurtain]["rect"].height);
               this.curtainItems[keyCurtain]["shape"].graphics.endFill();
               this._canvas.addChildAt(this.curtainItems[keyCurtain]["shape"],1);
               if(this.curtainItems[keyCurtain]["shapeStatus"])
               {
                  this.objectTint(this.curtainItems[keyCurtain]["im"],0);
                  this.curtainItems[keyCurtain]["shape"].visible = false;
               }
            }
         }
         if(this._activities)
         {
            for(key1 in this._activities)
            {
               if(this._activities[key1].page == this.guncelSayfa)
               {
                  this._activities[key1].im = new im_app();
                  this._activities[key1].im.cacheAsBitmap = true;
                  this._activities[key1].im.name = "mc_" + key1;
                  this._activities[key1].im.addEventListener(MouseEvent.CLICK,this.open_activity);
                  if(!this.pageItems[this.guncelSayfa])
                  {
                     this.pageItems[this.guncelSayfa] = new MovieClip();
                  }
                  this.pageItems[this.guncelSayfa].addChild(this._activities[key1].im);
                  this._activities[key1].im.x = this._activities[key1].x;
                  this._activities[key1].im.y = this._activities[key1].y;
               }
            }
         }
         if(this._maskChecker)
         {
            for(key3 in this._masks)
            {
               if(this._masks[key3]["page"] == this.guncelSayfa)
               {
                  this._masks[key3]["im"] = new im_txt();
                  this._masks[key3]["im"].cacheAsBitmap = true;
                  this._masks[key3]["im"].name = "IM_" + key3;
                  this._masks[key3]["im"].addEventListener(MouseEvent.CLICK,this.openMask);
                  if(!this.pageItems[this.guncelSayfa])
                  {
                     this.pageItems[this.guncelSayfa] = new MovieClip();
                  }
                  this.pageItems[this.guncelSayfa].addChild(this._masks[key3]["im"]);
                  this._masks[key3]["im"].x = this._masks[key3]["coor"].x;
                  this._masks[key3]["im"].y = this._masks[key3]["coor"].y;
               }
            }
         }
         if(this._maskChecker)
         {
            for(_key5 in this._aniMasks)
            {
               if(this._aniMasks[_key5].page == this.guncelSayfa)
               {
                  this._aniMasks[_key5].mc.addEventListener(MouseEvent.CLICK,this.openMaskAni);
               }
            }
         }
         for(_tfKey in this._arrayTF)
         {
            if(this._arrayTF[_tfKey].page == this.guncelSayfa && !this._arrayTF[_tfKey].im)
            {
               this._inputLayer.addChild(this._arrayTF[_tfKey].tf);
            }
         }
         this.removeItems(this.itemMc);
         this.removeItems(this._inputLayer);
         this.removeItems(this.tempLayer);
         this.removeItems(this._note.tempLayer2);
         if(this.pageItems[pNum])
         {
            this.itemMc.addChild(this.pageItems[pNum]);
         }
         if(this.drawAreas[pNum])
         {
            this.tempLayer.addChild(this.drawAreas[pNum]);
         }
         if(this.drawAreas2[pNum] && this.drawAreas2[pNum][0])
         {
            this._note.tempLayer2.addChild(this.drawAreas2[pNum][0]);
         }
         this.hangiNot = 0;
         this.updateNoteNums();
         this.updateNoteSize(this.noteSizes[this.guncelSayfa][this.hangiNot].x,this.noteSizes[this.guncelSayfa][this.hangiNot].y);
         if(this.zenbB)
         {
            this.removeItems(this.tempLayerZeng);
            if(this._icnPage[pNum])
            {
               this.tempLayerZeng.addChild(this._icnPage[pNum]);
            }
            this._currMc.filters = [];
            TweenMax.to(this.silPanel,this._tweenTime,{
               "x":this._capX,
               "visible":false
            });
            this.tempShape.graphics.clear();
         }
         if(this.selectItems[this.selectItems.length - 1]["im"])
         {
            if(!this.selectItems[this.selectItems.length - 1]["im"].hasEventListener(MouseEvent.CLICK))
            {
               this.selectItems[this.selectItems.length - 1]["im"].addEventListener(MouseEvent.CLICK,this.autoSelect);
            }
         }
         this.canvasScale();
         TweenMax.killDelayedCallsTo(this.saveCurrentPage);
         TweenMax.delayedCall(3,this.saveCurrentPage);
      }
      
      public function saveCurrentPage() : *
      {
         this._soBookKXK.data.pageHistory = int(this.guncelSayfa);
      }
      
      public function _btnTurn(e:MouseEvent) : void
      {
         if(this.verticalPanel)
         {
            TweenMax.to(this.toolBar,this._tweenTime,{"rotation":-90});
            this._int = 90;
            this.toolBar.fernusLinePalette.x = 84.05;
            this.toolBar.fernusLinePalette.y = 106.1;
            this.toolBar.fernusColorPalette.x = 84.05;
            this.toolBar.fernusColorPalette.y = 181.15;
            this.toolBar.fernusGrapsPalette.x = 74;
            this.toolBar.fernusGrapsPalette.y = 248.95;
            this.toolBar.fernusLinePalette.rotation = this._int;
            this.toolBar.fernusColorPalette.rotation = this._int;
            this.toolBar.fernusGrapsPalette.rotation = this._int;
            TweenMax.to(this.toolBar.btnBrush,this._tweenTime,{"rotation":this._int});
            TweenMax.to(this.toolBar.btnMark,this._tweenTime,{"rotation":this._int});
            TweenMax.to(this.toolBar.btnErase,this._tweenTime,{"rotation":this._int});
            TweenMax.to(this.toolBar.fernusLinePicker,this._tweenTime,{"rotation":this._int});
            TweenMax.to(this.toolBar.fernusColorPicker,this._tweenTime,{"rotation":this._int});
            TweenMax.to(this.toolBar.btnGraps,this._tweenTime,{"rotation":this._int});
            TweenMax.to(this.toolBar.btnBack,this._tweenTime,{"rotation":this._int});
            TweenMax.to(this.toolBar.btnCleanScreen,this._tweenTime,{"rotation":this._int});
            this.verticalPanel = false;
         }
         else
         {
            this._int = 0;
            this.toolBar.fernusLinePalette.x = 61.25;
            this.toolBar.fernusLinePalette.y = 52.85;
            this.toolBar.fernusColorPalette.x = 61.25;
            this.toolBar.fernusColorPalette.y = 121.3;
            this.toolBar.fernusGrapsPalette.x = 61.25;
            this.toolBar.fernusGrapsPalette.y = 197.2;
            this.toolBar.fernusLinePalette.rotation = this._int;
            this.toolBar.fernusColorPalette.rotation = this._int;
            this.toolBar.fernusGrapsPalette.rotation = this._int;
            TweenMax.to(this.toolBar,this._tweenTime,{"rotation":this._int});
            TweenMax.to(this.toolBar.btnBrush,this._tweenTime,{"rotation":this._int});
            TweenMax.to(this.toolBar.btnMark,this._tweenTime,{"rotation":this._int});
            TweenMax.to(this.toolBar.btnErase,this._tweenTime,{"rotation":this._int});
            TweenMax.to(this.toolBar.fernusLinePicker,this._tweenTime,{"rotation":this._int});
            TweenMax.to(this.toolBar.fernusColorPicker,this._tweenTime,{"rotation":this._int});
            TweenMax.to(this.toolBar.btnGraps,this._tweenTime,{"rotation":this._int});
            TweenMax.to(this.toolBar.btnBack,this._tweenTime,{"rotation":this._int});
            TweenMax.to(this.toolBar.btnCleanScreen,this._tweenTime,{"rotation":this._int});
            this.verticalPanel = true;
         }
         this.toolBar.fernusColorPalette.visible = false;
         this.toolBar.fernusLinePalette.visible = false;
         this.toolBar.fernusGrapsPalette.visible = false;
         this.toolBar.stopDrag();
         this.playSound("b");
      }
      
      public function eraseScreen(e:MouseEvent = null) : *
      {
         if(this.isIm && this.imMode == 0)
         {
            this.degisiklikKontrol();
            this.cleanScreen();
            this.sendCleanScreenData();
         }
         else
         {
            this.cleanPage();
         }
      }
      
      public function cleanPage() : *
      {
         for(var i:int = this.brushLayer; 0 < i; i--)
         {
            if(this.drawAreas[this.guncelSayfa].contains(this.brushAreas[i]))
            {
               this.drawAreas[this.guncelSayfa].removeChild(this.brushAreas[i]);
            }
         }
      }
      
      public function showRectangleCurtain(e:MouseEvent) : *
      {
         var _key:String = e.currentTarget.name;
         if(!this.curtainItems[_key]["shapeStatus"])
         {
            this.objectTint(this.curtainItems[_key]["im"],0);
            this.curtainItems[_key]["shape"].visible = false;
            this.curtainItems[_key]["shapeStatus"] = true;
         }
         else
         {
            this.stopColorize(this.curtainItems[_key]["im"]);
            this.curtainItems[_key]["shape"].visible = true;
            this.curtainItems[_key]["shapeStatus"] = false;
         }
      }
      
      public function hideToolBar(e:MouseEvent) : void
      {
         if(this.toolBar.toolBarHider.mcicon.currentFrame == 1)
         {
            this.toolBar.toolBarHider.mcicon.gotoAndStop(2);
            this.toolBar.btnBrush.visible = false;
            this.toolBar.fernusLinePicker.visible = false;
            this.toolBar.btnMark.visible = false;
            this.toolBar.fernusColorPicker.visible = false;
            this.toolBar.btnErase.visible = false;
            this.toolBar.btnGraps.visible = false;
            this.toolBar.btnBack.visible = false;
            this.toolBar.btnCleanScreen.visible = false;
            this.toolBar.stick.visible = false;
            this.toolBar.zoomTool.visible = false;
            this.toolBar.btnMode.visible = false;
            this.toolBar.btnMove.visible = false;
            this.toolBar.pPage.visible = false;
            this.toolBar.nPage.visible = false;
            this.toolBar.fernus.visible = false;
            this.toolBar.fernusLinePalette.visible = false;
            this.toolBar.fernusColorPalette.visible = false;
            this.toolBar.fernusGrapsPalette.visible = false;
            this.toolBar.mcBg.height = 115;
         }
         else
         {
            this.toolBar.toolBarHider.mcicon.gotoAndStop(1);
            this.toolBar.btnBrush.visible = true;
            this.toolBar.fernusLinePicker.visible = true;
            this.toolBar.btnMark.visible = true;
            this.toolBar.fernusColorPicker.visible = true;
            this.toolBar.btnErase.visible = true;
            this.toolBar.btnGraps.visible = true;
            this.toolBar.btnBack.visible = true;
            this.toolBar.btnCleanScreen.visible = true;
            this.toolBar.stick.visible = true;
            this.toolBar.zoomTool.visible = true;
            this.toolBar.btnMode.visible = true;
            this.toolBar.btnMove.visible = true;
            this.toolBar.pPage.visible = true;
            this.toolBar.nPage.visible = true;
            this.toolBar.fernus.visible = true;
            this.toolBar.mcBg.height = 505;
         }
         this.playSound("b");
      }
      
      public function onStartDrag(e:MouseEvent) : void
      {
         this.addStage(this.toolBar);
         this.toolBar.mcBg.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartDrag);
         this.toolBar.mcBg.addEventListener(MouseEvent.MOUSE_UP,this.onStopDrop);
         this.toolBar.startDrag();
         this.toolBar.fernusColorPalette.visible = false;
         this.toolBar.fernusLinePalette.visible = false;
         this.toolBar.fernusGrapsPalette.visible = false;
      }
      
      public function onStopDrop(e:MouseEvent) : void
      {
         this.toolBar.mcBg.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartDrag);
         this.toolBar.mcBg.removeEventListener(MouseEvent.MOUSE_UP,this.onStopDrop);
         this.toolBar.stopDrag();
      }
      
      public function numPanel(e:MouseEvent) : *
      {
         this.playSound("p");
         this.panelNums.visible = true;
         this.panelNums.pnl.close.addEventListener(MouseEvent.CLICK,this.closePanel);
         this.panelNums.pnl.b_0.addEventListener(MouseEvent.CLICK,this.writePage);
         this.panelNums.pnl.b_1.addEventListener(MouseEvent.CLICK,this.writePage);
         this.panelNums.pnl.b_2.addEventListener(MouseEvent.CLICK,this.writePage);
         this.panelNums.pnl.b_3.addEventListener(MouseEvent.CLICK,this.writePage);
         this.panelNums.pnl.b_4.addEventListener(MouseEvent.CLICK,this.writePage);
         this.panelNums.pnl.b_5.addEventListener(MouseEvent.CLICK,this.writePage);
         this.panelNums.pnl.b_6.addEventListener(MouseEvent.CLICK,this.writePage);
         this.panelNums.pnl.b_7.addEventListener(MouseEvent.CLICK,this.writePage);
         this.panelNums.pnl.b_8.addEventListener(MouseEvent.CLICK,this.writePage);
         this.panelNums.pnl.b_9.addEventListener(MouseEvent.CLICK,this.writePage);
         this.panelNums.pnl.mcsil.addEventListener(MouseEvent.CLICK,this.writePage);
         this.panelNums.pnl.openNum.addEventListener(MouseEvent.CLICK,this.goPage);
         this.addStage(this.panelNums);
         this._empString = "";
         this.panelNums.pnl.pageNum.text = "Sayfa No";
         this.playSound("b");
      }
      
      public function closePanel(e:MouseEvent = null) : *
      {
         this.playSound("p");
         this.panelNums.visible = false;
         this.panelNums.pnl.close.removeEventListener(MouseEvent.CLICK,this.closePanel);
         this.panelNums.pnl.b_0.removeEventListener(MouseEvent.CLICK,this.writePage);
         this.panelNums.pnl.b_1.removeEventListener(MouseEvent.CLICK,this.writePage);
         this.panelNums.pnl.b_2.removeEventListener(MouseEvent.CLICK,this.writePage);
         this.panelNums.pnl.b_3.removeEventListener(MouseEvent.CLICK,this.writePage);
         this.panelNums.pnl.b_4.removeEventListener(MouseEvent.CLICK,this.writePage);
         this.panelNums.pnl.b_5.removeEventListener(MouseEvent.CLICK,this.writePage);
         this.panelNums.pnl.b_6.removeEventListener(MouseEvent.CLICK,this.writePage);
         this.panelNums.pnl.b_7.removeEventListener(MouseEvent.CLICK,this.writePage);
         this.panelNums.pnl.b_8.removeEventListener(MouseEvent.CLICK,this.writePage);
         this.panelNums.pnl.b_9.removeEventListener(MouseEvent.CLICK,this.writePage);
         this.panelNums.pnl.mcsil.removeEventListener(MouseEvent.CLICK,this.writePage);
         this.panelNums.pnl.openNum.removeEventListener(MouseEvent.CLICK,this.goPage);
      }
      
      public function writePage(e:MouseEvent) : *
      {
         var key:* = null;
         this.playSound("b");
         if(e.currentTarget.name != "mcsil")
         {
            this._empString += e.currentTarget.name.split("_")[1];
            this.panelNums.pnl.pageNum.text = this._empString;
         }
         else if(this._empString != "" && e.currentTarget.name == "mcsil")
         {
            this._empArray = new Array();
            this._empArray = this._empString.split("");
            this._empString = "";
            this._empArray.pop();
            for(key in this._empArray)
            {
               this._empString += this._empArray[key];
            }
            this.panelNums.pnl.pageNum.text = this._empString;
         }
      }
      
      public function goPage(e:MouseEvent) : *
      {
         if(int(this._empString) + this._jump < 1 || int(this._empString) > this._book.totalFrames - this._jump || this._empString == "")
         {
            this.closePanel();
         }
         else
         {
            this.closeCloseZoom();
            this.pnlPageNumOpen();
            this.openPageNote();
            this.goToThePage(int(this._empString) + this._jump);
            this.closePanel();
            this.closeBtnLock();
         }
         this._empString = "";
      }
      
      public function search(e:MouseEvent = null) : void
      {
         if(this.searchPanel.visible == true)
         {
            this.searchPanel.visible = false;
            this.searchPanel.close.removeEventListener(MouseEvent.CLICK,this.search);
            this.searchPanel.mover.removeEventListener(MouseEvent.MOUSE_DOWN,this.searchDragStart);
            this.searchPanel.bSearch.removeEventListener(MouseEvent.CLICK,this.searchGo);
            this.stopColorize(this.sidePanel.btnRecord);
            this.searchPanel.searchContent.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandlerK);
            ScrollClass.disable(this.searchPanel.searchContent);
            ScrollClass.remove(this.searchPanel.searchContent);
         }
         else
         {
            this.searchPanel.x = (this._capX - 200) / 2;
            this.searchPanel.y = (this._capY - 233) / 2;
            stage.focus = this.searchPanel.word;
            this.addStage(this.searchPanel);
            this.searchPanel.visible = true;
            this.addStage(this.searchPanel);
            this.colorize(this.sidePanel.btnRecord,this._overColor);
            this.searchPanel.close.addEventListener(MouseEvent.CLICK,this.search);
            this.searchPanel.mover.addEventListener(MouseEvent.MOUSE_DOWN,this.searchDragStart);
            this.searchPanel.bSearch.addEventListener(MouseEvent.CLICK,this.searchGo);
            this.searchPanel.searchContent.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandlerK);
         }
      }
      
      public function searchGo(e:MouseEvent) : void
      {
         var key:* = null;
         var index:int = 0;
         var key2:* = null;
         this._empArray = new Array();
         if(this.searchPanel.word.text != "" && this.searchPanel.word.text != " " && this.searchPanel.word.text != "  " && this.searchPanel.word.text.length > 1)
         {
            this._empString = this.searchPanel.word.text;
            this._int = 0;
            for(key in this._pages)
            {
               index = this.buyukHarf(this._pages[key]["content"]).indexOf(this.buyukHarf(this._empString));
               if(index > -1)
               {
                  this._empArray[this._int] = this._pages[key]["no"];
                  ++this._int;
               }
            }
            this.removeItems(this.searchPanel.searchContent);
            this.searchPanel.searchContent.y = this.searchPanel.searchMask.y;
            if(this._empArray.length != 0)
            {
               this._int = 0;
               for(key2 in this._empArray)
               {
                  if(this._empArray[key2] - this._jump < 1)
                  {
                     this.searchPanel.stat.text = "Sonuç bulunamadı.";
                  }
                  else
                  {
                     this._empMovieClip = new searchB();
                     this._empMovieClip.x = 3;
                     this._empMovieClip.y = this._int;
                     this._empMovieClip.txt.text = String(this._empArray[key2] - this._jump) + ". Sayfa";
                     this._int += this._empMovieClip.height;
                     this.objectCache(this._empMovieClip);
                     this.searchPanel.searchContent.addChild(this._empMovieClip);
                     this._empMovieClip.name = "bs_" + this._empArray[key2];
                     this._empMovieClip.addEventListener(MouseEvent.CLICK,this.searchPage);
                     this.searchPanel.stat.text = "";
                  }
               }
            }
            else
            {
               this.searchPanel.stat.text = "Sonuç bulunamadı.";
            }
            ScrollClass.remove(this.searchPanel.searchContent);
            ScrollClass.add(this.searchPanel.searchContent,this.searchPanel.searchMask);
            ScrollClass.enable(this.searchPanel.searchContent);
            ScrollClass.update(this.searchPanel.searchContent);
         }
      }
      
      public function searchPage(e:MouseEvent = null) : void
      {
         if(this.clickControl())
         {
            this._empString = "";
            this.goToThePage(e.currentTarget.name.split("_")[1]);
            this.closeBtnLock();
         }
      }
      
      public function searchDragStart(e:MouseEvent = null) : void
      {
         this.playSound("b");
         this.addStage(this.searchPanel);
         this.searchPanel.mover.removeEventListener(MouseEvent.MOUSE_DOWN,this.searchDragStart);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.searchDragStop);
         this.searchPanel.startDrag();
      }
      
      public function searchDragStop(e:MouseEvent = null) : void
      {
         this.searchPanel.mover.addEventListener(MouseEvent.MOUSE_DOWN,this.searchDragStart);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.searchDragStop);
         this.searchPanel.stopDrag();
      }
      
      public function mouseDownHandlerK(event:MouseEvent) : void
      {
         this._scrollMc2 = MovieClip(event.currentTarget);
         if(this._scrollMc2.name == "searchContent")
         {
            this._boundsK = new Rectangle(this.searchPanel.searchMask.x,this.searchPanel.searchMask.y,this.searchPanel.searchMask.width,this.searchPanel.searchMask.height);
         }
         else if(this._scrollMc2.name == "popContent")
         {
            this._boundsK = new Rectangle(this.pnlPop.mcMask.x,this.pnlPop.mcMask.y,this.pnlPop.mcMask.width,this.pnlPop.mcMask.height);
         }
         else if(this._scrollMc2.name == "unitMc")
         {
            this._boundsK = new Rectangle(this._unitHolder.maske.x,this._unitHolder.maske.y,this._unitHolder.maske.width,this._unitHolder.maske.height);
         }
         else if(this._scrollMc2.name == "userContent")
         {
            this._boundsK = new Rectangle(this.mcUsers.con.contentMask.x,this.mcUsers.con.contentMask.y,this.mcUsers.con.contentMask.width,this.mcUsers.con.contentMask.height);
         }
         else if(this._scrollMc2.name == "mcEbaContent")
         {
            this._boundsK = new Rectangle(this.mcEbaPanel.mcMask.x,this.mcEbaPanel.mcMask.y,this.mcEbaPanel.mcMask.width,this.mcEbaPanel.mcMask.height);
         }
         else if(this._scrollMc2.name == "mcVideoContent")
         {
            this._boundsK = new Rectangle(this.mcEbaPanel.mcVideoMask.x,this.mcEbaPanel.mcVideoMask.y,this.mcEbaPanel.mcVideoMask.width,this.mcEbaPanel.mcVideoMask.height);
         }
         else if(this._scrollMc2.name == "contentVVUpload")
         {
            this._boundsK = new Rectangle(this.panelVV.mcMask.x,this.panelVV.mcMask.y,this.panelVV.mcMask.width,this.panelVV.mcMask.height);
         }
         else if(this._scrollMc2.name == "contentMeeting")
         {
            this._boundsK = new Rectangle(this.panelMeeting.mcMask.x,this.panelMeeting.mcMask.y,this.panelMeeting.mcMask.width,this.panelMeeting.mcMask.height);
         }
         else if(this._scrollMc2.name == "contentAh")
         {
            this._boundsK = new Rectangle(this.panelAh.mcMask.x,this.panelAh.mcMask.y,this.panelAh.mcMask.width,this.panelAh.mcMask.height);
         }
         else if(this._scrollMc2.name == "contentAhStatus")
         {
            this._boundsK = new Rectangle(this.panelAhStatus.con.mcMask.x,this.panelAhStatus.con.mcMask.y,this.panelAhStatus.con.mcMask.width,this.panelAhStatus.con.mcMask.height);
         }
         else if(this._scrollMc2.name == "contentSolution")
         {
            this._boundsK = new Rectangle(this.panelVideoSolution.mmask.x,this.panelVideoSolution.mmask.y,this.panelVideoSolution.mmask.width,this.panelVideoSolution.mmask.height);
         }
         this._mouseDownCoor.x = stage.mouseX;
         this._mouseDownCoor.y = stage.mouseY;
         TweenMax.killTweensOf(this._scrollMc2);
         this.yk1 = this.yk2 = this._scrollMc2.y;
         this.ykOffset = this.mouseY - this._scrollMc2.y;
         this.ykOverlap = Math.max(0,this._scrollMc2.height - this._boundsK.height);
         this.tk1 = this.tk2 = getTimer();
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandlerK);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.mouseUpHandlerK);
      }
      
      public function mouseMoveHandlerK(event:MouseEvent) : void
      {
         var y:Number = this.mouseY - this.ykOffset;
         if(y > this._boundsK.top)
         {
            this._scrollMc2.y = (y + this._boundsK.top) * 0.5;
         }
         else if(y < this._boundsK.top - this.ykOverlap)
         {
            this._scrollMc2.y = (y + this._boundsK.top - this.ykOverlap) * 0.5;
         }
         else
         {
            this._scrollMc2.y = y;
         }
         var t:uint = getTimer();
         if(t - this.tk2 > 25)
         {
            this.yk2 = this.yk1;
            this.yk1 = this._scrollMc2.y;
            this.tk2 = this.tk1;
            this.tk1 = t;
         }
         ScrollClass.update(this._scrollMc2);
      }
      
      public function mouseUpHandlerK(event:MouseEvent = null) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUpHandlerK);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandlerK);
         var time:Number = (getTimer() - this.tk2) / 1000;
         var yVelocity:Number = (this._scrollMc2.y - this.yk2) / time;
         ThrowPropsPlugin.to(this._scrollMc2,{
            "onUpdate":function():*
            {
               ScrollClass.update(_scrollMc2);
            },
            "throwProps":{"y":{
               "velocity":yVelocity,
               "max":this._boundsK.top,
               "min":this._boundsK.top - this.ykOverlap,
               "resistance":300
            }},
            "ease":Strong.easeOut
         },0.3,0.1,1);
      }
      
      public function _btnList(e:MouseEvent) : void
      {
         if(this._unitHolder.visible)
         {
            this._unitHider();
         }
         else if(this._unitStatus)
         {
            this.stageAlignCenter(this._unitHolder);
            this._unitHolder.y = (this._capY - 616) / 2;
            this.addStage(this._unitHolder);
            this._unitHolder.visible = true;
            this._unitHolder.unitHider.addEventListener(MouseEvent.CLICK,this._unitHider);
            this._unitHolder.unitMover.addEventListener(MouseEvent.MOUSE_DOWN,this.uOnStartDrag);
            this._unitHolder.unitMc.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandlerK);
            this.footer.btnList.gotoAndStop(2);
            ScrollClass.enable(this._unitHolder.unitMc);
         }
         else
         {
            this.warning("Bu kitapta içindekiler kısmı bulunmamaktadır.");
         }
      }
      
      public function _unitHider(e:MouseEvent = null) : void
      {
         this._unitHolder.unitMc.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandlerK);
         this._unitHolder.unitHider.removeEventListener(MouseEvent.CLICK,this._unitHider);
         this._unitHolder.visible = false;
         this.footer.btnList.gotoAndStop(1);
         ScrollClass.disable(this._unitHolder.unitMc);
      }
      
      public function uOnStartDrag(e:MouseEvent) : void
      {
         this.playSound("b");
         this._unitHolder.unitMover.removeEventListener(MouseEvent.MOUSE_DOWN,this.uOnStartDrag);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.uOnStopDrop);
         this._unitHolder.startDrag();
         this.addStage(this._unitHolder);
      }
      
      public function uOnStopDrop(e:MouseEvent) : void
      {
         this._unitHolder.unitMover.addEventListener(MouseEvent.MOUSE_DOWN,this.uOnStartDrag);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.uOnStopDrop);
         this._unitHolder.stopDrag();
      }
      
      public function unitClicked(e:MouseEvent) : void
      {
         if(e.currentTarget.name.split("_")[0] == "but")
         {
            this._unitHolder.visible = false;
            this.goToThePage(int(e.currentTarget.name.split("_")[1]) + this._jump);
            this.pnlPageNumOpen();
            this._unitHider();
            this.closeBtnLock();
         }
         else if(this.clickControl())
         {
            this._unitHolder.visible = false;
            this.goToThePage(int(e.currentTarget.name.split("_")[1]) + this._jump);
            this.pnlPageNumOpen();
            this._unitHider();
            this.closeBtnLock();
         }
      }
      
      public function clickControl() : Boolean
      {
         if(Math.abs(this._mouseDownCoor.x - stage.mouseX) < 5 && Math.abs(this._mouseDownCoor.y - stage.mouseY) < 5)
         {
            return true;
         }
         return false;
      }
      
      public function onGesture(event:GestureEvent) : void
      {
         var transformPoint:Point = null;
         this.kapKontrol();
         var gesture:TransformGesture = event.target as TransformGesture;
         var matrix:Matrix = this._canvas.transform.matrix;
         matrix.translate(gesture.offsetX,gesture.offsetY);
         this._canvas.transform.matrix = matrix;
         if(gesture.scale != 1 || gesture.rotation != 0)
         {
            transformPoint = matrix.transformPoint(this._canvas.globalToLocal(gesture.location));
            matrix.translate(-transformPoint.x,-transformPoint.y);
            matrix.scale(gesture.scale,gesture.scale);
            matrix.translate(transformPoint.x,transformPoint.y);
            this._canvas.transform.matrix = matrix;
         }
         this.openCloseZoom(false);
      }
      
      public function _btnShot(e:MouseEvent) : void
      {
      }
      
      public function _previousPage(e:MouseEvent = null) : void
      {
         if(this.footer.previousIm.visible)
         {
            this.footer.previousIm.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
            return;
         }
         if(this._jump + 1 < this.guncelSayfa)
         {
            this.pnlPageNumOpen();
            this.openPageNote();
         }
         else
         {
            this.pnlPageNumClose();
            this.closePageNote();
         }
         if(1 != this.guncelSayfa)
         {
            this.goToThePage(this.guncelSayfa - 1);
            this.closeBtnLock();
         }
      }
      
      public function _nextPage(e:MouseEvent = null) : void
      {
         if(this.footer.nextIm.visible)
         {
            this.footer.nextIm.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
            return;
         }
         if(this._jump - 1 < this.guncelSayfa)
         {
            this.pnlPageNumOpen();
            this.openPageNote();
         }
         else
         {
            this.pnlPageNumClose();
            this.closePageNote();
         }
         if(this._book.totalFrames != this.guncelSayfa)
         {
            this.goToThePage(this.guncelSayfa + 1);
            this.closeBtnLock();
         }
      }
      
      public function openPageNote() : *
      {
         if(!this.sidePanel.btnNote.hasEventListener(MouseEvent.CLICK))
         {
            this.sidePanel.btnNote.addEventListener(MouseEvent.CLICK,this.openNote);
         }
      }
      
      public function closePageNote() : *
      {
         if(this.sidePanel.btnNote.hasEventListener(MouseEvent.CLICK))
         {
            this._note.visible = true;
            this.sidePanel.btnNote.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
            this.sidePanel.btnNote.removeEventListener(MouseEvent.CLICK,this.openNote);
         }
      }
      
      public function pnlPageNumOpen() : *
      {
      }
      
      public function pnlPageNumClose() : *
      {
      }
      
      public function openCloseZoom(_bl:Boolean = false) : *
      {
         if(!this.footer.closeZoom.visible)
         {
            this.footer.closeZoom.visible = true;
            this.footer.closeZoom.addEventListener(MouseEvent.CLICK,this._closeZoom);
         }
         if(_bl)
         {
            this.kapKontrol();
         }
      }
      
      public function closeCloseZoom() : *
      {
         if(this.footer.closeZoom.visible)
         {
            this.footer.closeZoom.visible = false;
            this.footer.closeZoom.removeEventListener(MouseEvent.CLICK,this._closeZoom);
         }
      }
      
      public function _closeZoom(e:MouseEvent = null) : *
      {
         this.playSound("b");
         this.footer.closeZoom.visible = false;
         this.footer.closeZoom.removeEventListener(MouseEvent.CLICK,this._closeZoom);
         this.kapKontrol();
         this._scale = this._firstScale;
         this._canvas.x = this._firstPos.x;
         this._canvas.y = this._firstPos.y;
         this._canvas.scaleX = this._scale;
         this._canvas.scaleY = this._scale;
         this.closeBtnLock();
      }
      
      public function button_geogebra(e:MouseEvent = null) : void
      {
         var _urlRequest:URLRequest = null;
         var _urlVariable:URLVariables = null;
         var _kk:KryJSON = null;
         if(this._operatingSystem == "linux")
         {
            navigateToURL(new URLRequest("https://www.geogebra.org/"));
            return;
         }
         this._soGeoGebra = SharedObject.getLocal("geogebra");
         var _folder:File = File.applicationStorageDirectory.resolvePath("GeoGebra");
         if(this._soGeoGebra.data.status)
         {
            this.openGeoGebra();
         }
         else
         {
            if(!Network.status)
            {
               this.warning("İnternet bağlantınıza erişim yok. İnternet bağlantızı kontrol edip tekrar deneyin.");
               return;
            }
            this.showLoading();
            _urlRequest = new URLRequest(this._cloudBase);
            _urlVariable = new URLVariables();
            _urlVariable.action = "get_geogebra";
            _urlVariable.enrichment_date = this._date;
            _urlRequest.data = _urlVariable;
            _urlRequest.method = URLRequestMethod.POST;
            _kk = new KryJSON(_urlRequest,true);
            _kk.onError = function(e:*):*
            {
               hideLoading();
               warning("GeoGebra uygulama bilgileri alınamadı. Daha sonra tekrar deneyin.");
            };
            _kk.onComplete = function(e:*):*
            {
               hideLoading();
               if(e.error)
               {
                  warning(e.error);
                  return;
               }
               if(e.status)
               {
                  _soGeoGebra.data.timestamp = e.timestamp;
                  _soGeoGebra.data.file_url = e.file_url;
                  _soGeoGebra.data.file_size = e.file_size;
                  _soGeoGebra.data.executable_file = e.executable_file;
                  downloadGeoGebra();
               }
            };
            _kk.start();
         }
      }
      
      public function downloadGeoGebra() : void
      {
         this.panelGeoGebra.visible = true;
         this.panelGeoGebra.con.txt.text = "%0";
         this.panelGeoGebra.con.bcancel.addEventListener(MouseEvent.CLICK,this.cancelDownloadGeoGebra);
         this.addStage(this.panelGeoGebra);
         this._kxkDownloader = new KXKDownloader(this._soGeoGebra.data.file_url,this._tempPath + new File(this._soGeoGebra.data.file_url).name,this._soGeoGebra.data.file_size);
         this._kxkDownloader.addEventListener(IOErrorEvent.IO_ERROR,function():void
         {
            cancelDownloadGeoGebra();
            warning("İndirme sırasında hata oluştu. Daha sonra tekrar deneyin.");
         });
         this._kxkDownloader.addEventListener(Event.CHANGE,function():void
         {
            panelGeoGebra.con.txt.text = "%" + _kxkDownloader.progress.toString();
         });
         this._kxkDownloader.addEventListener(Event.COMPLETE,function():void
         {
            cancelDownloadGeoGebra();
            showLoading();
            var _zipFM:FileManager = new FileManager();
            _zipFM.addEventListener(IOErrorEvent.IO_ERROR,function():void
            {
               hideLoading();
               warning("İndirme sırasında hata oluştu. Daha sonra tekrar deneyin.");
            });
            _zipFM.addEventListener(Event.COMPLETE,function():void
            {
               hideLoading();
               _soGeoGebra.data.status = true;
               openGeoGebra();
            });
            var _folder:File = File.applicationStorageDirectory.resolvePath("GeoGebra");
            if(!_folder.exists)
            {
               _folder.createDirectory();
            }
            if(_operatingSystem == "windows" || _operatingSystem == "linux")
            {
               _zipFM.unzipFileSFX(_tempPath + new File(_soGeoGebra.data.file_url).name,_folder.url);
            }
            else
            {
               _zipFM.unzipFileOnMac(_tempPath + new File(_soGeoGebra.data.file_url).name,_folder.url);
            }
         });
         this._kxkDownloader.startDownload();
      }
      
      public function cancelDownloadGeoGebra(e:MouseEvent = null) : void
      {
         if(this._kxkDownloader)
         {
            this._kxkDownloader.dispose();
            this._kxkDownloader = null;
         }
         this.panelGeoGebra.visible = false;
      }
      
      public function openGeoGebra(e:MouseEvent = null) : void
      {
         this.panelGeoGebraOpener.visible = true;
         this.panelGeoGebraOpener.con.bopen.addEventListener(MouseEvent.CLICK,this.geogebraOpenerHandler);
         this.panelGeoGebraOpener.con.bdelete.addEventListener(MouseEvent.CLICK,this.geogebraOpenerHandler);
         this.panelGeoGebraOpener.con.close.addEventListener(MouseEvent.CLICK,this.geogebraOpenerHandler);
         this.addStage(this.panelGeoGebraOpener);
      }
      
      public function geogebraOpenerHandler(e:MouseEvent = null) : void
      {
         var _startupInfo:NativeProcessStartupInfo = null;
         var _np:NativeProcess = null;
         this.panelGeoGebraOpener.visible = false;
         this.panelGeoGebraOpener.con.bopen.removeEventListener(MouseEvent.CLICK,this.geogebraOpenerHandler);
         this.panelGeoGebraOpener.con.bdelete.removeEventListener(MouseEvent.CLICK,this.geogebraOpenerHandler);
         this.panelGeoGebraOpener.con.close.removeEventListener(MouseEvent.CLICK,this.geogebraOpenerHandler);
         if(e.currentTarget.name == "bopen")
         {
            try
            {
               _startupInfo = new NativeProcessStartupInfo();
               _startupInfo.executable = File.applicationStorageDirectory.resolvePath("GeoGebra/" + this._soGeoGebra.data.executable_file);
               _startupInfo.workingDirectory = File.applicationDirectory;
               _np = new NativeProcess();
               _np.start(_startupInfo);
            }
            catch(e:*)
            {
            }
         }
         else if(e.currentTarget.name == "bdelete")
         {
            this.ask(function():*
            {
               _soGeoGebra.data.status = false;
               _soGeoGebra.data.timestamp = null;
               _soGeoGebra.data.file_url = null;
               _soGeoGebra.data.file_size = null;
               _soGeoGebra.data.executable_file = null;
               var _folder:File = File.applicationStorageDirectory.resolvePath("GeoGebra");
               if(_folder.exists)
               {
                  try
                  {
                     _folder.deleteDirectory(true);
                  }
                  catch(e:*)
                  {
                  }
               }
            },"GeoGebra uygulamasını silmek istiyor musunuz? GeoGebra uygulamasını daha sonra tekrar indirip kullanabilirsiniz.");
         }
      }
      
      public function openNote(e:MouseEvent = null) : void
      {
         if(this._note.visible == true)
         {
            this._note.visible = false;
            this.isNote = false;
            this._note.resizeH.removeEventListener(MouseEvent.MOUSE_DOWN,this.noteResizeStart1);
            this._note.resizeW.removeEventListener(MouseEvent.MOUSE_DOWN,this.noteResizeStart1);
            this._note.noteHider.removeEventListener(MouseEvent.CLICK,this.openNote);
            this._note.b_add.removeEventListener(MouseEvent.CLICK,this.noteAdd);
            this._note.b_erase.removeEventListener(MouseEvent.CLICK,this.noteErase);
            this._note.b_left.removeEventListener(MouseEvent.CLICK,this.noteNavi);
            this._note.b_right.removeEventListener(MouseEvent.CLICK,this.noteNavi);
            this._note.sekilButton.removeEventListener(MouseEvent.CLICK,this.sekilDegis);
            this._note.panelMover.removeEventListener(MouseEvent.MOUSE_DOWN,this.uOnStartDrag2);
            this._note.geri.removeEventListener(MouseEvent.CLICK,this.goBack2);
            this.stopColorize(this.sidePanel.btnNote);
         }
         else
         {
            if(this.guncelSayfa - this._jump < 1)
            {
               return;
            }
            this.addStage(this._note);
            this._note.visible = true;
            this.isNote = true;
            this._note.resizeH.addEventListener(MouseEvent.MOUSE_DOWN,this.noteResizeStart1);
            this._note.resizeW.addEventListener(MouseEvent.MOUSE_DOWN,this.noteResizeStart1);
            this._note.noteHider.addEventListener(MouseEvent.CLICK,this.openNote);
            this._note.b_add.addEventListener(MouseEvent.CLICK,this.noteAdd);
            this._note.b_erase.addEventListener(MouseEvent.CLICK,this.noteErase);
            this._note.b_left.addEventListener(MouseEvent.CLICK,this.noteNavi);
            this._note.b_right.addEventListener(MouseEvent.CLICK,this.noteNavi);
            this._note.sekilButton.addEventListener(MouseEvent.CLICK,this.sekilDegis);
            this._note.panelMover.addEventListener(MouseEvent.MOUSE_DOWN,this.uOnStartDrag2);
            this._note.geri.addEventListener(MouseEvent.CLICK,this.goBack2);
            this.colorize(this.sidePanel.btnNote,this._overColor);
         }
      }
      
      public function uOnStartDrag2(e:MouseEvent) : void
      {
         this.playSound("b");
         this.addStage(this._note);
         this._note.panelMover.removeEventListener(MouseEvent.MOUSE_DOWN,this.uOnStartDrag2);
         this._note.panelMover.addEventListener(MouseEvent.MOUSE_UP,this.uOnStopDrop2);
         this._note.startDrag();
      }
      
      public function uOnStopDrop2(e:MouseEvent) : void
      {
         this._note.panelMover.addEventListener(MouseEvent.MOUSE_DOWN,this.uOnStartDrag2);
         this._note.panelMover.removeEventListener(MouseEvent.MOUSE_UP,this.uOnStopDrop2);
         this._note.stopDrag();
      }
      
      public function sekilDegis(e:MouseEvent = null) : void
      {
         if(this.sekilB == 1)
         {
            this._note.sekil.gotoAndStop(1);
            this._note.sekilButton.gotoAndStop(1);
            this.sekilB = 2;
         }
         else if(this.sekilB == 2)
         {
            this._note.sekil.gotoAndStop(2);
            this._note.sekilButton.gotoAndStop(2);
            this.sekilB = 3;
         }
         else if(this.sekilB == 3)
         {
            this._note.sekil.gotoAndStop(3);
            this._note.sekilButton.gotoAndStop(3);
            this.sekilB = 1;
         }
      }
      
      public function updateNoteSize(sizeW:Number, sizeH:Number) : *
      {
         this._note.resizeW.x = sizeW;
         this._note.resizeH.y = sizeH;
         this._note.bg2.height = this._note.resizeW.height = sizeH - 20;
         this._note.bg1.height = sizeH - 100;
         this._note.bgMask.height = sizeH - 100;
         this._note.bg1.width = this._note.bg2.width = this._note.bgMask.width = sizeW;
         this._note.resizeH.width = this._note.bg2.width + 8;
         this.updateNoteScale();
      }
      
      public function updateNoteScale() : *
      {
         this._note.b_left.x = 20;
         this._note.b_left.y = this._note.bg1.height + this._note.bg1.y + 12;
         this._note.b_right.x = this._note.bg1.width - 5 - this._note.b_right.width;
         this._note.b_right.y = this._note.bg1.height + this._note.bg1.y + 12;
         this._note.b_add.x = this._note.bg1.width - 30 - this._note.b_add.width;
         this._note.b_add.y = this._note.bg1.y - 20;
         this._note.b_erase.x = this._note.bg1.width - 8 - this._note.b_erase.width;
         this._note.b_erase.y = this._note.bg1.y - 20;
         this._note.geri.x = (this._note.bg1.width - this._note.geri.width) / 2 + this._note.bg1.x;
         this._note.geri.y = this._note.resizeH.y - 18;
         this._note.panelMover.bg.width = this._note.resizeH.width;
         this._note.noteHider.x = this._note.panelMover.width - this._note.noteHider.width - 3;
         this._note.resizeH.tus.scaleX = 1 / this._note.resizeH.scaleX;
         this._note.resizeW.tus.scaleY = 1 / this._note.resizeW.scaleY;
         this._note.resizeH.tus.x = (this._note.resizeH.bg.width - this._note.resizeH.tus.width) / 2;
         this._note.resizeW.tus.y = (this._note.resizeW.bg.height - this._note.resizeW.tus.height) / 2;
      }
      
      public function noteAdd(e:MouseEvent = null) : void
      {
         ++this.guncelNotlar[this.guncelSayfa];
         this.hangiNot = this.guncelNotlar[this.guncelSayfa];
         this.drawAreas2[this.guncelSayfa][this.hangiNot] = new Sprite();
         this.drawAreas2[this.guncelSayfa][this.hangiNot].graphics.clear();
         this.drawAreas2[this.guncelSayfa][this.hangiNot].graphics.beginFill(16777215,0.01);
         this.drawAreas2[this.guncelSayfa][this.hangiNot].graphics.drawRect(0,0,300,650);
         this.drawAreas2[this.guncelSayfa][this.hangiNot].graphics.endFill();
         this.noteSizes[this.guncelSayfa][this.hangiNot] = new Point();
         this.noteSizes[this.guncelSayfa][this.hangiNot].x = 300;
         this.noteSizes[this.guncelSayfa][this.hangiNot].y = 650;
         this.updateNoteSize(300,650);
         this.goToTheNote(this.hangiNot);
         this.updateNoteNums();
      }
      
      public function updateNoteNums() : *
      {
         this._note.noteHeader.txt_not.text = this.hangiNot + 1 + "/" + (this.guncelNotlar[this.guncelSayfa] + 1);
         this._note.noteHeader.txt_page.text = this.guncelSayfa - this._jump;
      }
      
      public function goToTheNote(pNum:int) : void
      {
         this.removeItems(this._note.tempLayer2);
         this._note.tempLayer2.addChild(this.drawAreas2[this.guncelSayfa][this.hangiNot]);
         this._note.tempLayer2.addChild(this.mcEraser2);
      }
      
      public function noteErase(e:MouseEvent) : void
      {
         if(this.hangiNot == 0)
         {
            if(this.guncelNotlar[this.guncelSayfa] == 0)
            {
               this.drawAreas2[this.guncelSayfa].splice(this.hangiNot,1);
               this.drawAreas2[this.guncelSayfa][this.hangiNot] = new Sprite();
               this.drawAreas2[this.guncelSayfa][this.hangiNot].graphics.clear();
               this.drawAreas2[this.guncelSayfa][this.hangiNot].graphics.beginFill(16777215,0.01);
               this.drawAreas2[this.guncelSayfa][this.hangiNot].graphics.drawRect(0,0,300,650);
               this.drawAreas2[this.guncelSayfa][this.hangiNot].graphics.endFill();
               this.noteSizes[this.guncelSayfa][this.hangiNot].x = 300;
               this.noteSizes[this.guncelSayfa][this.hangiNot].y = 650;
               this.updateNoteSize(300,650);
            }
            else
            {
               this.drawAreas2[this.guncelSayfa].splice(this.hangiNot,1);
               this.noteSizes[this.guncelSayfa].splice(this.hangiNot,1);
               this.updateNoteSize(this.noteSizes[this.guncelSayfa][this.hangiNot].x,this.noteSizes[this.guncelSayfa][this.hangiNot].y);
               --this.guncelNotlar[this.guncelSayfa];
            }
            this.goToTheNote(this.hangiNot);
         }
         else
         {
            this.drawAreas2[this.guncelSayfa].splice(this.hangiNot,1);
            this.noteSizes[this.guncelSayfa].splice(this.hangiNot,1);
            --this.guncelNotlar[this.guncelSayfa];
            --this.hangiNot;
            this.goToTheNote(this.hangiNot);
            this.updateNoteSize(this.noteSizes[this.guncelSayfa][this.hangiNot].x,this.noteSizes[this.guncelSayfa][this.hangiNot].y);
         }
         this.updateNoteNums();
      }
      
      public function noteNavi(e:MouseEvent) : void
      {
         if(e.currentTarget.name == "b_left")
         {
            if(this.hangiNot != 0)
            {
               this.goToTheNote(this.hangiNot--);
               this.updateNoteSize(this.noteSizes[this.guncelSayfa][this.hangiNot].x,this.noteSizes[this.guncelSayfa][this.hangiNot].y);
               this.updateNoteNums();
            }
         }
         else if(this.hangiNot != this.guncelNotlar[this.guncelSayfa])
         {
            this.goToTheNote(this.hangiNot++);
            this.updateNoteSize(this.noteSizes[this.guncelSayfa][this.hangiNot].x,this.noteSizes[this.guncelSayfa][this.hangiNot].y);
            this.updateNoteNums();
         }
      }
      
      public function noteResizeStart1(e:MouseEvent = null) : void
      {
         stage.addEventListener(MouseEvent.MOUSE_UP,this.noteResizeStop1);
         stage.addEventListener(Event.ENTER_FRAME,this.noteResizeFrame1);
         this._empString = e.currentTarget.name;
         if(e.currentTarget.name == "resizeH")
         {
            this._note.resizeH.startDrag(false,this.rectY);
            this._note.resizeH.removeEventListener(MouseEvent.MOUSE_DOWN,this.noteResizeStart1);
         }
         else
         {
            this._note.resizeW.startDrag(false,this.rectX);
            this._note.resizeW.removeEventListener(MouseEvent.MOUSE_DOWN,this.noteResizeStart1);
         }
      }
      
      public function noteResizeFrame1(e:Event = null) : void
      {
         if(this._empString == "resizeH")
         {
            if(this._note.resizeH.y < 650 && this._note.resizeH.y > 237)
            {
               this._note.bg2.height = this._note.resizeW.height = this._note.resizeH.y - 20;
               this._note.bg1.height = this._note.resizeH.y - 100;
               this._note.bgMask.height = this._note.resizeH.y - 100;
            }
            else if(this._note.resizeH.y > 650)
            {
               this._note.resizeH.y = 650;
               this._note.bg2.height = 480;
               this._note.bg1.height = 400;
               this.noteResizeStop1();
            }
            else if(this._note.resizeH.y < 237)
            {
               this._note.resizeH.y = 237;
               this._note.bg2.height = 217;
               this._note.bg1.height = 138;
               this.noteResizeStop1();
            }
            this.resizeB = true;
            this.updateNoteScale();
         }
         else if(this._empString == "resizeW")
         {
            if(this._note.resizeW.x < 650 && this._note.resizeW.x > 223)
            {
               this._note.bg2.width = this._note.bg1.width = this._note.bgMask.width = this._note.resizeW.x;
               this._note.resizeH.width = this._note.bg2.width + 8;
            }
            else if(this._note.resizeW.x > 650)
            {
               this._note.resizeW.x = this._note.bg2.width = 650;
               this.noteResizeStop1();
            }
            else if(this._note.resizeW.x < 223)
            {
               this._note.resizeW.x = this._note.bg2.width = 223;
               this.noteResizeStop1();
            }
            this.resizeB = false;
            this.updateNoteScale();
         }
      }
      
      public function noteResizeStop1(e:MouseEvent = null) : void
      {
         this._note.resizeH.addEventListener(MouseEvent.MOUSE_DOWN,this.noteResizeStart1);
         this._note.resizeW.addEventListener(MouseEvent.MOUSE_DOWN,this.noteResizeStart1);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.noteResizeStop1);
         stage.removeEventListener(Event.ENTER_FRAME,this.noteResizeFrame1);
         this._note.resizeH.stopDrag();
         this._note.resizeW.stopDrag();
         if(this.resizeB)
         {
            this._note.bg2.height = this._note.resizeW.height = this._note.resizeH.y - 20;
            this._note.bg1.height = this._note.resizeH.y - 100;
            this._note.bgMask.height = this._note.resizeH.y - 100;
            this.noteSizes[this.guncelSayfa][this.hangiNot].y = this._note.resizeH.y;
         }
         else
         {
            this._note.bg1.width = this._note.bg2.width = this._note.bgMask.width = this._note.resizeW.x;
            this._note.resizeH.width = this._note.bg2.width + 8;
            this.noteSizes[this.guncelSayfa][this.hangiNot].x = this._note.resizeW.x;
         }
         this.updateNoteScale();
      }
      
      public function goBack2(e:MouseEvent = null) : void
      {
         if(this.brushLayer2 != 0 && this.drawAreas2[this.guncelSayfa][this.hangiNot].contains(this.brushAreas2[this.brushLayer2]))
         {
            this.drawAreas2[this.guncelSayfa][this.hangiNot].removeChild(this.brushAreas2[this.brushLayer2]);
            --this.brushLayer2;
         }
      }
      
      public function onFrame2(e:MouseEvent) : void
      {
         this.currentPoint = new Point(this._note.mouseX,this._note.mouseY - 77.4);
         this.currentPoint = new Point(this.currentPoint.x,this.lastPoint.y + (this.currentPoint.y - this.lastPoint.y) * 0.5);
         if(this._note.bg1.hitTestPoint(mouseX,mouseY,true))
         {
            var _loc2_:* = this.sayac++;
            this.pointler[_loc2_] = {
               "x":this.currentPoint.x,
               "y":this.currentPoint.y
            };
            this.brushAreas2[this.brushLayer2].graphics.lineTo(this.currentPoint.x,this.currentPoint.y);
            this.lastPoint = this.currentPoint;
         }
      }
      
      public function onStartDraw2(e:MouseEvent) : void
      {
         this._note.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartDraw2);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onStopDraw2);
         if(!this.isDrawing && this._note.bg1.hitTestPoint(mouseX,mouseY,true))
         {
            this.pointler = [];
            this.sayac = 0;
            ++this.brushLayer2;
            this.brushAreas2[this.brushLayer2] = new Sprite();
            this.drawAreas2[this.guncelSayfa][this.hangiNot].addChild(this.brushAreas2[this.brushLayer2]);
            this.brushAreas2[this.brushLayer2].graphics.lineStyle(this.activeLineWidth,this.activeColor,1);
            this.isDrawing = true;
            this.lastPoint = new Point(this._note.mouseX,this._note.mouseY - 77.4);
            this.brushAreas2[this.brushLayer2].graphics.moveTo(this.lastPoint.x,this.lastPoint.y);
            var _loc2_:* = this.sayac++;
            this.pointler[_loc2_] = {
               "x":this._note.mouseX,
               "y":this._note.mouseY - 77.4
            };
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onFrame2);
         }
      }
      
      public function onStopDraw2(e:MouseEvent) : void
      {
         this._note.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartDraw2);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStopDraw2);
         this.currentPoint = new Point(this._note.mouseX,this._note.mouseY - 77.4);
         if(this.isDrawing)
         {
            if(this.currentPoint.x == this.lastPoint.x && this.currentPoint.y == this.lastPoint.y)
            {
               this.brushAreas2[this.brushLayer2].graphics.lineTo(this.currentPoint.x + 0.2,this.currentPoint.y);
            }
            else
            {
               this.lastLine = this.pointler;
               this.simplify(this.brushAreas2[this.brushLayer2],1,1);
            }
            this.isDrawing = false;
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onFrame2);
         }
      }
      
      public function onMarkFrame2(e:MouseEvent) : void
      {
         this.currentPoint = new Point(this._note.mouseX,this._note.mouseY - 77.4);
         this.currentPoint = new Point(this.currentPoint.x,this.lastPoint.y + (this.currentPoint.y - this.lastPoint.y) * 0.5);
         if(this._note.bg1.hitTestPoint(mouseX,mouseY,true))
         {
            var _loc2_:* = this.sayac++;
            this.pointler[_loc2_] = {
               "x":this.currentPoint.x,
               "y":this.currentPoint.y
            };
            this.brushAreas2[this.brushLayer2].graphics.lineTo(this.currentPoint.x,this.currentPoint.y);
            this.lastPoint = this.currentPoint;
         }
      }
      
      public function onStartMark2(e:MouseEvent) : void
      {
         this._note.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartMark2);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onStopMark2);
         if(!this.isMarking && this._note.bg1.hitTestPoint(mouseX,mouseY,true))
         {
            this.pointler = [];
            this.sayac = 0;
            ++this.brushLayer2;
            this.brushAreas2[this.brushLayer2] = new Sprite();
            this.drawAreas2[this.guncelSayfa][this.hangiNot].addChild(this.brushAreas2[this.brushLayer2]);
            this.brushAreas2[this.brushLayer2].graphics.lineStyle(this.activeLineWidth * 5,this.activeColor,0.3);
            this.isMarking = true;
            this.lastPoint = new Point(this._note.mouseX,this._note.mouseY - 77.4);
            this.brushAreas2[this.brushLayer2].graphics.moveTo(this.lastPoint.x,this.lastPoint.y);
            var _loc2_:* = this.sayac++;
            this.pointler[_loc2_] = {
               "x":this._note.mouseX,
               "y":this._note.mouseY - 77.4
            };
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMarkFrame2);
         }
      }
      
      public function onStopMark2(e:MouseEvent) : void
      {
         this._note.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartMark2);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStopMark2);
         if(this.isMarking)
         {
            this.currentPoint = new Point(this._note.mouseX,this._note.mouseY - 77.4);
            if(this.currentPoint.x == this.lastPoint.x && this.currentPoint.y == this.lastPoint.y)
            {
               this.brushAreas2[this.brushLayer2].graphics.lineTo(this.currentPoint.x + 0.2,this.currentPoint.y);
            }
            else
            {
               this.lastLine = this.pointler;
               this.simplify(this.brushAreas2[this.brushLayer2],5,0.3);
            }
            this.isMarking = false;
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMarkFrame2);
         }
      }
      
      public function lineOnFrame2(e:MouseEvent) : void
      {
         if(this.isLineDrawing && this._note.bg1.hitTestPoint(mouseX,mouseY,true))
         {
            this.tempShape.graphics.clear();
            this.tempShape.graphics.lineStyle(this.activeLineWidth,this.activeColor,1,true,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
            this.tempShape.graphics.moveTo(this.startPoint.x,this.startPoint.y);
            this.tempShape.graphics.lineTo(this._note.mouseX,this._note.mouseY - 77.4);
            this._note.tempLayer2.addChild(this.tempShape);
         }
      }
      
      public function onStartLine2(e:MouseEvent) : void
      {
         if(!this.isLineDrawing && this._note.bg1.hitTestPoint(mouseX,mouseY,true))
         {
            stage.addEventListener(MouseEvent.MOUSE_UP,this.onStopLine2);
            this._note.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartLine2);
            this.startPoint = new Point(this._note.mouseX,this._note.mouseY - 77.4);
            this.isLineDrawing = true;
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.lineOnFrame2);
         }
      }
      
      public function onStopLine2(e:MouseEvent) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStopLine2);
         this._note.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartLine2);
         this.tempShape.graphics.clear();
         this.isLineDrawing = false;
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.lineOnFrame2);
         this.lastPoint = new Point(this._note.mouseX,this._note.mouseY - 77.4);
         if(this._note.bg1.hitTestPoint(mouseX,mouseY,true))
         {
            ++this.brushLayer2;
            this.brushAreas2[this.brushLayer2] = new Sprite();
            this.brushAreas2[this.brushLayer2].graphics.lineStyle(this.activeLineWidth,this.activeColor,1,true,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
            this.brushAreas2[this.brushLayer2].graphics.beginFill(this.activeColor);
            this.brushAreas2[this.brushLayer2].graphics.moveTo(this.startPoint.x,this.startPoint.y);
            this.brushAreas2[this.brushLayer2].graphics.lineTo(this.lastPoint.x,this.lastPoint.y);
            this.drawAreas2[this.guncelSayfa][this.hangiNot].addChild(this.brushAreas2[this.brushLayer2]);
         }
      }
      
      public function eraseOnFrame2(e:MouseEvent) : void
      {
         this.currentPoint = new Point(this._note.mouseX,this._note.mouseY - 77.4);
         this.currentPoint = new Point(this.currentPoint.x,this.lastPoint.y + (this.currentPoint.y - this.lastPoint.y) * 0.5);
         if(this._note.bg1.hitTestPoint(mouseX,mouseY,true))
         {
            this.mcEraser2.x = this.currentPoint.x;
            this.mcEraser2.y = this.currentPoint.y;
            this.brushAreas2[this.brushLayer2].graphics.lineTo(this.currentPoint.x,this.currentPoint.y);
            this.brushAreas2[this.brushLayer2].blendMode = BlendMode.ERASE;
            this.lastPoint = this.currentPoint;
         }
      }
      
      public function onStartErase2(e:MouseEvent) : void
      {
         if(!this.isErasing && this._note.bg1.hitTestPoint(mouseX,mouseY,true))
         {
            this.mcEraser2.x = this._note.mouseX;
            this.mcEraser2.y = this._note.mouseY - 77.4;
            this._note.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartErase2);
            stage.addEventListener(MouseEvent.MOUSE_UP,this.onStopErase2);
            this.mcEraser2.width = this.mcEraser2.height = this.activeLineWidth * 10;
            ++this.brushLayer2;
            this.brushAreas2[this.brushLayer2] = new Sprite();
            this.drawAreas2[this.guncelSayfa][this.hangiNot].addChild(this.brushAreas2[this.brushLayer2]);
            this.drawAreas2[this.guncelSayfa][this.hangiNot].blendMode = BlendMode.LAYER;
            this.brushAreas2[this.brushLayer2].graphics.lineStyle(this.activeLineWidth * 10,this.activeColor,1);
            this.mcEraser2.visible = true;
            this._note.tempLayer2.addChild(this.mcEraser2);
            this.isErasing = true;
            this.lastPoint = new Point(this._note.mouseX,this._note.mouseY - 77.4);
            this.brushAreas2[this.brushLayer2].graphics.moveTo(this.lastPoint.x,this.lastPoint.y);
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.eraseOnFrame2);
         }
      }
      
      public function onStopErase2(e:MouseEvent) : void
      {
         this._note.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartErase2);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStopErase2);
         this.mcEraser2.visible = false;
         if(this.isErasing)
         {
            this.currentPoint = new Point(this._note.mouseX,this._note.mouseY - 77.4);
            this.isErasing = false;
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.eraseOnFrame2);
         }
      }
      
      public function arrowOnFrame2(e:MouseEvent) : void
      {
         var _angleDegree:Number = NaN;
         var _size:Number = NaN;
         var _angle:Number = NaN;
         var _w:Number = NaN;
         var _h:Number = NaN;
         var _angleDeg:Number = NaN;
         if(this.isArrowDrawing && this._note.bg1.hitTestPoint(mouseX,mouseY,true))
         {
            _angleDegree = 45;
            _size = this.activeLineWidth;
            _angle = this.polarAngle(new Point(this._note.mouseX,this._note.mouseY - 77.4),new Point(this.startPoint.x,this.startPoint.y));
            this.tempShape.graphics.clear();
            this.tempShape.graphics.lineStyle(this.activeLineWidth,this.activeColor,1,false,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
            this.tempShape.graphics.moveTo(this.startPoint.x,this.startPoint.y);
            this.tempShape.graphics.lineTo(this._note.mouseX,this._note.mouseY - 77.4);
            _w = 7 + Math.ceil(this.activeLineWidth / 7);
            _h = 11 + Math.ceil(this.activeLineWidth / 11);
            _angleDeg = 37;
            _size = _size * 5 / 2;
            this.tempShape.graphics.moveTo(this._note.mouseX + 0 * Math.cos(_angle * Math.PI / 180),this._note.mouseY - 77.4 + 0 * Math.sin(_angle * Math.PI / 180));
            this.tempShape.graphics.lineTo(this._note.mouseX - _size * Math.cos((_angle - _angleDegree) * Math.PI / 180),this._note.mouseY - 77.4 - _size * Math.sin((_angle - _angleDegree) * Math.PI / 180));
            this.tempShape.graphics.moveTo(this._note.mouseX + 0 * Math.cos(_angle * Math.PI / 180),this._note.mouseY - 77.4 + 0 * Math.sin(_angle * Math.PI / 180));
            this.tempShape.graphics.lineTo(this._note.mouseX - _size * Math.cos((_angle + _angleDegree) * Math.PI / 180),this._note.mouseY - 77.4 - _size * Math.sin((_angle + _angleDegree) * Math.PI / 180));
            this._note.tempLayer2.addChild(this.tempShape);
         }
      }
      
      public function onStartArrow2(e:MouseEvent) : void
      {
         if(!this.isArrowDrawing && this._note.bg1.hitTestPoint(mouseX,mouseY,true))
         {
            this._note.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartArrow2);
            stage.addEventListener(MouseEvent.MOUSE_UP,this.onStopArrow2);
            this.startPoint = new Point(this._note.mouseX,this._note.mouseY - 77.4);
            this.isArrowDrawing = true;
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.arrowOnFrame2);
         }
      }
      
      public function onStopArrow2(e:MouseEvent) : void
      {
         var _angleDegree:Number = NaN;
         var _size:Number = NaN;
         var _angle:Number = NaN;
         var _w:Number = NaN;
         var _h:Number = NaN;
         var _angleDeg:Number = NaN;
         this._note.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartArrow2);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStopArrow2);
         this.tempShape.graphics.clear();
         this.isArrowDrawing = false;
         this.lastPoint = new Point(this._note.mouseX,this._note.mouseY - 77.4);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.arrowOnFrame2);
         if(this._note.bg1.hitTestPoint(mouseX,mouseY,true))
         {
            ++this.brushLayer2;
            this.brushAreas2[this.brushLayer2] = new Sprite();
            _angleDegree = 45;
            _size = this.activeLineWidth;
            _angle = this.polarAngle(new Point(this.lastPoint.x,this.lastPoint.y),new Point(this.startPoint.x,this.startPoint.y));
            this.brushAreas2[this.brushLayer2].graphics.lineStyle(this.activeLineWidth,this.activeColor,1,false,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
            this.brushAreas2[this.brushLayer2].graphics.moveTo(this.startPoint.x,this.startPoint.y);
            this.brushAreas2[this.brushLayer2].graphics.lineTo(this.lastPoint.x,this.lastPoint.y);
            _w = 7 + Math.ceil(this.activeLineWidth / 7);
            _h = 11 + Math.ceil(this.activeLineWidth / 11);
            _angleDeg = 37;
            _size = _size * 5 / 2;
            this.brushAreas2[this.brushLayer2].graphics.moveTo(this._note.mouseX + 0 * Math.cos(_angle * Math.PI / 180),this._note.mouseY - 77.4 + 0 * Math.sin(_angle * Math.PI / 180));
            this.brushAreas2[this.brushLayer2].graphics.lineTo(this._note.mouseX - _size * Math.cos((_angle - _angleDegree) * Math.PI / 180),this._note.mouseY - 77.4 - _size * Math.sin((_angle - _angleDegree) * Math.PI / 180));
            this.brushAreas2[this.brushLayer2].graphics.moveTo(this._note.mouseX + 0 * Math.cos(_angle * Math.PI / 180),this._note.mouseY - 77.4 + 0 * Math.sin(_angle * Math.PI / 180));
            this.brushAreas2[this.brushLayer2].graphics.lineTo(this._note.mouseX - _size * Math.cos((_angle + _angleDegree) * Math.PI / 180),this._note.mouseY - 77.4 - _size * Math.sin((_angle + _angleDegree) * Math.PI / 180));
            this.drawAreas2[this.guncelSayfa][this.hangiNot].addChild(this.brushAreas2[this.brushLayer2]);
         }
      }
      
      public function circleOnFrame2(e:MouseEvent) : void
      {
         if(this.isCircleDrawing && this._note.bg1.hitTestPoint(mouseX,mouseY,true))
         {
            this.tempShape.graphics.clear();
            this.tempShape.graphics.lineStyle(this.activeLineWidth,this.activeColor,1);
            this.tempShape.graphics.drawEllipse(this.startPoint.x,this.startPoint.y,this._note.mouseX - this.startPoint.x,this._note.mouseY - 77.4 - this.startPoint.y);
            this._note.tempLayer2.addChild(this.tempShape);
         }
      }
      
      public function onStartCircle2(e:MouseEvent) : void
      {
         if(!this.isCircleDrawing && this._note.bg1.hitTestPoint(mouseX,mouseY,true))
         {
            this._note.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartCircle2);
            stage.addEventListener(MouseEvent.MOUSE_UP,this.onStopCircle2);
            this.startPoint = new Point(this._note.mouseX,this._note.mouseY - 77.4);
            this.isCircleDrawing = true;
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.circleOnFrame2);
         }
      }
      
      public function onStopCircle2(e:MouseEvent) : void
      {
         this._note.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartCircle2);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStopCircle2);
         this.tempShape.graphics.clear();
         this.lastPoint = new Point(this._note.mouseX,this._note.mouseY - 77.4);
         this.isCircleDrawing = false;
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.circleOnFrame2);
         if(this._note.bg1.hitTestPoint(mouseX,mouseY,true) && this.startPoint.x != this.lastPoint.x && this.startPoint.y != this.lastPoint.y)
         {
            ++this.brushLayer2;
            this.brushAreas2[this.brushLayer2] = new Sprite();
            this.brushAreas2[this.brushLayer2].graphics.lineStyle(this.activeLineWidth,this.activeColor,1);
            this.brushAreas2[this.brushLayer2].graphics.drawEllipse(this.startPoint.x,this.startPoint.y,this._note.mouseX - this.startPoint.x,this._note.mouseY - 77.4 - this.startPoint.y);
            this.drawAreas2[this.guncelSayfa][this.hangiNot].addChild(this.brushAreas2[this.brushLayer2]);
         }
      }
      
      public function squareOnFrame2(e:MouseEvent) : void
      {
         if(this.isSquareDrawing && this._note.bg1.hitTestPoint(mouseX,mouseY,true))
         {
            this.tempShape.graphics.clear();
            this.tempShape.graphics.lineStyle(this.activeLineWidth,this.activeColor,1,true,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
            this.tempShape.graphics.drawRect(this.startPoint.x,this.startPoint.y,this._note.mouseX - this.startPoint.x,this._note.mouseY - 77.4 - this.startPoint.y);
            this._note.tempLayer2.addChild(this.tempShape);
         }
      }
      
      public function onStartSquare2(e:MouseEvent) : void
      {
         if(!this.isSquareDrawing && this._note.bg1.hitTestPoint(mouseX,mouseY,true))
         {
            this._note.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartSquare2);
            stage.addEventListener(MouseEvent.MOUSE_UP,this.onStopSquare2);
            this.startPoint = new Point(this._note.mouseX,this._note.mouseY - 77.4);
            this.isSquareDrawing = true;
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.squareOnFrame2);
         }
      }
      
      public function onStopSquare2(e:MouseEvent) : void
      {
         this._note.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartSquare2);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStopSquare2);
         this.tempShape.graphics.clear();
         this.lastPoint = new Point(this._note.mouseX,this._note.mouseY - 77.4);
         this.isSquareDrawing = false;
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.squareOnFrame2);
         if(this._note.bg1.hitTestPoint(mouseX,mouseY,true) && this.startPoint.x != this.lastPoint.x && this.startPoint.y != this.lastPoint.y)
         {
            ++this.brushLayer2;
            this.brushAreas2[this.brushLayer2] = new Sprite();
            this.brushAreas2[this.brushLayer2].graphics.lineStyle(this.activeLineWidth,this.activeColor,1,true,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
            this.brushAreas2[this.brushLayer2].graphics.drawRect(this.startPoint.x,this.startPoint.y,this._note.mouseX - this.startPoint.x,this._note.mouseY - 77.4 - this.startPoint.y);
            this.drawAreas2[this.guncelSayfa][this.hangiNot].addChild(this.brushAreas2[this.brushLayer2]);
         }
      }
      
      public function triangleOnFrame2(e:MouseEvent) : void
      {
         var _distance1:Number = NaN;
         var _x:Number = NaN;
         var _y:Number = NaN;
         var _p:Array = null;
         if(this.isTriangeDrawing && this._note.bg1.hitTestPoint(mouseX,mouseY,true))
         {
            this.currentPoint = new Point(this._note.mouseX,this._note.mouseY - 77.4);
            _distance1 = this.distanceTwoPoints(this.startPoint.x,this.startPoint.y,this.currentPoint.x,this.currentPoint.y) / 2;
            _x = Math.abs(this.startPoint.x - this.currentPoint.x);
            _y = Math.abs(this.startPoint.y - this.currentPoint.y);
            _p = new Array();
            _p[0] = {
               "x":this.startPoint.x,
               "y":this.startPoint.y
            };
            if(_x >= _y)
            {
               _p[1] = new Object();
               _p[1].x = this.currentPoint.x;
               _p[1].y = this.currentPoint.y - _distance1;
               _p[2] = new Object();
               _p[2].x = this.currentPoint.x;
               _p[2].y = this.currentPoint.y + _distance1;
               if(!(_p[2].y < this._note.bg1.height && 0 < _p[1].y))
               {
                  return;
               }
            }
            else
            {
               _p[1] = new Object();
               _p[1].x = this.currentPoint.x - _distance1;
               _p[1].y = this.currentPoint.y;
               _p[2] = new Object();
               _p[2].x = this.currentPoint.x + _distance1;
               _p[2].y = this.currentPoint.y;
               if(!(_p[2].x < this._note.bg1.width && 0 < _p[1].x))
               {
                  return;
               }
            }
            _p[3] = new Object();
            _p[3].x = _p[0].x;
            _p[3].y = _p[0].y;
            this.tempShape.graphics.clear();
            this.tempShape.graphics.lineStyle(this.activeLineWidth,this.activeColor,1,true,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
            this.tempShape.graphics.moveTo(_p[0].x,_p[0].y);
            this.tempShape.graphics.lineTo(_p[1].x,_p[1].y);
            this.tempShape.graphics.lineTo(_p[2].x,_p[2].y);
            this.tempShape.graphics.lineTo(_p[3].x,_p[3].y);
            this._note.tempLayer2.addChild(this.tempShape);
         }
      }
      
      public function onStartTriangle2(e:MouseEvent) : void
      {
         if(!this.isTriangeDrawing && this._note.bg1.hitTestPoint(mouseX,mouseY,true))
         {
            this._note.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartTriangle2);
            stage.addEventListener(MouseEvent.MOUSE_UP,this.onStopTriangle2);
            this.startPoint = new Point(this._note.mouseX,this._note.mouseY - 77.4);
            this.isTriangeDrawing = true;
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.triangleOnFrame2);
         }
      }
      
      public function onStopTriangle2(e:MouseEvent) : void
      {
         var _distance1:Number = NaN;
         var _x:Number = NaN;
         var _y:Number = NaN;
         var _p:Array = null;
         this._note.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartTriangle2);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStopTriangle2);
         this.tempShape.graphics.clear();
         this.lastPoint = new Point(this._note.mouseX,this._note.mouseY - 77.4);
         this.isTriangeDrawing = false;
         removeEventListener(MouseEvent.MOUSE_MOVE,this.triangleOnFrame2);
         if(this._note.bg1.hitTestPoint(mouseX,mouseY,true) && this.startPoint.x != this.lastPoint.x && this.startPoint.y != this.lastPoint.y)
         {
            ++this.brushLayer2;
            this.brushAreas2[this.brushLayer2] = new Sprite();
            this.currentPoint = new Point(this.lastPoint.x,this.lastPoint.y);
            _distance1 = this.distanceTwoPoints(this.startPoint.x,this.startPoint.y,this.currentPoint.x,this.currentPoint.y) / 2;
            _x = Math.abs(this.startPoint.x - this.currentPoint.x);
            _y = Math.abs(this.startPoint.y - this.currentPoint.y);
            _p = new Array();
            _p[0] = {
               "x":this.startPoint.x,
               "y":this.startPoint.y
            };
            if(_x >= _y)
            {
               _p[1] = new Object();
               _p[1].x = this.currentPoint.x;
               _p[1].y = this.currentPoint.y - _distance1;
               _p[2] = new Object();
               _p[2].x = this.currentPoint.x;
               _p[2].y = this.currentPoint.y + _distance1;
               if(!(_p[2].y < this._note.bg1.height && 0 < _p[1].y))
               {
                  return;
               }
            }
            else
            {
               _p[1] = new Object();
               _p[1].x = this.currentPoint.x - _distance1;
               _p[1].y = this.currentPoint.y;
               _p[2] = new Object();
               _p[2].x = this.currentPoint.x + _distance1;
               _p[2].y = this.currentPoint.y;
               if(!(_p[2].x < this._note.bg1.width && 0 < _p[1].x))
               {
                  return;
               }
            }
            _p[3] = new Object();
            _p[3].x = _p[0].x;
            _p[3].y = _p[0].y;
            this.brushAreas2[this.brushLayer2].graphics.lineStyle(this.activeLineWidth,this.activeColor,1,true,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
            this.brushAreas2[this.brushLayer2].graphics.moveTo(_p[0].x,_p[0].y);
            this.brushAreas2[this.brushLayer2].graphics.lineTo(_p[1].x,_p[1].y);
            this.brushAreas2[this.brushLayer2].graphics.lineTo(_p[2].x,_p[2].y);
            this.brushAreas2[this.brushLayer2].graphics.lineTo(_p[3].x,_p[3].y);
            this.drawAreas2[this.guncelSayfa][this.hangiNot].addChild(this.brushAreas2[this.brushLayer2]);
         }
      }
      
      public function changeMode(e:MouseEvent) : *
      {
         this.playSound("b");
         if(!this._isWhite)
         {
            if(!this.isIm)
            {
               if(this.imMode == 0)
               {
                  this.imMode = 1;
                  this.toolBar.btnMode.mcicon.gotoAndStop(1);
                  this.toolBar.btnMode.mcTxt.text = "ÖNİZLEME";
               }
               else
               {
                  this.imMode = 0;
                  this.toolBar.btnMode.mcicon.gotoAndStop(2);
                  this.toolBar.btnMode.mcTxt.text = "İŞLEMSEL";
               }
            }
            if(this.isIm)
            {
               this.closeCloseZoom();
               this.kapKontrol();
               this._scale = this._firstScale;
               this._canvas.x = this._firstPos.x;
               this._canvas.y = this._firstPos.y;
               this._canvas.scaleX = this._scale;
               this._canvas.scaleY = this._scale;
               if(this.imMode == 0)
               {
                  this.imMode = 1;
                  this.toolBar.btnMode.mcicon.gotoAndStop(1);
                  this.toolBar.btnMode.mcTxt.text = "ÖNİZLEME";
               }
               else
               {
                  this.imMode = 0;
                  this.toolBar.btnMode.mcicon.gotoAndStop(2);
                  this.toolBar.btnMode.mcTxt.text = "İŞLEMSEL";
               }
               if(!this.zengIm)
               {
                  this.openImBtn();
                  if(this.imMode == 0)
                  {
                     this.autoZoom0(this.selectItems[this.guncelIm]["rect"]);
                  }
                  else
                  {
                     this.autoZoom1(this.selectItems[this.guncelIm]["rect"]);
                  }
               }
               else if(this.imMode == 0)
               {
                  this.autoZoom0Zeng(this._objZeng[0][this.zengImGuncel]["rc"]);
               }
               else
               {
                  this.autoZoom1Zeng(this._objZeng[0][this.zengImGuncel]["rc"]);
               }
               this.closeBtnLock();
            }
         }
      }
      
      public function changeImPercent(_t:*) : void
      {
         if(!this.zengIm)
         {
            if(_t == "out")
            {
               if(this.selectItems[this.guncelIm]["imPercent"] < 0.4)
               {
                  return;
               }
               this.selectItems[this.guncelIm]["imPercent"] -= 0.1;
            }
            else
            {
               if(this.selectItems[this.guncelIm]["imPercent"] > 0.9)
               {
                  return;
               }
               this.selectItems[this.guncelIm]["imPercent"] += 0.1;
            }
            this.kapKontrol();
            this.autoZoom0(this.selectItems[this.guncelIm]["rect"]);
         }
         else
         {
            if(_t == "out")
            {
               if(this._objZeng[0][this.zengImGuncel]["imPercent"] < 0.4)
               {
                  return;
               }
               this._objZeng[0][this.zengImGuncel]["imPercent"] -= 0.1;
            }
            else
            {
               if(this._objZeng[0][this.zengImGuncel]["imPercent"] > 0.9)
               {
                  return;
               }
               this._objZeng[0][this.zengImGuncel]["imPercent"] += 0.1;
            }
            this.kapKontrol();
            this.autoZoom0Zeng(this._objZeng[0][this.zengImGuncel]["rc"]);
         }
      }
      
      public function autoSelect(e:MouseEvent) : void
      {
         this.kapKontrol();
         this.zengIm = false;
         this.guncelIm = e.currentTarget.name.split("_")[1];
         this.openImBtn();
         if(this.imMode == 0)
         {
            this.autoZoom0(this.selectItems[e.currentTarget.name.split("_")[1]]["rect"]);
         }
         else
         {
            this.autoZoom1(this.selectItems[e.currentTarget.name.split("_")[1]]["rect"]);
         }
      }
      
      public function selectAutoCalc(_rectangle:Rectangle, _no:Number) : *
      {
         var _space:Number = NaN;
         var _x:Number = NaN;
         var _y:Number = NaN;
         var _width:Number = NaN;
         var _height:Number = NaN;
         TweenMax.killTweensOf(this._white);
         this._scale = Math.min((this._capX - this._imPadding * 2) * _no / _rectangle.width,(this._capY - this._capYOffset - this._imPadding * 2) * _no / _rectangle.height);
         _space = this._imPadding / this._scale;
         _x = _rectangle.x - _space;
         _y = _rectangle.y - _space;
         _width = (this._capX - _rectangle.width * this._scale) / this._scale + _rectangle.width;
         _height = (this._capY - this._capYOffset - _rectangle.height * this._scale) / this._scale + _rectangle.height;
         this._white.graphics.clear();
         this._white.graphics.beginFill(16777215,1);
         this._white.graphics.moveTo(_x,_y);
         this._white.graphics.lineTo(_x,_y + _height);
         this._white.graphics.lineTo(_x + _width,_y + _height);
         this._white.graphics.lineTo(_x + _width,_y);
         this._white.graphics.lineTo(_x + _space + _rectangle.width,_y);
         this._white.graphics.lineTo(_x + _space + _rectangle.width,_y + _space + _rectangle.height);
         this._white.graphics.lineTo(_x + _space,_y + _space + _rectangle.height);
         this._white.graphics.lineTo(_x + _space,_y + _space);
         this._white.graphics.lineTo(_x + _space + _rectangle.width,_y + _space);
         this._white.graphics.lineTo(_x + _space + _rectangle.width,_y);
         if(!this._isWhite)
         {
            this.itemMask.x = _rectangle.x;
            this.itemMask.y = _rectangle.y;
            this.itemMask.width = _rectangle.width;
            this.itemMask.height = _rectangle.height;
            this.itemMc.mask = this.itemMask;
         }
         else
         {
            this.itemMask.x = _rectangle.x;
            this.itemMask.y = _rectangle.y;
            this.itemMask.width = 1;
            this.itemMask.height = 1;
            this.itemMc.mask = this.itemMask;
         }
         this._canvas.x = -_rectangle.x * this._scale + _space * this._scale;
         this._canvas.y = -_rectangle.y * this._scale + _space * this._scale;
         this._canvas.scaleX = this._scale;
         this._canvas.scaleY = this._scale;
         this.openWhite();
         this.openCloseZoom(false);
         if(this.toolBar.x < this._capX / 2)
         {
            TweenMax.to(this.toolBar,1,{"x":this._capX * 0.8});
         }
      }
      
      public function autoZoom0(_rectangle:Rectangle) : *
      {
         var key:* = null;
         this.checkPreData(this.guncelIm);
         if(this.guncelIm == this.selectItems.length - 1)
         {
            this.addEmptyWhite();
         }
         if(!this.isIm)
         {
            this.bigErase();
         }
         this.toolBar.btnBrush.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
         this.preRecordPanel.visible = true;
         this.preRecordPanel.btnSaveAns.visible = true;
         this.preRecordPanel.btnNavi.preMc.visible = true;
         this.preRecordPanel.btnNavi.nextMc.visible = true;
         if(!this.isIm)
         {
            this.openImBtn();
            this.isIm = true;
         }
         for(key in this.selectItems)
         {
            if(this.selectItems[key]["page"] == this.guncelSayfa)
            {
               this.selectItems[key]["im"].visible = false;
            }
         }
         TweenMax.killTweensOf(this._white);
         if(!this.selectItems[this.guncelIm]["imPercent"])
         {
            if(_rectangle.height < _rectangle.width)
            {
               this.selectItems[this.guncelIm]["imPercent"] = 0.7;
            }
            else
            {
               this.selectItems[this.guncelIm]["imPercent"] = 1;
            }
         }
         this.selectAutoCalc(_rectangle,this.selectItems[this.guncelIm]["imPercent"]);
         this.openBtnLock();
         this.showVectorVideo(_rectangle,this._scale,0,0);
      }
      
      public function autoZoom1(_rectangle:Rectangle) : *
      {
         if(!this.isIm)
         {
            this.openImBtn();
            this.isIm = true;
         }
         this._num = 0.85;
         this.selectCalc(_rectangle,this._num);
      }
      
      public function bigErase() : *
      {
         if(!this._bigErase)
         {
            this._bigErase = true;
            ++this.brushLayer;
            this._eraseLayer = this.brushLayer;
            this.brushAreas[this.brushLayer] = new Sprite();
            this.drawAreas[this.guncelSayfa].addChild(this.brushAreas[this.brushLayer]);
            this.drawAreas[this.guncelSayfa].blendMode = BlendMode.LAYER;
            this.brushAreas[this.brushLayer].graphics.beginFill(0,1);
            this.brushAreas[this.brushLayer].graphics.drawRect(0,0,this._book.width,this._book.height);
            this.brushAreas[this.brushLayer].graphics.endFill();
            this.brushAreas[this.brushLayer].blendMode = BlendMode.ERASE;
         }
      }
      
      public function openImBtn() : *
      {
         this.footer.previousIm.visible = true;
         this.footer.nextIm.visible = true;
         this.footer.previousIm.addEventListener(MouseEvent.CLICK,this.imJump);
         this.footer.nextIm.addEventListener(MouseEvent.CLICK,this.imJump);
         this.footer.pPage.visible = false;
         this.footer.nPage.visible = false;
      }
      
      public function closeImBtn() : *
      {
         this.footer.previousIm.visible = false;
         this.footer.nextIm.visible = false;
         this.footer.previousIm.removeEventListener(MouseEvent.CLICK,this.imJump);
         this.footer.nextIm.removeEventListener(MouseEvent.CLICK,this.imJump);
         this.footer.pPage.visible = true;
         this.footer.nPage.visible = true;
      }
      
      public function openEmptyIm(e:MouseEvent = null) : *
      {
         if(!this._isWhite)
         {
            if(this.imMode == 1)
            {
               this.imMode = 0;
               this.toolBar.btnMode.mcicon.gotoAndStop(2);
               this.toolBar.btnMode.mcTxt.text = "İŞLEMSEL";
            }
            if(this.isIm)
            {
               this.kapKontrol();
            }
            this.selectItems[this.selectItems.length - 1]["im"].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
            this.sendOpenWhiteData();
         }
      }
      
      public function addEmptyWhite() : *
      {
         this._blankWhite.graphics.clear();
         this._blankWhite.graphics.beginFill(16777215,1);
         this._blankWhite.graphics.drawRect(0,0,this._book.width,this._book.height);
         this._blankWhite.graphics.endFill();
         this._blankWhite.visible = true;
         this._isWhite = true;
      }
      
      public function imJump(e:MouseEvent) : *
      {
         this._blockErase = true;
         if(e.currentTarget.name == "previousIm")
         {
            if(this.guncelIm != 0 && !this._isWhite)
            {
               this.kapKontrol();
               --this.guncelIm;
               if(this.selectItems[this.guncelIm]["page"] != this.guncelSayfa)
               {
                  this.goToThePage(this.selectItems[this.guncelIm]["page"]);
               }
               if(this.imMode == 0)
               {
                  this.autoZoom0(this.selectItems[this.guncelIm]["rect"]);
               }
               else
               {
                  this.autoZoom1(this.selectItems[this.guncelIm]["rect"]);
               }
            }
         }
         else if(this.guncelIm != this.selectItems.length - 2 && !this._isWhite)
         {
            this.kapKontrol();
            ++this.guncelIm;
            if(this.selectItems[this.guncelIm]["page"] != this.guncelSayfa)
            {
               this.goToThePage(this.selectItems[this.guncelIm]["page"]);
            }
            if(this.imMode == 0)
            {
               this.autoZoom0(this.selectItems[this.guncelIm]["rect"]);
            }
            else
            {
               this.autoZoom1(this.selectItems[this.guncelIm]["rect"]);
            }
         }
         this.sendJumpData(e.currentTarget.name);
      }
      
      public function kapKontrol() : *
      {
         var _tfKey:* = null;
         var key:* = null;
         if(!this.zengIm)
         {
            this.openMouseStat(this.sidePanel.btnAddInput);
            this.openMouseStat(this.footer.btnEba);
            this.openMouseStat(this.footer.btnDO);
            this.openMouseStat(this.footer.btnAH);
            this.openMouseStat(this.footer.btnMeeting);
            this.openMouseStat(this.footer.btnSolution);
            this.openMouseStat(this.sidePanel.btnCloudAdmin);
            this.openMouseStat(this.footer.btnZeng);
         }
         this.itemMc.mask = null;
         this.itemMask.x = this.itemMask.y = this.itemMask.height = this.itemMask.width = 1;
         if(this._panelSelectAnswer)
         {
            this.removeStage(this._panelSelectAnswer);
            this._panelSelectAnswer = null;
         }
         this.closeAniPanel();
         if(this.isIm)
         {
            for(_tfKey in this._arrayTF)
            {
               if(this._arrayTF[_tfKey].im)
               {
                  if(this._inputLayer.contains(this._arrayTF[_tfKey].tf))
                  {
                     this._inputLayer.removeChild(this._arrayTF[_tfKey].tf);
                  }
               }
               else if(this._arrayTF[_tfKey].page == this.guncelSayfa)
               {
                  this._inputLayer.addChild(this._arrayTF[_tfKey].tf);
               }
            }
         }
         if(this._kapBl)
         {
            this._canvas.removeChild(this._selectBg);
            this._kapBl = false;
         }
         if(!this.footer.nPage.visible)
         {
            this.footer.pPage.visible = true;
            this.footer.nPage.visible = true;
         }
         if(this.footer.previousIm.visible)
         {
            this.closeImBtn();
            this.mcEraser.x = 200;
            this.mcEraser.y = 200;
            this.zengIm = false;
         }
         if(this.isIm)
         {
            this.isIm = false;
         }
         if(this.imMode == 0)
         {
            if(!this.zengIm)
            {
               this.addImData();
            }
            this.cleanScreen();
            this.returnScreen();
            if(this._bigErase && !this._blockErase)
            {
               this.toolBar.btnBack.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
               this._bigErase = false;
            }
            if(this._isWhite)
            {
               this._isWhite = false;
               this._blankWhite.visible = false;
            }
            this._white.x = this._white.y = 0;
            this._white.graphics.clear();
            this._white.visible = false;
            TweenMax.killDelayedCallsTo(this.mcCiz);
            this.preRecordPanel.visible = false;
            this.preRecordPanel.btnSaveAns.visible = false;
            this.preRecordPanel.btnAns.visible = false;
            this.preRecordPanel.btnNavi.visible = false;
            this.preRecordPanel.btnGoster.visible = false;
            this.stopAutoCiz();
            for(key in this.selectItems)
            {
               if(this.selectItems[key]["page"] == this.guncelSayfa && this.selectItems[key]["im"])
               {
                  this.selectItems[key]["im"].visible = true;
               }
            }
            this._blockErase = false;
            this.hideVectorVideo();
         }
         if(this._sidePanelStatus)
         {
            this.openSidePanel();
         }
      }
      
      public function addImData() : *
      {
         if(this.silinecek.length != 0)
         {
            this.selectItems[this.guncelIm][this._dataType] = new ByteArray();
            this.selectItems[this.guncelIm][this._dataType] = this.createMcData();
         }
      }
      
      public function createMcData() : ByteArray
      {
         var key:* = null;
         this._empArray = new Array();
         this._mcObj = new Array();
         this._byteArr = new Array();
         this._byteArr[0] = new Array();
         this._byteArr[1] = new Array();
         for(this._int = 0; this._int < this.silinecek.length; ++this._int)
         {
            this._mcObj[this._int] = this.brushAreas[this.silinecek[this._int]].graphics.readGraphicsData(true);
            for(this._num = 0; this._num < this.silgiler.length; ++this._num)
            {
               if(this.silinecek[this._int] == this.silgiler[this._num])
               {
                  this._empArray[this._int] = true;
               }
            }
         }
         for(key in this._mcObj)
         {
            this._orjMcData = new Vector.<IGraphicsData>();
            this._orjMcData = this._mcObj[key];
            this._byteArr[0][key] = new Array();
            for(this._int = 0; this._int < this._orjMcData.length; ++this._int)
            {
               this._empString = String(this.getClass(this._orjMcData[this._int]));
               if(this._empString == "[class GraphicsSolidFill]")
               {
                  this._num = 0;
               }
               else if(this._empString == "[class GraphicsPath]")
               {
                  this._num = 1;
               }
               else if(this._empString == "[class GraphicsEndFill]")
               {
                  this._num = 2;
               }
               else if(this._empString == "[class GraphicsStroke]")
               {
                  this._num = 3;
               }
               else if(this._empString == "[class GraphicsBitmapFill]")
               {
                  this._num = 4;
               }
               else if(this._empString == "[class GraphicsGradientFill]")
               {
                  this._num = 5;
               }
               else if(this._empString == "[class GraphicsShaderFill]")
               {
                  this._num = 6;
               }
               this._byteArr[0][key][this._int] = this._num;
            }
            this._byteArr[1][key] = new Vector.<IGraphicsData>();
            this._byteArr[1][key] = this._orjMcData;
         }
         this._byteArr[2] = new Array();
         this._byteArr[2] = this._empArray;
         this._bytes = new ByteArray();
         this._bytes.writeObject(this._byteArr);
         this._bytes.position = 0;
         return this._bytes;
      }
      
      public function openWhite() : *
      {
         var _tfKey:* = null;
         this._white.visible = true;
         if(!this.zengIm)
         {
            if(this.selectItems[this.guncelIm][this._dataType])
            {
               this._empArray = new Array();
               this.selectItems[this.guncelIm][this._dataType].position = 0;
               this._empArray = this.selectItems[this.guncelIm][this._dataType].readObject() as Array;
               for(this._int = 0; this._int < this._empArray[0].length; ++this._int)
               {
                  this._empBoolean = false;
                  if(this._empArray[2][this._int])
                  {
                     this._empBoolean = true;
                  }
                  this.createQueAns(this._empArray[0][this._int],this._empArray[1][this._int],this._empBoolean);
               }
            }
            if(this.selectItems[this.guncelIm]["answer"])
            {
               this._panelSelectAnswer = new libPanelSelectAnswer();
               this._panelSelectAnswer.x = 10;
               this._panelSelectAnswer.y = 10;
               this._panelSelectAnswer.txt.text = this.selectItems[this.guncelIm]["answer"];
               this.addStage(this._panelSelectAnswer);
            }
         }
         for(_tfKey in this._arrayTF)
         {
            if(this._arrayTF[_tfKey].page == this.guncelSayfa && this._arrayTF[_tfKey].im == this.guncelIm)
            {
               this._inputLayer.addChild(this._arrayTF[_tfKey].tf);
            }
            else if(this._arrayTF[_tfKey].page == this.guncelSayfa)
            {
               if(this._inputLayer.contains(this._arrayTF[_tfKey].tf))
               {
                  this._inputLayer.removeChild(this._arrayTF[_tfKey].tf);
               }
            }
         }
      }
      
      public function createQueAns(_newList:Array, _newObjs:Vector.<Object>, _silgiB:Boolean) : *
      {
         var key:* = null;
         this._orjMcData = new Vector.<IGraphicsData>(_newObjs.length,true);
         this._num = 0;
         for(key in _newList)
         {
            if(_newList[key] == 0)
            {
               this._gData1 = new GraphicsSolidFill(_newObjs[key].color,_newObjs[key].alpha);
               this._orjMcData[this._num] = this._gData1;
            }
            else if(_newList[key] == 1)
            {
               this._gData2 = new GraphicsPath(new Vector.<int>(),new Vector.<Number>());
               this._gData2.commands = _newObjs[key].commands;
               this._gData2.data = _newObjs[key].data;
               this._orjMcData[this._num] = this._gData2;
            }
            else if(_newList[key] == 2)
            {
               this._gData3 = new GraphicsEndFill();
               this._orjMcData[this._num] = this._gData3;
            }
            else if(_newList[key] == 3)
            {
               this._solid = null;
               if(_newObjs[key].fill != null)
               {
                  this._solid = new GraphicsSolidFill(_newObjs[key].fill.color,_newObjs[key].fill.alpha);
               }
               if(!_silgiB)
               {
                  this._gData4 = new GraphicsStroke(_newObjs[key].thickness,_newObjs[key].pixelHinting,_newObjs[key].scaleMode,this._joints,this._joints,_newObjs[key].miterLimit,this._solid);
               }
               else
               {
                  this._gData4 = new GraphicsStroke(_newObjs[key].thickness,_newObjs[key].pixelHinting,_newObjs[key].scaleMode,this._joints,this._joints,_newObjs[key].miterLimit,this._solid);
               }
               this._orjMcData[this._num] = this._gData4;
            }
            else if(_newList[key] != 4)
            {
               if(_newList[key] == 5)
               {
                  this._matrix = new Matrix(_newObjs[key].matrix);
                  this._gData6 = new GraphicsGradientFill(_newObjs[key].type,_newObjs[key].colors,_newObjs[key].alphas,_newObjs[key].ratios,this._matrix,_newObjs[key].spreadMethod,_newObjs[key].interpolationMethod,_newObjs[key].focalPointRatio);
                  this._orjMcData[this._num] = this._gData6;
               }
               else if(_newList[key] == 6)
               {
                  this._matrix = new Matrix(_newObjs[key].matrix);
                  this._gData7 = new GraphicsShaderFill(_newObjs[key].shader,this._matrix);
                  this._orjMcData[this._num] = this._gData7;
               }
            }
            ++this._num;
         }
         if(_silgiB)
         {
            ++this.brushLayer;
            this.brushAreas[this.brushLayer] = new Sprite();
            this.brushAreas[this.brushLayer].alpha = 0;
            this.drawAreas[this.guncelSayfa].addChild(this.brushAreas[this.brushLayer]);
            this.drawAreas[this.guncelSayfa].blendMode = BlendMode.LAYER;
            this.brushAreas[this.brushLayer].graphics.drawGraphicsData(this._orjMcData);
            this.brushAreas[this.brushLayer].blendMode = BlendMode.ERASE;
            this.silinecek.push(this.brushLayer);
            this.silgiler.push(this.brushLayer);
         }
         else
         {
            ++this.brushLayer;
            this.brushAreas[this.brushLayer] = new Sprite();
            this.brushAreas[this.brushLayer].alpha = 0;
            this.brushAreas[this.brushLayer].graphics.drawGraphicsData(this._orjMcData);
            this.drawAreas[this.guncelSayfa].addChild(this.brushAreas[this.brushLayer]);
            this.silinecek.push(this.brushLayer);
         }
         TweenMax.to(this.brushAreas[this.brushLayer],this._tweenTime / 3,{"alpha":1});
         if(this._autoB)
         {
            TweenMax.delayedCall(this._tweenTime / 3,this.mcCiz);
         }
      }
      
      public function colorize(object:Object, color:uint) : void
      {
         var ct:Color = null;
         ct = new Color();
         ct.setTint(color,1);
         DisplayObject(object).transform.colorTransform = ct;
      }
      
      public function stopColorize(object:DisplayObject) : *
      {
         var ct:ColorTransform = null;
         ct = new ColorTransform();
         object.transform.colorTransform = ct;
      }
      
      public function objectTint(object:DisplayObject, color:uint) : void
      {
         var ct:Color = null;
         ct = new Color();
         ct.setTint(color,0.5);
         object.transform.colorTransform = ct;
      }
      
      public function objectStretch(o:Object, scale:Number) : *
      {
         o.scaleX = scale;
         o.scaleY = scale;
      }
      
      public function openObjectPanel(_url:String, _type:String) : *
      {
         this.disposeAllObject();
         this.mcObjectPanel = new libmcObjectPanel();
         this.stageAlignCenter(this.mcObjectPanel);
         if(_type == "img")
         {
            this._objectLoader = new ImageLoader(_url,{
               "name":"img",
               "smoothing":true,
               "onProgress":this.objectProgressHandler,
               "onComplete":this.objectCompleteHandler,
               "onError":this.objectErrorHandler
            });
            this._area = new AutoFitArea(this.mcObjectPanel.mcContent,0,0,this.mcObjectPanel.mcBg.width,this.mcObjectPanel.mcBg.height);
         }
         else
         {
            this._objectLoader = new SWFLoader(_url,{
               "name":"swf",
               "crop":true,
               "onProgress":this.objectProgressHandler,
               "onComplete":this.objectCompleteHandler,
               "onError":this.objectErrorHandler
            });
         }
         this._firstObjectData = new Object();
         this.mcObjectPanel.mcLoading.visible = true;
         this.mcObjectPanel.visible = true;
         this.addStage(this.mcObjectPanel);
         this.mcObjectPanel.btnClose.addEventListener(MouseEvent.CLICK,this.closeObjectPanel);
         this.mcObjectPanel.mcHeader.addEventListener(MouseEvent.MOUSE_DOWN,this.dragObjectPanel);
         this._objectLoader.load(true);
         this.mcObjectPanel.btnWidth.addEventListener(MouseEvent.MOUSE_DOWN,this.startObjectPanelResize);
         this.mcObjectPanel.btnHeight.addEventListener(MouseEvent.MOUSE_DOWN,this.startObjectPanelResize);
      }
      
      public function disposeAllObject() : *
      {
         if(this._objectFullStatus)
         {
            this.fullObjectPanel();
         }
         if(this._objectLoader)
         {
            this._objectLoader.dispose(true);
            this._objectLoader = null;
         }
         if(this._displayObject)
         {
            this.mcObjectPanel.mcContent.removeChild(this._displayObject);
            this._displayObject = null;
         }
         this._firstObjectData = null;
         if(this._area)
         {
            this._area.destroy();
            this._area = null;
         }
         if(this.mcObjectPanel)
         {
            this.removeStage(this.mcObjectPanel);
            this.mcObjectPanel = null;
         }
      }
      
      public function closeObjectPanel(e:MouseEvent = null) : *
      {
         if(this.mcObjectPanel)
         {
            this.mcObjectPanel.btnClose.removeEventListener(MouseEvent.CLICK,this.closeObjectPanel);
            this.mcObjectPanel.mcHeader.removeEventListener(MouseEvent.MOUSE_DOWN,this.dragObjectPanel);
            this.mcObjectPanel.btnFullScreen.removeEventListener(MouseEvent.CLICK,this.fullObjectPanel);
            this.mcObjectPanel.btnWidth.removeEventListener(MouseEvent.MOUSE_DOWN,this.startObjectPanelResize);
            this.mcObjectPanel.btnHeight.removeEventListener(MouseEvent.MOUSE_DOWN,this.startObjectPanelResize);
            this.mcObjectPanel.visible = false;
         }
         this.disposeAllObject();
      }
      
      public function objectCompleteHandler(event:LoaderEvent) : void
      {
         this._displayObject = this._objectLoader.rawContent;
         this.mcObjectPanel.mcContent.addChild(this._displayObject);
         if(this._area)
         {
            this._area.attach(this._displayObject);
         }
         else
         {
            this.areaManuel();
         }
         this.mcObjectPanel.mcLoading.visible = false;
         this.mcObjectPanel.btnFullScreen.addEventListener(MouseEvent.CLICK,this.fullObjectPanel);
      }
      
      public function fullObjectPanel(e:MouseEvent = null) : void
      {
         if(this._objectFullStatus)
         {
            this._objectFullStatus = false;
            this.mcObjectPanel.btnFullScreen.gotoAndStop(1);
            this.mcObjectPanel.mcHeader.addEventListener(MouseEvent.MOUSE_DOWN,this.dragObjectPanel);
            this.mcObjectPanel.x = this._firstObjectData.panelX;
            this.mcObjectPanel.y = this._firstObjectData.panelY;
            this.mcObjectPanel.mcHeader.width = this._firstObjectData.headerW;
            this.mcObjectPanel.mcBg.width = this._firstObjectData.bgW;
            this.mcObjectPanel.mcBg.height = this._firstObjectData.bgH;
            this.mcObjectPanel.mcMask.width = this._firstObjectData.bgW;
            this.mcObjectPanel.mcMask.height = this._firstObjectData.bgH;
            this.mcObjectPanel.btnClose.x = this._firstObjectData.btnCloseX;
            this.mcObjectPanel.btnFullScreen.x = this._firstObjectData.btnFullScreenX;
            this.mcObjectPanel.mcBgGlow.visible = true;
            if(this._area)
            {
               this._area.width = this.mcObjectPanel.mcBg.width;
               this._area.height = this.mcObjectPanel.mcBg.height;
            }
            else
            {
               this.areaManuel();
            }
            this.addStage(this.mcObjectPanel);
         }
         else
         {
            this._objectFullStatus = true;
            this.mcObjectPanel.btnFullScreen.gotoAndStop(2);
            this._firstObjectData.panelX = this.mcObjectPanel.x;
            this._firstObjectData.panelY = this.mcObjectPanel.y;
            this._firstObjectData.headerW = this.mcObjectPanel.mcHeader.width;
            this._firstObjectData.bgW = this.mcObjectPanel.mcBg.width;
            this._firstObjectData.bgH = this.mcObjectPanel.mcBg.height;
            this._firstObjectData.btnCloseX = this.mcObjectPanel.btnClose.x;
            this._firstObjectData.btnFullScreenX = this.mcObjectPanel.btnFullScreen.x;
            this.mcObjectPanel.x = 0;
            this.mcObjectPanel.y = 0;
            this.mcObjectPanel.mcHeader.width = this.mcObjectPanel.mcBg.width = this.mcObjectPanel.mcMask.width = this._capX;
            this.mcObjectPanel.mcBg.height = this.mcObjectPanel.mcMask.height = this._capY - this.mcObjectPanel.mcHeader.height;
            this.mcObjectPanel.btnClose.x = this._capX - this.mcObjectPanel.btnClose.width - 5;
            this.mcObjectPanel.btnFullScreen.x = this.mcObjectPanel.btnClose.x - this.mcObjectPanel.btnFullScreen.width - 5;
            this.mcObjectPanel.mcHeader.removeEventListener(MouseEvent.MOUSE_DOWN,this.dragObjectPanel);
            this.mcObjectPanel.mcBgGlow.visible = false;
            if(this._area)
            {
               this._area.width = this._capX;
               this._area.height = this._capY - this.mcObjectPanel.mcHeader.height;
            }
            else
            {
               this.areaManuel();
            }
         }
      }
      
      public function dragObjectPanel(e:MouseEvent) : void
      {
         this.mcObjectPanel.mcHeader.removeEventListener(MouseEvent.MOUSE_DOWN,this.dragObjectPanel);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.dropObjectPanel);
         this.addStage(this.mcObjectPanel);
         this.mcObjectPanel.startDrag();
      }
      
      public function dropObjectPanel(e:MouseEvent) : void
      {
         this.mcObjectPanel.mcHeader.addEventListener(MouseEvent.MOUSE_DOWN,this.dragObjectPanel);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.dropObjectPanel);
         this.mcObjectPanel.stopDrag();
      }
      
      public function areaManuel() : void
      {
         var _scale:Number = NaN;
         _scale = Math.min(this.mcObjectPanel.mcBg.width / this._displayObject.loaderInfo.width,this.mcObjectPanel.mcBg.height / this._displayObject.loaderInfo.height);
         this._displayObject.scaleX = this._displayObject.scaleY = _scale;
         this._displayObject.x = (this.mcObjectPanel.mcBg.width - this._displayObject.loaderInfo.width * _scale) / 2;
         this._displayObject.y = (this.mcObjectPanel.mcBg.height - this._displayObject.loaderInfo.height * _scale) / 2;
      }
      
      public function objectProgressHandler(event:LoaderEvent) : void
      {
      }
      
      public function objectErrorHandler(event:LoaderEvent) : void
      {
      }
      
      public function startObjectPanelResize(e:MouseEvent) : void
      {
         this.mcObjectPanel.btnWidth.removeEventListener(MouseEvent.MOUSE_DOWN,this.startObjectPanelResize);
         this.mcObjectPanel.btnHeight.removeEventListener(MouseEvent.MOUSE_DOWN,this.startObjectPanelResize);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.stopObjectPanelResize);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.calculateObjectPanelResize);
         this._resizeButton = e.currentTarget;
         if(this._resizeButton.name == "btnWidth")
         {
            e.currentTarget.startDrag(false,new Rectangle(350,e.currentTarget.y,this._capX,0));
         }
         else
         {
            e.currentTarget.startDrag(false,new Rectangle(e.currentTarget.x,350,0,this._capY));
         }
      }
      
      public function stopObjectPanelResize(e:MouseEvent) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.stopObjectPanelResize);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.calculateObjectPanelResize);
         this.mcObjectPanel.btnWidth.addEventListener(MouseEvent.MOUSE_DOWN,this.startObjectPanelResize);
         this.mcObjectPanel.btnHeight.addEventListener(MouseEvent.MOUSE_DOWN,this.startObjectPanelResize);
         this._resizeButton.stopDrag();
      }
      
      public function calculateObjectPanelResize(e:MouseEvent) : void
      {
         this.mcObjectPanel.btnWidth.y = this.mcObjectPanel.btnHeight.y;
         this.mcObjectPanel.btnHeight.x = this.mcObjectPanel.btnWidth.x - this.mcObjectPanel.btnHeight.width;
         this.mcObjectPanel.mcHeader.width = this.mcObjectPanel.mcBg.width = this.mcObjectPanel.mcMask.width = this.mcObjectPanel.btnWidth.x;
         this.mcObjectPanel.mcBg.height = this.mcObjectPanel.mcMask.height = this.mcObjectPanel.btnHeight.y - this.mcObjectPanel.mcHeader.height;
         this.mcObjectPanel.btnClose.x = this.mcObjectPanel.btnWidth.x - this.mcObjectPanel.btnClose.width - 5;
         this.mcObjectPanel.btnFullScreen.x = this.mcObjectPanel.btnClose.x - this.mcObjectPanel.btnFullScreen.width - 5;
         this.mcObjectPanel.mcBgGlow.width = this.mcObjectPanel.btnWidth.x;
         this.mcObjectPanel.mcBgGlow.height = this.mcObjectPanel.btnHeight.y;
         this.mcObjectPanel.mcLoading.x = (this.mcObjectPanel.mcBgGlow.width - this.mcObjectPanel.mcLoading.width) / 2;
         this.mcObjectPanel.mcLoading.y = (this.mcObjectPanel.mcBgGlow.height - this.mcObjectPanel.mcLoading.height) / 2;
         if(this._area)
         {
            this._area.width = this.mcObjectPanel.btnWidth.x;
            this._area.height = this.mcObjectPanel.btnHeight.y - this.mcObjectPanel.mcHeader.height;
         }
         else
         {
            this.areaManuel();
         }
      }
      
      public function openMp3Player(_url:String) : *
      {
         this.closeMp3Player();
         this._mp3PlayerUI = new libMp3Player();
         this.stageAlignCenter(this._mp3PlayerUI);
         this.addStage(this._mp3PlayerUI);
         this._mp3Player = new KryMp3Player(this._mp3PlayerUI.ui,_url);
         this._mp3PlayerUI.btnClose.addEventListener(MouseEvent.CLICK,this.closeMp3Player);
         this._mp3PlayerUI.mcBg.addEventListener(MouseEvent.MOUSE_DOWN,this.startDragMp3Player);
      }
      
      public function closeMp3Player(e:MouseEvent = null) : void
      {
         if(this._nativeProcessAudio)
         {
            this.closeZincPlayer();
         }
         if(this._mp3Player)
         {
            this._mp3Player.disposeAll();
            this._mp3Player = null;
         }
         if(this._mp3PlayerUI)
         {
            this.removeStage(this._mp3PlayerUI);
            this._mp3PlayerUI = null;
         }
      }
      
      public function startDragMp3Player(e:MouseEvent) : void
      {
         this._mp3PlayerUI.mcBg.removeEventListener(MouseEvent.MOUSE_DOWN,this.startDragMp3Player);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.stopDragMp3Player);
         this.addStage(this._mp3PlayerUI);
         this._mp3PlayerUI.startDrag();
      }
      
      public function stopDragMp3Player(e:MouseEvent) : void
      {
         this._mp3PlayerUI.mcBg.addEventListener(MouseEvent.MOUSE_DOWN,this.startDragMp3Player);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.stopDragMp3Player);
         this._mp3PlayerUI.stopDrag();
      }
      
      public function openPlayer(_url:String) : *
      {
         this.closeVVSolutionPlayer();
         this._videoPlayerUI = new libVideoPlayer();
         this.stageAlignCenter(this._videoPlayerUI);
         this.addStage(this._videoPlayerUI);
         this._videoPlayer = new KryPlayer(this._videoPlayerUI.ui,_url,this.fullScreenHandlerVideoPlayer);
         this._videoPlayerUI.btnClose.addEventListener(MouseEvent.CLICK,this.closeVVSolutionPlayer);
         this._videoPlayerUI.mcHeader.addEventListener(MouseEvent.MOUSE_DOWN,this.startDragVideoPlayer);
         this._videoPlayerUI.btnWidth.addEventListener(MouseEvent.MOUSE_DOWN,this.startVideoPanelResize);
         this._videoPlayerUI.btnHeight.addEventListener(MouseEvent.MOUSE_DOWN,this.startVideoPanelResize);
      }
      
      public function openVVSolutionPlayer(_o:Object) : *
      {
         if(!Network.status)
         {
            this.warning("İnternet bağlantınıza erişim yok. İnternet bağlantızı kontrol edip tekrar deneyin.");
            return;
         }
         this.closeVVSolutionPlayer();
         this._videoPlayerUI = new libVideoPlayer();
         this.stageAlignCenter(this._videoPlayerUI);
         this.addStage(this._videoPlayerUI);
         this._videoPlayerUI.btnClose.addEventListener(MouseEvent.CLICK,this.closeVVSolutionPlayer);
         this._videoPlayerUI.mcHeader.addEventListener(MouseEvent.MOUSE_DOWN,this.startDragVideoPlayer);
         this._solutionPlayer = new SolutionPlayer({
            "swf":_o.swf,
            "mp3":_o.audio,
            "xml":_o.video
         },this.closeVVSolutionPlayer,this._videoPlayerUI,new Point(this._capX,this._capY),this.fullScreenHandlerVideoPlayer);
         this._videoPlayerUI.btnWidth.addEventListener(MouseEvent.MOUSE_DOWN,this.startVideoPanelResize);
         this._videoPlayerUI.btnHeight.addEventListener(MouseEvent.MOUSE_DOWN,this.startVideoPanelResize);
      }
      
      public function closeVVSolutionPlayer(e:MouseEvent = null) : *
      {
         if(this._nativeProcessVideo)
         {
            this.closeZincPlayer();
         }
         if(this._solutionPlayer)
         {
            this._solutionPlayer.dispose();
            this._solutionPlayer = null;
         }
         if(this._videoPlayer)
         {
            this._videoPlayer.disposeAll();
            this._videoPlayer = null;
         }
         if(this._videoPlayerUI)
         {
            this.removeStage(this._videoPlayerUI);
            this._videoPlayerUI = null;
         }
      }
      
      public function startDragVideoPlayer(e:MouseEvent) : void
      {
         this._videoPlayerUI.mcHeader.removeEventListener(MouseEvent.MOUSE_DOWN,this.startDragVideoPlayer);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.stopDragVideoPlayer);
         this.addStage(this._videoPlayerUI);
         this._videoPlayerUI.startDrag();
      }
      
      public function stopDragVideoPlayer(e:MouseEvent) : void
      {
         this._videoPlayerUI.mcHeader.addEventListener(MouseEvent.MOUSE_DOWN,this.startDragVideoPlayer);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.stopDragVideoPlayer);
         this._videoPlayerUI.stopDrag();
      }
      
      public function fullScreenHandlerVideoPlayer(e:*) : void
      {
         if(e)
         {
            this._firstData = new Object();
            this._firstData.panelX = this._videoPlayerUI.x;
            this._firstData.panelY = this._videoPlayerUI.y;
            this._firstData.panelW = this._videoPlayerUI.mcBg.width;
            this._firstData.panelH = this._videoPlayerUI.mcBg.height;
            this._firstData.playerBgW = this._videoPlayerUI.ui.mcBg.width;
            this._firstData.playerBgH = this._videoPlayerUI.ui.mcBg.height;
            this._firstData.playerControlsY = this._videoPlayerUI.ui.mcControls.y;
            this._firstData.playerTxtX = this._videoPlayerUI.ui.mcControls.txtInfo.x;
            this._firstData.playerFullX = this._videoPlayerUI.ui.mcControls.btnFullScreen.x;
            this._videoPlayerUI.mcBg.visible = false;
            this.stageCoor(this._videoPlayerUI,0,0);
            this._videoPlayerUI.mcHeader.width = this._capX;
            this._videoPlayerUI.ui.mcBg.width = this._capX;
            this._videoPlayerUI.ui.mcBg.height = this._capY - this._videoPlayerUI.mcHeader.height - this._videoPlayerUI.ui.mcControls.height;
            this.stageCoor(this._videoPlayerUI.btnClose,this._capX - this._videoPlayerUI.btnClose.width - 5,this._videoPlayerUI.btnClose.y);
            this.stageCoor(this._videoPlayerUI.ui.mcControls,0,this._capY - this._videoPlayerUI.ui.mcControls.height - this._videoPlayerUI.mcHeader.height);
            this._videoPlayerUI.ui.mcControls.mcBg.width = this._capX;
            this._videoPlayerUI.ui.mcControls.btnFullScreen.x = this._capX - this._videoPlayerUI.ui.mcControls.btnFullScreen.width - 10;
            this._videoPlayerUI.ui.mcControls.txtInfo.x = this._videoPlayerUI.ui.mcControls.btnFullScreen.x - this._videoPlayerUI.ui.mcControls.txtInfo.width - 15;
            this._videoPlayerUI.ui.mcControls.btnFullScreen.gotoAndStop(2);
            this._videoPlayerUI.ui.mcControls.mcBar.width = this._capX - 20;
            this._videoPlayerUI.ui.mcControls.bullet.x = this._videoPlayerUI.ui.mcControls.mcBar.mcBarPlay.scaleX * this._videoPlayerUI.ui.mcControls.mcBar.width + this._videoPlayerUI.ui.mcControls.mcBar.x;
            if(this._solutionPlayer)
            {
               this._solutionPlayer.resizeSWF();
            }
            if(this._videoPlayer)
            {
               this._videoPlayer.resizeVideo();
            }
            this._videoPlayerUI.mcHeader.removeEventListener(MouseEvent.MOUSE_DOWN,this.startDragVideoPlayer);
            this.addStage(this._videoPlayerUI);
         }
         else if(this._firstData)
         {
            this._videoPlayerUI.mcHeader.addEventListener(MouseEvent.MOUSE_DOWN,this.startDragVideoPlayer);
            this._videoPlayerUI.ui.mcControls.btnFullScreen.gotoAndStop(1);
            this._videoPlayerUI.ui.mcControls.mcBg.width = this._firstData.playerBgW;
            this._videoPlayerUI.x = this._firstData.panelX;
            this._videoPlayerUI.y = this._firstData.panelY;
            this._videoPlayerUI.mcHeader.width = this._firstData.panelW;
            this.stageCoor(this._videoPlayerUI.btnClose,this._firstData.panelW - this._videoPlayerUI.btnClose.width - 5,this._videoPlayerUI.btnClose.y);
            this._videoPlayerUI.ui.mcBg.width = this._firstData.playerBgW;
            this._videoPlayerUI.ui.mcBg.height = this._firstData.playerBgH;
            if(this._solutionPlayer)
            {
               this._solutionPlayer.resizeSWF();
            }
            if(this._videoPlayer)
            {
               this._videoPlayer.resizeVideo();
            }
            this.stageCoor(this._videoPlayerUI.ui.mcControls,0,this._firstData.playerControlsY);
            this._videoPlayerUI.ui.mcControls.btnFullScreen.x = this._firstData.playerFullX;
            this._videoPlayerUI.ui.mcControls.txtInfo.x = this._firstData.playerTxtX;
            this._videoPlayerUI.ui.mcControls.mcBar.width = this._firstData.playerBgW - 20;
            this._videoPlayerUI.mcBg.visible = true;
            this._videoPlayerUI.ui.mcControls.bullet.x = this._videoPlayerUI.ui.mcControls.mcBar.mcBarPlay.scaleX * this._videoPlayerUI.ui.mcControls.mcBar.width + this._videoPlayerUI.ui.mcControls.mcBar.x;
            this._firstData = null;
         }
      }
      
      public function startVideoPanelResize(e:MouseEvent) : void
      {
         this._videoPlayerUI.btnWidth.removeEventListener(MouseEvent.MOUSE_DOWN,this.startVideoPanelResize);
         this._videoPlayerUI.btnHeight.removeEventListener(MouseEvent.MOUSE_DOWN,this.startVideoPanelResize);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.stopVideoPanelResize);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.calculateVideoPanelResize);
         this._resizeButton2 = e.currentTarget;
         if(this._resizeButton2.name == "btnWidth")
         {
            e.currentTarget.startDrag(false,new Rectangle(400,e.currentTarget.y,this._capX,0));
         }
         else
         {
            e.currentTarget.startDrag(false,new Rectangle(e.currentTarget.x,400,0,this._capY));
         }
      }
      
      public function stopVideoPanelResize(e:MouseEvent) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.stopVideoPanelResize);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.calculateVideoPanelResize);
         this._videoPlayerUI.btnWidth.addEventListener(MouseEvent.MOUSE_DOWN,this.startVideoPanelResize);
         this._videoPlayerUI.btnHeight.addEventListener(MouseEvent.MOUSE_DOWN,this.startVideoPanelResize);
         this._resizeButton2.stopDrag();
      }
      
      public function calculateVideoPanelResize(e:MouseEvent) : void
      {
         this._videoPlayerUI.btnWidth.y = this._videoPlayerUI.btnHeight.y;
         this._videoPlayerUI.btnHeight.x = this._videoPlayerUI.btnWidth.x - this._videoPlayerUI.btnHeight.width;
         this._videoPlayerUI.mcBg.width = this._videoPlayerUI.btnWidth.x;
         this._videoPlayerUI.mcBg.height = this._videoPlayerUI.btnHeight.y;
         this._videoPlayerUI.mcHeader.width = this._videoPlayerUI.btnWidth.x;
         this._videoPlayerUI.ui.mcBg.width = this._videoPlayerUI.btnWidth.x;
         this._videoPlayerUI.ui.mcBg.height = this._videoPlayerUI.btnHeight.y - this._videoPlayerUI.mcHeader.height - this._videoPlayerUI.ui.mcControls.height;
         this.stageCoor(this._videoPlayerUI.btnClose,this._videoPlayerUI.btnWidth.x - this._videoPlayerUI.btnClose.width - 5,this._videoPlayerUI.btnClose.y);
         this.stageCoor(this._videoPlayerUI.ui.mcControls,0,this._videoPlayerUI.btnHeight.y - this._videoPlayerUI.ui.mcControls.height - this._videoPlayerUI.mcHeader.height);
         this._videoPlayerUI.ui.mcControls.mcBg.width = this._videoPlayerUI.btnWidth.x;
         this._videoPlayerUI.ui.mcControls.btnFullScreen.x = this._videoPlayerUI.btnWidth.x - this._videoPlayerUI.ui.mcControls.btnFullScreen.width - 10;
         this._videoPlayerUI.ui.mcControls.txtInfo.x = this._videoPlayerUI.ui.mcControls.btnFullScreen.x - this._videoPlayerUI.ui.mcControls.txtInfo.width - 15;
         this._videoPlayerUI.ui.mcControls.mcBar.width = this._videoPlayerUI.btnWidth.x - 20;
         this._videoPlayerUI.ui.mcControls.bullet.x = this._videoPlayerUI.ui.mcControls.mcBar.mcBarPlay.scaleX * this._videoPlayerUI.ui.mcControls.mcBar.width + this._videoPlayerUI.ui.mcControls.mcBar.x;
         if(this._solutionPlayer)
         {
            this._solutionPlayer.resizeSWF();
         }
         if(this._videoPlayer)
         {
            this._videoPlayer.resizeVideo();
         }
      }
      
      public function openZincPlayer(_url:String, _type:String) : *
      {
         if(Capabilities.os == "Windows 7" || Capabilities.os == "Windows XP")
         {
            if(_type == "video")
            {
               this.openPlayer(_url);
            }
            else
            {
               this.openMp3Player(_url);
            }
            return;
         }
         this.showLoading();
         TweenMax.delayedCall(0.1,function():*
         {
            var _processArgs:Vector.<String> = null;
            var _nativeProcessStartupInfo:NativeProcessStartupInfo = null;
            _processArgs = new Vector.<String>();
            _processArgs.push(_type);
            _processArgs.push(_url);
            _processArgs.push(Capabilities.screenResolutionX.toString());
            _processArgs.push(Capabilities.screenResolutionY.toString());
            _processArgs.push(_realScale.toString());
            _nativeProcessStartupInfo = new NativeProcessStartupInfo();
            _nativeProcessStartupInfo.executable = File.applicationDirectory.resolvePath("kxk-player/player.exe");
            _nativeProcessStartupInfo.arguments = _processArgs;
            _nativeProcessStartupInfo.workingDirectory = new File(_tempPath);
            if(_type == "video")
            {
               closeVVSolutionPlayer();
               if(_nativeProcessVideo)
               {
                  if(_nativeProcessVideo.running)
                  {
                     _nativeProcessVideo.exit(true);
                     _nativeProcessVideo = null;
                  }
               }
               _nativeProcessVideo = new NativeProcess();
               _nativeProcessVideo.start(_nativeProcessStartupInfo);
            }
            else
            {
               closeMp3Player();
               if(_nativeProcessAudio)
               {
                  if(_nativeProcessAudio.running)
                  {
                     _nativeProcessAudio.exit(true);
                     _nativeProcessAudio = null;
                  }
               }
               _nativeProcessAudio = new NativeProcess();
               _nativeProcessAudio.start(_nativeProcessStartupInfo);
            }
            TweenMax.delayedCall(2,hideLoading);
         });
      }
      
      public function closeZincPlayer() : void
      {
         if(this._nativeProcessVideo)
         {
            if(this._nativeProcessVideo.running)
            {
               this._nativeProcessVideo.exit(true);
               this._nativeProcessVideo = null;
            }
         }
         if(this._nativeProcessAudio)
         {
            if(this._nativeProcessAudio.running)
            {
               this._nativeProcessAudio.exit(true);
               this._nativeProcessAudio = null;
            }
         }
      }
      
      public function _actionVideo(e:MouseEvent) : void
      {
         this._file = this._tempPath + String(this._conts[e.currentTarget.name.split("_")[1]]["source"]);
         this.openPlayer(new File(this._file).url);
      }
      
      public function _actionSound(e:MouseEvent) : void
      {
         this._file = this._tempPath + String(this._conts[e.currentTarget.name.split("_")[1]]["source"]);
         this.openMp3Player(new File(this._file).url);
      }
      
      public function _actionImage(e:MouseEvent) : void
      {
         this._file = this._tempPath + String(this._conts[e.currentTarget.name.split("_")[1]]["source"]);
         this.openObjectPanel(new File(this._file).url,"img");
      }
      
      public function _actionApp(e:MouseEvent) : void
      {
         this._file = this._tempPath + String(this._conts[e.currentTarget.name.split("_")[1]]["source"]);
         this.openObjectPanel(new File(this._file).url,"swf");
      }
      
      public function _actionLink(e:MouseEvent) : void
      {
         var _file:String = null;
         _file = String(this._conts[e.currentTarget.name.split("_")[1]]["source"]);
         if(_file.indexOf("http") < 0)
         {
            _file = "http://" + _file;
         }
         navigateToURL(new URLRequest(_file));
      }
      
      public function _actionDoc(e:MouseEvent) : void
      {
         var _f:File = null;
         _f = new File(this._tempPath + String(this._conts[e.currentTarget.name.split("_")[1]]["source"]));
         if(_f.exists)
         {
            _f.openWithDefaultApplication();
         }
         else
         {
            this.warning("Dosya bulunamadı.");
         }
      }
      
      public function popKapat(e:MouseEvent = null) : *
      {
         this.pnlPop.visible = false;
         this.pnlPop.mover.close.removeEventListener(MouseEvent.CLICK,this.popKapat);
         this.pnlPop.mover.removeEventListener(MouseEvent.MOUSE_DOWN,this.dragPop);
         this.pnlPop.popContent.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandlerK);
         ScrollClass.remove(this.pnlPop.popContent);
      }
      
      public function dragPop(e:MouseEvent) : void
      {
         this.addStage(this.pnlPop);
         this.pnlPop.mover.removeEventListener(MouseEvent.MOUSE_DOWN,this.dragPop);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.dropPop);
         this.pnlPop.startDrag();
      }
      
      public function dropPop(e:MouseEvent) : void
      {
         this.pnlPop.mover.addEventListener(MouseEvent.MOUSE_DOWN,this.dragPop);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.dropPop);
         this.pnlPop.stopDrag();
      }
      
      public function openPop(_strF:String) : void
      {
         this.pnlPop.bar.visible = false;
         this.pnlPop.thumb.visible = false;
         _strF = _strF.replace(/\s*\R/g,"\n");
         this.removeItems(this.pnlPop.popContent);
         this.pnlPop.popContent.y = this.pnlPop.mover.height;
         this._poptxtfield.htmlText = _strF;
         this.pnlPop.popContent.addChild(this._txtShape);
         this.pnlPop.popContent.addChild(this._poptxtfield);
         this._txtShape.graphics.clear();
         this._txtShape.graphics.beginFill(0,0);
         this._txtShape.graphics.drawRect(0,0,this._poptxtfield.width,this._poptxtfield.height + this._txtPadding * 2);
         this._txtShape.graphics.endFill();
         this.pnlPop.mcMask.height = this.pnlPop.popContent.height;
         if(this.pnlPop.popContent.height > 500)
         {
            this.pnlPop.mcMask.height = 500 - this.pnlPop.mover.height;
            this.pnlPop.bar.height = this.pnlPop.mcMask.height;
            this.pnlPop.thumb.height = this.pnlPop.mcMask.height / 3;
            ScrollClass.add(this.pnlPop.popContent,this.pnlPop.mcMask);
            ScrollClass.enable(this.pnlPop.popContent);
         }
         this.pnlPop.bg.height = this.pnlPop.mcMask.y + this.pnlPop.mcMask.height;
         this.pnlPop.x = (this._capX - this.pnlPop.bg.width) / 2;
         this.pnlPop.y = (this._capY - this.pnlPop.bg.height) / 2;
         this.pnlPop.popContent.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandlerK);
         this.pnlPop.mover.close.addEventListener(MouseEvent.CLICK,this.popKapat);
         this.pnlPop.mover.addEventListener(MouseEvent.MOUSE_DOWN,this.dragPop);
         this.pnlPop.visible = true;
         this.addStage(this.pnlPop);
      }
      
      public function _actionText(e:MouseEvent) : void
      {
         this.openPop(this._conts[e.currentTarget.name.split("_")[1]]["source"]);
      }
      
      public function saveData(e:MouseEvent) : *
      {
         var _data:Object = null;
         if(this.silinecek.length != 0)
         {
            this.playSound("b");
            _data = {
               "areaID":this.guncelIm,
               "base64":Base64.encodeByteArray(this.createMcData())
            };
            KXKDatabase.deletePreData(this.guncelIm,function():*
            {
               KXKDatabase.insertPreData(_data,function():*
               {
                  preRecordPanel.btnNavi.visible = false;
                  preRecordPanel.btnGoster.visible = false;
                  checkPreData(guncelIm);
                  warning("Bölge başarıyla kaydedildi");
               });
            });
         }
         else
         {
            this.warning("Bölge üzerinde işlem yapılmadı");
         }
      }
      
      public function checkPreData(_id:*) : void
      {
         KXKDatabase.existsPreData(_id,function(e:*):*
         {
            preRecordPanel.btnAns.visible = e != null;
            if(e == null)
            {
               preRecordPanel.bg.width = 38;
            }
            else
            {
               preRecordPanel.bg.width = 70;
            }
            preRecordPanel.x = _capX - preRecordPanel.bg.width - 10;
         });
      }
      
      public function datYukle(event:Event) : void
      {
         if(this._vectorVideo.status)
         {
            this.warning("Ders kaydı sırasında ön kayıt kullanılamaz.");
            return;
         }
         this.playSound("b");
         this.preRecordPanel.btnAns.visible = false;
         KXKDatabase.existsPreData(this.guncelIm,function(e:*):*
         {
            if(e)
            {
               _bytes = new ByteArray();
               _bytes = Base64.decodeToByteArray(e[0].data) as ByteArray;
               _bytes.position = 0;
               _objArr = new Array();
               _objArr = _bytes.readObject() as Array;
               _bytes = null;
               _empBoolean = false;
               _mcNo = 0;
               preRecordPanel.btnNavi.visible = true;
               preRecordPanel.btnGoster.visible = true;
               preRecordPanel.btnGoster.bshow.addEventListener(MouseEvent.CLICK,direkGoster);
               preRecordPanel.btnGoster.bdelete.addEventListener(MouseEvent.CLICK,direkGoster);
               preRecordPanel.btnNavi.statMc.addEventListener(MouseEvent.CLICK,autoPlay);
               preRecordPanel.btnNavi.preMc.addEventListener(MouseEvent.CLICK,ileriGeri);
               preRecordPanel.btnNavi.nextMc.addEventListener(MouseEvent.CLICK,ileriGeri);
               stopAutoCiz();
               preRecordPanel.bg.width = 195;
               preRecordPanel.x = _capX - preRecordPanel.bg.width - 10;
               cleanScreen();
               sendCleanScreenData();
            }
         });
      }
      
      public function cleanScreen() : *
      {
         var key:* = null;
         var _k:* = null;
         if(this.silinecek.length != 0)
         {
            for(key in this.silinecek)
            {
               if(this._vectorVideo.status)
               {
                  for(_k in this._vectorVideo.boardData)
                  {
                     if(this.brushAreas[this.silinecek[key]] == this._vectorVideo.boardData[_k].sprite)
                     {
                        this._vectorVideo.actObject = new ActObject();
                        this._vectorVideo.actObject.id = this._vectorVideo.getID();
                        this._vectorVideo.actObject.startTime = this._vectorVideo.time;
                        this._vectorVideo.actObject.type = ActObject.TYPE_DELETE;
                        this._vectorVideo.actObject.shapeID = this._vectorVideo.boardData[_k].id;
                        this._vectorVideo.addAct();
                        break;
                     }
                  }
               }
               if(this.drawAreas[this.guncelSayfa].contains(this.brushAreas[this.silinecek[key]]))
               {
                  this.drawAreas[this.guncelSayfa].removeChild(this.brushAreas[this.silinecek[key]]);
               }
               --this.brushLayer;
            }
            this.silinecek = new Array();
            this.silgiler = new Array();
         }
      }
      
      public function autoPlay(e:MouseEvent) : *
      {
         if(this.preRecordPanel.btnNavi.statMc.currentFrame == 1)
         {
            this.preRecordPanel.btnNavi.statMc.gotoAndStop(2);
            this._autoB = true;
            this.mcCiz();
         }
         else
         {
            this.stopAutoCiz();
            TweenMax.killDelayedCallsTo(this.mcCiz);
         }
         this.playSound("b");
      }
      
      public function degisiklikKontrol() : void
      {
         if(this.preRecordPanel.btnNavi.visible == true)
         {
            this.preRecordPanel.btnGoster.bshow.removeEventListener(MouseEvent.CLICK,this.direkGoster);
            this.preRecordPanel.btnGoster.bdelete.removeEventListener(MouseEvent.CLICK,this.direkGoster);
            this.preRecordPanel.btnNavi.statMc.removeEventListener(MouseEvent.CLICK,this.autoPlay);
            this.preRecordPanel.btnNavi.preMc.removeEventListener(MouseEvent.CLICK,this.ileriGeri);
            this.preRecordPanel.btnNavi.nextMc.removeEventListener(MouseEvent.CLICK,this.ileriGeri);
            this.preRecordPanel.btnNavi.visible = false;
            this.preRecordPanel.btnGoster.visible = false;
            this.preRecordPanel.btnAns.visible = false;
            this.stopAutoCiz();
            TweenMax.killDelayedCallsTo(this.mcCiz);
            this.preRecordPanel.bg.width = 38;
            this.preRecordPanel.x = this._capX - this.preRecordPanel.bg.width - 10;
            if(this.isIm && this.imMode == 0)
            {
               this.checkPreData(this.guncelIm);
            }
         }
      }
      
      public function ileriGeri(e:MouseEvent) : *
      {
         var i:* = null;
         if(e.currentTarget.name == "nextMc")
         {
            this.mcCiz();
         }
         else if(this.brushLayer != 0)
         {
            if(this._mcNo != 0)
            {
               if(this.drawAreas[this.guncelSayfa].contains(this.brushAreas[this.brushLayer]))
               {
                  this.drawAreas[this.guncelSayfa].removeChild(this.brushAreas[this.brushLayer]);
               }
               for(i in this.silgiler)
               {
                  if(this.brushLayer == this.silgiler[i])
                  {
                     this.silgiler.splice(i,1);
                  }
               }
               --this.brushLayer;
               if(this.isIm && this.imMode == 0)
               {
                  this.silinecek.pop();
               }
               --this._mcNo;
               this.sendBackData();
            }
         }
         this.playSound("b");
      }
      
      public function direkGoster(e:MouseEvent) : void
      {
         var i:int = 0;
         if(e.currentTarget.name == "bshow")
         {
            this._autoB = false;
            if(this._objArr[0].length != this._mcNo)
            {
               for(i = this._mcNo; i < this._objArr[0].length; i++)
               {
                  this.mcCiz();
               }
            }
         }
         else
         {
            KXKDatabase.deletePreData(this.guncelIm,function():*
            {
               degisiklikKontrol();
            });
         }
      }
      
      public function mcCiz() : *
      {
         if(this._objArr[0].length != this._mcNo)
         {
            this._silB = false;
            if(this._objArr[2][this._mcNo])
            {
               this._silB = true;
            }
            this.createQueAns(this._objArr[0][this._mcNo],this._objArr[1][this._mcNo],this._silB);
            this.sendData(this._silB);
            ++this._mcNo;
         }
         else
         {
            this.stopAutoCiz();
         }
      }
      
      public function stopAutoCiz() : *
      {
         this._autoB = false;
         this.preRecordPanel.btnNavi.statMc.gotoAndStop(1);
         this.preRecordPanel.btnNavi.preMc.visible = true;
         this.preRecordPanel.btnNavi.nextMc.visible = true;
      }
      
      public function zengModu(e:MouseEvent) : void
      {
         if(!this.zenbB)
         {
            this.footer.btnZeng.gotoAndStop(2);
            this._closeZoom();
            this.addStage(this.toolZeng);
            this.toolZeng.visible = true;
            this.toolBar.visible = false;
            this.toolZeng.b_0.addEventListener(MouseEvent.MOUSE_DOWN,this.addZeng);
            this.toolZeng.b_1.addEventListener(MouseEvent.MOUSE_DOWN,this.addZeng);
            this.toolZeng.b_2.addEventListener(MouseEvent.MOUSE_DOWN,this.addZeng);
            this.toolZeng.b_3.addEventListener(MouseEvent.MOUSE_DOWN,this.addZeng);
            this.toolZeng.b_4.addEventListener(MouseEvent.MOUSE_DOWN,this.addZeng);
            this.toolZeng.b_5.addEventListener(MouseEvent.MOUSE_DOWN,this.addZeng);
            this.toolZeng.b_6.addEventListener(MouseEvent.MOUSE_DOWN,this.addZeng);
            this.toolZeng.b_7.addEventListener(MouseEvent.MOUSE_DOWN,this.addZeng);
            this.toolZeng.close.addEventListener(MouseEvent.CLICK,this.zengModu);
            this.zenbB = true;
            this.trs.enabled = false;
            this.itemMc.mouseChildren = false;
            this.goActiveTool(4);
            this.activated(this.toolBar.btnMove);
            if(this._curtain.visible)
            {
               this.openCurtain();
            }
            if(this.panelChronometer.visible)
            {
               this.hideChronometer();
            }
            if(this.panelStudent.visible)
            {
               this.studentPanelHandler();
            }
            if(this._unitHolder.visible)
            {
               this._unitHider();
            }
            if(this.pnlPop.visible)
            {
               this.popKapat();
            }
            if(this.searchPanel.visible)
            {
               this.search();
            }
            if(this._note.visible)
            {
               this.openNote();
            }
            if(this.calcPanel.visible)
            {
               this.openCalc();
            }
            if(this.panelNums.visible)
            {
               this.closePanel();
            }
            if(this.panelVideoSolution.visible)
            {
               this.videoSolutionHandler();
            }
            if(this.panelVV.visible)
            {
               this.vvPanelHandler();
            }
            if(this.panelAh.visible)
            {
               this.closePanelAh();
            }
            if(this.panelMeeting.visible)
            {
               this.closePanelMeeting();
            }
            if(this.mcEbaPanel.visible)
            {
               this.closeEbaList();
            }
            TweenMax.killTweensOf(this.toolZeng);
            TweenMax.to(this.toolZeng,this._tweenTime,{
               "x":125,
               "ease":Strong.easeOut
            });
            this._canvas.addChild(this.tempLayerZeng);
            this.butonSil();
            this.closeMouseStat(this.footer.btnBos);
            this.closeMouseStat(this.footer.tools);
            this.closeMouseStat(this.panelVector);
            this.closeMouseStat(this.sidePanel.btnAddInput);
            this.closeMouseStat(this.footer.btnEba);
            this.closeMouseStat(this.footer.btnDO);
            this.closeMouseStat(this.footer.btnAH);
            this.closeMouseStat(this.footer.btnMeeting);
            this.closeMouseStat(this.footer.btnSolution);
            this.closeEbaList();
            this.closeMouseStat(this.sidePanel.btnCloudAdmin);
            this.warning("Zenginleştirme modunda içerik ekleyebilirsiniz. Eklemek istediğiniz içerik türünü sürükleyerek sayfa üzerine bırakın.");
         }
         else
         {
            this.openMouseStat(this.footer.btnBos);
            this.openMouseStat(this.footer.tools);
            this.openMouseStat(this.panelVector);
            this.openMouseStat(this.sidePanel.btnAddInput);
            this.openMouseStat(this.footer.btnEba);
            this.openMouseStat(this.footer.btnDO);
            this.openMouseStat(this.footer.btnAH);
            this.openMouseStat(this.footer.btnMeeting);
            this.openMouseStat(this.footer.btnSolution);
            this.openMouseStat(this.sidePanel.btnCloudAdmin);
            this.footer.btnZeng.gotoAndStop(1);
            this.zengKaydet();
         }
      }
      
      public function kaydetmeZeng(e:MouseEvent = null) : *
      {
         this.playSound("b");
         if(e != null)
         {
            TweenMax.to(this.soruPanel,this._tweenTime,{"alpha":0});
            TweenMax.to(this._blackBg,this._tweenTime,{
               "alpha":0,
               "onComplete":function():*
               {
                  soruPanel.visible = false;
                  removeStage(_blackBg);
               }
            });
            this.soruPanel.bgir.removeEventListener(MouseEvent.CLICK,this.kaydetmeZeng);
         }
         this.butonAc();
         this._currMc.filters = [];
         this.tempShape.graphics.clear();
         TweenMax.to(this.silPanel,this._tweenTime,{
            "x":this._capX,
            "visible":false
         });
         this.toolBar.visible = true;
         this.zenbB = false;
         this.toolZeng.b_0.removeEventListener(MouseEvent.MOUSE_DOWN,this.addZeng);
         this.toolZeng.b_1.removeEventListener(MouseEvent.MOUSE_DOWN,this.addZeng);
         this.toolZeng.b_2.removeEventListener(MouseEvent.MOUSE_DOWN,this.addZeng);
         this.toolZeng.b_3.removeEventListener(MouseEvent.MOUSE_DOWN,this.addZeng);
         this.toolZeng.b_4.removeEventListener(MouseEvent.MOUSE_DOWN,this.addZeng);
         this.toolZeng.b_5.removeEventListener(MouseEvent.MOUSE_DOWN,this.addZeng);
         this.toolZeng.b_6.removeEventListener(MouseEvent.MOUSE_DOWN,this.addZeng);
         this.toolZeng.b_7.removeEventListener(MouseEvent.MOUSE_DOWN,this.addZeng);
         this.toolZeng.close.removeEventListener(MouseEvent.CLICK,this.zengModu);
         this.trs.enabled = true;
         this.itemMc.mouseChildren = true;
         this.goActiveTool(4);
         this.activated(this.toolBar.btnMove);
         TweenMax.killTweensOf(this.toolZeng);
         TweenMax.to(this.toolZeng,this._tweenTime,{
            "x":-103,
            "ease":Strong.easeOut,
            "visible":false
         });
         if(this.tempLayerZeng.stage)
         {
            this._canvas.removeChild(this.tempLayerZeng);
         }
      }
      
      public function butonSil() : *
      {
         var key1:* = null;
         var key2:* = null;
         var key3:* = null;
         var key4:* = null;
         var key5:* = null;
         var key6:* = null;
         var key7:* = null;
         var key8:* = null;
         var key9:* = null;
         for(key1 in this._objZeng[0])
         {
            this._objZeng[0][key1]["mc"].removeEventListener(MouseEvent.CLICK,this.autoSelectZeng);
            this._objZeng[0][key1]["mc"].addEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
            this._icnPage[this._objZeng[0][key1]["pn"]].addChild(this._objZeng[0][key1]["mc"]);
         }
         for(key2 in this._objZeng[1])
         {
            this._objZeng[1][key2]["mc"].addEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
            this._objZeng[1][key2]["mc"].removeEventListener(MouseEvent.CLICK,this._actionImage2);
            this._icnPage[this._objZeng[1][key2]["pn"]].addChild(this._objZeng[1][key2]["mc"]);
         }
         for(key3 in this._objZeng[2])
         {
            this._objZeng[2][key3]["mc"].addEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
            this._objZeng[2][key3]["mc"].removeEventListener(MouseEvent.CLICK,this._actionSound2);
            this._icnPage[this._objZeng[2][key3]["pn"]].addChild(this._objZeng[2][key3]["mc"]);
         }
         for(key4 in this._objZeng[3])
         {
            this._objZeng[3][key4]["mc"].addEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
            this._objZeng[3][key4]["mc"].removeEventListener(MouseEvent.CLICK,this._actionVideo2);
            this._icnPage[this._objZeng[3][key4]["pn"]].addChild(this._objZeng[3][key4]["mc"]);
         }
         for(key5 in this._objZeng[4])
         {
            this._objZeng[4][key5]["mc"].addEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
            this._objZeng[4][key5]["mc"].removeEventListener(MouseEvent.CLICK,this._actionApp2);
            this._icnPage[this._objZeng[4][key5]["pn"]].addChild(this._objZeng[4][key5]["mc"]);
         }
         for(key6 in this._objZeng[5])
         {
            this._objZeng[5][key6]["mc"].addEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
            this._objZeng[5][key6]["mc"].removeEventListener(MouseEvent.CLICK,this._actionDoc2);
            this._icnPage[this._objZeng[5][key6]["pn"]].addChild(this._objZeng[5][key6]["mc"]);
         }
         for(key7 in this._objZeng[6])
         {
            this._objZeng[6][key7]["mc"].addEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
            this._objZeng[6][key7]["mc"].removeEventListener(MouseEvent.CLICK,this._actionLink2);
            this._icnPage[this._objZeng[6][key7]["pn"]].addChild(this._objZeng[6][key7]["mc"]);
         }
         for(key8 in this._objZeng[7])
         {
            this._objZeng[7][key8]["mc"].addEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
            this._objZeng[7][key8]["mc"].removeEventListener(MouseEvent.CLICK,this._actionText2);
            this._icnPage[this._objZeng[7][key8]["pn"]].addChild(this._objZeng[7][key8]["mc"]);
         }
         for(key9 in this._objZeng[8])
         {
            this._objZeng[8][key9]["mc"].addEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
            this._objZeng[8][key9]["mc"].removeEventListener(MouseEvent.CLICK,this._actionEba2);
            this._icnPage[this._objZeng[8][key9]["pn"]].addChild(this._objZeng[8][key9]["mc"]);
         }
         if(!this._icnPage[this.guncelSayfa])
         {
            this._icnPage[this.guncelSayfa] = new MovieClip();
         }
         this.removeItems(this.tempLayerZeng);
         this.tempLayerZeng.addChild(this._icnPage[this.guncelSayfa]);
      }
      
      public function butonAc() : *
      {
         var key1:* = null;
         var key2:* = null;
         var key3:* = null;
         var key4:* = null;
         var key5:* = null;
         var key6:* = null;
         var key7:* = null;
         var key8:* = null;
         var key9:* = null;
         for(key1 in this._objZeng[0])
         {
            this.pageItems[this._objZeng[0][key1]["pn"]].addChild(this._objZeng[0][key1]["mc"]);
            this._objZeng[0][key1]["mc"].removeEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
            this._objZeng[0][key1]["mc"].addEventListener(MouseEvent.CLICK,this.autoSelectZeng);
         }
         for(key2 in this._objZeng[1])
         {
            this.pageItems[this._objZeng[1][key2]["pn"]].addChild(this._objZeng[1][key2]["mc"]);
            this._objZeng[1][key2]["mc"].removeEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
            this._objZeng[1][key2]["mc"].addEventListener(MouseEvent.CLICK,this._actionImage2);
         }
         for(key3 in this._objZeng[2])
         {
            this.pageItems[this._objZeng[2][key3]["pn"]].addChild(this._objZeng[2][key3]["mc"]);
            this._objZeng[2][key3]["mc"].removeEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
            this._objZeng[2][key3]["mc"].addEventListener(MouseEvent.CLICK,this._actionSound2);
         }
         for(key4 in this._objZeng[3])
         {
            this.pageItems[this._objZeng[3][key4]["pn"]].addChild(this._objZeng[3][key4]["mc"]);
            this._objZeng[3][key4]["mc"].removeEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
            this._objZeng[3][key4]["mc"].addEventListener(MouseEvent.CLICK,this._actionVideo2);
         }
         for(key5 in this._objZeng[4])
         {
            this.pageItems[this._objZeng[4][key5]["pn"]].addChild(this._objZeng[4][key5]["mc"]);
            this._objZeng[4][key5]["mc"].removeEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
            this._objZeng[4][key5]["mc"].addEventListener(MouseEvent.CLICK,this._actionApp2);
         }
         for(key6 in this._objZeng[5])
         {
            this.pageItems[this._objZeng[5][key6]["pn"]].addChild(this._objZeng[5][key6]["mc"]);
            this._objZeng[5][key6]["mc"].removeEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
            this._objZeng[5][key6]["mc"].addEventListener(MouseEvent.CLICK,this._actionDoc2);
         }
         for(key7 in this._objZeng[6])
         {
            this.pageItems[this._objZeng[6][key7]["pn"]].addChild(this._objZeng[6][key7]["mc"]);
            this._objZeng[6][key7]["mc"].removeEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
            this._objZeng[6][key7]["mc"].addEventListener(MouseEvent.CLICK,this._actionLink2);
         }
         for(key8 in this._objZeng[7])
         {
            this.pageItems[this._objZeng[7][key8]["pn"]].addChild(this._objZeng[7][key8]["mc"]);
            this._objZeng[7][key8]["mc"].removeEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
            this._objZeng[7][key8]["mc"].addEventListener(MouseEvent.CLICK,this._actionText2);
         }
         for(key9 in this._objZeng[8])
         {
            this.pageItems[this._objZeng[8][key9]["pn"]].addChild(this._objZeng[8][key9]["mc"]);
            this._objZeng[8][key9]["mc"].removeEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
            this._objZeng[8][key9]["mc"].addEventListener(MouseEvent.CLICK,this._actionEba2);
         }
      }
      
      public function addZeng(e:MouseEvent) : void
      {
         TweenMax.to(this.silPanel,this._tweenTime,{
            "x":this._capX,
            "visible":false
         });
         if(e.currentTarget.name.split("_")[1] == 0)
         {
            this._addObj = new sIm();
            this.icn = 0;
         }
         if(e.currentTarget.name.split("_")[1] == 1)
         {
            this._addObj = new im_photo();
            this.icn = 1;
         }
         if(e.currentTarget.name.split("_")[1] == 2)
         {
            this._addObj = new im_sound();
            this.icn = 2;
         }
         if(e.currentTarget.name.split("_")[1] == 3)
         {
            this._addObj = new im_video();
            this.icn = 3;
         }
         if(e.currentTarget.name.split("_")[1] == 4)
         {
            this._addObj = new im_app();
            this.icn = 4;
         }
         if(e.currentTarget.name.split("_")[1] == 5)
         {
            this._addObj = new im_document();
            this.icn = 5;
         }
         if(e.currentTarget.name.split("_")[1] == 6)
         {
            this._addObj = new im_link();
            this.icn = 6;
         }
         if(e.currentTarget.name.split("_")[1] == 7)
         {
            this._addObj = new im_txt();
            this.icn = 7;
         }
         this._addObj.x = stage.mouseX;
         this._addObj.y = stage.mouseY;
         this.playSound("b");
         this.tempShape.graphics.clear();
         this._currMc.filters = [];
         this.addStage(this._addObj);
         this._addObj.startDrag();
         stage.addEventListener(MouseEvent.MOUSE_UP,this.birakti);
         this.footer.btnZeng.removeEventListener(MouseEvent.CLICK,this.zengModu);
      }
      
      public function birakti(e:MouseEvent) : void
      {
         var _p1:Point = null;
         var _p2:Point = null;
         if(this._book.hitTestPoint(stage.mouseX,stage.mouseY,true))
         {
            this.playSound("b");
            this._addObj.stopDrag();
            this._addObj.filters = [this._glowF];
            this._blackBg.alpha = 0;
            this.addStage(this._blackBg);
            this.addStage(this.bilgiPanel);
            this.kayitPanel.visible = true;
            this.addStage(this.kayitPanel);
            this.bilgiPanel.visible = true;
            this.tempLayerZeng.mouseChildren = false;
            this.toolZeng.mouseChildren = false;
            this.bilgiPanel.txt.text = this._bilgiler[this.icn][0];
            this.kayitPanel.baslik.text = this._bilgiler[this.icn][1];
            this.kayitPanel.acikla.text = this._bilgiler[this.icn][2];
            this.kayitPanel.simge.gotoAndStop(this.icn + 1);
            this.footer.nPage.mouseEnabled = false;
            this.footer.pPage.mouseEnabled = false;
            this.kayitPanel.pir.gotoAndPlay(2);
            if(this.icn == 0)
            {
               this.bölgeSec();
            }
            else if(this.icn == 1)
            {
               this.dosyaEkle();
            }
            else if(this.icn == 2)
            {
               this.dosyaEkle();
            }
            else if(this.icn == 3)
            {
               this.dosyaEkle();
            }
            else if(this.icn == 4)
            {
               this.dosyaEkle();
            }
            else if(this.icn == 5)
            {
               this.dosyaEkle();
            }
            else if(this.icn == 6)
            {
               this.linkGir();
            }
            else if(this.icn == 7)
            {
               this.yaziGir();
            }
            _p1 = new Point(this._addObj.x,this._addObj.y);
            _p2 = this.tempLayerZeng.globalToLocal(_p1);
            this._addObj.x = _p2.x;
            this._addObj.y = _p2.y;
            this.tempLayerZeng.addChild(this._addObj);
         }
         else
         {
            this.footer.btnZeng.addEventListener(MouseEvent.CLICK,this.zengModu);
            if(this._addObj)
            {
               if(this._addObj.stage)
               {
                  this.removeStage(this._addObj);
               }
            }
            this._addObj.stopDrag();
         }
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.birakti);
      }
      
      public function icnSurukle(e:MouseEvent) : void
      {
         var key:* = null;
         for(key in this._objZeng[e.currentTarget.name.split("_")[2]])
         {
            if(this._objZeng[e.currentTarget.name.split("_")[2]][key]["mc"].name == e.currentTarget.name)
            {
               if(this._objZeng[e.currentTarget.name.split("_")[2]][key]["online"] == "true")
               {
                  return;
               }
            }
         }
         ++this.kayitB2;
         this._currMc.filters = [];
         this._currMc = MovieClip(e.currentTarget);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.icnBirak);
         this._currMc.startDrag(false,new Rectangle(this._book.x,this._book.y,this._book.width,this._book.height));
         this._currMc.filters = [this._glowF];
         this.silPanel.simge.gotoAndStop(int(this._currMc.name.split("_")[2]) + 1);
         this.silPanel.visible = true;
         this.addStage(this.silPanel);
         this.silPanel.btnSil.addEventListener(MouseEvent.CLICK,this.icnSil);
         this.silPanel.btnGoster.addEventListener(MouseEvent.CLICK,this.icnGoster);
         this.tempShape.graphics.clear();
         TweenMax.to(this.silPanel,this._tweenTime,{"x":this._capX - this.silPanel.width - 10});
      }
      
      public function icnBirak(e:MouseEvent) : void
      {
         var key:* = null;
         for(key in this._objZeng[this._currMc.name.split("_")[2]])
         {
            if(this._objZeng[this._currMc.name.split("_")[2]][key]["mc"].name == this._currMc.name)
            {
               this._objZeng[this._currMc.name.split("_")[2]][key]["mc"].x = this._currMc.x;
               this._objZeng[this._currMc.name.split("_")[2]][key]["mc"].y = this._currMc.y;
            }
         }
         this._currMc.addEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.icnBirak);
         this._currMc.stopDrag();
      }
      
      public function bulutAc(e:MouseEvent) : *
      {
         this.playSound("b");
         if(this.hangiIslem == 0)
         {
            this.bolgeKaydet();
         }
         else if(this.hangiIslem == 1)
         {
            this.dosyaKaydet();
         }
         else if(this.hangiIslem == 2)
         {
            this.linkKaydet();
         }
         else if(this.hangiIslem == 3)
         {
            this.yaziKaydet();
         }
      }
      
      public function bölgeSec() : *
      {
         this.kayitPanel.dosya.text = "Bölge seçilmedi";
         this.bilgiPanel.visible = true;
         this.addStage(this.bilgiPanel);
         TweenMax.to(this.bilgiPanel,this._tweenTime,{"y":10});
         TweenMax.to(this._blackBg,this._tweenTime,{
            "alpha":1,
            "onComplete":function():*
            {
               TweenMax.to(_blackBg,_tweenTime,{
                  "delay":1,
                  "alpha":0,
                  "onComplete":function():*
                  {
                     removeStage(_blackBg);
                  }
               });
               kayitPanel.visible = true;
               TweenMax.to(bilgiPanel,_tweenTime,{
                  "delay":1,
                  "y":-45,
                  "visible":false
               });
               TweenMax.to(kayitPanel,_tweenTime,{
                  "delay":1,
                  "x":_capX - kayitPanel.width - 10
               });
            }
         });
         this.kayitPanel.btnKay.alpha = 0.5;
         this.kayitPanel.btnVaz.addEventListener(MouseEvent.CLICK,this.vazgecF);
         this._canvas.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartSelectZeng);
      }
      
      public function onStartSelectZeng(e:MouseEvent) : void
      {
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onStopSelectZeng);
         if(!this.isSelectDrawingZeng && this._book.hitTestPoint(mouseX,mouseY,true))
         {
            this.startPoint = new Point(this._canvas.mouseX,this._canvas.mouseY);
            this.isSelectDrawingZeng = true;
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.selectOnFrameZeng);
         }
      }
      
      public function selectOnFrameZeng(e:MouseEvent) : void
      {
         if(this.isSelectDrawingZeng && this._book.hitTestPoint(mouseX,mouseY,true))
         {
            this.tempShape.graphics.clear();
            this.tempShape.graphics.lineStyle(1,13421772,1,true,LineScaleMode.NORMAL,CapsStyle.NONE,"miter");
            this.tempShape.graphics.beginFill(0,0.1);
            this.tempShape.graphics.drawRect(this.startPoint.x,this.startPoint.y,this._canvas.mouseX - this.startPoint.x,this._canvas.mouseY - this.startPoint.y);
            this.tempShape.graphics.endFill();
            this._canvas.addChild(this.tempShape);
         }
      }
      
      public function onStopSelectZeng(e:MouseEvent) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStopSelectZeng);
         this.lastPoint = new Point(this._canvas.mouseX,this._canvas.mouseY);
         this.isSelectDrawingZeng = false;
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.selectOnFrameZeng);
         if(this._book.hitTestPoint(mouseX,mouseY,true) && this.startPoint.x != this.lastPoint.x && this.startPoint.y != this.lastPoint.y && this._scale < 500)
         {
            if(this.startPoint.x < this.lastPoint.x)
            {
               if(this.startPoint.y < this.lastPoint.y)
               {
                  this._rect = new Rectangle(this.startPoint.x,this.startPoint.y,this.tempShape.width,this.tempShape.height);
               }
               else
               {
                  this._rect = new Rectangle(this.startPoint.x,this.startPoint.y - this.tempShape.height,this.tempShape.width,this.tempShape.height);
               }
            }
            else if(this.startPoint.y < this.lastPoint.y)
            {
               this._rect = new Rectangle(this.startPoint.x - this.tempShape.width,this.startPoint.y,this.tempShape.width,this.tempShape.height);
            }
            else
            {
               this._rect = new Rectangle(this.startPoint.x - this.tempShape.width,this.startPoint.y - this.tempShape.height,this.tempShape.width,this.tempShape.height);
            }
            this.kayitPanel.pir.gotoAndStop(1);
            this.kayitPanel.acikla.text = this._bilgiler[this.icn][3];
            this.kayitPanel.dosya.text = "Bölge seçildi";
            this.kayitPanel.btnKay.alpha = 1;
            this.hangiIslem = 0;
            this.kayitPanel.btnKay.addEventListener(MouseEvent.CLICK,this.bulutAc);
         }
      }
      
      public function bolgeKaydet(e:MouseEvent = null) : void
      {
         this._addObj.filters = [];
         if(!this._icnPage[this.guncelSayfa])
         {
            this._icnPage[this.guncelSayfa] = new MovieClip();
            this.tempLayerZeng.addChild(this._icnPage[this.guncelSayfa]);
         }
         this.icn = 0;
         this._objZeng[this.icn][this._intZeng[this.icn]] = new Array();
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"] = this._addObj;
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].cacheAsBitmap = true;
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].name = "im_" + this._nameInt + "_" + this.icn;
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].x = this._addObj.x;
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].y = this._addObj.y;
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].addEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
         this._objZeng[this.icn][this._intZeng[this.icn]]["pn"] = this.guncelSayfa;
         this._objZeng[this.icn][this._intZeng[this.icn]]["rc"] = this._rect;
         this._icnPage[this.guncelSayfa].addChild(this._objZeng[this.icn][this._intZeng[this.icn]]["mc"]);
         ++this.kayitB2;
         ++this.kayitB;
         ++this._nameInt;
         ++this._intZeng[this.icn];
         this._addObj = null;
         this.tempLayerZeng.mouseChildren = true;
         this.toolZeng.mouseChildren = true;
         this.footer.nPage.mouseEnabled = true;
         this.footer.pPage.mouseEnabled = true;
         TweenMax.to(this.kayitPanel,this._tweenTime,{
            "x":this._capX,
            "visible":false
         });
         this.tempShape.graphics.clear();
         this.kayitPanel.btnKay.removeEventListener(MouseEvent.CLICK,this.bulutAc);
         this._canvas.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartSelectZeng);
         this.footer.btnZeng.addEventListener(MouseEvent.CLICK,this.zengModu);
      }
      
      public function tempCiz() : void
      {
         var key:* = null;
         for(key in this._objZeng[0])
         {
            if(this._objZeng[0][key]["mc"].name == this._currMc.name)
            {
               this._rect = new Rectangle(this._objZeng[0][key]["rc"].x,this._objZeng[0][key]["rc"].y,this._objZeng[0][key]["rc"].width,this._objZeng[0][key]["rc"].height);
            }
         }
         this.tempShape.graphics.clear();
         this.tempShape.graphics.lineStyle(1,13421772,1,true,LineScaleMode.NORMAL,CapsStyle.NONE,this._joints);
         this.tempShape.graphics.beginFill(0,0.1);
         this.tempShape.graphics.drawRect(this._rect.x,this._rect.y,this._rect.width,this._rect.height);
         this.tempShape.graphics.endFill();
         this._canvas.addChild(this.tempShape);
      }
      
      public function dosyaEkle() : void
      {
         this.kayitPanel.dosya.text = "DOSYA SEÇ";
         this.kayitPanel.btnKay.alpha = 0.5;
         this.kayitPanel.btnVaz.addEventListener(MouseEvent.CLICK,this.vazgecF);
         this.kayitPanel.dosya.addEventListener(MouseEvent.CLICK,this.dosyaSec);
         this.bilgiPanel.visible = true;
         this.addStage(this._blackBg);
         this.addStage(this.bilgiPanel);
         this._blackBg.alpha = 0;
         TweenMax.to(this.bilgiPanel,this._tweenTime,{"y":10});
         TweenMax.to(this._blackBg,this._tweenTime,{
            "alpha":1,
            "onComplete":function():*
            {
               TweenMax.to(_blackBg,_tweenTime,{
                  "delay":0.5,
                  "alpha":0,
                  "onComplete":function():*
                  {
                     removeStage(_blackBg);
                  }
               });
               kayitPanel.visible = true;
               TweenMax.to(bilgiPanel,_tweenTime,{
                  "delay":0.5,
                  "y":-45,
                  "visible":false
               });
               TweenMax.to(kayitPanel,_tweenTime,{
                  "delay":0.5,
                  "x":_capX - kayitPanel.width - 10
               });
            }
         });
      }
      
      public function dosyaSec(e:MouseEvent) : void
      {
         var _fileFilter:FileFilter = null;
         this._fileSelect = new File();
         this._fileSelect.addEventListener(Event.SELECT,this.dosyaSecildi);
         if(this.icn == 1)
         {
            _fileFilter = new FileFilter("Resim Dosyası","*.jpg;*.png;*.bmp;*.jpeg");
         }
         else if(this.icn == 2)
         {
            _fileFilter = new FileFilter("Ses Dosyası","*.mp3;");
         }
         else if(this.icn == 3)
         {
            _fileFilter = new FileFilter("Video Dosyası","*.mp4;*.m4v;*.flv");
         }
         else if(this.icn == 4)
         {
            _fileFilter = new FileFilter("SWF Dosyası","*.swf");
         }
         else if(this.icn == 5)
         {
            _fileFilter = new FileFilter("Dosya","*.*");
         }
         else if(this.icn == 6)
         {
         }
         this._fileSelect.browse([_fileFilter]);
      }
      
      public function dosyaSecildi(event:*) : void
      {
         this._fileSelect.removeEventListener(Event.SELECT,this.dosyaSecildi);
         this.ilkPath = this._fileSelect.url;
         this._dosyaPath = this._fileSelect.name;
         this.kayitPanel.pir.gotoAndStop(1);
         this.kayitPanel.acikla.text = this._bilgiler[this.icn][3];
         this.kayitPanel.dosya.text = "DOSYAYI DEĞİŞTİR";
         this.kayitPanel.btnKay.alpha = 1;
         this.kayitPanel.btnKay.addEventListener(MouseEvent.CLICK,this.bulutAc);
         this.hangiIslem = 1;
      }
      
      public function dosyaKaydet(e:MouseEvent = null) : void
      {
         var sourceFile:File = null;
         var destinationFile:File = null;
         this.showLoading();
         sourceFile = new File(this.ilkPath);
         destinationFile = new File(this._assPath + this._dosyaPath);
         sourceFile.addEventListener(Event.COMPLETE,this.fileCopyCompleteHandler);
         sourceFile.addEventListener(IOErrorEvent.IO_ERROR,this.fileCopyIOErrorEventHandler);
         sourceFile.copyToAsync(destinationFile,true);
      }
      
      public function fileCopyCompleteHandler(event:Event) : void
      {
         this.hideLoading();
         this._addObj.filters = [];
         if(!this._icnPage[this.guncelSayfa])
         {
            this._icnPage[this.guncelSayfa] = new MovieClip();
            this.tempLayerZeng.addChild(this._icnPage[this.guncelSayfa]);
         }
         this._objZeng[this.icn][this._intZeng[this.icn]] = new Array();
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"] = this._addObj;
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].cacheAsBitmap = true;
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].name = "im_" + this._nameInt + "_" + this.icn;
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].x = this._addObj.x;
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].y = this._addObj.y;
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].addEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
         this._objZeng[this.icn][this._intZeng[this.icn]]["pn"] = this.guncelSayfa;
         this._objZeng[this.icn][this._intZeng[this.icn]]["fl"] = this._dosyaPath;
         this._icnPage[this.guncelSayfa].addChild(this._objZeng[this.icn][this._intZeng[this.icn]]["mc"]);
         ++this.kayitB2;
         ++this.kayitB;
         ++this._nameInt;
         ++this._intZeng[this.icn];
         this._addObj = null;
         this.tempLayerZeng.mouseChildren = true;
         this.toolZeng.mouseChildren = true;
         this.footer.nPage.mouseEnabled = true;
         this.footer.pPage.mouseEnabled = true;
         TweenMax.to(this.kayitPanel,this._tweenTime,{
            "x":this._capX,
            "visible":false
         });
         this.tempShape.graphics.clear();
         this.kayitPanel.dosya.removeEventListener(MouseEvent.CLICK,this.dosyaSec);
         this.kayitPanel.btnKay.removeEventListener(MouseEvent.CLICK,this.bulutAc);
         this.footer.btnZeng.addEventListener(MouseEvent.CLICK,this.zengModu);
      }
      
      public function fileCopyIOErrorEventHandler(e:IOErrorEvent) : void
      {
         this.hideLoading();
         this.warning("Dosya kopyalanırken hata oluştu. Tekrar deneyin.");
      }
      
      public function linkGir(e:MouseEvent = null) : *
      {
         this.kayitPanel.acikla.text = this._bilgiler[this.icn][2];
         this.kayitPanel.dosya.text = "ADRES GİR";
         this.kayitPanel.btnKay.alpha = 0.5;
         this.kayitPanel.btnVaz.addEventListener(MouseEvent.CLICK,this.vazgecF);
         this.linkPanel.txtTitle.text = "Adres";
         this.linkPanel.linkTxt.text = "";
         stage.focus = this.linkPanel.linkTxt;
         this.linkPanel.visible = true;
         this.kayitPanel.visible = true;
         this.bilgiPanel.visible = true;
         this.linkPanel.alpha = 0;
         this.addStage(this._blackBg);
         this.addStage(this.bilgiPanel);
         this.addStage(this.linkPanel);
         TweenMax.to(this.bilgiPanel,this._tweenTime,{"y":10});
         TweenMax.to(this._blackBg,this._tweenTime,{"alpha":1});
         TweenMax.to(this.linkPanel,this._tweenTime,{"alpha":1});
         TweenMax.to(this.kayitPanel,this._tweenTime,{"x":this._capX - this.kayitPanel.width - 10});
         this.linkPanel.bgir.addEventListener(MouseEvent.CLICK,this.linkDurum);
         this.linkPanel.biptal.addEventListener(MouseEvent.CLICK,this.linkDurum);
      }
      
      public function linkDurum(e:MouseEvent = null) : void
      {
         this.playSound("b");
         if(e.currentTarget.name == "bgir")
         {
            if(this.linkPanel.linkTxt.text != "" && this.linkPanel.linkTxt.text != " " && this.linkPanel.linkTxt.text != "   " && this.linkPanel.linkTxt.text.length > 3)
            {
               this.linkPanel.bgir.removeEventListener(MouseEvent.CLICK,this.linkDurum);
               this.linkPanel.biptal.removeEventListener(MouseEvent.CLICK,this.linkDurum);
               TweenMax.to(this.linkPanel,this._tweenTime,{"alpha":0});
               TweenMax.to(this.bilgiPanel,this._tweenTime,{
                  "y":-45,
                  "visible":false
               });
               TweenMax.to(this._blackBg,this._tweenTime,{
                  "alpha":0,
                  "onComplete":function():*
                  {
                     removeStage(_blackBg);
                     linkPanel.visible = false;
                  }
               });
               this.kayitPanel.pir.gotoAndStop(1);
               this.kayitPanel.acikla.text = this._bilgiler[this.icn][3];
               this.kayitPanel.dosya.text = "DOSYAYI DEĞİŞTİR";
               this.kayitPanel.btnKay.alpha = 1;
               this.kayitPanel.dosya.addEventListener(MouseEvent.CLICK,this.linkGir);
               this.kayitPanel.btnKay.addEventListener(MouseEvent.CLICK,this.bulutAc);
               this.hangiIslem = 2;
            }
            else
            {
               stage.focus = this.linkPanel.linkTxt;
            }
         }
         else
         {
            TweenMax.to(this.linkPanel,this._tweenTime,{"alpha":0});
            TweenMax.to(this.bilgiPanel,this._tweenTime,{
               "y":-45,
               "visible":false
            });
            TweenMax.to(this._blackBg,this._tweenTime,{
               "alpha":0,
               "onComplete":function():*
               {
                  removeStage(_blackBg);
                  linkPanel.visible = false;
               }
            });
            this.vazgecF();
         }
      }
      
      public function linkKaydet(e:MouseEvent = null) : void
      {
         this._addObj.filters = [];
         if(!this._icnPage[this.guncelSayfa])
         {
            this._icnPage[this.guncelSayfa] = new MovieClip();
            this.tempLayerZeng.addChild(this._icnPage[this.guncelSayfa]);
         }
         this._objZeng[this.icn][this._intZeng[this.icn]] = new Array();
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"] = this._addObj;
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].cacheAsBitmap = true;
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].name = "im_" + this._nameInt + "_" + this.icn;
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].x = this._addObj.x;
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].y = this._addObj.y;
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].addEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
         this._objZeng[this.icn][this._intZeng[this.icn]]["pn"] = this.guncelSayfa;
         this._objZeng[this.icn][this._intZeng[this.icn]]["fl"] = this.linkPanel.linkTxt.text;
         this._icnPage[this.guncelSayfa].addChild(this._objZeng[this.icn][this._intZeng[this.icn]]["mc"]);
         ++this.kayitB2;
         ++this.kayitB;
         ++this._nameInt;
         ++this._intZeng[this.icn];
         this._addObj = null;
         this.tempLayerZeng.mouseChildren = true;
         this.toolZeng.mouseChildren = true;
         this.footer.nPage.mouseEnabled = true;
         this.footer.pPage.mouseEnabled = true;
         TweenMax.to(this.kayitPanel,this._tweenTime,{
            "x":this._capX,
            "visible":false
         });
         this.tempShape.graphics.clear();
         this.kayitPanel.dosya.removeEventListener(MouseEvent.CLICK,this.linkGir);
         this.kayitPanel.btnKay.removeEventListener(MouseEvent.CLICK,this.bulutAc);
         this.footer.btnZeng.addEventListener(MouseEvent.CLICK,this.zengModu);
      }
      
      public function yaziGir(e:MouseEvent = null) : *
      {
         this.kayitPanel.acikla.text = this._bilgiler[this.icn][2];
         this.kayitPanel.dosya.text = "METİN GİR";
         this.kayitPanel.btnKay.alpha = 0.5;
         this.kayitPanel.btnVaz.addEventListener(MouseEvent.CLICK,this.vazgecF);
         this.linkPanel.txtTitle.text = "METİN";
         this.linkPanel.linkTxt.text = "";
         stage.focus = this.linkPanel.linkTxt;
         this.linkPanel.visible = true;
         this.kayitPanel.visible = true;
         this.bilgiPanel.visible = true;
         this.linkPanel.alpha = 0;
         this.addStage(this._blackBg);
         this.addStage(this.bilgiPanel);
         this.addStage(this.linkPanel);
         TweenMax.to(this.bilgiPanel,this._tweenTime,{"y":10});
         TweenMax.to(this._blackBg,this._tweenTime,{"alpha":1});
         TweenMax.to(this.linkPanel,this._tweenTime,{"alpha":1});
         TweenMax.to(this.kayitPanel,this._tweenTime,{"x":this._capX - this.kayitPanel.width - 10});
         this.linkPanel.bgir.addEventListener(MouseEvent.CLICK,this.yaziDurum);
         this.linkPanel.biptal.addEventListener(MouseEvent.CLICK,this.yaziDurum);
      }
      
      public function yaziDurum(e:MouseEvent = null) : void
      {
         this.playSound("b");
         if(e.currentTarget.name == "bgir")
         {
            if(this.linkPanel.linkTxt.text != "" && this.linkPanel.linkTxt.text != " " && this.linkPanel.linkTxt.text != "   ")
            {
               this.linkPanel.bgir.removeEventListener(MouseEvent.CLICK,this.yaziDurum);
               this.linkPanel.biptal.removeEventListener(MouseEvent.CLICK,this.yaziDurum);
               TweenMax.to(this.linkPanel,this._tweenTime,{"alpha":0});
               TweenMax.to(this.bilgiPanel,this._tweenTime,{
                  "y":-45,
                  "visible":false
               });
               TweenMax.to(this._blackBg,this._tweenTime,{
                  "alpha":0,
                  "onComplete":function():*
                  {
                     removeStage(_blackBg);
                     linkPanel.visible = false;
                  }
               });
               this.kayitPanel.pir.gotoAndStop(1);
               this.kayitPanel.acikla.text = this._bilgiler[this.icn][3];
               this.kayitPanel.dosya.text = "METNİ DEĞİŞTİR";
               this.kayitPanel.btnKay.alpha = 1;
               this.kayitPanel.dosya.addEventListener(MouseEvent.CLICK,this.yaziGir);
               this.kayitPanel.btnKay.addEventListener(MouseEvent.CLICK,this.bulutAc);
               this.hangiIslem = 3;
            }
            else
            {
               stage.focus = this.linkPanel.linkTxt;
            }
         }
         else
         {
            TweenMax.to(this.linkPanel,this._tweenTime,{"alpha":0});
            TweenMax.to(this.bilgiPanel,this._tweenTime,{
               "y":-45,
               "visible":false
            });
            TweenMax.to(this._blackBg,this._tweenTime,{
               "alpha":0,
               "onComplete":function():*
               {
                  removeStage(_blackBg);
                  linkPanel.visible = false;
               }
            });
            this.vazgecF();
         }
      }
      
      public function yaziKaydet(e:MouseEvent = null) : void
      {
         this._addObj.filters = [];
         if(!this._icnPage[this.guncelSayfa])
         {
            this._icnPage[this.guncelSayfa] = new MovieClip();
            this.tempLayerZeng.addChild(this._icnPage[this.guncelSayfa]);
         }
         this._objZeng[this.icn][this._intZeng[this.icn]] = new Array();
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"] = this._addObj;
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].cacheAsBitmap = true;
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].name = "im_" + this._nameInt + "_" + this.icn;
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].x = this._addObj.x;
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].y = this._addObj.y;
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].addEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
         this._objZeng[this.icn][this._intZeng[this.icn]]["pn"] = this.guncelSayfa;
         this._objZeng[this.icn][this._intZeng[this.icn]]["fl"] = this.linkPanel.linkTxt.text;
         this._icnPage[this.guncelSayfa].addChild(this._objZeng[this.icn][this._intZeng[this.icn]]["mc"]);
         ++this.kayitB2;
         ++this.kayitB;
         ++this._nameInt;
         ++this._intZeng[this.icn];
         this._addObj = null;
         this.tempLayerZeng.mouseChildren = true;
         this.toolZeng.mouseChildren = true;
         this.footer.nPage.mouseEnabled = true;
         this.footer.pPage.mouseEnabled = true;
         TweenMax.to(this.kayitPanel,this._tweenTime,{
            "x":this._capX,
            "visible":false
         });
         this.tempShape.graphics.clear();
         this.kayitPanel.dosya.removeEventListener(MouseEvent.CLICK,this.yaziGir);
         this.kayitPanel.btnKay.removeEventListener(MouseEvent.CLICK,this.bulutAc);
         this.footer.btnZeng.addEventListener(MouseEvent.CLICK,this.zengModu);
      }
      
      public function vazgecF(e:MouseEvent = null) : void
      {
         this.playSound("b");
         this.silPanel.btnSil.removeEventListener(MouseEvent.CLICK,this.icnSil);
         this.silPanel.btnGoster.removeEventListener(MouseEvent.CLICK,this.icnGoster);
         this.kayitPanel.dosya.removeEventListener(MouseEvent.CLICK,this.linkGir);
         this.kayitPanel.dosya.removeEventListener(MouseEvent.CLICK,this.yaziGir);
         this.kayitPanel.btnKay.removeEventListener(MouseEvent.CLICK,this.bulutAc);
         this.linkPanel.bgir.removeEventListener(MouseEvent.CLICK,this.linkDurum);
         this.linkPanel.biptal.removeEventListener(MouseEvent.CLICK,this.linkDurum);
         this.linkPanel.bgir.removeEventListener(MouseEvent.CLICK,this.yaziDurum);
         this.linkPanel.biptal.removeEventListener(MouseEvent.CLICK,this.yaziDurum);
         this.kayitPanel.btnKay.removeEventListener(MouseEvent.CLICK,this.bulutAc);
         this.kayitPanel.dosya.removeEventListener(MouseEvent.CLICK,this.dosyaSec);
         this.kayitPanel.btnVaz.removeEventListener(MouseEvent.CLICK,this.vazgecF);
         this.kayitPanel.btnKay.removeEventListener(MouseEvent.CLICK,this.bulutAc);
         this._canvas.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartSelectZeng);
         this.footer.btnZeng.addEventListener(MouseEvent.CLICK,this.zengModu);
         this.tempShape.graphics.clear();
         if(this._addObj)
         {
            if(this.tempLayerZeng.contains(this._addObj))
            {
               this.tempLayerZeng.removeChild(this._addObj);
            }
         }
         this._addObj = null;
         this.tempLayerZeng.mouseChildren = true;
         this.toolZeng.mouseChildren = true;
         this.footer.nPage.mouseEnabled = true;
         this.footer.pPage.mouseEnabled = true;
         TweenMax.to(this.kayitPanel,this._tweenTime,{
            "x":this._capX,
            "visible":false
         });
      }
      
      public function icnGoster(e:MouseEvent = null) : void
      {
         var key:* = null;
         this.playSound("b");
         for(key in this._objZeng[this._currMc.name.split("_")[2]])
         {
            if(this._objZeng[this._currMc.name.split("_")[2]][key]["mc"].name == this._currMc.name)
            {
               if(this._currMc.name.split("_")[2] == 0)
               {
                  this.tempCiz();
               }
               else if(this._currMc.name.split("_")[2] == 1)
               {
                  this._file = this._assPath + String(this._objZeng[this._currMc.name.split("_")[2]][key]["fl"]);
                  this._actionImage2();
               }
               else if(this._currMc.name.split("_")[2] == 2)
               {
                  this._file = this._assPath + String(this._objZeng[this._currMc.name.split("_")[2]][key]["fl"]);
                  this._actionSound2();
               }
               else if(this._currMc.name.split("_")[2] == 3)
               {
                  this._file = this._assPath + String(this._objZeng[this._currMc.name.split("_")[2]][key]["fl"]);
                  this._actionVideo2();
               }
               else if(this._currMc.name.split("_")[2] == 4)
               {
                  this._file = this._assPath + String(this._objZeng[this._currMc.name.split("_")[2]][key]["fl"]);
                  this._actionApp2();
               }
               else if(this._currMc.name.split("_")[2] == 5)
               {
                  this._file = this._assPath + String(this._objZeng[this._currMc.name.split("_")[2]][key]["fl"]);
                  this._actionDoc2();
               }
               else if(this._currMc.name.split("_")[2] == 6)
               {
                  this._file = String(this._objZeng[this._currMc.name.split("_")[2]][key]["fl"]);
                  this._actionLink2();
               }
               else if(this._currMc.name.split("_")[2] == 7)
               {
                  this._file = String(this._objZeng[this._currMc.name.split("_")[2]][key]["fl"]);
                  this._actionText2();
               }
               else if(this._currMc.name.split("_")[2] == 8)
               {
                  this._file = String(this._objZeng[this._currMc.name.split("_")[2]][key]["fl"]);
                  this._actionEba2();
               }
            }
         }
      }
      
      public function icnSil(e:MouseEvent) : void
      {
         var key:* = null;
         var _f:File = null;
         this.playSound("b");
         this._empArray = new Array();
         this._empArray = this._currMc.name.split("_");
         this._icnPage[this.guncelSayfa].removeChild(this._currMc);
         this.tempShape.graphics.clear();
         TweenMax.to(this.silPanel,this._tweenTime,{
            "x":this._capX,
            "visible":false
         });
         for(key in this._objZeng[this._empArray[2]])
         {
            if(this._objZeng[this._empArray[2]][key]["mc"].name == this._currMc.name)
            {
               this._objZeng[this._empArray[2]][key]["mc"].removeEventListener(MouseEvent.CLICK,this._actionImage2);
               this._objZeng[this._empArray[2]][key]["mc"].removeEventListener(MouseEvent.CLICK,this._actionSound2);
               this._objZeng[this._empArray[2]][key]["mc"].removeEventListener(MouseEvent.CLICK,this._actionVideo2);
               this._objZeng[this._empArray[2]][key]["mc"].removeEventListener(MouseEvent.CLICK,this._actionApp2);
               this._objZeng[this._empArray[2]][key]["mc"].removeEventListener(MouseEvent.CLICK,this._actionDoc2);
               this._objZeng[this._empArray[2]][key]["mc"].removeEventListener(MouseEvent.CLICK,this._actionLink2);
               this._objZeng[this._empArray[2]][key]["mc"].removeEventListener(MouseEvent.CLICK,this._actionText2);
               this._objZeng[this._empArray[2]][key]["mc"].removeEventListener(MouseEvent.CLICK,this._actionEba2);
               if(this._empArray[2] == 1 || this._empArray[2] == 2 || this._empArray[2] == 3 || this._empArray[2] == 4 || this._empArray[2] == 5)
               {
                  this._empString = this._objZeng[this._empArray[2]][key]["fl"];
               }
               this._objZeng[this._empArray[2]].splice(key,1);
               --this._intZeng[this._empArray[2]];
               --this.kayitB;
            }
         }
         ++this.kayitB2;
         _f = new File(this._assPath + this._empString);
         if(_f.exists)
         {
            _f.deleteFile();
         }
      }
      
      public function zengKaydet() : *
      {
         var key:* = null;
         this._empBoolean = false;
         for(key in this._icnPage)
         {
            if(this._icnPage[key].numChildren > 0)
            {
               this._empBoolean = true;
            }
         }
         if(this.kayitB > 0)
         {
            if(this.kayitB2 > 0)
            {
               this.kayitB2 = 0;
               this.xmlZengKaydet();
            }
            else
            {
               this.kaydetmeZeng();
            }
         }
         else if(this._empBoolean)
         {
            this.kayitB2 = 0;
            this.xmlZengKaydet();
         }
         else
         {
            KXKDatabase.deleteEnrichmentData("xml");
            this.kaydetmeZeng();
         }
      }
      
      public function xmlZengKaydet() : *
      {
         var tags:String = null;
         var xmlData:String = null;
         var key1:String = null;
         var key2:String = null;
         var key3:String = null;
         var key4:String = null;
         var key5:String = null;
         var key6:String = null;
         var key7:String = null;
         var key8:String = null;
         var key9:String = null;
         var _online:String = null;
         xmlData = "<?xml version=\'1.0\' encoding=\'UTF-8\' standalone=\'yes\'?><data>\n";
         tags = "<selects>\n";
         for(key1 in this._objZeng[0])
         {
            tags = tags + "<select><page>" + this._objZeng[0][key1]["pn"] + "</page><rect>" + this._objZeng[0][key1]["rc"].x + "," + this._objZeng[0][key1]["rc"].y + "/" + this._objZeng[0][key1]["rc"].width + "," + this._objZeng[0][key1]["rc"].height + "</rect><imCoor>" + this._objZeng[0][key1]["mc"].x + "," + this._objZeng[0][key1]["mc"].y + "</imCoor></select>\n";
            if(!this.pageItems[this._objZeng[0][key1]["pn"]])
            {
               this.pageItems[this._objZeng[0][key1]["pn"]] = new MovieClip();
            }
            this.pageItems[this._objZeng[0][key1]["pn"]].addChild(this._objZeng[0][key1]["mc"]);
            this._objZeng[0][key1]["mc"].removeEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
            this._objZeng[0][key1]["mc"].addEventListener(MouseEvent.CLICK,this.autoSelectZeng);
            this._objZeng[0][key1]["bl"] = true;
         }
         tags += "</selects>\n";
         xmlData += tags;
         tags = "<actions>\n";
         for(key2 in this._objZeng[1])
         {
            tags = tags + "<item><page>" + this._objZeng[1][key2]["pn"] + "</page><coordinates>" + this._objZeng[1][key2]["mc"].x + "," + this._objZeng[1][key2]["mc"].y + "</coordinates><aType>image</aType><aFile>" + this._objZeng[1][key2]["fl"] + "</aFile></item>\n";
            if(!this.pageItems[this._objZeng[1][key2]["pn"]])
            {
               this.pageItems[this._objZeng[1][key2]["pn"]] = new MovieClip();
            }
            this.pageItems[this._objZeng[1][key2]["pn"]].addChild(this._objZeng[1][key2]["mc"]);
            this._objZeng[1][key2]["mc"].removeEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
            this._objZeng[1][key2]["mc"].addEventListener(MouseEvent.CLICK,this._actionImage2);
            this._objZeng[1][key2]["bl"] = true;
         }
         for(key3 in this._objZeng[2])
         {
            tags = tags + "<item><page>" + this._objZeng[2][key3]["pn"] + "</page><coordinates>" + this._objZeng[2][key3]["mc"].x + "," + this._objZeng[2][key3]["mc"].y + "</coordinates><aType>sound</aType><aFile>" + this._objZeng[2][key3]["fl"] + "</aFile></item>\n";
            if(!this.pageItems[this._objZeng[2][key3]["pn"]])
            {
               this.pageItems[this._objZeng[2][key3]["pn"]] = new MovieClip();
            }
            this.pageItems[this._objZeng[2][key3]["pn"]].addChild(this._objZeng[2][key3]["mc"]);
            this._objZeng[2][key3]["mc"].removeEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
            this._objZeng[2][key3]["mc"].addEventListener(MouseEvent.CLICK,this._actionSound2);
            this._objZeng[2][key3]["bl"] = true;
         }
         for(key4 in this._objZeng[3])
         {
            tags = tags + "<item><page>" + this._objZeng[3][key4]["pn"] + "</page><coordinates>" + this._objZeng[3][key4]["mc"].x + "," + this._objZeng[3][key4]["mc"].y + "</coordinates><aType>video</aType><aFile>" + this._objZeng[3][key4]["fl"] + "</aFile></item>\n";
            if(!this.pageItems[this._objZeng[3][key4]["pn"]])
            {
               this.pageItems[this._objZeng[3][key4]["pn"]] = new MovieClip();
            }
            this.pageItems[this._objZeng[3][key4]["pn"]].addChild(this._objZeng[3][key4]["mc"]);
            this._objZeng[3][key4]["mc"].removeEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
            this._objZeng[3][key4]["mc"].addEventListener(MouseEvent.CLICK,this._actionVideo2);
            this._objZeng[3][key4]["bl"] = true;
         }
         for(key5 in this._objZeng[4])
         {
            tags = tags + "<item><page>" + this._objZeng[4][key5]["pn"] + "</page><coordinates>" + this._objZeng[4][key5]["mc"].x + "," + this._objZeng[4][key5]["mc"].y + "</coordinates><aType>app</aType><aFile>" + this._objZeng[4][key5]["fl"] + "</aFile></item>\n";
            if(!this.pageItems[this._objZeng[4][key5]["pn"]])
            {
               this.pageItems[this._objZeng[4][key5]["pn"]] = new MovieClip();
            }
            this.pageItems[this._objZeng[4][key5]["pn"]].addChild(this._objZeng[4][key5]["mc"]);
            this._objZeng[4][key5]["mc"].removeEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
            this._objZeng[4][key5]["mc"].addEventListener(MouseEvent.CLICK,this._actionApp2);
            this._objZeng[4][key5]["bl"] = true;
         }
         for(key6 in this._objZeng[5])
         {
            tags = tags + "<item><page>" + this._objZeng[5][key6]["pn"] + "</page><coordinates>" + this._objZeng[5][key6]["mc"].x + "," + this._objZeng[5][key6]["mc"].y + "</coordinates><aType>document</aType><aFile>" + this._objZeng[5][key6]["fl"] + "</aFile></item>\n";
            if(!this.pageItems[this._objZeng[5][key6]["pn"]])
            {
               this.pageItems[this._objZeng[5][key6]["pn"]] = new MovieClip();
            }
            this.pageItems[this._objZeng[5][key6]["pn"]].addChild(this._objZeng[5][key6]["mc"]);
            this._objZeng[5][key6]["mc"].removeEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
            this._objZeng[5][key6]["mc"].addEventListener(MouseEvent.CLICK,this._actionDoc2);
            this._objZeng[5][key6]["bl"] = true;
         }
         for(key7 in this._objZeng[6])
         {
            tags = tags + "<item><page>" + this._objZeng[6][key7]["pn"] + "</page><coordinates>" + this._objZeng[6][key7]["mc"].x + "," + this._objZeng[6][key7]["mc"].y + "</coordinates><aType>link</aType><aFile>" + this._objZeng[6][key7]["fl"] + "</aFile></item>\n";
            if(!this.pageItems[this._objZeng[6][key7]["pn"]])
            {
               this.pageItems[this._objZeng[6][key7]["pn"]] = new MovieClip();
            }
            this.pageItems[this._objZeng[6][key7]["pn"]].addChild(this._objZeng[6][key7]["mc"]);
            this._objZeng[6][key7]["mc"].removeEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
            this._objZeng[6][key7]["mc"].addEventListener(MouseEvent.CLICK,this._actionLink2);
            this._objZeng[6][key7]["bl"] = true;
         }
         for(key8 in this._objZeng[7])
         {
            tags = tags + "<item><page>" + this._objZeng[7][key8]["pn"] + "</page><coordinates>" + this._objZeng[7][key8]["mc"].x + "," + this._objZeng[7][key8]["mc"].y + "</coordinates><aType>answer</aType><aFile>" + this._objZeng[7][key8]["fl"] + "</aFile></item>\n";
            if(!this.pageItems[this._objZeng[7][key8]["pn"]])
            {
               this.pageItems[this._objZeng[7][key8]["pn"]] = new MovieClip();
            }
            this.pageItems[this._objZeng[7][key8]["pn"]].addChild(this._objZeng[7][key8]["mc"]);
            this._objZeng[7][key8]["mc"].removeEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
            this._objZeng[7][key8]["mc"].addEventListener(MouseEvent.CLICK,this._actionText2);
            this._objZeng[7][key8]["bl"] = true;
         }
         for(key9 in this._objZeng[8])
         {
            _online = "false";
            if(this._objZeng[8][key9]["online"] == "true")
            {
               _online = "true";
            }
            tags = tags + "<item online=\"" + _online + "\" id=\"" + this._objZeng[8][key9]["id"] + "\" f=\"" + this._objZeng[8][key9]["f"] + "\" p=\"" + this._objZeng[8][key9]["p"] + "\" type=\"" + this._objZeng[8][key9]["type"] + "\"><page>" + this._objZeng[8][key9]["pn"] + "</page><coordinates>" + this._objZeng[8][key9]["mc"].x + "," + this._objZeng[8][key9]["mc"].y + "</coordinates><aType>cloud</aType><aFile><![CDATA[" + this._objZeng[8][key9]["fl"] + "]]></aFile><title><![CDATA[" + this._objZeng[8][key9]["title"] + "]]></title></item>\n";
            if(!this.pageItems[this._objZeng[8][key9]["pn"]])
            {
               this.pageItems[this._objZeng[8][key9]["pn"]] = new MovieClip();
            }
            this.pageItems[this._objZeng[8][key9]["pn"]].addChild(this._objZeng[8][key9]["mc"]);
            this._objZeng[8][key9]["mc"].removeEventListener(MouseEvent.MOUSE_DOWN,this.icnSurukle);
            this._objZeng[8][key9]["mc"].addEventListener(MouseEvent.CLICK,this._actionEba2);
            this._objZeng[8][key9]["bl"] = true;
         }
         tags += "</actions>\n";
         xmlData = xmlData + tags + "</data>";
         KXKDatabase.deleteEnrichmentData("xml",function():*
         {
            KXKDatabase.insertEnrichmentData("xml",Base64.encode(removeTabsAndNewLines(xmlData)));
         });
         if(this.pageItems[this.guncelSayfa])
         {
            this.itemMc.addChild(this.pageItems[this.guncelSayfa]);
         }
         this.kaydetmeZeng();
      }
      
      public function removeTabsAndNewLines($str:String) : String
      {
         var rex:RegExp = null;
         rex = /(\t|\n|\r)/gi;
         return $str.replace(rex,"");
      }
      
      public function _actionVideo2(e:MouseEvent = null) : void
      {
         var key:* = null;
         this.playSound("b");
         if(e != null)
         {
            for(key in this._objZeng[e.currentTarget.name.split("_")[2]])
            {
               if(this._objZeng[e.currentTarget.name.split("_")[2]][key]["mc"].name == e.currentTarget.name)
               {
                  this._file = this._assPath + String(this._objZeng[e.currentTarget.name.split("_")[2]][key]["fl"]);
               }
            }
         }
         this.openPlayer(new File(this._file).url);
      }
      
      public function _actionSound2(e:MouseEvent = null) : void
      {
         var key:* = null;
         this.playSound("b");
         if(e != null)
         {
            for(key in this._objZeng[e.currentTarget.name.split("_")[2]])
            {
               if(this._objZeng[e.currentTarget.name.split("_")[2]][key]["mc"].name == e.currentTarget.name)
               {
                  this._file = this._assPath + String(this._objZeng[e.currentTarget.name.split("_")[2]][key]["fl"]);
               }
            }
         }
         this.openMp3Player(new File(this._file).url);
      }
      
      public function _actionImage2(e:MouseEvent = null) : void
      {
         var key:* = null;
         this.playSound("b");
         if(e != null)
         {
            for(key in this._objZeng[e.currentTarget.name.split("_")[2]])
            {
               if(this._objZeng[e.currentTarget.name.split("_")[2]][key]["mc"].name == e.currentTarget.name)
               {
                  this._file = this._assPath + String(this._objZeng[e.currentTarget.name.split("_")[2]][key]["fl"]);
               }
            }
         }
         this.openObjectPanel(new File(this._file).url,"img");
      }
      
      public function _actionApp2(e:MouseEvent = null) : void
      {
         var key:* = null;
         this.playSound("b");
         if(e != null)
         {
            for(key in this._objZeng[e.currentTarget.name.split("_")[2]])
            {
               if(this._objZeng[e.currentTarget.name.split("_")[2]][key]["mc"].name == e.currentTarget.name)
               {
                  this._file = this._assPath + String(this._objZeng[e.currentTarget.name.split("_")[2]][key]["fl"]);
               }
            }
         }
         this.openObjectPanel(new File(this._file).url,"swf");
      }
      
      public function _actionLink2(e:MouseEvent = null) : void
      {
         var key:* = null;
         this.playSound("b");
         if(e != null)
         {
            for(key in this._objZeng[e.currentTarget.name.split("_")[2]])
            {
               if(this._objZeng[e.currentTarget.name.split("_")[2]][key]["mc"].name == e.currentTarget.name)
               {
                  this._file = String(this._objZeng[e.currentTarget.name.split("_")[2]][key]["fl"]);
               }
            }
         }
         if(this._file.indexOf("http") < 0)
         {
            this._file = "http://" + this._file;
         }
         navigateToURL(new URLRequest(this._file));
      }
      
      public function _actionText2(e:MouseEvent = null) : void
      {
         var key:* = null;
         this.playSound("b");
         if(e != null)
         {
            for(key in this._objZeng[e.currentTarget.name.split("_")[2]])
            {
               if(this._objZeng[e.currentTarget.name.split("_")[2]][key]["mc"].name == e.currentTarget.name)
               {
                  this._file = String(this._objZeng[e.currentTarget.name.split("_")[2]][key]["fl"]);
               }
            }
         }
         this.openPop(this._file);
      }
      
      public function _actionDoc2(e:MouseEvent = null) : void
      {
         var _f:File = null;
         var key:* = null;
         this.playSound("b");
         if(e != null)
         {
            for(key in this._objZeng[e.currentTarget.name.split("_")[2]])
            {
               if(this._objZeng[e.currentTarget.name.split("_")[2]][key]["mc"].name == e.currentTarget.name)
               {
                  this._file = this._assPath + String(this._objZeng[e.currentTarget.name.split("_")[2]][key]["fl"]);
               }
            }
         }
         _f = new File(this._file);
         if(_f.exists)
         {
            _f.openWithDefaultApplication();
         }
         else
         {
            this.warning("Dosya bulunamadı.");
         }
      }
      
      public function autoSelectZeng(e:MouseEvent) : void
      {
         var key:* = null;
         this.kapKontrol();
         for(key in this._objZeng[0])
         {
            if(this._objZeng[0][key]["mc"].name == e.currentTarget.name)
            {
               this.zengImGuncel = int(key);
               if(this.imMode == 0)
               {
                  this.autoZoom0Zeng(this._objZeng[0][key]["rc"]);
               }
               else
               {
                  this.autoZoom1Zeng(this._objZeng[0][key]["rc"]);
               }
            }
         }
      }
      
      public function autoZoom0Zeng(_rectangle:Rectangle) : *
      {
         this.zengIm = true;
         if(!this.isIm)
         {
            this.bigErase();
         }
         this.toolBar.btnBrush.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
         this.isIm = true;
         TweenMax.killTweensOf(this._white);
         if(!this._objZeng[0][this.zengImGuncel]["imPercent"])
         {
            if(_rectangle.height < _rectangle.width)
            {
               this._objZeng[0][this.zengImGuncel]["imPercent"] = 0.7;
            }
            else
            {
               this._objZeng[0][this.zengImGuncel]["imPercent"] = 1;
            }
         }
         this.selectAutoCalc(_rectangle,this._objZeng[0][this.zengImGuncel]["imPercent"]);
      }
      
      public function autoZoom1Zeng(_rectangle:Rectangle) : *
      {
         this.zengIm = true;
         this.isIm = true;
         this.openMouseStat(this.footer.btnZeng);
         this._num = 0.85;
         this.selectCalc(_rectangle,this._num);
      }
      
      public function openCurtain(e:MouseEvent = null) : *
      {
         if(!this._curtain.visible)
         {
            this._curtain.visible = true;
            this._curtain.start();
            this.colorize(this.sidePanel.btnCurtain,this._overColor);
            this._curtain.close.addEventListener(MouseEvent.CLICK,this.openCurtain);
            this.openSidePanel();
         }
         else
         {
            this._curtain.visible = false;
            this.stopColorize(this.sidePanel.btnCurtain);
            this._curtain.close.removeEventListener(MouseEvent.CLICK,this.openCurtain);
         }
      }
      
      public function studentPanelHandler(e:MouseEvent = null) : *
      {
         if(!this.panelStudent.visible)
         {
            this.panelStudent.visible = true;
            this.colorize(this.sidePanel.btnStudent,this._overColor);
            this.panelStudent.close.addEventListener(MouseEvent.CLICK,this.studentPanelHandler);
            this.stageAlignCenter(this.panelStudent);
            this.clearStudentPanel();
            this.addStage(this.panelStudent);
            this.panelStudent.bg.addEventListener(MouseEvent.MOUSE_DOWN,this.startDragStudentPanel);
            this.panelStudent.pnl1.bgo.addEventListener(MouseEvent.CLICK,this.studentPanelHandlerButton);
            this.panelStudent.pnl2.bselect.addEventListener(MouseEvent.CLICK,this.studentPanelHandlerButton);
            this.panelStudent.pnl2.bback.addEventListener(MouseEvent.CLICK,this.studentPanelHandlerButton);
         }
         else
         {
            this.panelStudent.visible = false;
            this.clearStudentPanel();
            this.stopColorize(this.sidePanel.btnStudent);
            this.panelStudent.close.removeEventListener(MouseEvent.CLICK,this.studentPanelHandler);
            this.panelStudent.bg.removeEventListener(MouseEvent.MOUSE_DOWN,this.startDragStudentPanel);
            this.panelStudent.pnl1.bgo.removeEventListener(MouseEvent.CLICK,this.studentPanelHandlerButton);
            this.panelStudent.pnl2.bselect.removeEventListener(MouseEvent.CLICK,this.studentPanelHandlerButton);
            this.panelStudent.pnl2.bback.removeEventListener(MouseEvent.CLICK,this.studentPanelHandlerButton);
         }
      }
      
      public function startDragStudentPanel(e:MouseEvent) : *
      {
         this.panelStudent.bg.removeEventListener(MouseEvent.MOUSE_DOWN,this.startDragStudentPanel);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.stopDragStudentPanel);
         this.panelStudent.startDrag();
         this.addStage(this.panelStudent);
      }
      
      public function stopDragStudentPanel(e:MouseEvent) : *
      {
         this.panelStudent.bg.addEventListener(MouseEvent.MOUSE_DOWN,this.startDragStudentPanel);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.stopDragStudentPanel);
         this.panelStudent.stopDrag();
      }
      
      public function studentPanelHandlerButton(e:MouseEvent = null) : *
      {
         var _n:Number = NaN;
         var _i:* = undefined;
         if(e.currentTarget.name == "bgo")
         {
            _n = Number(this.panelStudent.pnl1.txt.text);
            if(isNaN(_n) || this.panelStudent.pnl1.txt.text == "")
            {
               this.panelStudent.pnl1.txt.text = "";
               this.warning("Lütfen sayı girin.");
               return;
            }
            if(1000 < _n)
            {
               this.warning("Lütfen 1000 den küçük sayı girin.");
               return;
            }
            if(_n < 2)
            {
               this.warning("Lütfen 1 den büyük sayı girin.");
               return;
            }
            this._dictionary = new Array();
            this._studentSize = _n;
            this.panelStudent.pnl1.visible = false;
            this.panelStudent.pnl2.visible = true;
            this.panelStudent.pnl2.txt1.text = String(this._studentSize);
            this.panelStudent.pnl2.txt2.text = String(this._studentSize);
         }
         else if(e.currentTarget.name == "bselect")
         {
            if(this._studentSize - this.countArray(this._dictionary) == 0)
            {
               this._dictionary = new Array();
               this.panelStudent.pnl2.txt2.text = String(this._studentSize);
            }
            _i = 0;
            do
            {
               _i = this.randomNumber(1,this._studentSize);
            }
            while(this._dictionary[_i]);
            
            this._dictionary[_i] = true;
            this.panelStudent.pnl2.txt.text = _i.toString();
            this.panelStudent.pnl2.txt2.text = String(this._studentSize - this.countArray(this._dictionary));
            this.panelStudent.pnl2.ani.gotoAndPlay(2);
         }
         else if(e.currentTarget.name == "bback")
         {
            this.clearStudentPanel();
         }
      }
      
      public function clearStudentPanel(e:MouseEvent = null) : *
      {
         this._studentSize = NaN;
         this._dictionary = null;
         this.panelStudent.pnl1.visible = true;
         this.panelStudent.pnl2.visible = false;
         this.panelStudent.pnl1.txt.text = "";
         this.panelStudent.pnl2.txt.text = "0";
         this.panelStudent.pnl2.txt1.text = "";
         this.panelStudent.pnl2.txt2.text = "";
      }
      
      public function playSound(_str:String) : *
      {
      }
      
      public function openConnectionPnl(e:MouseEvent) : *
      {
         if(Network.status)
         {
            this.bagla();
         }
         else
         {
            this.warning("Ağ bağlantınıza erişim yok. Ağ bağlantızı kontrol edip tekrar deneyin.");
         }
      }
      
      public function bagla() : *
      {
         this.sidePanel.btnConnect.removeEventListener(MouseEvent.CLICK,this.openConnectionPnl);
         this._user.type = "ogrenci";
         this.pnlConnect.btn_ogretmen.nokta.gotoAndStop(1);
         this.pnlConnect.btn_ogrenci.nokta.gotoAndStop(2);
         this.pnlConnect.txtGroup.text = "";
         this.pnlConnect.txtName.text = "";
         this.addStage(this._blackBg);
         this.addStage(this.pnlConnect);
         this._blackBg.alpha = 0;
         this.pnlConnect.alpha = 0;
         this.pnlConnect.visible = true;
         TweenMax.to(this._blackBg,this._tweenTime,{"alpha":1});
         TweenMax.to(this.pnlConnect,this._tweenTime,{"alpha":1});
         this.pnlConnect.btnYes.addEventListener(MouseEvent.CLICK,this.checkConnectInfo);
         this.pnlConnect.btnNo.addEventListener(MouseEvent.CLICK,this.checkConnectInfo);
         this.pnlConnect.btn_ogretmen.addEventListener(MouseEvent.CLICK,this.userType);
         this.pnlConnect.btn_ogrenci.addEventListener(MouseEvent.CLICK,this.userType);
      }
      
      public function closeConnectionPnl() : *
      {
         TweenMax.to(this.pnlConnect,this._tweenTime,{"alpha":0});
         TweenMax.to(this._blackBg,this._tweenTime,{
            "alpha":0,
            "onComplete":function():*
            {
               pnlConnect.visible = false;
               removeStage(_blackBg);
            }
         });
         this.pnlConnect.btnYes.removeEventListener(MouseEvent.CLICK,this.checkConnectInfo);
         this.pnlConnect.btnNo.removeEventListener(MouseEvent.CLICK,this.checkConnectInfo);
         this.pnlConnect.btn_ogretmen.removeEventListener(MouseEvent.CLICK,this.userType);
         this.pnlConnect.btn_ogrenci.removeEventListener(MouseEvent.CLICK,this.userType);
      }
      
      public function openInfo(_strF:String) : *
      {
         this.addStage(this.bilgiPanel);
         this.bilgiPanel.visible = true;
         this.bilgiPanel.txt.text = _strF;
         TweenMax.killTweensOf(this.bilgiPanel);
         TweenMax.to(this.bilgiPanel,this._tweenTime,{
            "y":10,
            "onComplete":function():*
            {
               TweenMax.to(bilgiPanel,_tweenTime,{
                  "delay":1.5,
                  "y":-bilgiPanel.height,
                  "visible":false
               });
            }
         });
      }
      
      public function userType(e:MouseEvent) : *
      {
         this.pnlConnect.btn_ogretmen.nokta.gotoAndStop(1);
         this.pnlConnect.btn_ogrenci.nokta.gotoAndStop(1);
         e.currentTarget.nokta.gotoAndStop(2);
         this._user.type = e.currentTarget.name.split("_")[1];
      }
      
      public function checkConnectInfo(e:MouseEvent) : *
      {
         if(e.currentTarget.name == "btnYes")
         {
            if(this.pnlConnect.txtGroup.text != "" && this.pnlConnect.txtName.text != "")
            {
               this._user.group = this.pnlConnect.txtGroup.text;
               this._user.name = this.pnlConnect.txtName.text;
               this.closeConnectionPnl();
               this.openInfo("Bağlantı kuruluyor lütfen bekleyin...");
               this.sidePanel.btnConnect.addEventListener(MouseEvent.CLICK,this.cancelConnection);
               this.tryConnection();
            }
         }
         else
         {
            this.sidePanel.btnConnect.addEventListener(MouseEvent.CLICK,this.openConnectionPnl);
            this.closeConnectionPnl();
         }
      }
      
      public function tryConnection() : *
      {
         this._connection = new MultiUserSession(this._serverAdress,this._user.group);
         this._connection.onConnect = this.onConnected;
         this._connection.onUserAdded = this.onUserAdded;
         this._connection.onUserRemoved = this.onUserRemoved;
         this._connection.onObjectRecieve = this.onObjectReceived;
         try
         {
            this._connection.connect(this._user.name,this._user);
         }
         catch(e:Error)
         {
         }
      }
      
      public function onConnected(_userF:UserObject) : void
      {
         if(this._user.type == "ogretmen")
         {
            this.openInfo("Bağlantı başarıyla kuruldu.");
         }
         else
         {
            this.openInfo("Bağlantı başarıyla kuruldu. Bilgiler alınıyor...");
         }
         this._connectStat = true;
         this.sidePanel.btnConnect.icon.gotoAndStop(2);
         this._user.id = this._connection.myUser.id;
         this.openBtnLock();
      }
      
      public function onUserAdded(_userF:UserObject) : void
      {
         if(_userF.details.type == "ogretmen")
         {
            this.requestStat(_userF.details.id);
         }
      }
      
      public function onUserRemoved(_userF:UserObject) : void
      {
         if(_userF.details.type == "ogretmen")
         {
            this.checkLocked();
         }
      }
      
      public function lockAllUsers(e:MouseEvent = null) : *
      {
         if(!this._lockStat)
         {
            this._connectionObj = new Object();
            this._connectionObj.stat = "lockUser";
            this._connectionObj.im = this.guncelIm;
            this.addImData();
            if(this.selectItems[this.guncelIm][this._dataType])
            {
               this._connectionObj.data = this.selectItems[this.guncelIm][this._dataType];
            }
            else
            {
               this._connectionObj.data = false;
            }
            this._connection.sendObject(this.writeByte(this._connectionObj));
            this._lockStat = true;
            this._writing = true;
            this.colorize(this.panelCast.btnLockUser,this._overColor);
            this.panelCast.btnPermission.alpha = 1;
            this.panelCast.btnPermission.addEventListener(MouseEvent.CLICK,this.permissionStat);
            this.degisiklikKontrol();
         }
         else
         {
            this._lockStat = false;
            this._writing = false;
            this.stopColorize(this.panelCast.btnLockUser);
            this._connectionObj = new Object();
            this._connectionObj.stat = "unlockUser";
            this._connection.sendObject(this.writeByte(this._connectionObj));
            this._permissionStat = false;
            this.stopColorize(this.panelCast.btnPermission);
            this.panelCast.btnPermission.alpha = 0.3;
            this.panelCast.btnPermission.removeEventListener(MouseEvent.CLICK,this.permissionStat);
         }
      }
      
      public function checkLocked() : *
      {
         if(this._locked)
         {
            this.addImData();
            this.cleanScreen();
            this._locked = false;
            this._dataType = "user";
            if(this.selectItems[this.guncelIm][this._dataType])
            {
               this.writeData(this.selectItems[this.guncelIm][this._dataType]);
            }
            this.openScreen();
         }
         this._typeCheck = false;
      }
      
      public function lockScreen(_objF:Object) : *
      {
         if(this.selectItems[_objF.im]["page"] != this.guncelSayfa)
         {
            this.goToThePage(this.selectItems[_objF.im]["page"]);
         }
         else if(this.isIm && this.imMode == 0)
         {
            this.addImData();
            this.cleanScreen();
         }
         this._dataType = "head";
         if(_objF.data != false)
         {
            this.selectItems[_objF.im][this._dataType] = _objF.data;
         }
         this.selectItems[_objF.im]["im"].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
         this._locked = true;
         this.toolBar.visible = false;
         this._canvas.mouseEnabled = this._canvas.mouseChildren = false;
         this.closeMouseStat(this.footer.btnZeng);
         this.closeMouseStat(this.footer.btnBos);
         this.closeMouseStat(this.footer.tools);
         this.closeMouseStat(this.panelVector);
         this.closeMouseStat(this.preRecordPanel.btnAns);
         this.closeMouseStat(this.preRecordPanel.btnSaveAns);
         this.closeMouseStat(this.sidePanel.btnAddInput);
         this.closeMouseStat(this.footer.btnEba);
         this.closeMouseStat(this.footer.btnDO);
         this.closeMouseStat(this.footer.btnAH);
         this.closeMouseStat(this.footer.btnMeeting);
         this.closeMouseStat(this.footer.btnSolution);
         this.closeMouseStat(this.sidePanel.btnCloudAdmin);
         this.closeMouseStat(this.footer.previousIm);
         this.closeMouseStat(this.footer.nextIm);
         this.closeMouseStat(this.footer.pPage);
         this.closeMouseStat(this.footer.nPage);
         this.closeMouseStat(this.footer.pnlPageNum);
         this.closeMouseStat(this.footer.closeZoom);
         this.closeMouseStat(this.sidePanel.btnConnect);
         this.closeMouseStat(this.toolBar.btnCleanScreen);
      }
      
      public function openScreen() : *
      {
         this.toolBar.visible = true;
         this.openMouseStat(this._canvas);
         this.openMouseStat(this.footer.btnZeng);
         this.openMouseStat(this.footer.btnBos);
         this.openMouseStat(this.footer.tools);
         this.openMouseStat(this.panelVector);
         this.openMouseStat(this.preRecordPanel.btnAns);
         this.openMouseStat(this.preRecordPanel.btnSaveAns);
         this.openMouseStat(this.footer.btnEba);
         this.openMouseStat(this.footer.btnDO);
         this.openMouseStat(this.footer.btnAH);
         this.openMouseStat(this.footer.btnMeeting);
         this.openMouseStat(this.footer.btnSolution);
         this.openMouseStat(this.sidePanel.btnAddInput);
         this.openMouseStat(this.sidePanel.btnCloudAdmin);
         this.openMouseStat(this.footer.previousIm);
         this.openMouseStat(this.footer.nextIm);
         this.openMouseStat(this.footer.pPage);
         this.openMouseStat(this.footer.nPage);
         this.openMouseStat(this.footer.pnlPageNum);
         this.openMouseStat(this.footer.closeZoom);
         this.openMouseStat(this.sidePanel.btnConnect);
         this.openMouseStat(this.toolBar.pPage);
         this.openMouseStat(this.toolBar.nPage);
         this.openMouseStat(this.toolBar.btnMode);
         this.openMouseStat(this.toolBar.btnMove);
         this.openMouseStat(this.toolBar.zoomTool);
         this.openMouseStat(this.footer.pnlPageNum);
         this.openMouseStat(this.toolBar.zoomTool.btnSelect);
         this.openMouseStat(this.footer.btnList);
         this.openMouseStat(this.sidePanel.btnChronometer);
         this.openMouseStat(this.sidePanel.btnStudent);
         this.openMouseStat(this.sidePanel.btnCurtain);
         this.openMouseStat(this.sidePanel.btnRecord);
         this.openMouseStat(this.toolBar.btnCleanScreen);
      }
      
      public function sendData(_blF:Boolean) : *
      {
         if(this._connectStat && this._writing)
         {
            this._connectionObj = new Object();
            this._connectionObj.stat = "writeData";
            this._connectionObj.list = new Array();
            this._orjMcData = new Vector.<IGraphicsData>();
            this._orjMcData = this.brushAreas[this.brushLayer].graphics.readGraphicsData(true);
            for(this._int = 0; this._int < this._orjMcData.length; ++this._int)
            {
               this._empString = String(this.getClass(this._orjMcData[this._int]));
               if(this._empString == "[class GraphicsSolidFill]")
               {
                  this._num = 0;
               }
               else if(this._empString == "[class GraphicsPath]")
               {
                  this._num = 1;
               }
               else if(this._empString == "[class GraphicsEndFill]")
               {
                  this._num = 2;
               }
               else if(this._empString == "[class GraphicsStroke]")
               {
                  this._num = 3;
               }
               else if(this._empString == "[class GraphicsBitmapFill]")
               {
                  this._num = 4;
               }
               else if(this._empString == "[class GraphicsGradientFill]")
               {
                  this._num = 5;
               }
               else if(this._empString == "[class GraphicsShaderFill]")
               {
                  this._num = 6;
               }
               this._connectionObj.list[this._int] = this._num;
            }
            this._connectionObj.data = new Vector.<IGraphicsData>();
            this._connectionObj.data = this._orjMcData;
            this._connectionObj.type = _blF;
            this._connection.sendObject(this.writeByte(this._connectionObj));
         }
      }
      
      public function sendBackData() : *
      {
         if(this._connectStat && this._lockStat && !this._permissionStat && this._user.type == "ogretmen")
         {
            this._connectionObj = new Object();
            this._connectionObj.stat = "goBack";
            this._connection.sendObject(this.writeByte(this._connectionObj));
         }
      }
      
      public function sendJumpData(_strF:String) : *
      {
         if(this._connectStat && this._lockStat && !this._permissionStat && this._user.type == "ogretmen")
         {
            this._connectionObj = new Object();
            this._connectionObj.stat = "jump";
            if(_strF == "previousIm")
            {
               this._connectionObj.btn = "previous";
            }
            else
            {
               this._connectionObj.btn = "next";
            }
            if(this.selectItems[this.guncelIm][this._dataType])
            {
               this._connectionObj.data = this.selectItems[this.guncelIm][this._dataType];
            }
            else
            {
               this._connectionObj.data = false;
            }
            this._connectionObj.im = this.guncelIm;
            this._connection.sendObject(this.writeByte(this._connectionObj));
         }
      }
      
      public function sendCleanScreenData() : *
      {
         if(this._connectStat && this._lockStat && !this._permissionStat && this._user.type == "ogretmen")
         {
            this._connectionObj = new Object();
            this._connectionObj.stat = "cleanScreen";
            this._connection.sendObject(this.writeByte(this._connectionObj));
         }
      }
      
      public function sendOpenWhiteData() : *
      {
         if(this._connectStat && this._lockStat && !this._permissionStat && this._user.type == "ogretmen")
         {
            this._connectionObj = new Object();
            this._connectionObj.stat = "openWhite";
            this._connection.sendObject(this.writeByte(this._connectionObj));
         }
      }
      
      public function openBtnLock() : *
      {
         if(this.isIm && this.imMode == 0 && !this.zengIm && this._connectStat)
         {
            if(this._user.type == "ogretmen")
            {
               this.panelCast.visible = true;
               this.panelCast.btnLockUser.alpha = 1;
               this.panelCast.btnLockUser.addEventListener(MouseEvent.CLICK,this.lockAllUsers);
               this.panelCast.btnGetScreen.alpha = 1;
               this.panelCast.btnGetScreen.addEventListener(MouseEvent.CLICK,this.openUsersScreen);
            }
         }
      }
      
      public function permissionStat(e:MouseEvent = null) : *
      {
         if(!this._permissionStat)
         {
            this.colorize(this.panelCast.btnPermission,this._overColor);
            this._permissionStat = true;
            this._connectionObj = new Object();
            this._connectionObj.stat = "onPermission";
            this._connection.sendObject(this.writeByte(this._connectionObj));
            this._writing = false;
         }
         else
         {
            this._permissionStat = false;
            this.stopColorize(this.panelCast.btnPermission);
            this._writing = true;
            this._connectionObj = new Object();
            this._connectionObj.stat = "lockUser";
            this._connectionObj.im = this.guncelIm;
            this.addImData();
            if(this.selectItems[this.guncelIm][this._dataType])
            {
               this._connectionObj.data = this.selectItems[this.guncelIm][this._dataType];
            }
            else
            {
               this._connectionObj.data = false;
            }
            this._connection.sendObject(this.writeByte(this._connectionObj));
         }
      }
      
      public function onPermission() : *
      {
         this.toolBar.visible = true;
         this._canvas.mouseEnabled = this._canvas.mouseChildren = true;
         this.closeMouseStat(this.toolBar.pPage);
         this.closeMouseStat(this.toolBar.nPage);
         this.closeMouseStat(this.toolBar.btnMode);
         this.closeMouseStat(this.toolBar.btnMove);
         this.closeMouseStat(this.toolBar.zoomTool);
         this.closeMouseStat(this.footer.pnlPageNum);
         this.closeMouseStat(this.toolBar.zoomTool.btnSelect);
         this.closeMouseStat(this.footer.btnList);
         this.closeMouseStat(this.sidePanel.btnChronometer);
         this.closeMouseStat(this.sidePanel.btnStudent);
         this.closeMouseStat(this.sidePanel.btnCurtain);
         this.closeMouseStat(this.sidePanel.btnRecord);
         this.addImData();
         this.cleanScreen();
         this._permission = true;
         this._dataType = "user";
         if(this.selectItems[this.guncelIm][this._dataType])
         {
            this.writeData(this.selectItems[this.guncelIm][this._dataType]);
         }
      }
      
      public function closeUsersScreen(e:MouseEvent = null) : *
      {
         clearInterval(this._interval);
         this.mcUsers.visible = false;
         this.mcUsers.con.btnClose.removeEventListener(MouseEvent.CLICK,this.closeUsersScreen);
         this.mcUsers.con.userContent.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandlerK);
         this._users = [];
         ScrollClass.disable(this.mcUsers.con.userContent);
         ScrollClass.remove(this.mcUsers.con.userContent);
         this.mcUsers.con.bar.visible = false;
         this.mcUsers.con.thumb.visible = false;
      }
      
      public function openUsersScreen(e:MouseEvent) : *
      {
         if(this._connectStat && this._user.type == "ogretmen")
         {
            this.mcUsers.con.userContent.y = this.mcUsers.con.contentMask.y;
            this.updateUsers();
            this._interval = setInterval(this.updateUsers,10000);
            this.addStage(this.mcUsers);
            this.mcUsers.visible = true;
            this.mcUsers.con.btnClose.addEventListener(MouseEvent.CLICK,this.closeUsersScreen);
            this.mcUsers.con.userContent.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandlerK);
         }
      }
      
      public function updateUsers() : *
      {
         var key:* = null;
         this.removeItems(this.mcUsers.con.userContent);
         this._users = new Array();
         this._int = 0;
         for(key in this._connection.userArray)
         {
            this._empString = this._connection.userArray[key].id;
            if(this._user.id != this._empString)
            {
               this._users[this._empString] = new Object();
               this._users[this._empString].user = this._connection.userArray[key];
               this._users[this._empString].mc = new mcUserCon();
               this._users[this._empString].mc.name = "user_" + this._empString;
               this._users[this._empString].mc.txt.text = this._connection.userArray[key].name;
               this._users[this._empString].mc.x = 0;
               this._users[this._empString].mc.y = this._int * this._users[this._empString].mc.height;
               this.mcUsers.con.userContent.addChild(this._users[this._empString].mc);
               this._users[this._empString].mc.addEventListener(MouseEvent.CLICK,this.getScreen);
               ++this._int;
            }
         }
         ScrollClass.remove(this.mcUsers.con.userContent);
         ScrollClass.add(this.mcUsers.con.userContent,this.mcUsers.con.contentMask,this.mcUsers.con.bar,this.mcUsers.con.thumb);
         ScrollClass.enable(this.mcUsers.con.userContent);
         ScrollClass.update(this.mcUsers.con.userContent);
      }
      
      public function getScreen(e:MouseEvent) : *
      {
         if(this.clickControl())
         {
            this._connectionObj = new Object();
            this._connectionObj.stat = "giveScreen";
            this._connectionObj.senderId = this._user.id;
            this._connectionObj.targetId = e.currentTarget.name.split("_")[1];
            this._connectionObj.im = this.guncelIm;
            this._connection.sendObject(this.writeByte(this._connectionObj));
            this.closeUsersScreen();
         }
      }
      
      public function sendScreen(_strF:String, _intF:int) : *
      {
         this._connectionObj = new Object();
         this._connectionObj.stat = "takeScreen";
         this._connectionObj.senderId = this._user.id;
         this._connectionObj.targetId = _strF;
         if(!this._locked)
         {
            if(this.isIm && this.imMode == 0)
            {
               this.addImData();
            }
         }
         else if(this._permission)
         {
            this.addImData();
         }
         if(this.selectItems[_intF]["user"])
         {
            this._connectionObj.data = this.selectItems[_intF]["user"];
         }
         else
         {
            this._connectionObj.data = false;
         }
         this._connection.sendObject(this.writeByte(this._connectionObj));
      }
      
      public function showUserScreen(_byteF:ByteArray) : *
      {
         this.degisiklikKontrol();
         this.addImData();
         this.cleanScreen();
         this.writeData(_byteF);
         this._dataType = "head";
         this.panelCast.btnScreenBack.alpha = 1;
         this.panelCast.btnScreenBack.addEventListener(MouseEvent.CLICK,this.returnScreen);
         if(this._lockStat && !this._permissionStat)
         {
            this._connectionObj = new Object();
            this._connectionObj.stat = "lockUser";
            this._connectionObj.im = this.guncelIm;
            this.addImData();
            if(this.selectItems[this.guncelIm][this._dataType])
            {
               this._connectionObj.data = this.selectItems[this.guncelIm][this._dataType];
            }
            else
            {
               this._connectionObj.data = false;
            }
            this._connection.sendObject(this.writeByte(this._connectionObj));
         }
      }
      
      public function returnScreen(e:MouseEvent = null) : *
      {
         if(this.panelCast.btnScreenBack.alpha == 1)
         {
            this.degisiklikKontrol();
            this.panelCast.btnScreenBack.alpha = 0.3;
            this.panelCast.btnScreenBack.removeEventListener(MouseEvent.CLICK,this.returnScreen);
            this._dataType = "user";
            if(e != null && this._lockStat && !this._permissionStat)
            {
               this.cleanScreen();
               this._connectionObj = new Object();
               this._connectionObj.stat = "lockUser";
               this._connectionObj.im = this.guncelIm;
               if(this.selectItems[this.guncelIm][this._dataType])
               {
                  this._connectionObj.data = this.selectItems[this.guncelIm][this._dataType];
                  this.writeData(this.selectItems[this.guncelIm][this._dataType]);
               }
               else
               {
                  this._connectionObj.data = false;
               }
               this._connection.sendObject(this.writeByte(this._connectionObj));
            }
            else if(e != null)
            {
               this.cleanScreen();
               if(this.selectItems[this.guncelIm][this._dataType])
               {
                  this.writeData(this.selectItems[this.guncelIm][this._dataType]);
               }
            }
         }
      }
      
      public function closeBtnLock() : *
      {
         this.panelCast.visible = false;
         this.stopColorize(this.panelCast.btnLockUser);
         this.panelCast.btnLockUser.alpha = 0.3;
         this.panelCast.btnLockUser.removeEventListener(MouseEvent.CLICK,this.lockAllUsers);
         this.panelCast.btnGetScreen.alpha = 0.3;
         this.panelCast.btnGetScreen.removeEventListener(MouseEvent.CLICK,this.openUsersScreen);
         this.closeUsersScreen();
         this._dataType = "user";
         if(this._lockStat)
         {
            this.lockAllUsers();
         }
      }
      
      public function requestStat(_strF:String) : *
      {
         if(!this._typeCheck)
         {
            this._typeCheck = true;
            this._statusStr = _strF;
            this.sendStatusConfirm();
            this._statusInterval = setInterval(this.sendStatusConfirm,1000);
         }
      }
      
      public function sendStatusConfirm() : *
      {
         this._connectionObj = new Object();
         this._connectionObj.stat = "statusCheck";
         this._connectionObj.targetId = this._statusStr;
         this._connectionObj.senderId = this._user.id;
         this._connection.sendObject(this.writeByte(this._connectionObj));
      }
      
      public function statusCheck(_objF:Object) : *
      {
         this._connectionObj = new Object();
         this._connectionObj.stat = "statusConfirm";
         this._connectionObj.targetId = _objF.senderId;
         this._connectionObj.senderId = this._user.id;
         this._connectionObj.im = this.guncelIm;
         this.addImData();
         if(this._lockStat)
         {
            this._connectionObj.permissionStat = this._permissionStat;
            if(this.selectItems[this.guncelIm][this._dataType])
            {
               this._connectionObj.data = this.selectItems[this.guncelIm][this._dataType];
            }
            else
            {
               this._connectionObj.data = false;
            }
         }
         else
         {
            this._connectionObj.lockStat = false;
         }
         this._connection.sendObject(this.writeByte(this._connectionObj));
      }
      
      public function statusConfirm(_objF:Object) : *
      {
         clearInterval(this._statusInterval);
         if(_objF.lockStat != false)
         {
            if(_objF.permissionStat)
            {
               if(this.selectItems[_objF.im]["page"] != this.guncelSayfa)
               {
                  this.goToThePage(this.selectItems[_objF.im]["page"]);
               }
               else if(this.isIm && this.imMode == 0)
               {
                  this.addImData();
                  this.cleanScreen();
               }
               this.selectItems[_objF.im]["im"].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
               this.onPermission();
               this.closeMouseStat(this.footer.btnZeng);
               this.closeMouseStat(this.footer.btnBos);
               this.closeMouseStat(this.footer.tools);
               this.closeMouseStat(this.panelVector);
               this.closeMouseStat(this.preRecordPanel.btnSaveAns);
               this.closeMouseStat(this.sidePanel.btnAddInput);
               this.closeMouseStat(this.footer.btnEba);
               this.closeMouseStat(this.footer.btnDO);
               this.closeMouseStat(this.footer.btnAH);
               this.closeMouseStat(this.footer.btnMeeting);
               this.closeMouseStat(this.footer.btnSolution);
               this.closeMouseStat(this.sidePanel.btnCloudAdmin);
               this.closeMouseStat(this.preRecordPanel.btnAns);
               this.closeMouseStat(this.footer.previousIm);
               this.closeMouseStat(this.footer.nextIm);
               this.closeMouseStat(this.footer.pPage);
               this.closeMouseStat(this.footer.nPage);
               this.closeMouseStat(this.footer.pnlPageNum);
               this.closeMouseStat(this.footer.closeZoom);
               this.closeMouseStat(this.sidePanel.btnConnect);
               this.closeMouseStat(this.toolBar.btnCleanScreen);
            }
            else
            {
               this.lockScreen(_objF);
            }
         }
      }
      
      public function cancelConnection(e:MouseEvent = null) : *
      {
         this.sidePanel.btnConnect.removeEventListener(MouseEvent.CLICK,this.cancelConnection);
         this.sidePanel.btnConnect.addEventListener(MouseEvent.CLICK,this.openConnectionPnl);
         this.sidePanel.btnConnect.icon.gotoAndStop(1);
         this.openInfo("Bağlantı kapatıldı.");
         this.closeBtnLock();
         this.checkLocked();
         if(this._connectStat)
         {
            this._connection.close();
         }
         this._connection = null;
         this._connectStat = false;
         this._lockStat = false;
      }
      
      public function onObjectReceived(_peerID:String, _byteF:ByteArray) : void
      {
         this._connectionObj = new Object();
         this._connectionObj = _byteF.readObject() as Object;
         switch(this._connectionObj.stat)
         {
            case "lockUser":
               this.lockScreen(this._connectionObj);
               break;
            case "unlockUser":
               this.checkLocked();
               break;
            case "writeData":
               this.createQueAns(this._connectionObj.list,this._connectionObj.data,this._connectionObj.type);
               break;
            case "onPermission":
               this.onPermission();
               break;
            case "goBack":
               this.toolBar.btnBack.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
               break;
            case "jump":
               if(!this.selectItems[this._connectionObj.im][this._dataType])
               {
                  this.selectItems[this._connectionObj.im][this._dataType] = new ByteArray();
               }
               this.selectItems[this._connectionObj.im][this._dataType] = this._connectionObj.data;
               if(this._connectionObj.btn == "previous")
               {
                  this.footer.previousIm.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
               }
               else
               {
                  this.footer.nextIm.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
               }
               break;
            case "giveScreen":
               if(this._connectionObj.targetId == this._user.id)
               {
                  this.sendScreen(this._connectionObj.senderId,this._connectionObj.im);
               }
               break;
            case "takeScreen":
               if(this._connectionObj.targetId == this._user.id)
               {
                  if(!this._connectionObj.data)
                  {
                     this.warning("Kullanıcı bölge üzerinde hiç işlem yapmamıştır.");
                  }
                  else
                  {
                     this.showUserScreen(this._connectionObj.data);
                  }
               }
               break;
            case "statusCheck":
               if(this._connectionObj.targetId == this._user.id)
               {
                  this.statusCheck(this._connectionObj);
               }
               break;
            case "statusConfirm":
               if(this._connectionObj.targetId == this._user.id)
               {
                  this.statusConfirm(this._connectionObj);
               }
               break;
            case "cleanScreen":
               this.toolBar.btnCleanScreen.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
               break;
            case "openWhite":
               this.footer.btnBos.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
         }
      }
      
      public function closeMouseStat(_mcF:MovieClip) : *
      {
         _mcF.mouseEnabled = _mcF.mouseChildren = false;
         _mcF.alpha = 0.6;
      }
      
      public function openMouseStat(_mcF:MovieClip) : *
      {
         _mcF.mouseEnabled = _mcF.mouseChildren = true;
         _mcF.alpha = 1;
      }
      
      public function writeByte(_objF:Object) : *
      {
         this._bytes = new ByteArray();
         this._bytes.writeObject(_objF);
         this._bytes.position = 0;
         return this._bytes;
      }
      
      public function writeData(_byteF:ByteArray) : *
      {
         this._empArray = _byteF.readObject() as Array;
         for(this._int = 0; this._int < this._empArray[0].length; ++this._int)
         {
            this._empBoolean = false;
            if(this._empArray[2][this._int])
            {
               this._empBoolean = true;
            }
            this.createQueAns(this._empArray[0][this._int],this._empArray[1][this._int],this._empBoolean);
         }
      }
      
      public function openSnm(e:MouseEvent) : *
      {
      }
      
      public function windowFocus() : *
      {
      }
      
      public function openSnmTxt() : *
      {
         this.mcSnm.visible = true;
         this.addStage(this.mcSnm);
         TweenMax.delayedCall(4,this.closeSnmTxt);
      }
      
      public function closeSnmTxt() : *
      {
         this.mcSnm.visible = false;
      }
      
      public function checkBanner() : *
      {
         var _urlRequest:URLRequest = null;
         var _urlVariable:URLVariables = null;
         var _json:* = undefined;
         _urlRequest = new URLRequest(this._publisherApi);
         _urlVariable = new URLVariables();
         _urlVariable.action = "check_banner";
         _urlRequest.data = _urlVariable;
         _urlRequest.method = URLRequestMethod.POST;
         _json = new KryJSON(_urlRequest,true);
         _json.onComplete = function(e:*):*
         {
            if(e.status)
            {
               _bannerData = e;
               _bannerLoader = new ImageLoader(_bannerData.image_url,{"onComplete":bannerCompleteHandler});
               _bannerLoader.load();
            }
         };
         _json.start();
      }
      
      public function bannerCompleteHandler(e:LoaderEvent) : *
      {
         var _mc:MovieClip = null;
         var _scale:Number = NaN;
         var _margin:Number = NaN;
         _mc = new MovieClip();
         _mc.addChild(this._bannerLoader.rawContent);
         this._bannerMc = new MovieClip();
         this._bannerMc.addChild(_mc);
         _scale = 1;
         _margin = 10;
         _scale = Math.min(this._capX / 3 / this._bannerLoader.rawContent.width,this._capY / 3 / this._bannerLoader.rawContent.height);
         this._bannerLoader.rawContent.scaleX = this._bannerLoader.rawContent.scaleY = _scale;
         if(this._bannerData.position_vertical == "top")
         {
            this._bannerMc.y = _margin;
         }
         else if(this._bannerData.position_vertical == "center")
         {
            this._bannerMc.y = (this._capY - this._bannerLoader.rawContent.height) / 2;
         }
         else if(this._bannerData.position_vertical == "bottom")
         {
            this._bannerMc.y = this._capY - this._bannerLoader.rawContent.height - _margin - 35;
         }
         if(this._bannerData.position_horizontal == "left")
         {
            this._bannerMc.x = _margin;
         }
         else if(this._bannerData.position_horizontal == "center")
         {
            this._bannerMc.x = (this._capX - this._bannerLoader.rawContent.width) / 2;
         }
         else if(this._bannerData.position_horizontal == "right")
         {
            this._bannerMc.x = this._capX - this._bannerLoader.rawContent.width - _margin;
         }
         this.addStage(this._bannerMc);
         if(this._bannerData.close)
         {
            this._bannerCloser = new libClose();
            this._bannerCloser.width = this._bannerCloser.height = 25;
            this._bannerCloser.x = this._bannerLoader.rawContent.width - this._bannerCloser.width - 5;
            this._bannerCloser.y = 5;
            this._bannerMc.addChild(this._bannerCloser);
            this._bannerCloser.addEventListener(MouseEvent.CLICK,this.closeBanner);
            this.setGlow(this._bannerCloser);
         }
         if(this._bannerData.time != -1)
         {
            TweenMax.delayedCall(this._bannerData.time,this.closeBanner);
         }
         stage.addEventListener(Event.ENTER_FRAME,this.keepBanner);
         _mc.addEventListener(MouseEvent.CLICK,this.goToBanner);
         this.setGlow(this._bannerMc);
      }
      
      public function goToBanner(e:MouseEvent) : *
      {
         var _urlRequest:URLRequest = null;
         var _urlVariable:URLVariables = null;
         var _json:* = undefined;
         if(!this._bannerData.banner_url)
         {
            return;
         }
         navigateToURL(new URLRequest(this._bannerData.banner_url));
         _urlRequest = new URLRequest(this._publisherApi);
         _urlVariable = new URLVariables();
         _urlVariable.action = "log_banner";
         _urlVariable.id = this._bannerData.id;
         _urlRequest.data = _urlVariable;
         _urlRequest.method = URLRequestMethod.POST;
         _json = new KryJSON(_urlRequest,true);
         _json.start();
      }
      
      public function keepBanner(e:Event) : *
      {
         this.addStage(this._bannerMc);
      }
      
      public function closeBanner(e:MouseEvent = null) : *
      {
         stage.removeEventListener(Event.ENTER_FRAME,this.keepBanner);
         TweenMax.killDelayedCallsTo(this.closeBanner);
         if(this._bannerMc)
         {
            this.removeStage(this._bannerMc);
         }
         this._bannerMc = null;
         this._bannerCloser = null;
         if(this._bannerLoader)
         {
            this._bannerLoader.dispose(true);
            this._bannerLoader = null;
         }
         this._bannerData = null;
      }
      
      public function addKeyboardEvents() : *
      {
         this.pnlKey.con.mcSerial.txtKey.needsSoftKeyboard = false;
         this.searchPanel.word.needsSoftKeyboard = false;
         this.linkPanel.linkTxt.needsSoftKeyboard = false;
         this.pnlConnect.txtGroup.needsSoftKeyboard = false;
         this.pnlConnect.txtName.needsSoftKeyboard = false;
         this.panelStudent.pnl1.txt.needsSoftKeyboard = false;
         this.mcEbaPanel.mcSearchHeader.txt.needsSoftKeyboard = false;
         this.panelConfirmation.con.pnl1.txt.needsSoftKeyboard = false;
         this.panelConfirmation.con.pnl2.txt.needsSoftKeyboard = false;
         this.panelVideoSolution.psearch.txt.needsSoftKeyboard = false;
         this.panelMeetingAdd.con.txtName.needsSoftKeyboard = false;
         this.panelAhSave.con.txtName.needsSoftKeyboard = false;
         this.panelAhSave.con.txtInfo.needsSoftKeyboard = false;
         this.panelVideoSolution.psearch.txt.addEventListener(FocusEvent.FOCUS_IN,this.tfFocusIn);
         this.panelConfirmation.con.pnl1.txt.addEventListener(FocusEvent.FOCUS_IN,this.tfFocusIn);
         this.panelConfirmation.con.pnl2.txt.addEventListener(FocusEvent.FOCUS_IN,this.tfFocusIn);
         this.pnlKey.con.mcSerial.txtKey.addEventListener(FocusEvent.FOCUS_IN,this.tfFocusIn);
         this.searchPanel.word.addEventListener(FocusEvent.FOCUS_IN,this.tfFocusIn);
         this.linkPanel.linkTxt.addEventListener(FocusEvent.FOCUS_IN,this.tfFocusIn);
         this.pnlConnect.txtGroup.addEventListener(FocusEvent.FOCUS_IN,this.tfFocusIn);
         this.pnlConnect.txtName.addEventListener(FocusEvent.FOCUS_IN,this.tfFocusIn);
         this.panelStudent.pnl1.txt.addEventListener(FocusEvent.FOCUS_IN,this.tfFocusIn);
         this.mcEbaPanel.mcSearchHeader.txt.addEventListener(FocusEvent.FOCUS_IN,this.tfFocusIn);
         this.panelMeetingAdd.con.txtName.addEventListener(FocusEvent.FOCUS_IN,this.tfFocusIn);
         this.panelAhSave.con.txtName.addEventListener(FocusEvent.FOCUS_IN,this.tfFocusIn);
         this.panelAhSave.con.txtInfo.addEventListener(FocusEvent.FOCUS_IN,this.tfFocusIn);
      }
      
      public function tfFocusIn(e:FocusEvent) : void
      {
         var _p:Point = null;
         if(this._mainTF == TextField(e.currentTarget))
         {
            return;
         }
         this.clearKeyboardManuel();
         this._mainTF = TextField(e.currentTarget);
         this._mainKeyboard = new KryKeyboard(this._mainTF);
         this._keyboardContainer = new libMainKBCon();
         this._mainKeyboard.scaleY = this._mainKeyboard.scaleX = this._keyboardContainer.mcHeader.width / this._mainKeyboard.width;
         this._mainKeyboard.y = this._keyboardContainer.mcHeader.height;
         this.setGlow(this._keyboardContainer);
         this._keyboardContainer.addChild(this._mainKeyboard);
         this.addStage(this._keyboardContainer);
         this._keyboardContainer.mcHeader.addEventListener(MouseEvent.MOUSE_DOWN,this.startDragMainKeyboard);
         _p = this._mainTF.parent.localToGlobal(new Point(this._mainTF.x,this._mainTF.y));
         this._keyboardContainer.x = (this._mainTF.width - this._keyboardContainer.width) / 2 + _p.x;
         this._keyboardContainer.y = _p.y + 50;
         if(this._capY - this._keyboardContainer.height < this._keyboardContainer.y)
         {
            this._keyboardContainer.y = _p.y - this._keyboardContainer.height - this._mainTF.height;
         }
         if(this._keyboardContainer.x < 0)
         {
            this._keyboardContainer.x = 0;
         }
         if(this._capX - this._keyboardContainer.width < this._keyboardContainer.x)
         {
            this._keyboardContainer.x = this._capX - this._keyboardContainer.width;
         }
         stage.addEventListener(MouseEvent.MOUSE_DOWN,this.clearKeyboard);
         stage.addEventListener(Event.ENTER_FRAME,this.checkKBIndex);
         this._keyboardContainer.btnClose.addEventListener(MouseEvent.CLICK,this.clearKeyboardManuel);
      }
      
      public function clearKeyboard(e:MouseEvent = null) : void
      {
         if(!this._mainTF)
         {
            return;
         }
         if(!this._keyboardContainer)
         {
            return;
         }
         if(!this._mainTF.hitTestPoint(stage.mouseX,stage.mouseY) && !this._keyboardContainer.hitTestPoint(stage.mouseX,stage.mouseY))
         {
            this.clearKeyboardManuel();
         }
      }
      
      public function clearKeyboardManuel(e:MouseEvent = null) : void
      {
         if(this._keyboardContainer)
         {
            this._keyboardContainer.mcHeader.addEventListener(MouseEvent.MOUSE_DOWN,this.startDragMainKeyboard);
            this._keyboardContainer.btnClose.removeEventListener(MouseEvent.CLICK,this.clearKeyboardManuel);
            this.removeStage(this._keyboardContainer);
            this._keyboardContainer = null;
         }
         if(this._mainKeyboard)
         {
            this._mainKeyboard.disposeAll();
            this._mainKeyboard = null;
         }
         this._mainTF = null;
         stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.clearKeyboard);
         stage.removeEventListener(Event.ENTER_FRAME,this.checkKBIndex);
      }
      
      public function checkKBIndex(e:Event = null) : *
      {
         if(stage.getChildIndex(this._keyboardContainer) < stage.numChildren - 1)
         {
            if(this._keyboardContainer)
            {
               this.addStage(this._keyboardContainer);
            }
         }
      }
      
      public function startDragMainKeyboard(e:MouseEvent) : *
      {
         this._keyboardContainer.mcHeader.removeEventListener(MouseEvent.MOUSE_DOWN,this.startDragMainKeyboard);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.stopDragMainKeyboard);
         this._keyboardContainer.startDrag();
      }
      
      public function stopDragMainKeyboard(e:MouseEvent) : *
      {
         this._keyboardContainer.mcHeader.addEventListener(MouseEvent.MOUSE_DOWN,this.startDragMainKeyboard);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.stopDragMainKeyboard);
         this._keyboardContainer.stopDrag();
      }
      
      public function showChronometer(e:MouseEvent) : *
      {
         if(this.panelChronometer.visible)
         {
            this.hideChronometer();
         }
         else
         {
            this.panelChronometer.sandWatch.gotoAndStop(1);
            this.panelChronometer.panelType.visible = true;
            this.panelChronometer.timeOver.visible = false;
            this.panelChronometer.first.visible = false;
            this.panelChronometer.second.visible = false;
            this.panelChronometer.second.bar.scaleX = 0;
            this.panelChronometer.second.bstatus.gotoAndStop(1);
            this.stageAlignCenter(this.panelChronometer);
            this.addStage(this.panelChronometer);
            this.panelChronometer.visible = true;
            this.panelChronometer.bg.addEventListener(MouseEvent.MOUSE_DOWN,this.startDragChro);
            this.panelChronometer.close.addEventListener(MouseEvent.MOUSE_DOWN,this.hideChronometer);
            this.panelChronometer.first.start.addEventListener(MouseEvent.CLICK,this.startCount);
            this.panelChronometer.first.type.addEventListener(MouseEvent.CLICK,this.openTypeChro);
            this.panelChronometer.first.up.addEventListener(MouseEvent.CLICK,this.totalTimeFunc);
            this.panelChronometer.first.down.addEventListener(MouseEvent.CLICK,this.totalTimeFunc);
            this.panelChronometer.first.up2.addEventListener(MouseEvent.CLICK,this.totalTimeFunc);
            this.panelChronometer.first.down2.addEventListener(MouseEvent.CLICK,this.totalTimeFunc);
            this.panelChronometer.panelType.up.addEventListener(MouseEvent.CLICK,this.changeChroType);
            this.panelChronometer.panelType.down.addEventListener(MouseEvent.CLICK,this.changeChroType);
            this.colorize(this.sidePanel.btnChronometer,this._overColor);
         }
      }
      
      public function hideChronometer(e:MouseEvent = null) : *
      {
         this.panelChronometer.sandWatch.gotoAndStop(1);
         this.removeStage(this.panelChronometer);
         this.panelChronometer.panelType.visible = false;
         this.panelChronometer.first.visible = false;
         this.panelChronometer.second.visible = false;
         this.panelChronometer.visible = false;
         this.panelChronometer.bg.removeEventListener(MouseEvent.MOUSE_DOWN,this.startDragChro);
         this.panelChronometer.close.removeEventListener(MouseEvent.MOUSE_DOWN,this.hideChronometer);
         this.panelChronometer.first.start.removeEventListener(MouseEvent.CLICK,this.startCount);
         this.panelChronometer.first.type.removeEventListener(MouseEvent.CLICK,this.openTypeChro);
         this.panelChronometer.first.up.removeEventListener(MouseEvent.CLICK,this.totalTimeFunc);
         this.panelChronometer.first.down.removeEventListener(MouseEvent.CLICK,this.totalTimeFunc);
         this.panelChronometer.first.up2.removeEventListener(MouseEvent.CLICK,this.totalTimeFunc);
         this.panelChronometer.first.down2.removeEventListener(MouseEvent.CLICK,this.totalTimeFunc);
         this.panelChronometer.second.bstatus.addEventListener(MouseEvent.CLICK,this.timerStatus);
         this.panelChronometer.second.bstop.addEventListener(MouseEvent.CLICK,this.timerStatus);
         this._chroTotalTime = 60;
         this.refreshTotalTime();
         if(this._kryTimerChronometer)
         {
            this._kryTimerChronometer.stop();
            this._kryTimerChronometer = null;
         }
         this.stopColorize(this.sidePanel.btnChronometer);
      }
      
      public function startDragChro(e:MouseEvent) : *
      {
         this.panelChronometer.bg.removeEventListener(MouseEvent.MOUSE_DOWN,this.startDragChro);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.stopDragChro);
         this.panelChronometer.startDrag();
         this.addStage(this.panelChronometer);
      }
      
      public function stopDragChro(e:MouseEvent) : *
      {
         this.panelChronometer.bg.addEventListener(MouseEvent.MOUSE_DOWN,this.startDragChro);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.stopDragChro);
         this.panelChronometer.stopDrag();
      }
      
      public function openTypeChro(e:MouseEvent = null) : void
      {
         this.panelChronometer.panelType.visible = true;
         this.panelChronometer.first.visible = false;
      }
      
      public function changeChroType(e:MouseEvent = null) : void
      {
         this._chroType = e.currentTarget.name;
         this.panelChronometer.panelType.visible = false;
         this.panelChronometer.first.visible = true;
      }
      
      public function totalTimeFunc(e:MouseEvent = null) : void
      {
         if(e.currentTarget.name == "up")
         {
            this._chroTotalTime += 60;
         }
         else if(e.currentTarget.name == "down")
         {
            if(this._chroTotalTime > 60)
            {
               this._chroTotalTime -= 60;
            }
            if(this._chroTotalTime < 5)
            {
               this._chroTotalTime = 5;
            }
         }
         if(e.currentTarget.name == "up2")
         {
            ++this._chroTotalTime;
         }
         else if(e.currentTarget.name == "down2")
         {
            if(this._chroTotalTime != 5)
            {
               --this._chroTotalTime;
            }
         }
         this.refreshTotalTime();
      }
      
      public function startCount(e:MouseEvent = null) : void
      {
         this.panelChronometer.first.visible = false;
         this.panelChronometer.second.visible = true;
         this.panelChronometer.sandWatch.gotoAndPlay(2);
         this._kryTimerChronometer = new KryTimer();
         this._kryTimerChronometer.onTime = function():*
         {
            if(_chroType == "up")
            {
               panelChronometer.second.txt.text = _kryTimerChronometer.timeString(_kryTimerChronometer.time) + " / " + getTimeString();
            }
            else
            {
               panelChronometer.second.txt.text = _kryTimerChronometer.timeString(_chroTotalTime - _kryTimerChronometer.time) + " / " + getTimeString();
            }
            panelChronometer.second.bar.scaleX = _kryTimerChronometer.time / _chroTotalTime;
            if(_chroTotalTime < _kryTimerChronometer.time)
            {
               panelChronometer.second.bstop.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
               panelChronometer.timeOver.visible = true;
               TweenMax.to(panelChronometer.timeOver,2,{"visible":false});
            }
         };
         this._kryTimerChronometer.reset();
         this._kryTimerChronometer.start();
         this.panelChronometer.second.bstatus.addEventListener(MouseEvent.CLICK,this.timerStatus);
         this.panelChronometer.second.bstop.addEventListener(MouseEvent.CLICK,this.timerStatus);
      }
      
      public function timerStatus(e:MouseEvent = null) : void
      {
         if(e.currentTarget.name == "bstatus")
         {
            if(this.panelChronometer.second.bstatus.currentFrame == 1)
            {
               this.panelChronometer.second.bstatus.gotoAndStop(2);
               this._kryTimerChronometer.stop();
            }
            else
            {
               this.panelChronometer.second.bstatus.gotoAndStop(1);
               this._kryTimerChronometer.start();
            }
         }
         else
         {
            if(this._kryTimerChronometer)
            {
               this._kryTimerChronometer.stop();
               this._kryTimerChronometer = null;
            }
            this.panelChronometer.panelType.visible = true;
            this.panelChronometer.sandWatch.gotoAndStop(1);
            this.panelChronometer.first.visible = false;
            this.panelChronometer.second.visible = false;
            this.panelChronometer.second.bstatus.removeEventListener(MouseEvent.CLICK,this.timerStatus);
            this.panelChronometer.second.bstop.removeEventListener(MouseEvent.CLICK,this.timerStatus);
            this.panelChronometer.second.bar.scaleX = 0;
            this.panelChronometer.second.bstatus.gotoAndStop(1);
         }
      }
      
      public function refreshTotalTime() : void
      {
         this.panelChronometer.first.txt.text = this.getTimeString();
      }
      
      public function getTimeString() : *
      {
         var minutes:* = undefined;
         var seconds:* = undefined;
         minutes = Math.floor(this._chroTotalTime / 60);
         seconds = this._chroTotalTime % 60;
         return this.formatTime(minutes) + ":" + this.formatTime(seconds);
      }
      
      public function formatTime(n:*) : *
      {
         if(n < 10)
         {
            return "0" + n;
         }
         return n.toString();
      }
      
      public function checkSavedTextfields() : void
      {
         KXKDatabase.getTextfields(function(_d:*):*
         {
            var _o:Object = null;
            if(_d)
            {
               _arrayTF = JSON.parse(_d[0].data) as Array;
               for each(_o in _arrayTF)
               {
                  _o.tf = createTF(_o.size,_o.color,false);
                  _o.tf.cacheAsBitmap = true;
                  _o.tf.x = _o.x;
                  _o.tf.y = _o.y;
                  _o.tf.text = _o.text;
                  delete _o.x;
                  delete _o.y;
                  delete _o.text;
                  delete _o.size;
                  delete _o.color;
                  if(_o.im)
                  {
                     if(isIm && imMode == 0 && _o.page == guncelSayfa && _o.im == guncelIm)
                     {
                        _inputLayer.addChild(_o.tf);
                     }
                  }
                  else if(_o.page == guncelSayfa)
                  {
                     _inputLayer.addChild(_o.tf);
                  }
               }
            }
         });
      }
      
      public function addInputToBook(e:MouseEvent = null) : void
      {
         if(this._vectorVideo.status)
         {
            this.warning("Ders kaydı sırasında metin ekleyemezsiniz.");
            return;
         }
         if(!this.zenbB && !this._lockStat)
         {
            if(this._spriteTF == null)
            {
               this._spriteTF = new Sprite();
               this._spriteTF.graphics.beginFill(0,0.5);
               this._spriteTF.graphics.drawRect(0,0,this._capX,this._capY);
               this._spriteTF.graphics.endFill();
               this._infoBar = new libInfoBar();
               this._infoBar.x = (this._capX - this._infoBar.width) / 2;
               this._infoBar.y = 10;
               this._infoBar.txt.text = "Metin eklemek veya varolan metni düzenlemek için kitap üzerine tıklayın.";
               this._canvasIndex = stage.getChildIndex(this._canvas);
               this._footerIndex = stage.getChildIndex(this.footer);
               this.addStage(this._spriteTF);
               this.addStage(this._canvas);
               this.addStage(this._infoBar);
               this.addStage(this.footer);
               this.toolBar.visible = false;
               this._trsStat = this.trs.enabled;
               this.trs.enabled = false;
               this.itemMc.mouseChildren = false;
               this._canvas.mouseChildren = false;
               this._canvas.mouseEnabled = false;
               this.footer.mouseChildren = false;
               this.footer.mouseEnabled = false;
               this.objectTint(this.footer,0);
               stage.addEventListener(MouseEvent.MOUSE_UP,this.addTf);
               this._infoBar.btnClose.addEventListener(MouseEvent.CLICK,this.cancelTF);
               this._inputTextStatus = true;
            }
         }
      }
      
      public function cancelTF(e:MouseEvent = null) : void
      {
         this._inputTextStatus = false;
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.addTf);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.dropTF);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.dropTF);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.moveTFAndTool);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.stopDragKeyboard);
         this._tfStatus = false;
         this.toolBar.visible = true;
         this.itemMc.mouseChildren = true;
         this._canvas.mouseChildren = true;
         this._canvas.mouseEnabled = true;
         this.footer.mouseChildren = true;
         this.footer.mouseEnabled = true;
         this.stopColorize(this.footer);
         this.trs.enabled = this._trsStat;
         if(this._spriteTF)
         {
            this.removeStage(this._spriteTF);
            this._spriteTF = null;
         }
         if(this._infoBar)
         {
            this.removeStage(this._infoBar);
            this._infoBar = null;
         }
         if(this._tempTF)
         {
            if(this._inputLayer.contains(this._tempTF))
            {
               this._inputLayer.removeChild(this._tempTF);
            }
            this._tempTF = null;
         }
         if(this._inputTool)
         {
            this.removeStage(this._inputTool);
            this._inputTool = null;
         }
         if(this._kbCon)
         {
            this.removeStage(this._kbCon);
            this._kbCon = null;
         }
         this._keyboard = null;
         stage.setChildIndex(this._canvas,this._canvasIndex);
         stage.setChildIndex(this.footer,this._footerIndex);
      }
      
      public function addTf(e:MouseEvent) : void
      {
         var _key:* = null;
         var _point:Point = null;
         var _bound:Rectangle = null;
         var _lpoint:Point = null;
         var _pg:Point = null;
         for(_key in this._arrayTF)
         {
            if(this._arrayTF[_key].page == this.guncelSayfa)
            {
               _bound = this._arrayTF[_key].tf.getBounds(this._inputLayer);
               _lpoint = this._inputLayer.globalToLocal(new Point(stage.mouseX,stage.mouseY));
               if(_bound.x < _lpoint.x && _lpoint.x < _bound.x + _bound.width && _bound.y < _lpoint.y && _lpoint.y < _bound.y + _bound.height)
               {
                  stage.removeEventListener(MouseEvent.MOUSE_UP,this.addTf);
                  this._tfStatus = true;
                  this._inputLayer.removeChild(this._arrayTF[_key].tf);
                  this._tempTF = this._arrayTF[_key].tf;
                  this._tempTF.border = true;
                  stage.focus = this._tempTF;
                  this._inputTool = new libInputTool();
                  this._inputTool.x = this._tempTF.x * this._canvas.scaleX + this._canvas.x;
                  this._inputTool.y = this._tempTF.y * this._canvas.scaleX - this._inputTool.height - 10 + this._canvas.y;
                  this._inputLayer.addChild(this._tempTF);
                  this.addStage(this._inputTool);
                  if(this._kbCon == null)
                  {
                     this._kbCon = new libKeyboardCon();
                     if(this._keyboard == null)
                     {
                        this._keyboard = new KryKeyboard(this._tempTF);
                        this._keyboard.y = this._kbCon.mcHeader.height;
                        this._keyboard.scaleY = this._keyboard.scaleX = this._kbCon.mcHeader.width / this._keyboard.width;
                        this._kbCon.addChild(this._keyboard);
                     }
                     this.setGlow(this._kbCon);
                     _pg = this._inputLayer.localToGlobal(new Point(this._tempTF.x,this._tempTF.y));
                     this._kbCon.x = _pg.x;
                     this._kbCon.y = _pg.y + 10 + this._tempTF.height * this._canvas.scaleX;
                     if(this._capY - this._kbCon.height / 3 < this._kbCon.y)
                     {
                        this._kbCon.y = this._inputTool.y - this._kbCon.height - 10;
                     }
                     this.addStage(this._kbCon);
                     this._kbCon.mcHeader.addEventListener(MouseEvent.MOUSE_DOWN,this.startDragKeyboard);
                     this._kbCon.btnColor.addEventListener(MouseEvent.CLICK,this.changeTFColor);
                     this._kbCon.btnSize.addEventListener(MouseEvent.CLICK,this.changeTFSize);
                  }
                  this._inputTool.btnDrag.addEventListener(MouseEvent.MOUSE_DOWN,this.dragTF);
                  this._inputTool.btnCancel.addEventListener(MouseEvent.CLICK,this.deleteTF);
                  this._inputTool.btnSave.addEventListener(MouseEvent.CLICK,this.saveTF);
                  this._arrayTF.splice(int(_key),1);
                  return;
               }
            }
         }
         _point = new Point(stage.mouseX,stage.mouseY);
         if(_point.y < 25)
         {
            _point.y = 25;
         }
         if(this._canvas.x < _point.x && _point.x < this._canvas.x + this._canvas.width && this._canvas.y < _point.y && _point.y < this._canvas.y + this._canvas.height && !this._tfStatus)
         {
            _point.x -= this._canvas.x;
            _point.y -= this._canvas.y;
            _point.x /= this._canvas.scaleX;
            _point.y /= this._canvas.scaleX;
            stage.removeEventListener(MouseEvent.MOUSE_UP,this.addTf);
            this._tfStatus = true;
            this._tempTF = this.createTF();
            this._tempTF.x = _point.x;
            this._tempTF.y = _point.y;
            this._inputTool = new libInputTool();
            this._inputTool.x = this._tempTF.x * this._canvas.scaleX + this._canvas.x;
            this._inputTool.y = this._tempTF.y * this._canvas.scaleX - this._inputTool.height - 10 + this._canvas.y;
            this._inputLayer.addChild(this._tempTF);
            this.addStage(this._inputTool);
            if(this._kbCon == null)
            {
               this._kbCon = new libKeyboardCon();
               if(this._keyboard == null)
               {
                  this._keyboard = new KryKeyboard(this._tempTF);
                  this._keyboard.y = this._kbCon.mcHeader.height;
                  this._keyboard.scaleY = this._keyboard.scaleX = this._kbCon.mcHeader.width / this._keyboard.width;
                  this._kbCon.addChild(this._keyboard);
               }
               this.setGlow(this._kbCon);
               this._kbCon.x = stage.mouseX;
               this._kbCon.y = stage.mouseY + 10 + this._tempTF.height * this._canvas.scaleX;
               if(this._capY - this._kbCon.height / 3 < this._kbCon.y)
               {
                  this._kbCon.y = this._inputTool.y - this._kbCon.height - 10;
               }
               this.addStage(this._kbCon);
               this._kbCon.mcHeader.addEventListener(MouseEvent.MOUSE_DOWN,this.startDragKeyboard);
               this._kbCon.btnColor.addEventListener(MouseEvent.CLICK,this.changeTFColor);
               this._kbCon.btnSize.addEventListener(MouseEvent.CLICK,this.changeTFSize);
            }
            this._inputTool.btnDrag.addEventListener(MouseEvent.MOUSE_DOWN,this.dragTF);
            this._inputTool.btnCancel.addEventListener(MouseEvent.CLICK,this.deleteTF);
            this._inputTool.btnSave.addEventListener(MouseEvent.CLICK,this.saveTF);
         }
      }
      
      public function setGlow(_mc:*) : *
      {
         var myGlow:GlowFilter = null;
         myGlow = new GlowFilter();
         myGlow.color = 0;
         myGlow.blurX = 10;
         myGlow.blurY = 10;
         myGlow.strength = 0.5;
         _mc.filters = [myGlow];
         _mc.cacheAsBitmap = true;
      }
      
      public function deleteTF(e:MouseEvent = null) : *
      {
         this.cancelTF();
         this.addInputToBook();
         if(e)
         {
            this.saveTextfieldsToDB();
         }
      }
      
      public function saveTF(e:MouseEvent) : *
      {
         var _object:Object = null;
         var _index:int = 0;
         if(this._tempTF.text == "")
         {
            this.deleteTF();
            return;
         }
         _object = new Object();
         this._tempTF.border = false;
         this._tempTF.cacheAsBitmap = true;
         _object.tf = this._tempTF;
         _object.page = this.guncelSayfa;
         if(this.isIm && this.imMode == 0)
         {
            _object.im = this.guncelIm;
         }
         _index = this._arrayTF.length;
         this._arrayTF[_index] = _object;
         stage.focus = null;
         this.deleteTF();
         this._inputLayer.addChild(_object.tf);
         this.saveTextfieldsToDB();
      }
      
      public function saveTextfieldsToDB() : *
      {
         KXKDatabase.deleteTextfields(function():*
         {
            var _a:Array = null;
            var _o:Object = null;
            if(_arrayTF.length == 0)
            {
               return;
            }
            _a = new Array();
            for each(_o in _arrayTF)
            {
               _a.push({
                  "x":_o.tf.x,
                  "y":_o.tf.y,
                  "text":_o.tf.text,
                  "size":_o.tf.defaultTextFormat.size,
                  "color":_o.tf.textColor,
                  "page":_o.page,
                  "im":_o.im
               });
            }
            KXKDatabase.insertTextfields(JSON.stringify(_a));
         });
      }
      
      public function moveTFAndTool(e:MouseEvent) : *
      {
         var _point:Point = null;
         _point = this._canvas.globalToLocal(new Point(this._inputTool.x,this._inputTool.y));
         this._tempTF.x = _point.x;
         this._tempTF.y = _point.y + this._inputTool.height / this._canvas.scaleX + 10 / this._canvas.scaleX;
      }
      
      public function dragTF(e:MouseEvent) : *
      {
         this._inputTool.btnDrag.removeEventListener(MouseEvent.MOUSE_DOWN,this.dragTF);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.dropTF);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.moveTFAndTool);
         if(!this.isIm)
         {
            this._inputTool.startDrag(false,new Rectangle(this._canvas.x,this._canvas.y - this._inputTool.height - 10,this._canvas.width - this._tempTF.width * this._canvas.scaleX,this._canvas.height - this._inputTool.height + 20));
         }
         else
         {
            this._inputTool.startDrag(false,new Rectangle(0,0,this._capX - this._tempTF.width * this._canvas.scaleX,this._capY - this._inputTool.height));
         }
      }
      
      public function dropTF(e:MouseEvent) : *
      {
         this._inputTool.btnDrag.addEventListener(MouseEvent.MOUSE_DOWN,this.dragTF);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.dropTF);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.moveTFAndTool);
         this._inputTool.stopDrag();
      }
      
      public function changeTFFormat(_tf:TextField, _size:int = -1, _color:uint = 0) : *
      {
         var _textFormat:TextFormat = null;
         if(_size != -1)
         {
            _textFormat = new TextFormat();
            _textFormat.size = _size;
            _textFormat.font = "Roboto";
            _tf.defaultTextFormat = _textFormat;
            _tf.setTextFormat(_textFormat);
         }
         if(_color != 0)
         {
            _tf.textColor = _color;
         }
      }
      
      public function changeTFColor(e:MouseEvent) : *
      {
         if(-1 < e.target.parent.name.indexOf("_"))
         {
            this.changeTFFormat(this._tempTF,-1,uint("0x" + e.target.parent.name.split("_")[1]));
         }
      }
      
      public function changeTFSize(e:MouseEvent) : *
      {
         if(-1 < e.target.parent.name.indexOf("_"))
         {
            this.changeTFFormat(this._tempTF,int(e.target.parent.name.split("_")[1]) * 2,0);
         }
      }
      
      public function startDragKeyboard(e:MouseEvent) : *
      {
         this._kbCon.mcHeader.removeEventListener(MouseEvent.MOUSE_DOWN,this.startDragKeyboard);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.stopDragKeyboard);
         this._kbCon.startDrag();
      }
      
      public function stopDragKeyboard(e:MouseEvent) : *
      {
         this._kbCon.mcHeader.addEventListener(MouseEvent.MOUSE_DOWN,this.startDragKeyboard);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.stopDragKeyboard);
         this._kbCon.stopDrag();
      }
      
      public function createTF(_size:int = 15, _color:uint = 0, _border:Boolean = true) : *
      {
         var _textFormat:TextFormat = null;
         var _tf:TextField = null;
         _textFormat = new TextFormat();
         _textFormat.size = _size;
         _textFormat.font = "Roboto";
         _tf = new TextField();
         _tf.defaultTextFormat = _textFormat;
         _tf.type = TextFieldType.INPUT;
         _tf.border = _border;
         _tf.embedFonts = true;
         _tf.multiline = true;
         _tf.autoSize = TextFieldAutoSize.LEFT;
         _tf.mouseEnabled = false;
         _tf.needsSoftKeyboard = false;
         _tf.width = 100;
         _tf.textColor = _color;
         return _tf;
      }
      
      public function unzipFile(_zipPath:String, _targetPath:String, _f:Function = null) : *
      {
         this._targetPath = _targetPath;
         this._zipFunc = _f;
         this._zipFileCounter = 0;
         this._fmArray = new Array();
         this._zipFileReader = new ZipFileReader();
         this._zipFileReader.open(new File(_zipPath));
         this._fileList = this._zipFileReader.getEntries();
         this.startUnzip();
      }
      
      public function startUnzip() : void
      {
         var _zipEntry:ZipEntry = null;
         var _zipFM:FileManager = null;
         _zipEntry = this._fileList[this._zipFileCounter];
         if(_zipEntry.isDirectory())
         {
            new File(this._targetPath + _zipEntry.getFilename()).createDirectory();
            this.checkEnd();
         }
         else
         {
            _zipFM = new FileManager();
            _zipFM.addEventListener(IOErrorEvent.IO_ERROR,function():void
            {
            });
            _zipFM.addEventListener(Event.COMPLETE,function():void
            {
               checkEnd();
            });
            _zipFM.writeFile(this._targetPath + _zipEntry.getFilename(),this._zipFileReader.unzip(_zipEntry));
            this._fmArray.push(_zipFM);
         }
      }
      
      public function checkEnd() : void
      {
         if(this._zipFileCounter == this._fileList.length - 1)
         {
            if(this._zipFunc != null)
            {
               this._zipFunc();
            }
         }
         else
         {
            ++this._zipFileCounter;
            this.startUnzip();
         }
      }
      
      public function openEbaList(e:MouseEvent) : *
      {
         if(this.mcEbaPanel.visible)
         {
            this.footer.btnEba.bg.gotoAndPlay(2);
            this.closeEbaList();
            return;
         }
         if(Network.status)
         {
            if(this.panelVideoSolution.visible)
            {
               this.videoSolutionHandler();
            }
            if(this.panelVV.visible)
            {
               this.vvPanelHandler();
            }
            if(this.panelAh.visible)
            {
               this.closePanelAh();
            }
            if(this.panelMeeting.visible)
            {
               this.closePanelMeeting();
            }
            this.footer.btnEba.gotoAndStop(2);
            this.footer.btnEba.bg.gotoAndPlay(2);
            this.mcEbaPanel.visible = true;
            this.mcEbaPanel.mcLoading1.visible = true;
            TweenMax.to(this.mcEbaPanel,this._tweenTime,{"x":this._capX - this.mcEbaPanel.width});
            this.addStage(this.mcEbaPanel);
            this.mcEbaPanel.mcBg.btnClose.addEventListener(MouseEvent.CLICK,this.closeEbaList);
            this.mcEbaPanel.btnSearch.addEventListener(MouseEvent.CLICK,this.ebaSearch);
            if(!this._mainCat)
            {
               this._mainCat = "0";
               this._treeArray.push(this._mainCat);
            }
            this.getXml(this._cloudBase + "&action=get_content_pool&pid=" + this._mainCat,this.createTree);
         }
         else
         {
            this.warning("İçerik Havuzu\'nu kullanabilmek için internet bağlantısı gerekmektedir.");
         }
      }
      
      public function closeEbaList(e:MouseEvent = null) : *
      {
         if(this.mcEbaPanel.visible)
         {
            this.footer.btnEba.bg.gotoAndPlay(2);
            this.closeVideoPanel();
            this.closeEbaSearch();
            this.footer.btnEba.gotoAndStop(1);
            TweenMax.to(this.mcEbaPanel,this._tweenTime,{
               "x":this._capX,
               "visible":false
            });
            this.mcEbaPanel.mcBg.btnClose.removeEventListener(MouseEvent.CLICK,this.closeEbaList);
            this.mcEbaPanel.mcEbaContent.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandlerK);
            this.mcEbaPanel.mcCatHeader.btnBack.removeEventListener(MouseEvent.CLICK,this.getEbaOut);
            if(this._xmlLoader)
            {
               this._xmlLoader.dispose(true);
            }
            if(this._videoQueue)
            {
               this._videoQueue.dispose(true);
            }
            this.removeItems(this.mcEbaPanel.mcEbaContent);
            this._empArray = [];
            this._videoList = [];
            this.mcEbaPanel.txtStat1.text = "";
            this.mcEbaPanel.mcCatHeader.visible = false;
            this.mcEbaPanel.mcLoading1.visible = false;
            ScrollClass.disable(this.mcEbaPanel.mcEbaContent);
            ScrollClass.remove(this.mcEbaPanel.mcEbaContent);
            this.mcEbaPanel.bar1.visible = false;
            this.mcEbaPanel.bar2.visible = false;
            this.mcEbaPanel.thumb1.visible = false;
            this.mcEbaPanel.thumb2.visible = false;
         }
      }
      
      public function getXml(_strF:String, _funcF:Function) : *
      {
         var _urlRequest:URLRequest = null;
         this.mcEbaPanel.bar1.visible = false;
         this.mcEbaPanel.thumb1.visible = false;
         this._function = _funcF;
         _urlRequest = new URLRequest(_strF);
         _urlRequest.method = URLRequestMethod.POST;
         this._xmlLoader = new XMLLoader(_urlRequest,{
            "name":"xml",
            "onComplete":this.downloadedXml,
            "onProgress":this.progressXml,
            "onError":function():*
            {
               _ebaLoadStatus = false;
            }
         });
         try
         {
            this._xmlLoader.load(true);
         }
         catch(e:Error)
         {
            _ebaLoadStatus = false;
         }
         this._xmlLoader.load(true);
      }
      
      public function downloadedXml(e:LoaderEvent) : *
      {
         this._function(new XML(this._xmlLoader.content));
         if(this._xmlLoader)
         {
            this._xmlLoader.dispose(true);
         }
      }
      
      public function progressXml(e:LoaderEvent) : void
      {
         this._num = Math.floor(e.target.progress * 100);
      }
      
      public function createTree(_xmlF:XML = null) : *
      {
         var _item:XML = null;
         var _v:XML = null;
         var _obj:Object = null;
         this._ebaLoadStatus = false;
         this.removeItems(this.mcEbaPanel.mcEbaContent);
         TweenMax.killTweensOf(this.mcEbaPanel.mcEbaContent);
         this.mcEbaPanel.mcEbaContent.y = this.mcEbaPanel.mcMask.y;
         this._int = 0;
         this._num = 0;
         this._empArray = [];
         for each(_item in _xmlF.kategoriler.k)
         {
            this._empArray[this._int] = new libEbaElement();
            this._empArray[this._int].name = "b_" + _item.@id;
            this._empArray[this._int].txt.text = _item;
            this._empArray[this._int].y = this._int * this._empArray[this._int].height;
            this.mcEbaPanel.mcEbaContent.addChild(this._empArray[this._int]);
            this._empArray[this._int].addEventListener(MouseEvent.CLICK,this.getEbaIn);
            this._empArray[this._int].cacheAsBitmap = true;
            this._num += this._empArray[this._int].height;
            ++this._int;
            this._ebaArray[_item.@id] = new Object();
            this._ebaArray[_item.@id].id = _item.@id;
            this._ebaArray[_item.@id].ustkategori = _item.@ustkategori;
            this._ebaArray[_item.@id].txt = _item;
         }
         ScrollClass.remove(this.mcEbaPanel.mcEbaContent);
         ScrollClass.add(this.mcEbaPanel.mcEbaContent,this.mcEbaPanel.mcMask,this.mcEbaPanel.bar1,this.mcEbaPanel.thumb1);
         ScrollClass.enable(this.mcEbaPanel.mcEbaContent);
         ScrollClass.update(this.mcEbaPanel.mcEbaContent);
         this.mcEbaPanel.txtStat1.text = this._int == 0 ? "Kategori bulunamadı" : "";
         if(0 < _xmlF.items.children().length())
         {
            this._ebaArray[this._mainCat].videos = new Array();
            for each(_v in _xmlF.items.v)
            {
               _obj = new Object();
               _obj.id = _v.@id;
               _obj.thumb = _v.@gorsel;
               _obj.dosya = _v.@dosya;
               _obj.filename = _obj.dosya.split("/")[_obj.dosya.split("/").length - 1];
               _obj.rate = _v.@izlenme;
               _obj.like = _v.@begeni;
               _obj.time = _v.@sure;
               _obj.title = _v;
               _obj.type = _v.@type;
               _obj.p = _v.@p;
               _obj.f = _v.@f;
               this._ebaArray[this._mainCat].videos.push(_obj);
            }
         }
         if(this._mainCat != "0")
         {
            this.mcEbaPanel.mcCatHeader.visible = true;
            this.mcEbaPanel.mcCatHeader.txt.text = this._ebaArray[this._mainCat].txt;
            this.mcEbaPanel.mcCatHeader.btnBack.addEventListener(MouseEvent.CLICK,this.getEbaOut);
         }
         else
         {
            this.mcEbaPanel.mcCatHeader.visible = false;
            this.mcEbaPanel.mcCatHeader.txt.text = "";
            this.mcEbaPanel.mcCatHeader.btnBack.removeEventListener(MouseEvent.CLICK,this.getEbaOut);
         }
         this.mcEbaPanel.mcLoading1.visible = false;
         this.mcEbaPanel.mcEbaContent.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandlerK);
         this.openVideoList();
      }
      
      public function getEbaIn(e:MouseEvent) : *
      {
         if(this.clickControl() && !this._ebaLoadStatus)
         {
            if(Network.status)
            {
               this._ebaLoadStatus = true;
               this.closeVideoPanel();
               this.mcEbaPanel.mcLoading1.visible = true;
               this._treeArray.push(this._mainCat);
               this._mainCat = e.currentTarget.name.split("_")[1];
               this.getXml(this._cloudBase + "&action=get_content_pool&pid=" + this._mainCat,this.createTree);
            }
            else
            {
               this.warning("İçerik Havuzu\'nu kullanabilmek için internet bağlantısı gerekmektedir.");
            }
         }
      }
      
      public function getEbaOut(e:MouseEvent) : *
      {
         if(Network.status && !this._ebaLoadStatus)
         {
            this._ebaLoadStatus = true;
            this.closeVideoPanel();
            this.mcEbaPanel.mcLoading1.visible = true;
            this._mainCat = this._treeArray[this._treeArray.length - 1];
            this.getXml(this._cloudBase + "&action=get_content_pool&pid=" + this._mainCat,this.createTree);
            this._treeArray.pop();
         }
         else
         {
            this.warning("İçerik Havuzu\'nu kullanabilmek için internet bağlantısı gerekmektedir.");
         }
      }
      
      public function openVideoList() : *
      {
         this.closeVideoPanel();
         if(!this._ebaArray[this._mainCat])
         {
            this.mcEbaPanel.txtStat2.text = "İçerik bulunamadı";
         }
         else if(this.countArray(this._ebaArray[this._mainCat].videos) == 0)
         {
            this.mcEbaPanel.txtStat2.text = "İçerik bulunamadı";
         }
         else
         {
            this._videoMainList = this._ebaArray[this._mainCat].videos;
            this.goOpenVideo();
         }
      }
      
      public function goOpenVideo() : *
      {
         this.mcEbaPanel.mcVideoContent.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandlerK);
         this.mcEbaPanel.mcP1.addEventListener(MouseEvent.CLICK,this.openVideoPage);
         this.mcEbaPanel.mcP2.addEventListener(MouseEvent.CLICK,this.openVideoPage);
         this.mcEbaPanel.mcP3.addEventListener(MouseEvent.CLICK,this.openVideoPage);
         this.mcEbaPanel.mcP5.addEventListener(MouseEvent.CLICK,this.openVideoPage);
         this.mcEbaPanel.mcP6.addEventListener(MouseEvent.CLICK,this.openVideoPage);
         this.mcEbaPanel.mcP7.addEventListener(MouseEvent.CLICK,this.openVideoPage);
         this.mcEbaPanel.btnPrev.addEventListener(MouseEvent.CLICK,this.videoPageNavi);
         this.mcEbaPanel.btnNext.addEventListener(MouseEvent.CLICK,this.videoPageNavi);
         this.mcEbaPanel.btnSortTime.addEventListener(MouseEvent.CLICK,this.videoSort);
         this.mcEbaPanel.btnSortRate.addEventListener(MouseEvent.CLICK,this.videoSort);
         this.mcEbaPanel.btnSortLike.addEventListener(MouseEvent.CLICK,this.videoSort);
         this._videoPageNo = 0;
         this.createPagination();
         this.createVideoList(this.getPageElements(this._videoPageNo));
         this.mcEbaPanel.txtStat2.text = "";
      }
      
      public function closeVideoPanel() : *
      {
         this.mcEbaPanel.mcP1.removeEventListener(MouseEvent.CLICK,this.openVideoPage);
         this.mcEbaPanel.mcP2.removeEventListener(MouseEvent.CLICK,this.openVideoPage);
         this.mcEbaPanel.mcP3.removeEventListener(MouseEvent.CLICK,this.openVideoPage);
         this.mcEbaPanel.mcP5.removeEventListener(MouseEvent.CLICK,this.openVideoPage);
         this.mcEbaPanel.mcP6.removeEventListener(MouseEvent.CLICK,this.openVideoPage);
         this.mcEbaPanel.mcP7.removeEventListener(MouseEvent.CLICK,this.openVideoPage);
         this.mcEbaPanel.mcVideoContent.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandlerK);
         this.mcEbaPanel.btnSortTime.removeEventListener(MouseEvent.CLICK,this.videoSort);
         this.mcEbaPanel.btnSortRate.removeEventListener(MouseEvent.CLICK,this.videoSort);
         this.mcEbaPanel.btnSortLike.removeEventListener(MouseEvent.CLICK,this.videoSort);
         this.mcEbaPanel.btnBack.removeEventListener(MouseEvent.CLICK,this.goEbaBack);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.dropStageEbaVideo);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.catchEba);
         this.stopColorize(this.mcEbaPanel.btnSortTime.mcBg);
         this.stopColorize(this.mcEbaPanel.btnSortRate.mcBg);
         this.stopColorize(this.mcEbaPanel.btnSortLike.mcBg);
         this.mcEbaPanel.btnSortTime.gotoAndStop(1);
         this.mcEbaPanel.btnSortRate.gotoAndStop(1);
         this.mcEbaPanel.btnSortLike.gotoAndStop(1);
         this._empArray = [];
         this._videoList = [];
         this._videoPageNo = 0;
         this._lastPageNo = 0;
         if(this._videoQueue)
         {
            this._videoQueue.dispose(true);
         }
         this._sortSet = "";
         this.removeItems(this.mcEbaPanel.mcVideoContent);
         this.mcEbaPanel.mcP1.txt.text = this.mcEbaPanel.mcP2.txt.text = this.mcEbaPanel.mcP3.txt.text = this.mcEbaPanel.mcP4.txt.text = this.mcEbaPanel.mcP5.txt.text = this.mcEbaPanel.mcP6.txt.text = this.mcEbaPanel.mcP7.txt.text = "";
         this.mcEbaPanel.txtStat2.text = "";
         this.mcEbaPanel.btnBack.visible = false;
         ScrollClass.disable(this.mcEbaPanel.mcVideoContent);
         ScrollClass.remove(this.mcEbaPanel.mcVideoContent);
         this.mcEbaPanel.bar2.visible = false;
         this.mcEbaPanel.thumb2.visible = false;
      }
      
      public function createPagination() : *
      {
         var _a:Array = null;
         var _l:int = 0;
         _a = this._videoMainList;
         _l = _a.length;
         this._lastPageNo = Math.floor(_l / this._perPage);
         if(_l % this._perPage != 0)
         {
            this._lastPageNo += 1;
         }
      }
      
      public function getPageElements(_pageNo:*) : Array
      {
         var _start:int = 0;
         var _end:int = 0;
         var _a:Array = null;
         _start = _pageNo * this._perPage;
         _end = (_pageNo + 1) * this._perPage;
         _a = this._videoMainList.concat();
         if(_end > _a.length)
         {
            _end = _a.length;
         }
         if(this._sortSet != "")
         {
            if(this._sortSet.split("_")[0] != "time")
            {
               if(this._sortSet.split("_")[1] == "2")
               {
                  _a.sortOn(this._sortSet.split("_")[0],Array.DESCENDING | Array.NUMERIC);
               }
               else
               {
                  _a.sortOn(this._sortSet.split("_")[0],Array.NUMERIC);
               }
            }
            else if(this._sortSet.split("_")[1] == "2")
            {
               _a.sortOn(this._sortSet.split("_")[0],Array.DESCENDING | Array.CASEINSENSITIVE);
            }
            else
            {
               _a.sortOn(this._sortSet.split("_")[0],Array.CASEINSENSITIVE);
            }
         }
         return _a.slice(_start,_end);
      }
      
      public function createVideoList(_a:Array) : *
      {
         var _key:String = null;
         this.mcEbaPanel.bar2.visible = false;
         this.mcEbaPanel.thumb2.visible = false;
         this.mcEbaPanel.mcVideoContent.y = this.mcEbaPanel.mcVideoMask.y;
         this.removeItems(this.mcEbaPanel.mcVideoContent);
         this._empArray = [];
         this._num = 0;
         this._videoList = _a;
         if(this._videoQueue)
         {
            this._videoQueue.dispose(true);
         }
         this._videoQueue = new LoaderMax({
            "name":"mainQueue",
            "autoDispose":true
         });
         for(_key in this._videoList)
         {
            this._videoList[_key].mc = new libEbaListEl();
            this._videoList[_key].mc.y = this._num;
            this._videoList[_key].mc.name = "v_" + _key;
            this._videoList[_key].mc.txtTitle.text = this._videoList[_key].title;
            if(this._videoList[_key].type == "videolar")
            {
               this._videoList[_key].mc.mcBg.icon.gotoAndStop(1);
            }
            if(this._videoList[_key].type == "sesler")
            {
               this._videoList[_key].mc.mcBg.icon.gotoAndStop(2);
            }
            if(this._videoList[_key].type == "swf")
            {
               this._videoList[_key].mc.mcBg.icon.gotoAndStop(3);
            }
            if(this._videoList[_key].type == "dokumanlar")
            {
               this._videoList[_key].mc.mcBg.icon.gotoAndStop(4);
            }
            if(this._videoList[_key].type == "gorseller")
            {
               this._videoList[_key].mc.mcBg.icon.gotoAndStop(5);
            }
            if(this._videoList[_key].type == "baglanti")
            {
               this._videoList[_key].mc.mcBg.icon.gotoAndStop(6);
            }
            this.mcEbaPanel.mcVideoContent.addChild(this._videoList[_key].mc);
            this._videoList[_key].mc.addEventListener(MouseEvent.CLICK,this.cloud_handler);
            this._videoList[_key].mc.addEventListener(MouseEvent.MOUSE_DOWN,this.dragStageEbaVideo);
            this._num += this._videoList[_key].mc.height;
            this._videoList[_key].mc.cacheAsBitmap = true;
            if(this._videoList[_key].thumb != "")
            {
               this._videoQueue.append(new ImageLoader(this._videoList[_key].thumb,{
                  "name":_key,
                  "container":this._videoList[_key].mc.mcCon,
                  "smoothing":true,
                  "width":40,
                  "height":32,
                  "scaleMode":"proportionalInside",
                  "hAlign":"center",
                  "vAlign":"center",
                  "onComplete":function(e:*):*
                  {
                     _videoList[e.target.vars.indexKey].mc.mcBg.icon.visible = false;
                  },
                  "indexKey":_key
               }));
            }
         }
         this.mcEbaPanel.mcP1.txt.text = this.mcEbaPanel.mcP2.txt.text = this.mcEbaPanel.mcP3.txt.text = this.mcEbaPanel.mcP4.txt.text = this.mcEbaPanel.mcP5.txt.text = this.mcEbaPanel.mcP6.txt.text = this.mcEbaPanel.mcP7.txt.text = "";
         this.setPageButtons();
         if(Network.status)
         {
            this._videoQueue.load();
         }
         ScrollClass.remove(this.mcEbaPanel.mcVideoContent);
         ScrollClass.add(this.mcEbaPanel.mcVideoContent,this.mcEbaPanel.mcVideoMask,this.mcEbaPanel.bar2,this.mcEbaPanel.thumb2);
         ScrollClass.enable(this.mcEbaPanel.mcVideoContent);
         ScrollClass.update(this.mcEbaPanel.mcVideoContent);
      }
      
      public function setPageButtons() : *
      {
         this.mcEbaPanel.mcP4.txt.text = (this._videoPageNo + 1).toString();
         this.mcEbaPanel.mcP3.txt.text = this._videoPageNo > 0 ? this._videoPageNo.toString() : "";
         this.mcEbaPanel.mcP2.txt.text = this._videoPageNo - 1 > 0 ? (this._videoPageNo - 1).toString() : "";
         this.mcEbaPanel.mcP1.txt.text = this._videoPageNo - 2 > 0 ? (this._videoPageNo - 2).toString() : "";
         this.mcEbaPanel.mcP5.txt.text = this._videoPageNo + 1 < this._lastPageNo ? (this._videoPageNo + 2).toString() : "";
         this.mcEbaPanel.mcP6.txt.text = this._videoPageNo + 2 < this._lastPageNo ? (this._videoPageNo + 3).toString() : "";
         this.mcEbaPanel.mcP7.txt.text = this._videoPageNo + 3 < this._lastPageNo ? (this._videoPageNo + 4).toString() : "";
      }
      
      public function videoPageNavi(e:MouseEvent) : *
      {
         if(e.currentTarget.name == "btnPrev")
         {
            if(0 >= this._videoPageNo)
            {
               return;
            }
            --this._videoPageNo;
         }
         else
         {
            if(this._videoPageNo >= this._lastPageNo - 1)
            {
               return;
            }
            ++this._videoPageNo;
         }
         this.createVideoList(this.getPageElements(this._videoPageNo));
      }
      
      public function openVideoPage(e:MouseEvent) : *
      {
         if(e.currentTarget.txt.text != "")
         {
            this._videoPageNo = int(e.currentTarget.txt.text) - 1;
            this.createVideoList(this.getPageElements(this._videoPageNo));
         }
      }
      
      public function videoSort(e:MouseEvent) : *
      {
         this.stopColorize(this.mcEbaPanel.btnSortTime.mcBg);
         this.stopColorize(this.mcEbaPanel.btnSortRate.mcBg);
         this.stopColorize(this.mcEbaPanel.btnSortLike.mcBg);
         this.colorize(e.currentTarget.mcBg,10066329);
         if(e.currentTarget.name == "btnSo rtTime")
         {
            e.currentTarget.gotoAndStop(e.currentTarget.currentFrame == 1 ? 2 : 1);
            this._sortSet = "time";
         }
         else
         {
            this.mcEbaPanel.btnSortTime.gotoAndStop(1);
         }
         if(e.currentTarget.name == "btnSortRate")
         {
            e.currentTarget.gotoAndStop(e.currentTarget.currentFrame == 1 ? 2 : 1);
            this._sortSet = "rate";
         }
         else
         {
            this.mcEbaPanel.btnSortRate.gotoAndStop(1);
         }
         if(e.currentTarget.name == "btnSortLike")
         {
            e.currentTarget.gotoAndStop(e.currentTarget.currentFrame == 1 ? 2 : 1);
            this._sortSet = "like";
         }
         else
         {
            this.mcEbaPanel.btnSortLike.gotoAndStop(1);
         }
         this._sortSet += "_" + e.currentTarget.currentFrame.toString();
         this.createVideoList(this.getPageElements(this._videoPageNo));
      }
      
      public function ebaSearch(e:MouseEvent) : *
      {
         this.mcEbaPanel.mcSearchHeader.visible = true;
         stage.focus = this.mcEbaPanel.mcSearchHeader.txt;
         this.mcEbaPanel.mcSearchHeader.btnCross.addEventListener(MouseEvent.CLICK,this.closeEbaSearch);
         this.mcEbaPanel.mcSearchHeader.btnTick.addEventListener(MouseEvent.CLICK,this.goEbaSearch);
         this.mcEbaPanel.mcSearchHeader.txt.text = "";
      }
      
      public function closeEbaSearch(e:MouseEvent = null) : *
      {
         this.mcEbaPanel.mcSearchHeader.visible = false;
         this.mcEbaPanel.mcSearchHeader.btnCross.removeEventListener(MouseEvent.CLICK,this.closeEbaSearch);
         this.mcEbaPanel.mcSearchHeader.btnTick.removeEventListener(MouseEvent.CLICK,this.goEbaSearch);
         this.mcEbaPanel.mcSearchHeader.btnTick.gotoAndStop(1);
         this._xmlLoader.dispose(true);
      }
      
      public function goEbaSearch(e:MouseEvent) : *
      {
         if(this.mcEbaPanel.mcSearchHeader.txt.text != "")
         {
            if(Network.status)
            {
               trace(13123);
               this.mcEbaPanel.mcSearchHeader.btnTick.removeEventListener(MouseEvent.CLICK,this.goEbaSearch);
               this.mcEbaPanel.mcSearchHeader.btnTick.gotoAndStop(2);
               this.getXml(this._cloudBase + "&action=search&value=" + this.mcEbaPanel.mcSearchHeader.txt.text,this.getSearchResult);
            }
            else
            {
               this.warning("İçerik Havuzu\'nu kullanabilmek için internet bağlantısı gerekmektedir.");
            }
         }
      }
      
      public function getSearchResult(_x:XML) : *
      {
         var _v:XML = null;
         var _obj:Object = null;
         this.closeEbaSearch();
         if(0 < _x.items.children().length())
         {
            this._videoMainList = [];
            for each(_v in _x.items.v)
            {
               _obj = new Object();
               _obj.id = _v.@id;
               _obj.thumb = _v.@gorsel;
               _obj.dosya = _v.@dosya;
               _obj.filename = _obj.dosya.split("/")[_obj.dosya.split("/").length - 1];
               _obj.title = _v;
               _obj.type = _v.@type;
               _obj.f = _v.@f;
               _obj.p = _v.@p;
               this._videoMainList.push(_obj);
            }
            this.mcEbaPanel.btnBack.visible = true;
            this.mcEbaPanel.btnBack.addEventListener(MouseEvent.CLICK,this.goEbaBack);
            this.goOpenVideo();
         }
         else
         {
            this.warning("İçerik bulunamadı.");
         }
      }
      
      public function goEbaBack(e:MouseEvent) : *
      {
         this.mcEbaPanel.btnBack.visible = false;
         this.mcEbaPanel.btnBack.removeEventListener(MouseEvent.CLICK,this.goEbaBack);
         this.openVideoList();
      }
      
      public function cloud_handler(e:MouseEvent) : *
      {
         var _key:* = undefined;
         if(this.clickControl() && !this._dragStatus && e.target.name != "mcDrag")
         {
            this._dragStatus = false;
            _key = e.currentTarget.name.split("_")[1];
            this.openCloudDownloader(this._videoList[_key],this.downloadComplete,1);
         }
      }
      
      public function dragStageEbaVideo(e:MouseEvent) : *
      {
         if(!this._dragStatus && e.target.name == "mcDrag")
         {
            this._selectedVideo = this._videoList[e.currentTarget.name.split("_")[1]];
            if(!User.token)
            {
               if(this._selectedVideo.f == 0)
               {
                  this.warning("Bu içeriği kullanabilmek için kullanıcı doğrulaması yapmanız gerekmektedir.");
                  return;
               }
            }
            stage.addEventListener(MouseEvent.MOUSE_UP,this.dropStageEbaVideo);
            TweenMax.delayedCall(0.05,this.startDragEbaVideo);
         }
         else
         {
            this._dragStatus = false;
         }
      }
      
      public function startDragEbaVideo() : *
      {
         var _b:Bitmap = null;
         if(this.clickControl())
         {
            this._dragStatus = true;
            this.kapKontrol();
            this._closeZoom();
            this._selectedVideo.mc.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandlerK);
            this.mouseUpHandlerK();
            this._ebaIcon = new im_eba();
            if(this._selectedVideo.mc.mcCon.numChildren > 0)
            {
               _b = this.getVideoThumb(this._selectedVideo.mc.mcCon);
               _b.x = -_b.width / 2;
               _b.y = -this._ebaIcon.height / 2 - _b.height;
               _b.alpha = 0.7;
               this._ebaIcon.addChild(_b);
            }
            this.catchEba();
            this.addStage(this._ebaIcon);
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.catchEba);
         }
      }
      
      public function dropStageEbaVideo(e:MouseEvent) : *
      {
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.dropStageEbaVideo);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.catchEba);
         TweenMax.killDelayedCallsTo(this.startDragEbaVideo);
         this._selectedVideo.mc.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandlerK);
         if(this._dragStatus)
         {
            if(!this._book.hitTestPoint(stage.mouseX,stage.mouseY,true))
            {
               this.removeStage(this._ebaIcon);
               this._ebaIcon = null;
            }
            else
            {
               this.addEbaToZeng();
            }
         }
         this._dragStatus = false;
      }
      
      public function addEbaToZeng() : *
      {
         var _p1:Point = null;
         var _p2:Point = null;
         this.icn = 8;
         if(!this._icnPage[this.guncelSayfa])
         {
            this._icnPage[this.guncelSayfa] = new MovieClip();
            this.tempLayerZeng.addChild(this._icnPage[this.guncelSayfa]);
         }
         this._objZeng[this.icn][this._intZeng[this.icn]] = new Array();
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"] = new im_eba();
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].cacheAsBitmap = true;
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].name = "im_" + this._nameInt + "_" + this.icn;
         _p1 = new Point(this._ebaIcon.x,this._ebaIcon.y);
         _p2 = this._canvas.globalToLocal(_p1);
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].x = _p2.x;
         this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].y = _p2.y;
         this._objZeng[this.icn][this._intZeng[this.icn]]["pn"] = this.guncelSayfa;
         this._objZeng[this.icn][this._intZeng[this.icn]]["fl"] = this._selectedVideo.dosya;
         this._objZeng[this.icn][this._intZeng[this.icn]]["title"] = this._selectedVideo.title;
         this._objZeng[this.icn][this._intZeng[this.icn]]["type"] = this._selectedVideo.type;
         this._objZeng[this.icn][this._intZeng[this.icn]]["id"] = this._selectedVideo.id;
         this._objZeng[this.icn][this._intZeng[this.icn]]["f"] = this._selectedVideo.f;
         this._objZeng[this.icn][this._intZeng[this.icn]]["p"] = this._selectedVideo.p;
         this._objZeng[this.icn][this._intZeng[this.icn]]["online"] = "false";
         this.removeStage(this._ebaIcon);
         this._ebaIcon = null;
         this._icnPage[this.guncelSayfa].addChild(this._objZeng[this.icn][this._intZeng[this.icn]]["mc"]);
         ++this.kayitB2;
         ++this.kayitB;
         ++this._nameInt;
         ++this._intZeng[this.icn];
         this.zengKaydet();
      }
      
      public function getVideoThumb(_do:DisplayObject) : Bitmap
      {
         var _bmpData:BitmapData = null;
         var _bmp:Bitmap = null;
         _bmpData = new BitmapData(_do.width,_do.height,true,0);
         _bmpData.draw(_do);
         _bmp = new Bitmap(_bmpData);
         _bmp.smoothing = true;
         return _bmp;
      }
      
      public function catchEba(e:MouseEvent = null) : *
      {
         var _p1:Point = null;
         var _p2:Point = null;
         if(this._ebaIcon)
         {
            _p1 = new Point(this._canvas.mouseX,this._canvas.mouseY);
            _p2 = this._canvas.localToGlobal(_p1);
            this._ebaIcon.x = _p2.x;
            this._ebaIcon.y = _p2.y;
         }
      }
      
      public function openCloudDownloader(_o:Object, _f:Function, _i:int) : *
      {
         if(!User.token)
         {
            if(_o.f == 0)
            {
               this.warning("Bu içeriği kullanabilmek için kullanıcı doğrulaması yapmanız gerekmektedir.");
               return;
            }
         }
         this._selectetCloudObject = _o;
         if(this._selectetCloudObject.p == 1)
         {
            this.cloudDownloader.con.close.addEventListener(MouseEvent.CLICK,this.closeCloudDown);
            this.cloudDownloader.onComplete = _f;
            this.cloudDownloader.onError = this.downloadError;
            this.cloudDownloader.onOnline = this.downloadComplete;
            this.cloudDownloader.folder = this._assPath;
            this.cloudDownloader.setObject(_o);
            this.cloudDownloader.visible = true;
            this.addStage(this.cloudDownloader);
         }
         else
         {
            this.downloadComplete(true);
         }
      }
      
      public function closeAndDisposeCloud(e:MouseEvent = null) : *
      {
         this.cloudDownloader.dispose();
      }
      
      public function closeCloudDown(e:MouseEvent = null) : *
      {
         this.cloudDownloader.con.close.removeEventListener(MouseEvent.CLICK,this.closeCloudDown);
         this.cloudDownloader.onComplete = null;
         this.cloudDownloader.onError = null;
         this.cloudDownloader.onOnline = null;
         this.cloudDownloader.visible = false;
         setTimeout(this.closeAndDisposeCloud,150);
      }
      
      public function downloadError(e:*) : *
      {
         this.closeCloudDown();
         this.warning(e);
      }
      
      public function downloadComplete(_online:Boolean = false) : *
      {
         var _f:File = null;
         this.closeCloudDown();
         if(this._selectetCloudObject.type == "videolar")
         {
            if(_online)
            {
               if(this._operatingSystem != "windows")
               {
                  this.openPlayer(this._selectetCloudObject.dosya);
               }
               else
               {
                  this.openZincPlayer(this._selectetCloudObject.dosya,"video");
               }
            }
            else if(this._operatingSystem != "windows")
            {
               this.openPlayer(this.cloudDownloader.folder + this._selectetCloudObject.filename);
            }
            else
            {
               this.openZincPlayer(this.cloudDownloader.folder + this._selectetCloudObject.filename,"video");
            }
         }
         if(this._selectetCloudObject.type == "sesler")
         {
            if(_online)
            {
               if(this._operatingSystem != "windows")
               {
                  this.openMp3Player(this._selectetCloudObject.dosya);
               }
               else
               {
                  this.openZincPlayer(this._selectetCloudObject.dosya,"audio");
               }
            }
            else if(this._operatingSystem != "windows")
            {
               this.openMp3Player(this.cloudDownloader.folder + this._selectetCloudObject.filename);
            }
            else
            {
               this.openZincPlayer(this.cloudDownloader.folder + this._selectetCloudObject.filename,"audio");
            }
         }
         if(this._selectetCloudObject.type == "gorseller")
         {
            if(_online)
            {
               this.openObjectPanel(this._selectetCloudObject.dosya,"img");
            }
            else
            {
               this.openObjectPanel(this.cloudDownloader.folder + this._selectetCloudObject.filename,"img");
            }
         }
         if(this._selectetCloudObject.type == "dokumanlar")
         {
            if(FileManager.exists(this.cloudDownloader.folder + this._selectetCloudObject.filename))
            {
               _f = new File(this.cloudDownloader.folder + this._selectetCloudObject.filename);
               if(_f.exists)
               {
                  _f.openWithDefaultApplication();
               }
               else
               {
                  this.warning("Dosya bulunamadı.");
               }
            }
         }
         if(this._selectetCloudObject.type == "swf")
         {
            if(_online)
            {
               this.openObjectPanel(this._selectetCloudObject.dosya,"swf");
            }
            else
            {
               this.openObjectPanel(this.cloudDownloader.folder + this._selectetCloudObject.filename,"swf");
            }
         }
         if(this._selectetCloudObject.type == "baglanti")
         {
            trace(this._selectetCloudObject.dosya);
            navigateToURL(new URLRequest(this._selectetCloudObject.dosya));
         }
      }
      
      public function _actionEba2(e:MouseEvent = null) : void
      {
         var key:* = null;
         var _o:Object = null;
         if(e != null)
         {
            for(key in this._objZeng[e.currentTarget.name.split("_")[2]])
            {
               if(this._objZeng[e.currentTarget.name.split("_")[2]][key]["mc"].name == e.currentTarget.name)
               {
                  if(!User.token)
                  {
                     if(this._objZeng[e.currentTarget.name.split("_")[2]][key]["f"] == 0)
                     {
                        this.warning("Bu içeriği kullanabilmek için kullanıcı doğrulaması yapmanız gerekmektedir.");
                        return;
                     }
                  }
                  _o = new Object();
                  _o.dosya = this._objZeng[e.currentTarget.name.split("_")[2]][key]["fl"];
                  _o.filename = _o.dosya.split("/")[_o.dosya.split("/").length - 1];
                  _o.title = this._objZeng[e.currentTarget.name.split("_")[2]][key]["title"];
                  _o.type = this._objZeng[e.currentTarget.name.split("_")[2]][key]["type"];
                  _o.f = this._objZeng[e.currentTarget.name.split("_")[2]][key]["f"];
                  _o.p = this._objZeng[e.currentTarget.name.split("_")[2]][key]["p"];
                  this.openCloudDownloader(_o,this.downloadComplete,0);
                  break;
               }
            }
         }
      }
      
      public function openCloudSettingHandler(e:MouseEvent) : *
      {
         this.cloudSettings.con.close.addEventListener(MouseEvent.CLICK,this.cloudSettingHandler);
         this.cloudSettings.con.btnDown.addEventListener(MouseEvent.CLICK,this.cloudSettingHandler);
         this.cloudSettings.con.btnUp.addEventListener(MouseEvent.CLICK,this.cloudSettingHandler);
         this.cloudSettings.con.btnClear.addEventListener(MouseEvent.CLICK,this.cloudSettingHandler);
         this.cloudSettings.visible = true;
         this.addStage(this.cloudSettings);
      }
      
      public function closeCloudSettingHandler() : *
      {
         this.cloudSettings.con.close.removeEventListener(MouseEvent.CLICK,this.cloudSettingHandler);
         this.cloudSettings.con.btnDown.removeEventListener(MouseEvent.CLICK,this.cloudSettingHandler);
         this.cloudSettings.con.btnUp.removeEventListener(MouseEvent.CLICK,this.cloudSettingHandler);
         this.cloudSettings.con.btnClear.removeEventListener(MouseEvent.CLICK,this.cloudSettingHandler);
         this.cloudSettings.visible = false;
      }
      
      public function cloudSettingHandler(e:MouseEvent) : *
      {
         var _json:* = undefined;
         if(e.currentTarget.name == "close")
         {
            this.closeCloudSettingHandler();
         }
         else if(e.currentTarget.name == "btnUp")
         {
            if(!Network.status)
            {
               this.warning("İçerik Havuzu\'nu kullanabilmek için internet bağlantısı gerekmektedir.");
               return;
            }
            this.ask(function():*
            {
               var _a:Array = null;
               var _k:String = null;
               var _urlRequest:URLRequest = null;
               var _urlVariable:URLVariables = null;
               var _d:Object = null;
               if(_objZeng[8].length == 0)
               {
                  warning("Kitap üzerinde zenginleştirilmiş içerik bulunamadı.");
                  return;
               }
               _a = new Array();
               for(_k in _objZeng[8])
               {
                  if(_objZeng[8][_k]["online"] != "true")
                  {
                     _d = new Object();
                     _d.x = _objZeng[8][_k]["mc"].x;
                     _d.y = _objZeng[8][_k]["mc"].y;
                     _d.page = _objZeng[8][_k]["pn"];
                     _d.id = String(_objZeng[8][_k]["id"]);
                     _a.push(_d);
                  }
               }
               showLoading();
               _urlRequest = new URLRequest(_cloudBase);
               _urlVariable = new URLVariables();
               _urlVariable.action = "upload_content_pool";
               _urlVariable.token = User.token;
               _urlVariable.json = JSON.stringify(_a);
               _urlRequest.data = _urlVariable;
               _urlRequest.method = URLRequestMethod.POST;
               _json = new KryJSON(_urlRequest,true);
               _json.onError = function():*
               {
                  hideLoading();
                  warning("Gönderim sırasında hata oluştu. Lütfen tekrar deneyin.");
               };
               _json.onComplete = function(e:*):*
               {
                  hideLoading();
                  if(e.error)
                  {
                     warning(String(e.error));
                     return;
                  }
                  if(e.status)
                  {
                     closeCloudSettingHandler();
                     warning("Zenginleştirilmiş içerik başarıyla gönderildi.");
                  }
                  else
                  {
                     warning("Gönderim sırasında hata oluştu. Lütfen tekrar deneyin.");
                  }
               };
               _json.start();
            },"Zenginleştirilmiş içeriği sunucuya yüklemek istiyor musunuz?");
         }
         else if(e.currentTarget.name == "btnDown")
         {
            if(!Network.status)
            {
               this.warning("Zenginleştirilmiş içeriği indirmek için internet bağlantısı gerekmektedir.");
               return;
            }
            this.ask(function():*
            {
               var _urlRequest:URLRequest = null;
               var _urlVariable:URLVariables = null;
               showLoading();
               _urlRequest = new URLRequest(_cloudBase);
               _urlVariable = new URLVariables();
               _urlVariable.action = "download_content_pool";
               _urlVariable.token = User.token;
               _urlRequest.data = _urlVariable;
               _urlRequest.method = URLRequestMethod.POST;
               _json = new KryJSON(_urlRequest,true);
               _json.onError = function():*
               {
                  hideLoading();
                  warning("İndirme sırasında hata oluştu. Lütfen tekrar deneyin.");
               };
               _json.onComplete = function(e:*):*
               {
                  hideLoading();
                  if(e.error)
                  {
                     warning(e.error);
                     return;
                  }
                  if(e.status)
                  {
                     closeCloudSettingHandler();
                     if(e.items)
                     {
                        KXKDatabase.deleteEnrichmentData("date");
                        clearEbaZeng();
                        setEbaZeng(e.items);
                     }
                  }
                  else
                  {
                     warning("İndirme sırasında hata oluştu. Lütfen tekrar deneyin.");
                  }
               };
               _json.start();
            },"Sunucuda kayıtlı zenginleştirilmiş içeriği indirmek istiyor musunuz?");
         }
         else if(e.currentTarget.name == "btnClear")
         {
            if(!Network.status)
            {
               this.warning("Zenginleştirilmiş içeriği silmek için internet bağlantısı gerekmektedir.");
               return;
            }
            this.ask(function():*
            {
               var _urlRequest:URLRequest = null;
               var _urlVariable:URLVariables = null;
               showLoading();
               _urlRequest = new URLRequest(_cloudBase);
               _urlVariable = new URLVariables();
               _urlVariable.action = "all_enrichment_clear";
               _urlVariable.token = User.token;
               _urlRequest.data = _urlVariable;
               _urlRequest.method = URLRequestMethod.POST;
               _json = new KryJSON(_urlRequest,true);
               _json.onError = function():*
               {
                  hideLoading();
                  warning("Silme sırasında hata oluştu. Lütfen tekrar deneyin.");
               };
               _json.onComplete = function(e:*):*
               {
                  hideLoading();
                  if(e.error)
                  {
                     warning(e.error);
                     return;
                  }
                  if(e.status)
                  {
                     closeCloudSettingHandler();
                     clearEbaZeng();
                     KXKDatabase.deleteEnrichmentData("date");
                     KXKDatabase.deleteEnrichmentData("xml");
                  }
                  else
                  {
                     warning("Silme sırasında hata oluştu. Lütfen tekrar deneyin.");
                  }
               };
               _json.start();
            },"Sunucuda kayıtlı zenginleştirilmiş içeriği silmek istiyor musunuz?");
         }
      }
      
      public function clearEbaZeng() : *
      {
         var _k:* = null;
         for(_k in this._objZeng[8])
         {
            if(this._currMc)
            {
               this._currMc.filters = [];
            }
            this._currMc = MovieClip(this._objZeng[8][_k]["mc"]);
            if(this._currMc.parent)
            {
               this._currMc.parent.removeChild(this._currMc);
            }
            this._objZeng[8][_k]["mc"].removeEventListener(MouseEvent.CLICK,this._actionEba2);
            --this.kayitB;
         }
         this._intZeng[8] = 0;
         this._objZeng[8] = new Array();
         ++this.kayitB2;
      }
      
      public function setEbaZeng(_data:Object, _save:Boolean = true) : *
      {
         var _key:* = null;
         this.icn = 8;
         for(_key in _data)
         {
            if(!this._icnPage[_data[_key].page])
            {
               this._icnPage[_data[_key].page] = new MovieClip();
               this.tempLayerZeng.addChild(this._icnPage[_data[_key].page]);
            }
            this._objZeng[this.icn][this._intZeng[this.icn]] = new Array();
            this._objZeng[this.icn][this._intZeng[this.icn]]["mc"] = new im_eba();
            this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].cacheAsBitmap = true;
            this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].name = "im_" + this._nameInt + "_" + this.icn;
            this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].x = _data[_key].x;
            this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].y = _data[_key].y;
            this._objZeng[this.icn][this._intZeng[this.icn]]["pn"] = _data[_key].page;
            this._objZeng[this.icn][this._intZeng[this.icn]]["fl"] = _data[_key].url;
            this._objZeng[this.icn][this._intZeng[this.icn]]["title"] = _data[_key].title;
            this._objZeng[this.icn][this._intZeng[this.icn]]["type"] = _data[_key].type;
            this._objZeng[this.icn][this._intZeng[this.icn]]["id"] = _data[_key].id;
            this._objZeng[this.icn][this._intZeng[this.icn]]["f"] = _data[_key].f;
            this._objZeng[this.icn][this._intZeng[this.icn]]["p"] = _data[_key].p;
            this._objZeng[this.icn][this._intZeng[this.icn]]["online"] = _data[_key].online;
            if(this._objZeng[this.icn][this._intZeng[this.icn]]["online"] == "true")
            {
               this._objZeng[this.icn][this._intZeng[this.icn]]["mc"].gotoAndStop(2);
            }
            this._icnPage[_data[_key].page].addChild(this._objZeng[this.icn][this._intZeng[this.icn]]["mc"]);
            ++this.kayitB2;
            ++this.kayitB;
            ++this._nameInt;
            ++this._intZeng[this.icn];
         }
         if(_save)
         {
            this.zengKaydet();
         }
      }
      
      public function checkOnlineEnrichment() : *
      {
         if(-1 < this._mainFolderPath.indexOf("fernusadmin"))
         {
            return;
         }
         KXKDatabase.getEnrichmentData("date",function(e:*):*
         {
            var _date:* = undefined;
            var _urlRequest:URLRequest = null;
            var _urlVariable:URLVariables = null;
            var _json:* = undefined;
            _date = null;
            if(e)
            {
               _date = e[0].data;
            }
            _urlRequest = new URLRequest(_cloudBase);
            _urlVariable = new URLVariables();
            _urlVariable.action = "auto_enrichments";
            _urlVariable.enrichment_date = _date;
            _urlRequest.data = _urlVariable;
            _urlRequest.method = URLRequestMethod.POST;
            _json = new KryJSON(_urlRequest,true);
            _json.onComplete = function(e:*):*
            {
               var _k:String = null;
               var _cArray:Array = null;
               var _a:Array = null;
               var _newArray:Array = null;
               var _filename:String = null;
               var _ff:* = undefined;
               var _s:Boolean = false;
               if(e.status)
               {
                  if(e.items)
                  {
                     KXKDatabase.deleteEnrichmentData("date",function():*
                     {
                        KXKDatabase.insertEnrichmentData("date",e.date);
                     });
                     _cArray = new Array();
                     _a = new Array();
                     _newArray = e.items;
                     for(_k in _objZeng[8])
                     {
                        if(_objZeng[8][_k]["online"] != "true")
                        {
                           _a.push({
                              "type":_objZeng[8][_k]["type"],
                              "title":_objZeng[8][_k]["title"],
                              "id":_objZeng[8][_k]["id"],
                              "x":_objZeng[8][_k]["mc"].x,
                              "y":_objZeng[8][_k]["mc"].y,
                              "page":_objZeng[8][_k]["pn"],
                              "url":_objZeng[8][_k]["fl"],
                              "f":_objZeng[8][_k]["f"],
                              "p":_objZeng[8][_k]["p"],
                              "online":"false"
                           });
                        }
                        else if(_objZeng[8][_k]["online"] == "true")
                        {
                           if(_objZeng[8][_k]["type"] == "videolar" || _objZeng[8][_k]["type"] == "sesler" || _objZeng[8][_k]["type"] == "gorseller" || _objZeng[8][_k]["type"] == "dokumanlar" || _objZeng[8][_k]["type"] == "baglanti" || _objZeng[8][_k]["type"] == "swf")
                           {
                              _filename = _objZeng[8][_k]["fl"].split("/")[_objZeng[8][_k]["fl"].split("/").length - 1];
                              _cArray[_filename] = true;
                           }
                        }
                     }
                     clearEbaZeng();
                     setEbaZeng(_a,false);
                     setEbaZeng(_newArray,true);
                     warning("Zenginleştirilmiş içerikler güncellenmiştir.");
                     for(_ff in _cArray)
                     {
                        _s = true;
                        for(_k in _newArray)
                        {
                           if(_newArray[_k].url.split("/")[_newArray[_k].url.split("/").length - 1] == _ff)
                           {
                              _s = false;
                              break;
                           }
                        }
                        if(_s)
                        {
                           FileManager.deleteFile(_assPath + _ff);
                        }
                     }
                  }
               }
            };
            _json.start();
         });
      }
      
      public function openWebview(_title:String, _url:String) : *
      {
         if(this._operatingSystem == "mac")
         {
            navigateToURL(new URLRequest(_url));
            return;
         }
         if(!Network.status)
         {
            this.warning("İnternet bağlantınıza erişim yok. İnternet bağlantızı kontrol edip tekrar deneyin.");
            return;
         }
         this.panelWebview.con.txt.text = _title;
         this.panelWebview.visible = true;
         this.addStage(this.panelWebview);
         this.panelWebview.openWeb(_url,this._realScale * (this._window.bounds.width / this._windowBounds.x));
         this.panelWebview.con.close.addEventListener(MouseEvent.CLICK,this.closeWebview);
         this._window.addEventListener(NativeWindowBoundsEvent.RESIZE,this.closeWebview);
      }
      
      public function closeWebview(e:*) : *
      {
         this._window.removeEventListener(NativeWindowBoundsEvent.RESIZE,this.closeWebview);
         this.panelWebview.visible = false;
         this.panelWebview.closeWeb();
         this.panelWebview.con.close.removeEventListener(MouseEvent.CLICK,this.closeWebview);
      }
      
      public function accountHandler(e:MouseEvent = null, f:Function = null) : *
      {
         if(User.token)
         {
            this.openAccountPanel();
         }
         else
         {
            KXKDatabase.getLogin(function(_d:*):*
            {
               if(!_d)
               {
                  if(!Network.status)
                  {
                     warning("İnternet bağlantınıza erişim yok. İnternet bağlantızı kontrol edip tekrar deneyin.");
                     return;
                  }
                  openConfirmation();
                  if(!e)
                  {
                     warning("Bu özelliği kullanabilmek için kullanıcı doğrulaması yapın.");
                  }
               }
               else
               {
                  panelAccount.con.txt.text = Base64.decode(_d[0].mail);
                  panelConfirmation.con.pnl1.txt.text = Base64.decode(_d[0].mail);
                  panelConfirmation.con.pnl2.txt.text = Base64.decode(_d[0].password);
                  panelConfirmation.con.pnl1.bclear.visible = true;
                  if(!e)
                  {
                     checkUser(f);
                  }
                  else
                  {
                     openConfirmation();
                  }
               }
            });
         }
      }
      
      public function checkAutoLogin() : *
      {
         KXKDatabase.getLogin(function(_d:*):*
         {
            if(_d)
            {
               panelAccount.con.txt.text = Base64.decode(_d[0].mail);
               panelConfirmation.con.pnl1.txt.text = Base64.decode(_d[0].mail);
               panelConfirmation.con.pnl2.txt.text = Base64.decode(_d[0].password);
               panelConfirmation.con.pnl1.bclear.visible = true;
               checkUser(null,true);
            }
         });
      }
      
      public function openAccountPanel() : *
      {
         if(!Network.status)
         {
            this.warning("İnternet bağlantınıza erişim yok. İnternet bağlantızı kontrol edip tekrar deneyin.");
            return;
         }
         this.panelAccount.visible = true;
         this.addStage(this.panelAccount);
         this.panelAccount.con.close.addEventListener(MouseEvent.CLICK,this.panelAccountHandler);
         this.panelAccount.con.bdelete.addEventListener(MouseEvent.CLICK,this.panelAccountHandler);
         this.panelAccount.con.bvis.addEventListener(MouseEvent.CLICK,this.panelAccountHandler);
         this.panelAccount.con.txt.displayAsPassword = true;
         this.panelAccount.con.bvis.gotoAndStop(int(this.panelAccount.con.txt.displayAsPassword) + 1);
      }
      
      public function panelAccountHandler(e:MouseEvent = null) : *
      {
         if(e.currentTarget.name == "close")
         {
            this.panelAccount.con.close.removeEventListener(MouseEvent.CLICK,this.panelAccountHandler);
            this.panelAccount.con.bdelete.removeEventListener(MouseEvent.CLICK,this.panelAccountHandler);
            this.panelAccount.con.bvis.removeEventListener(MouseEvent.CLICK,this.panelAccountHandler);
            this.panelAccount.visible = false;
         }
         else if(e.currentTarget.name == "bvis")
         {
            this.panelAccount.con.txt.displayAsPassword = !this.panelAccount.con.txt.displayAsPassword;
            this.panelAccount.con.bvis.gotoAndStop(int(this.panelAccount.con.txt.displayAsPassword) + 1);
         }
         else if(e.currentTarget.name == "bdelete")
         {
            this.ask(function():*
            {
               KXKDatabase.deleteLogin();
               panelAccount.con.txt.text = "";
               panelConfirmation.con.pnl1.txt.text = "";
               panelConfirmation.con.pnl2.txt.text = "";
               panelConfirmation.con.pnl1.bclear.visible = false;
               User.token = null;
               User.phone = null;
               User.code = null;
               User.bookCode = null;
               User.admin = false;
               footer.btnAccount.gotoAndStop(1);
               VVUploader.disposeAllData();
               sidePanel.btnCloudAdmin.visible = false;
               sidePanel.btnCloudAdmin.removeEventListener(MouseEvent.CLICK,openCloudSettingHandler);
               panelAccount.con.close.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
               if(panelVV.visible)
               {
                  vvPanelHandler();
               }
               if(panelAh.visible)
               {
                  closePanelAh();
               }
               if(panelMeeting.visible)
               {
                  closePanelMeeting();
               }
               panelVV.txtCode.text = "";
               panelVectorVideoInfo.con.txt.text = "";
            },"Doğrulanmış kullanıcıyı silmek istiyor musunuz?");
         }
      }
      
      public function openConfirmation() : *
      {
         this.closeConfirmation();
         this.panelConfirmation.visible = true;
         this.addStage(this.panelConfirmation);
         this.panelConfirmation.con.pnl1.bvis.addEventListener(MouseEvent.CLICK,this.confirmationPanelHandler);
         this.panelConfirmation.con.pnl2.bvis2.addEventListener(MouseEvent.CLICK,this.confirmationPanelHandler);
         this.panelConfirmation.con.pnl1.bnew.addEventListener(MouseEvent.CLICK,this.confirmationPanelHandler);
         this.panelConfirmation.con.pnl1.buse.addEventListener(MouseEvent.CLICK,this.confirmationPanelHandler);
         this.panelConfirmation.con.pnl1.bclear.addEventListener(MouseEvent.CLICK,this.confirmationPanelHandler);
         this.panelConfirmation.con.pnl2.bback.addEventListener(MouseEvent.CLICK,this.confirmationPanelHandler);
         this.panelConfirmation.con.pnl2.bconfirm.addEventListener(MouseEvent.CLICK,this.confirmationPanelHandler);
         this.panelConfirmation.con.close.addEventListener(MouseEvent.CLICK,this.confirmationPanelHandler);
         stage.addEventListener(Event.ENTER_FRAME,this.restrictTF);
         KXKDatabase.getLogin(function(_d:*):*
         {
            if(_d)
            {
               panelAccount.con.txt.text = Base64.decode(_d[0].mail);
               panelConfirmation.con.pnl1.txt.text = Base64.decode(_d[0].mail);
               panelConfirmation.con.pnl2.txt.text = Base64.decode(_d[0].password);
               panelConfirmation.con.pnl1.bclear.visible = true;
            }
         });
      }
      
      public function closeConfirmation(e:MouseEvent = null) : *
      {
         this.panelConfirmation.visible = false;
         this.panelConfirmation.con.pnl1.txt.text = "";
         this.panelConfirmation.con.pnl2.txt.text = "";
         this.panelConfirmation.con.pnl1.txt.displayAsPassword = true;
         this.panelConfirmation.con.pnl2.txt.displayAsPassword = true;
         this.panelConfirmation.con.pnl1.bvis.gotoAndStop(int(this.panelConfirmation.con.pnl1.txt.displayAsPassword) + 1);
         this.panelConfirmation.con.pnl2.bvis2.gotoAndStop(int(this.panelConfirmation.con.pnl2.txt.displayAsPassword) + 1);
         this.panelConfirmation.con.pnl1.bclear.visible = false;
         this.panelConfirmation.con.pnl1.visible = true;
         this.panelConfirmation.con.pnl2.visible = false;
         this.panelConfirmation.con.pnl1.bvis.removeEventListener(MouseEvent.CLICK,this.confirmationPanelHandler);
         this.panelConfirmation.con.pnl2.bvis2.removeEventListener(MouseEvent.CLICK,this.confirmationPanelHandler);
         this.panelConfirmation.con.pnl1.bnew.removeEventListener(MouseEvent.CLICK,this.confirmationPanelHandler);
         this.panelConfirmation.con.pnl1.buse.removeEventListener(MouseEvent.CLICK,this.confirmationPanelHandler);
         this.panelConfirmation.con.pnl2.bconfirm.removeEventListener(MouseEvent.CLICK,this.confirmationPanelHandler);
         this.panelConfirmation.con.close.removeEventListener(MouseEvent.CLICK,this.confirmationPanelHandler);
         this.panelConfirmation.con.pnl1.bclear.removeEventListener(MouseEvent.CLICK,this.confirmationPanelHandler);
         stage.removeEventListener(Event.ENTER_FRAME,this.restrictTF);
      }
      
      public function restrictTF(e:Event) : *
      {
         var currentString:String = null;
         var numbersRegex:RegExp = null;
         var invalidRegex:RegExp = null;
         currentString = this.panelConfirmation.con.pnl1.txt.text;
         numbersRegex = /^\d*$/;
         invalidRegex = /\D+/;
         if(numbersRegex.test(currentString) == false)
         {
            currentString = currentString.replace(invalidRegex,"");
         }
         if(10 < currentString.length)
         {
            currentString = currentString.substr(0,currentString.length - 1);
         }
         this.panelConfirmation.con.pnl1.txt.text = currentString;
      }
      
      public function confirmationPanelHandler(e:MouseEvent) : *
      {
         if(e.currentTarget.name == "close")
         {
            this.closeConfirmation();
         }
         else if(e.currentTarget.name == "bvis")
         {
            this.panelConfirmation.con.pnl1.txt.displayAsPassword = !this.panelConfirmation.con.pnl1.txt.displayAsPassword;
            this.panelConfirmation.con.pnl1.bvis.gotoAndStop(int(this.panelConfirmation.con.pnl1.txt.displayAsPassword) + 1);
         }
         else if(e.currentTarget.name == "bvis2")
         {
            this.panelConfirmation.con.pnl2.txt.displayAsPassword = !this.panelConfirmation.con.pnl2.txt.displayAsPassword;
            this.panelConfirmation.con.pnl2.bvis2.gotoAndStop(int(this.panelConfirmation.con.pnl2.txt.displayAsPassword) + 1);
         }
         else if(e.currentTarget.name == "bnew")
         {
            if(!Network.status)
            {
               this.warning("İnternet bağlantınıza erişim yok. İnternet bağlantızı kontrol edip tekrar deneyin.");
               return;
            }
            if(this.panelConfirmation.con.pnl1.txt.text == "" || this.panelConfirmation.con.pnl1.txt.text.length != 10)
            {
               this.warning("Cep telefonu numaranızı girin.");
               return;
            }
            this.ask(function():*
            {
               var _urlRequest:URLRequest = null;
               var _urlVariable:URLVariables = null;
               var _kk:KryJSON = null;
               showLoading();
               _urlRequest = new URLRequest(_cloudBase);
               _urlVariable = new URLVariables();
               _urlVariable.action = "user_confirmation";
               _urlVariable.phone = panelConfirmation.con.pnl1.txt.text;
               _urlRequest.data = _urlVariable;
               _urlRequest.method = URLRequestMethod.POST;
               _kk = new KryJSON(_urlRequest,true);
               _kk.onError = function(e:*):*
               {
                  hideLoading();
                  warning("Şifre yollanamadı tekrar deneyin.");
               };
               _kk.onComplete = function(e:*):*
               {
                  hideLoading();
                  if(e.error)
                  {
                     warning(e.error);
                     return;
                  }
                  if(e.status)
                  {
                     if(e.success)
                     {
                        warning(e.success);
                     }
                     panelConfirmation.con.pnl2.txt.text = "";
                     panelConfirmation.con.pnl1.visible = false;
                     panelConfirmation.con.pnl2.visible = true;
                     stage.removeEventListener(Event.ENTER_FRAME,restrictTF);
                     panelConfirmation.con.pnl1.bclear.visible = false;
                     KXKDatabase.deleteLogin();
                  }
               };
               _kk.start();
            },"Yeni şifre almak istiyor musunuz? Eğer daha önce aldığınız şifre varsa iptal edilecektir. Tüm kitaplarda yeni şifre geçerli olacaktır.");
         }
         else if(e.currentTarget.name == "bback")
         {
            stage.addEventListener(Event.ENTER_FRAME,this.restrictTF);
            this.panelConfirmation.con.pnl1.visible = true;
            this.panelConfirmation.con.pnl2.visible = false;
         }
         else if(e.currentTarget.name == "bconfirm")
         {
            if(this.panelConfirmation.con.pnl2.txt.text == "")
            {
               this.warning("Şifrenizi girin.");
               return;
            }
            this.checkUser();
         }
         else if(e.currentTarget.name == "bclear")
         {
            KXKDatabase.deleteLogin();
            this.panelAccount.con.txt.text = "";
            this.panelConfirmation.con.pnl1.txt.text = "";
            this.panelConfirmation.con.pnl2.txt.text = "";
            this.panelConfirmation.con.pnl1.bclear.visible = false;
         }
         else if(e.currentTarget.name == "buse")
         {
            if(this.panelConfirmation.con.pnl1.txt.text == "" || this.panelConfirmation.con.pnl1.txt.text.length != 10)
            {
               this.warning("Cep telefonu numaranızı girin.");
               return;
            }
            stage.removeEventListener(Event.ENTER_FRAME,this.restrictTF);
            this.panelConfirmation.con.pnl1.visible = false;
            this.panelConfirmation.con.pnl2.visible = true;
         }
      }
      
      public function checkUser(_func:Function = null, _silent:Boolean = false) : *
      {
         var _urlRequest2:URLRequest = null;
         var _urlVariable2:URLVariables = null;
         var _kk2:KryJSON = null;
         if(!_silent)
         {
            if(!Network.status)
            {
               this.warning("İnternet bağlantınıza erişim yok. İnternet bağlantızı kontrol edip tekrar deneyin.");
               return;
            }
            this.showLoading();
         }
         _urlRequest2 = new URLRequest(this._cloudBase);
         _urlVariable2 = new URLVariables();
         _urlVariable2.action = "user_confirmation_check";
         _urlVariable2.phone = this.panelConfirmation.con.pnl1.txt.text;
         _urlVariable2.code = this.panelConfirmation.con.pnl2.txt.text;
         _urlRequest2.data = _urlVariable2;
         _urlRequest2.method = URLRequestMethod.POST;
         _kk2 = new KryJSON(_urlRequest2,true);
         _kk2.onError = function(e:*):*
         {
            hideLoading();
            if(!_silent)
            {
               warning("Kullanıcı doğrulaması yapılırken hata oluştu.");
            }
         };
         _kk2.onComplete = function(e:*):*
         {
            hideLoading();
            if(e.error)
            {
               if(!_silent)
               {
                  warning(e.error);
               }
               if(e.delete_data)
               {
                  KXKDatabase.deleteLogin();
                  panelAccount.con.txt.text = "";
                  panelConfirmation.con.pnl1.txt.text = "";
                  panelConfirmation.con.pnl2.txt.text = "";
                  panelConfirmation.con.pnl1.bclear.visible = false;
               }
               return;
            }
            if(e.status)
            {
               if(!_silent)
               {
                  if(e.success)
                  {
                     warning(e.success);
                  }
               }
               User.token = e.token;
               User.admin = e.admin;
               User.bookCode = e.book_code;
               User.phone = panelConfirmation.con.pnl1.txt.text;
               User.code = panelConfirmation.con.pnl2.txt.text;
               KXKDatabase.deleteLogin(function():*
               {
                  KXKDatabase.insertLogin(Base64.encode(User.phone),Base64.encode(User.code));
               });
               closeConfirmation();
               VVUploader.start();
               if(User.admin)
               {
                  sidePanel.btnCloudAdmin.visible = true;
                  sidePanel.btnCloudAdmin.addEventListener(MouseEvent.CLICK,openCloudSettingHandler);
               }
               if(_func != null)
               {
                  _func();
               }
               footer.btnAccount.gotoAndStop(2);
               panelVV.txtCode.text = User.bookCode;
               panelVectorVideoInfo.con.txt.text = "Videolara erişim için öğrencilere vermeniz gereken kod: " + User.bookCode;
               panelAccount.con.txt.text = User.phone;
            }
         };
         _kk2.start();
      }
      
      public function openHelp(e:MouseEvent = null) : *
      {
         this.openWebview("Kullanım Kılavuzu",this._cloudBase + "&action=user_guide");
      }
      
      public function messagePanelHandler(e:MouseEvent = null) : *
      {
         if(User.token)
         {
            this.openWebview("Yazarla Mesajlaş",this._cloudBase + "&action=message&token=" + User.token);
         }
         else
         {
            this.accountHandler(null,this.messagePanelHandler);
         }
      }
      
      public function vvPanelHandler(e:MouseEvent = null) : *
      {
         TweenMax.killTweensOf(this.panelVV);
         if(!this.panelVV.visible)
         {
            if(e)
            {
               if(e.currentTarget.name == "btnDO" && !User.token)
               {
                  this.accountHandler(null,this.vvPanelHandler);
                  return;
               }
            }
            if(this.panelVideoSolution.visible)
            {
               this.videoSolutionHandler();
            }
            if(this.mcEbaPanel.visible)
            {
               this.closeEbaList();
            }
            if(this.panelAh.visible)
            {
               this.closePanelAh();
            }
            if(this.panelMeeting.visible)
            {
               this.closePanelMeeting();
            }
            this.footer.btnDO.gotoAndStop(2);
            this.footer.btnDO.bg.gotoAndPlay(2);
            this.panelVV.visible = true;
            TweenMax.to(this.panelVV,this._tweenTime,{"x":this._capX - this.panelVV.width});
            this.addStage(this.panelVV);
            this.panelVV.close.addEventListener(MouseEvent.CLICK,this.vvPanelHandler);
            this.panelVV.sendAll.addEventListener(MouseEvent.CLICK,this.sendAllVV);
            this.panelVV.downloadQR.addEventListener(MouseEvent.CLICK,this.downloadBookQR);
            VVUploader.addEventListener(KryEvent.COMPLETE,this.checkVVPanelStatus);
            VVUploader.addEventListener(KryEvent.PROGRESS,this.checkVVPanelStatus);
            VVUploader.addEventListener(KryEvent.START,this.checkVVPanelStatus);
            this._vectorVideo.addEventListener(KryEvent.VV_CHANGED,this.imPanelVVStatus);
            this._vectorVideo.addEventListener(KryEvent.VV_DELETED,this.imPanelVVStatus);
            this._vectorVideo.addEventListener(KryEvent.VV_ADDED,this.imPanelVVStatus);
            this.panelVV.txtTotal.text = "0";
            this.panelVV.txtWaiting.text = "0";
            this.panelVV.txtUploaded.text = "0";
            this.panelVV.txtFile.text = "Gönderilen ders kaydı bulunmamaktadır.";
            this.panelVV.txtPercent.text = "%0";
            this.getVVStatus();
            VVUploader.start();
         }
         else
         {
            this.footer.btnDO.gotoAndStop(1);
            this.footer.btnDO.bg.gotoAndPlay(2);
            TweenMax.to(this.panelVV,this._tweenTime,{
               "x":this._capX,
               "visible":false
            });
            this.panelVV.close.removeEventListener(MouseEvent.CLICK,this.vvPanelHandler);
            this.panelVV.sendAll.removeEventListener(MouseEvent.CLICK,this.sendAllVV);
            this.panelVV.contentVVUpload.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandlerK);
            this.panelVV.downloadQR.removeEventListener(MouseEvent.CLICK,this.downloadBookQR);
            VVUploader.removeEventListener(KryEvent.COMPLETE,this.checkVVPanelStatus);
            VVUploader.removeEventListener(KryEvent.PROGRESS,this.checkVVPanelStatus);
            VVUploader.removeEventListener(KryEvent.START,this.checkVVPanelStatus);
            this._vectorVideo.removeEventListener(KryEvent.VV_CHANGED,this.imPanelVVStatus);
            this._vectorVideo.removeEventListener(KryEvent.VV_DELETED,this.imPanelVVStatus);
            this._vectorVideo.removeEventListener(KryEvent.VV_ADDED,this.imPanelVVStatus);
            this.removeItems(this.panelVV.contentVVUpload);
            this._vvStatusArray = null;
            ScrollClass.disable(this.panelVV.contentVVUpload);
            ScrollClass.remove(this.panelVV.contentVVUpload);
         }
      }
      
      public function downloadBookQR(evt:MouseEvent = null) : *
      {
         var _urlRequest:URLRequest = null;
         var _urlVariable:URLVariables = null;
         var _kk:KryJSON = null;
         if(!Network.status)
         {
            this.warning("İnternet bağlantınıza erişim yok. İnternet bağlantızı kontrol edip tekrar deneyin.");
            return;
         }
         this.showLoading();
         _urlRequest = new URLRequest(this._cloudBase);
         _urlVariable = new URLVariables();
         _urlVariable.action = "get_qr_code";
         _urlVariable.token = User.token;
         _urlRequest.data = _urlVariable;
         _urlRequest.method = URLRequestMethod.POST;
         _kk = new KryJSON(_urlRequest,true);
         _kk.onError = function(e:*):*
         {
            hideLoading();
            warning("Kitap kodu indirilirken hata oluştu.");
         };
         _kk.onComplete = function(e:*):*
         {
            var _fileSelect:* = undefined;
            hideLoading();
            if(e.error)
            {
               warning(e.error);
               return;
            }
            if(e.status)
            {
               _fileSelect = new File();
               _fileSelect.addEventListener(Event.SELECT,function():*
               {
                  var _kxkDownloader:KXKDownloader = null;
                  showLoading();
                  _kxkDownloader = new KXKDownloader(e.qr_url,_fileSelect.url + "/" + _bookName + "_KAREKOD.png",-1);
                  _kxkDownloader.addEventListener(IOErrorEvent.IO_ERROR,function():void
                  {
                     hideLoading();
                     warning("Karekod indirilirken hata oluştu.");
                  });
                  _kxkDownloader.addEventListener(Event.COMPLETE,function():void
                  {
                     var _f:File = null;
                     hideLoading();
                     _f = new File(_fileSelect.url + "/" + _bookName + "_KAREKOD.png");
                     if(_f.exists)
                     {
                        _f.openWithDefaultApplication();
                     }
                  });
                  _kxkDownloader.startDownload();
               });
               _fileSelect.browseForDirectory("Klasör seçin");
            }
         };
         _kk.start();
      }
      
      public function getVVStatus(_listStatus:Boolean = true, _y:Number = -1) : *
      {
         KXKDatabase.getAllAreaData(function(e:*):*
         {
            var _a:Array = null;
            var _i1:int = 0;
            var _i2:int = 0;
            var _i:int = 0;
            var _o:Object = null;
            if(!e)
            {
               e = new Array();
            }
            _a = e as Array;
            _i1 = 0;
            _i2 = 0;
            _i = 0;
            if(_listStatus)
            {
               removeItems(panelVV.contentVVUpload);
               _vvStatusArray = new Array();
            }
            _a.sortOn("areaID",Array.NUMERIC);
            for each(_o in _a)
            {
               if(_o.upload == 1)
               {
                  _i1++;
               }
               if(_o.upload == 2)
               {
                  _i2++;
               }
               if(_listStatus)
               {
                  _o.mc = new libVVUploadListElement();
                  _o.mc.txt.text = getAreaName(_o);
                  _o.mc.y = _i * _o.mc.height;
                  _o.mc.bcloud.gotoAndStop(_o.upload + 1);
                  panelVV.contentVVUpload.addChild(_o.mc);
                  _o.mc.name = _i.toString();
                  _o.mc.bplay.addEventListener(MouseEvent.CLICK,bplayVV);
                  _o.mc.bshow.addEventListener(MouseEvent.CLICK,bshowVV);
                  _o.mc.bcloud.addEventListener(MouseEvent.CLICK,bcloudVV);
                  _o.mc.bdelete.addEventListener(MouseEvent.CLICK,bdeleteVV);
                  _vvStatusArray.push(_o);
                  _i++;
               }
            }
            if(_listStatus)
            {
               panelVV.contentVVUpload.y = panelVV.mcMask.y;
               panelVV.contentVVUpload.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandlerK);
               ScrollClass.remove(panelVV.contentVVUpload);
               ScrollClass.add(panelVV.contentVVUpload,panelVV.mcMask);
               ScrollClass.enable(panelVV.contentVVUpload);
               if(_y != -1)
               {
                  panelVV.contentVVUpload.y = _y;
               }
               ScrollClass.update(panelVV.contentVVUpload);
            }
            panelVV.txtTotal.text = _vvStatusArray.length.toString();
            panelVV.txtWaiting.text = _i1.toString();
            panelVV.txtUploaded.text = _i2.toString();
         });
      }
      
      public function bplayVV(e:MouseEvent) : *
      {
         if(!this.clickControl())
         {
            return;
         }
         this._vectorVideo.openPlayer(this._vvStatusArray[e.currentTarget.parent.name].name);
      }
      
      public function bshowVV(e:MouseEvent) : *
      {
         var _o:Object = null;
         if(!this.clickControl())
         {
            return;
         }
         _o = this._vvStatusArray[e.currentTarget.parent.name];
         this.goToThePage(_o.page + this._jump);
         this.selectItems[_o.areaID]["im"].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
      }
      
      public function bdeleteVV(e:MouseEvent) : *
      {
         var _o:Object = null;
         if(!this.clickControl())
         {
            return;
         }
         _o = this._vvStatusArray[e.currentTarget.parent.name];
         this.ask(function():*
         {
            KXKDatabase.deleteData(_o,function():void
            {
               VVUploader.check(_o);
               FileManager.deleteFile(_assPath + _o.name);
               if(isIm && imMode == 0)
               {
                  if(guncelIm == _o.areaID)
                  {
                     _vectorVideo.closeRecordPanel();
                  }
               }
               getVVStatus(true,panelVV.contentVVUpload.y);
               panelVV.txtFile.text = "Gönderilen ders kaydı bulunmamaktadır.";
               panelVV.txtPercent.text = "%0";
               panelVV.progressBar.gotoAndStop(1);
            });
         },"Ders kaydını silmek istiyor musunuz?");
      }
      
      public function bcloudVV(e:MouseEvent) : *
      {
         var _o:Object = null;
         if(!this.clickControl())
         {
            return;
         }
         _o = this._vvStatusArray[e.currentTarget.parent.name];
         if(_o.upload == 0)
         {
            _o.upload = 1;
            KXKDatabase.updateData(_o,function():*
            {
               _o.mc.bcloud.gotoAndStop(_o.upload + 1);
               getVVStatus(false);
               VVUploader.start();
               warning("Ders kaydı gönderilmek üzere sıraya alındı.");
            });
         }
         else if(_o.upload == 1)
         {
            _o.upload = 0;
            KXKDatabase.updateData(_o,function():*
            {
               _o.mc.bcloud.gotoAndStop(_o.upload + 1);
               getVVStatus(false);
               VVUploader.check(_o);
               warning("Ders kaydı gönderme işlemi iptal edildi.");
               panelVV.txtFile.text = "Gönderilen ders kaydı bulunmamaktadır.";
               panelVV.txtPercent.text = "%0";
               panelVV.progressBar.gotoAndStop(1);
            });
         }
      }
      
      public function checkVVPanelStatus(e:KryEvent) : *
      {
         var _o:Object = null;
         if(e.type == KryEvent.COMPLETE)
         {
            this.panelVV.txtFile.text = "Gönderilen ders kaydı bulunmamaktadır.";
            this.panelVV.txtPercent.text = "%0";
            this.panelVV.progressBar.gotoAndStop(1);
            if(!this._vvStatusArray)
            {
               return;
            }
            for each(_o in this._vvStatusArray)
            {
               if(e.data.areaID == _o.areaID)
               {
                  _o.upload = 2;
                  _o.mc.bcloud.gotoAndStop(_o.upload + 1);
                  this.getVVStatus(false);
                  break;
               }
            }
         }
         else if(e.type == KryEvent.PROGRESS)
         {
            this.panelVV.txtFile.text = this.getAreaName(e.data.object);
            this.panelVV.txtPercent.text = "%" + String(e.data.percent);
            this.panelVV.progressBar.gotoAndStop(int(e.data.percent));
         }
      }
      
      public function getAreaName(_o:Object) : *
      {
         var _text:* = null;
         var _area:int = 0;
         var _k:* = null;
         _text = "Sayfa " + _o.page.toString() + " | " + _o.name;
         _area = 0;
         for(_k in this.selectItems)
         {
            if(this.selectItems[_k]["page"] == _o.page + this._jump)
            {
               _area++;
               if(_k == String(_o.areaID))
               {
                  _text = "Sayfa " + _o.page.toString() + " | " + _area.toString() + ". Bölge";
                  break;
               }
            }
         }
         return _text;
      }
      
      public function sendAllVV(e:MouseEvent) : *
      {
         if(!this._vvStatusArray)
         {
            return;
         }
         if(this._vvStatusArray.length == 0)
         {
            this.warning("Kayıtlı ders kaydı bulunmamaktadır.");
            return;
         }
         this.ask(function():*
         {
            var _o:Object = null;
            for each(_o in _vvStatusArray)
            {
               if(_o.upload == 0)
               {
                  _o.upload = 1;
                  KXKDatabase.updateData(_o);
                  _o.mc.bcloud.gotoAndStop(_o.upload + 1);
               }
            }
            getVVStatus(false);
            VVUploader.start();
            warning("Tüm ders kayıtları gönderilmek üzere sıraya alındı.");
         },"Tüm ders kayıtlarını göndermek istiyor musunuz?");
      }
      
      public function imPanelVVStatus(e:KryEvent) : *
      {
         var _o:Object = null;
         if(!this._vvStatusArray)
         {
            return;
         }
         if(e.type == KryEvent.VV_CHANGED)
         {
            for each(_o in this._vvStatusArray)
            {
               if(e.data.areaID == _o.areaID)
               {
                  _o.upload = e.data.upload;
                  _o.mc.bcloud.gotoAndStop(_o.upload + 1);
                  this.getVVStatus(false);
                  break;
               }
            }
         }
         else if(e.type == KryEvent.VV_DELETED)
         {
            this.getVVStatus(true,this.panelVV.contentVVUpload.y);
         }
         else if(e.type == KryEvent.VV_ADDED)
         {
            this.getVVStatus(true,this.panelVV.contentVVUpload.y);
         }
      }
      
      public function videoSolutionHandler(e:MouseEvent = null) : *
      {
         if(!Network.status)
         {
            this.warning("İnternet bağlantınıza erişim yok. İnternet bağlantızı kontrol edip tekrar deneyin.");
            return;
         }
         TweenMax.killTweensOf(this.panelVideoSolution);
         if(!this.panelVideoSolution.visible)
         {
            if(this.panelVV.visible)
            {
               this.vvPanelHandler();
            }
            if(this.mcEbaPanel.visible)
            {
               this.closeEbaList();
            }
            if(this.panelAh.visible)
            {
               this.closePanelAh();
            }
            if(this.panelMeeting.visible)
            {
               this.closePanelMeeting();
            }
            this.footer.btnSolution.gotoAndStop(2);
            this.footer.btnSolution.bg.gotoAndPlay(2);
            this.panelVideoSolution.visible = true;
            TweenMax.to(this.panelVideoSolution,this._tweenTime,{"x":this._capX - this.panelVideoSolution.width});
            this.addStage(this.panelVideoSolution);
            this.panelVideoSolution.start();
            this.panelVideoSolution.contentSolution.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandlerK);
            this.panelVideoSolution.close.addEventListener(MouseEvent.CLICK,this.videoSolutionHandler);
            this.panelVideoSolution.onError = this.errorSolution;
            this.panelVideoSolution.openVideo = this.openSolution;
         }
         else
         {
            this.footer.btnSolution.gotoAndStop(1);
            this.footer.btnSolution.bg.gotoAndPlay(2);
            TweenMax.to(this.panelVideoSolution,this._tweenTime,{
               "x":this._capX,
               "visible":false
            });
            this.panelVideoSolution.disposeData();
            this.panelVideoSolution.contentSolution.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandlerK);
            this.panelVideoSolution.close.removeEventListener(MouseEvent.CLICK,this.videoSolutionHandler);
            this.panelVideoSolution.onError = null;
            this.panelVideoSolution.openVideo = this.openSolution;
         }
      }
      
      public function errorSolution(_str:String) : *
      {
         if(this.panelVideoSolution.visible)
         {
            this.videoSolutionHandler();
         }
         this.warning(_str);
      }
      
      public function openSolution(_o:Object) : *
      {
         this.closeVVSolutionPlayer();
         this.closeZincPlayer();
         this.closeObjectPanel();
         if(_o.solved_type == "fernus")
         {
            this.openVVSolutionPlayer(_o);
         }
         else if(_o.solved_type == "video")
         {
            if(this._operatingSystem != "windows")
            {
               this.openPlayer(_o.url);
            }
            else
            {
               this.openZincPlayer(_o.url,"video");
            }
         }
         else if(_o.solved_type == "swf")
         {
            this.openObjectPanel(_o.url,"swf");
         }
         else if(_o.solved_type == "image")
         {
            this.openObjectPanel(_o.url,"img");
         }
      }
      
      public function mainBGHandler(e:MouseEvent) : *
      {
         if(!this.panelBG.visible)
         {
            this.panelBG.visible = true;
            this.panelBG.con.close.addEventListener(MouseEvent.CLICK,this.mainBGHandler);
            this.panelBG.con.thumbs.addEventListener(MouseEvent.CLICK,this.change_mainBG);
            this.addStage(this.panelBG);
         }
         else
         {
            this.panelBG.visible = false;
            this.panelBG.con.close.removeEventListener(MouseEvent.CLICK,this.mainBGHandler);
            this.panelBG.con.thumbs.removeEventListener(MouseEvent.CLICK,this.change_mainBG);
         }
      }
      
      public function change_mainBG(e:MouseEvent) : *
      {
         var _mainBgIndex:* = undefined;
         if(DisplayObject(e.target) == this.panelBG.con.thumbs.mc)
         {
            return;
         }
         _mainBgIndex = this.panelBG.con.thumbs.getChildIndex(DisplayObject(e.target)) + 1;
         this.panelBG.con.thumbs.mc.x = DisplayObject(e.target).x;
         this.panelBG.con.thumbs.mc.y = DisplayObject(e.target).y;
         this.mcBg.gotoAndStop(_mainBgIndex);
         KXKDatabase.delete_background(function():*
         {
            KXKDatabase.insert_background(_mainBgIndex);
         });
      }
      
      public function openPanelAh(e:MouseEvent = null) : *
      {
         if(!Network.status)
         {
            this.warning("İnternet bağlantınıza erişim yok. İnternet bağlantızı kontrol edip tekrar deneyin.");
            return;
         }
         if(!User.token)
         {
            this.accountHandler();
            return;
         }
         if(this.panelAh.visible)
         {
            this.closePanelAh();
            return;
         }
         TweenMax.killTweensOf(this.panelAh);
         if(this.panelVideoSolution.visible)
         {
            this.videoSolutionHandler();
         }
         if(this.mcEbaPanel.visible)
         {
            this.closeEbaList();
         }
         if(this.panelVV.visible)
         {
            this.vvPanelHandler();
         }
         if(this.panelMeeting.visible)
         {
            this.closePanelMeeting();
         }
         this.footer.btnAH.gotoAndStop(2);
         this.footer.btnAH.bg.gotoAndPlay(2);
         this.panelAh.visible = true;
         TweenMax.to(this.panelAh,this._tweenTime,{"x":this._capX - this.panelAh.width});
         this.addStage(this.panelAh);
         this.panelAh.contentAh.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandlerK);
         this.panelAh.close.addEventListener(MouseEvent.CLICK,this.closePanelAh);
         this.panelAh.bnew.addEventListener(MouseEvent.CLICK,this.selectNewAh);
         this.panelAh.brefresh.addEventListener(MouseEvent.CLICK,this.getAhData);
         this.panelAh.bsortPage.addEventListener(MouseEvent.CLICK,this.datesort_handler);
         this.panelAh.bsortDate.addEventListener(MouseEvent.CLICK,this.datesort_handler);
         this.panelAh.bsortPage.gotoAndStop(3);
         this.getAhData();
      }
      
      public function closePanelAh(e:MouseEvent = null) : *
      {
         TweenMax.killTweensOf(this.panelAh);
         this.footer.btnAH.gotoAndStop(1);
         this.footer.btnAH.bg.gotoAndPlay(2);
         TweenMax.to(this.panelAh,this._tweenTime,{
            "x":this._capX,
            "visible":false
         });
         this.panelAh.contentAh.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandlerK);
         this.panelAh.close.removeEventListener(MouseEvent.CLICK,this.closePanelAh);
         this.panelAh.bnew.removeEventListener(MouseEvent.CLICK,this.selectNewAh);
         this.panelAh.brefresh.removeEventListener(MouseEvent.CLICK,this.getAhData);
         this.panelAh.bsortPage.removeEventListener(MouseEvent.CLICK,this.datesort_handler);
         this.panelAh.bsortDate.removeEventListener(MouseEvent.CLICK,this.datesort_handler);
         this._ahList = null;
         this.removeItems(this.panelAh.contentAh);
         ScrollClass.disable(this.panelAh.contentAh);
         ScrollClass.remove(this.panelAh.contentAh);
      }
      
      public function datesort_handler(e:MouseEvent = null) : *
      {
         if(e.currentTarget.name == "bsortPage")
         {
            this._ahDateSort = -1;
            this.panelAh.bsortDate.gotoAndStop(3);
            this._ahPageSort = this._ahPageSort == 0 ? 1 : 0;
            this.panelAh.bsortPage.gotoAndStop(this._ahPageSort + 1);
         }
         else
         {
            this._ahPageSort = -1;
            this.panelAh.bsortPage.gotoAndStop(3);
            this._ahDateSort = this._ahDateSort == 0 ? 1 : 0;
            this.panelAh.bsortDate.gotoAndStop(this._ahDateSort + 1);
         }
         this.getAhData();
      }
      
      public function getAhData(e:MouseEvent = null) : *
      {
         var _urlRequest:URLRequest = null;
         var _urlVariable:URLVariables = null;
         var _json:KryJSON = null;
         this.showLoading();
         _urlRequest = new URLRequest(this._cloudBase);
         _urlVariable = new URLVariables();
         _urlVariable.action = "activehomework_get_data";
         _urlVariable.token = User.token;
         _urlVariable.date_sort = this._ahDateSort;
         _urlVariable.page_sort = this._ahPageSort;
         _urlRequest.data = _urlVariable;
         _urlRequest.method = URLRequestMethod.POST;
         _json = new KryJSON(_urlRequest,true);
         _json.onError = function():*
         {
            hideLoading();
            closePanelAh();
            warning("İşlem sırasında hata oluştu. Lütfen tekrar deneyin.");
         };
         _json.onComplete = function(e:*):*
         {
            hideLoading();
            if(e.error)
            {
               warning(String(e.error));
               closePanelAh();
               return;
            }
            if(e.status)
            {
               _ahList = e.list;
               panelAh.txtCode.text = e.book_code;
               updateAhList();
            }
            else
            {
               warning("İşlem sırasında hata oluştu. Lütfen tekrar deneyin.");
               closePanelAh();
            }
         };
         _json.start();
      }
      
      public function updateAhList() : *
      {
         var _i:* = undefined;
         var _o:Object = null;
         this.removeItems(this.panelAh.contentAh);
         _i = 0;
         for each(_o in this._ahList)
         {
            _o.mc = null;
            _o.mc = new libAhListItem();
            _o.mc.txtName.text = _o.name;
            _o.mc.txtInfo.text = _o.info;
            this.truncateTF(_o.mc.txtName);
            this.truncateTF(_o.mc.txtInfo);
            _o.mc.y = _i * _o.mc.height;
            this.panelAh.contentAh.addChild(_o.mc);
            _o.mc.name = _i.toString();
            _o.mc.bstatus.addEventListener(MouseEvent.CLICK,this.ahItemHandler);
            _o.mc.bshow.addEventListener(MouseEvent.CLICK,this.ahItemHandler);
            _o.mc.bdelete.addEventListener(MouseEvent.CLICK,this.ahItemHandler);
            _i++;
         }
         this.panelAh.contentAh.y = this.panelAh.mcMask.y;
         this.panelAh.contentAh.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandlerK);
         ScrollClass.remove(this.panelAh.contentAh);
         ScrollClass.add(this.panelAh.contentAh,this.panelAh.mcMask);
         ScrollClass.enable(this.panelAh.contentAh);
      }
      
      public function selectNewAh(e:MouseEvent = null) : *
      {
         if(this._vectorVideo.status)
         {
            this.warning("Ders kaydı sırasında Aktif Ödev\'i kullanamazsınız.");
            return;
         }
         if(!this.zenbB && !this._lockStat)
         {
            if(this._spriteTF == null)
            {
               this._spriteTF = new Sprite();
               this._spriteTF.graphics.beginFill(0,0.5);
               this._spriteTF.graphics.drawRect(0,0,this._capX,this._capY);
               this._spriteTF.graphics.endFill();
               this._infoBar = new libInfoBar();
               this._infoBar.x = (this._capX - this._infoBar.width) / 2;
               this._infoBar.y = 10;
               this._infoBar.txt.text = "Ödev olarak göndermek istediğiniz alanı seçin.";
               this._canvasIndex = stage.getChildIndex(this._canvas);
               this._footerIndex = stage.getChildIndex(this.footer);
               this.addStage(this._spriteTF);
               this.addStage(this._canvas);
               this.addStage(this._infoBar);
               this.addStage(this.footer);
               this.toolBar.visible = false;
               this._trsStat = this.trs.enabled;
               this.trs.enabled = false;
               this.itemMc.mouseChildren = false;
               this._canvas.mouseChildren = false;
               this._canvas.mouseEnabled = false;
               this.footer.mouseChildren = false;
               this.footer.mouseEnabled = false;
               this.objectTint(this.footer,0);
               stage.addEventListener(MouseEvent.MOUSE_DOWN,this.startSelectionForAH);
               this._infoBar.btnClose.addEventListener(MouseEvent.CLICK,this.cancelAH);
               this._ahSelectStatus = true;
            }
         }
      }
      
      public function cancelAH(e:MouseEvent = null) : void
      {
         this._ahSelectStatus = false;
         stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.startSelectionForAH);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.stopSelectionForAH);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.moveSelectionForAH);
         this._tfStatus = false;
         this.toolBar.visible = true;
         this.itemMc.mouseChildren = true;
         this._canvas.mouseChildren = true;
         this._canvas.mouseEnabled = true;
         this.footer.mouseChildren = true;
         this.footer.mouseEnabled = true;
         this.stopColorize(this.footer);
         this.trs.enabled = this._trsStat;
         if(this._spriteTF)
         {
            this.removeStage(this._spriteTF);
            this._spriteTF = null;
         }
         if(this._infoBar)
         {
            this.removeStage(this._infoBar);
            this._infoBar = null;
         }
         if(this._spriteAhSelect)
         {
            if(this._canvas.contains(this._spriteAhSelect))
            {
               this._canvas.removeChild(this._spriteAhSelect);
            }
            this._spriteAhSelect = null;
         }
         stage.setChildIndex(this._canvas,this._canvasIndex);
         stage.setChildIndex(this.footer,this._footerIndex);
      }
      
      public function startSelectionForAH(e:MouseEvent = null) : *
      {
         if(this._canvas.hitTestPoint(mouseX,mouseY,true))
         {
            stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.startSelectionForAH);
            stage.addEventListener(MouseEvent.MOUSE_UP,this.stopSelectionForAH);
            this.startPoint = new Point(this._canvas.mouseX,this._canvas.mouseY);
            this._spriteAhSelect = new Sprite();
            this._canvas.addChild(this._spriteAhSelect);
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.moveSelectionForAH);
         }
      }
      
      public function moveSelectionForAH(e:MouseEvent = null) : *
      {
         if(this._canvas.hitTestPoint(mouseX,mouseY,true))
         {
            this._spriteAhSelect.graphics.clear();
            this._spriteAhSelect.graphics.lineStyle(1,0,1);
            this._spriteAhSelect.graphics.beginFill(0,0.2);
            this._spriteAhSelect.graphics.drawRect(this.startPoint.x,this.startPoint.y,this._canvas.mouseX - this.startPoint.x,this._canvas.mouseY - this.startPoint.y);
            this._spriteAhSelect.graphics.endFill();
         }
      }
      
      public function stopSelectionForAH(e:MouseEvent = null) : *
      {
         var _bounds:* = undefined;
         var _s:* = undefined;
         var _bmpDataCanvas:BitmapData = null;
         var _m:Matrix = null;
         stage.addEventListener(MouseEvent.MOUSE_DOWN,this.startSelectionForAH);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.stopSelectionForAH);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.moveSelectionForAH);
         _bounds = this._spriteAhSelect.getBounds(this._canvas);
         if(this._spriteAhSelect)
         {
            if(this._canvas.contains(this._spriteAhSelect))
            {
               this._canvas.removeChild(this._spriteAhSelect);
            }
            this._spriteAhSelect = null;
         }
         if(10 < _bounds.width && 10 < _bounds.height)
         {
            _s = 2;
            _bmpDataCanvas = new BitmapData(this._canvas.width * _s,this._canvas.height * _s);
            _m = new Matrix();
            _m.scale(_s,_s);
            _bmpDataCanvas.draw(this._canvas,_m,null,BlendMode.LAYER,null,true);
            this._ahData = new Object();
            this._ahData.bounds = {
               "x":Math.floor(_bounds.x),
               "y":Math.floor(_bounds.y),
               "width":Math.ceil(_bounds.width),
               "height":Math.ceil(_bounds.height)
            };
            this._ahData.bd = new BitmapData(_bounds.width * _s,_bounds.height * _s);
            this._ahData.bd.copyPixels(_bmpDataCanvas,new Rectangle(Math.floor(_bounds.x * _s),Math.floor(_bounds.y * _s),Math.ceil(_bounds.width * _s),Math.ceil(_bounds.height * _s)),new Point());
            this.cancelAH();
            this.openAhSaveModal();
         }
      }
      
      public function openAhSaveModal(e:MouseEvent = null) : *
      {
         this._bitmapAh = new Bitmap(this._ahData.bd,"auto",true);
         this._bitmapAh.scaleX = this._bitmapAh.scaleY = Math.min(this.panelAhSave.con.imageBG.width / this._bitmapAh.width,this.panelAhSave.con.imageBG.height / this._bitmapAh.height);
         this._bitmapAh.x = (this.panelAhSave.con.imageBG.width - this._bitmapAh.width) / 2 + this.panelAhSave.con.imageBG.x;
         this._bitmapAh.y = (this.panelAhSave.con.imageBG.height - this._bitmapAh.height) / 2 + this.panelAhSave.con.imageBG.y;
         this.panelAhSave.con.addChild(this._bitmapAh);
         this.panelAhSave.con.txtName.text = "";
         this.panelAhSave.con.txtInfo.text = "";
         this.panelAhSave.visible = true;
         this.panelAhSave.con.mcPicker.refreshDate();
         this.panelAhSave.con.radioDate0.selected = true;
         this.ahDateChange();
         this.addStage(this.panelAhSave);
         this.panelAhSave.con.close.addEventListener(MouseEvent.CLICK,this.closeAhPanel);
         this.panelAhSave.con.bdelete.addEventListener(MouseEvent.CLICK,this.closeAhPanel);
         this.panelAhSave.con.bsave.addEventListener(MouseEvent.CLICK,this.ahSaveHandler);
         this.panelAhSave.con.radioDate0.addEventListener(Event.CHANGE,this.ahDateChange);
         this.panelAhSave.con.radioDate1.addEventListener(Event.CHANGE,this.ahDateChange);
      }
      
      public function closeAhPanel(e:MouseEvent = null) : *
      {
         this.panelAhSave.visible = false;
         if(this._bitmapAh)
         {
            if(this.panelAhSave.con.contains(this._bitmapAh))
            {
               this.panelAhSave.con.removeChild(this._bitmapAh);
            }
            this._bitmapAh = null;
         }
         this.panelAhSave.con.txtName.text = "";
         this.panelAhSave.con.txtInfo.text = "";
         this.panelAhSave.con.close.removeEventListener(MouseEvent.CLICK,this.closeAhPanel);
         this.panelAhSave.con.bdelete.removeEventListener(MouseEvent.CLICK,this.closeAhPanel);
         this.panelAhSave.con.bsave.removeEventListener(MouseEvent.CLICK,this.ahSaveHandler);
         this.panelAhSave.con.radioDate0.removeEventListener(Event.CHANGE,this.ahDateChange);
         this.panelAhSave.con.radioDate1.removeEventListener(Event.CHANGE,this.ahDateChange);
      }
      
      public function ahDateChange(e:Event = null) : *
      {
         if(this.panelAhSave.con.radioDate0.selected)
         {
            this.panelAhSave.con.mcPicker.alpha = 0.2;
            this.panelAhSave.con.mcPicker.mouseEnabled = false;
            this.panelAhSave.con.mcPicker.mouseChildren = false;
         }
         else if(this.panelAhSave.con.radioDate1.selected)
         {
            this.panelAhSave.con.mcPicker.alpha = 1;
            this.panelAhSave.con.mcPicker.mouseEnabled = true;
            this.panelAhSave.con.mcPicker.mouseChildren = true;
         }
      }
      
      public function ahSaveHandler(e:MouseEvent = null) : *
      {
         var _zipFM:FileManager = null;
         if(!Network.status)
         {
            this.warning("İnternet bağlantınıza erişim yok. İnternet bağlantızı kontrol edip tekrar deneyin.");
            return;
         }
         if(this.panelAhSave.con.txtName.text == "")
         {
            this.warning("Lütfen ödev ismi girin.");
            return;
         }
         if(!User.token)
         {
            this.accountHandler();
            return;
         }
         this.showLoading();
         this._ahData.file = "odev_" + VectorVideo.dateTime() + ".png";
         this._ahData.page = this.guncelSayfa;
         this._ahData.pdf_page = this._book.currentFrame;
         this._ahData.book_name = this._bookName;
         this._ahData.name = this.panelAhSave.con.txtName.text;
         this._ahData.info = this.panelAhSave.con.txtInfo.text;
         if(this.panelAhSave.con.radioDate0.selected)
         {
            this._ahData.end_date = "";
         }
         else
         {
            this._ahData.end_date = this.panelAhSave.con.mcPicker.getStart();
         }
         this._ahData.x = this._ahData.bounds.x;
         this._ahData.y = this._ahData.bounds.y;
         this._ahData.width = this._ahData.bounds.width;
         this._ahData.height = this._ahData.bounds.height;
         this._ahData.date_sort = this._ahDateSort;
         this._ahData.page_sort = this._ahPageSort;
         _zipFM = new FileManager();
         _zipFM.addEventListener(IOErrorEvent.IO_ERROR,this.ahSaveError);
         _zipFM.addEventListener(Event.COMPLETE,function():void
         {
            var _aHFileUploader:AHFileUploader = null;
            _aHFileUploader = new AHFileUploader();
            _aHFileUploader.onError = function(e:*):*
            {
               hideLoading();
               warning(e);
            };
            _aHFileUploader.onComplete = function(_d:*):*
            {
               var _w:* = undefined;
               hideLoading();
               closeAhPanel();
               _w = new Object();
               _w.id = _d.activehomework.id;
               _w.name = _d.activehomework.name;
               _w.info = _d.activehomework.info;
               _w.file = _d.activehomework.file;
               _w.file_url = _d.activehomework.file_url;
               _ahList = _d.list;
               updateAhList();
               openPanelAhStatus(_w);
            };
            _aHFileUploader.start(_ahData);
         });
         _zipFM.writeFile(new File(this._assPath + this._ahData.file).url,PNGEncoder.encode(this._ahData.bd));
      }
      
      public function ahSaveError(e:* = null) : *
      {
         this.hideLoading();
         this.warning("Ödev kaydedilirken hata oluştu. Lütfen tekrar deneyin.");
      }
      
      public function ahItemHandler(e:MouseEvent = null) : *
      {
         var _index:* = undefined;
         var _o:* = undefined;
         if(!this.clickControl())
         {
            return;
         }
         _index = int(e.currentTarget.parent.name);
         _o = this._ahList[_index];
         if(e.currentTarget.name == "bstatus")
         {
            this.openPanelAhStatus(_o);
         }
         else if(e.currentTarget.name == "bshow")
         {
            if(new File(this._assPath + _o.file).exists)
            {
               this.openObjectPanel(this._assPath + _o.file,"img");
            }
            else
            {
               this.openObjectPanel(_o.file_url,"img");
            }
         }
         else if(e.currentTarget.name == "bdelete")
         {
            if(!Network.status)
            {
               this.warning("İnternet bağlantınıza erişim yok. İnternet bağlantızı kontrol edip tekrar deneyin.");
               return;
            }
            this.ask(function():*
            {
               var _urlRequest:URLRequest = null;
               var _urlVariable:URLVariables = null;
               var _json:KryJSON = null;
               showLoading();
               _urlRequest = new URLRequest(_cloudBase);
               _urlVariable = new URLVariables();
               _urlVariable.action = "activehomework_delete";
               _urlVariable.token = User.token;
               _urlVariable.file = _o.file;
               _urlRequest.data = _urlVariable;
               _urlRequest.method = URLRequestMethod.POST;
               _json = new KryJSON(_urlRequest,true);
               _json.onError = function():*
               {
                  hideLoading();
                  warning("İşlem sırasında hata oluştu. Lütfen tekrar deneyin.");
               };
               _json.onComplete = function(e:*):*
               {
                  hideLoading();
                  if(e.error)
                  {
                     warning(String(e.error));
                     return;
                  }
                  if(e.status)
                  {
                     FileManager.deleteFile(_assPath + _o.file);
                     _ahList.splice(_index,1);
                     updateAhList();
                  }
                  else
                  {
                     warning("İşlem sırasında hata oluştu. Lütfen tekrar deneyin.");
                  }
               };
               _json.start();
            },_o.name + " (Ödev No: " + _o.id + ")" + " isimli ödevi silmek istiyor musunuz?");
         }
      }
      
      public function openPanelAhStatus(_o:Object) : *
      {
         var _urlRequest:URLRequest = null;
         var _urlVariable:URLVariables = null;
         var _json:KryJSON = null;
         this.showLoading();
         this._selectedAh = _o;
         _urlRequest = new URLRequest(this._cloudBase);
         _urlVariable = new URLVariables();
         _urlVariable.action = "activehomework_status";
         _urlVariable.token = User.token;
         _urlVariable.file = this._selectedAh.file;
         _urlRequest.data = _urlVariable;
         _urlRequest.method = URLRequestMethod.POST;
         _json = new KryJSON(_urlRequest,true);
         _json.onError = function():*
         {
            hideLoading();
            warning("İşlem sırasında hata oluştu. Lütfen tekrar deneyin.");
         };
         _json.onComplete = function(e:*):*
         {
            var _path:* = undefined;
            var _i:* = undefined;
            var _u:Object = null;
            hideLoading();
            if(e.error)
            {
               warning(String(e.error));
               return;
            }
            if(e.status)
            {
               _path = "";
               if(new File(_assPath + _selectedAh.file).exists)
               {
                  _path = _assPath + _selectedAh.file;
               }
               else
               {
                  _path = _selectedAh.file_url;
               }
               _imageLoaderAh = new ImageLoader(_path,{
                  "name":"img",
                  "smoothing":true,
                  "onComplete":function():*
                  {
                     var _padding:* = undefined;
                     _padding = 5;
                     _imageLoaderAh.rawContent.scaleX = _imageLoaderAh.rawContent.scaleY = Math.min((panelAhStatus.con.imageBG.width - _padding * 2) / _imageLoaderAh.rawContent.width,(panelAhStatus.con.imageBG.height - _padding * 2) / _imageLoaderAh.rawContent.height);
                     _imageLoaderAh.rawContent.x = (panelAhStatus.con.imageBG.width - _padding * 2 - _imageLoaderAh.rawContent.width) / 2 + panelAhStatus.con.imageBG.x + _padding;
                     _imageLoaderAh.rawContent.y = (panelAhStatus.con.imageBG.height - _padding * 2 - _imageLoaderAh.rawContent.height) / 2 + panelAhStatus.con.imageBG.y + _padding;
                     panelAhStatus.con.addChild(_imageLoaderAh.rawContent);
                     _imageLoaderAh.rawContent.addEventListener(MouseEvent.CLICK,openAhImage);
                  }
               });
               _imageLoaderAh.load(true);
               _selectedAh.name = e.name;
               _selectedAh.info = e.info;
               _selectedAh.created_datetime = "Ödev No: " + e.id + " | " + e.created_datetime;
               _selectedAh.share_url = e.share_url;
               _selectedAh.info_datetime = e.info_datetime;
               _selectedAh.list = e.list;
               _selectedAh.publish = e.publish;
               _selectedAh.share = e.share;
               _selectedAh.export_url = e.export_url;
               panelAhStatus.con.txtName.text = _selectedAh.name;
               panelAhStatus.con.txtInfo.text = _selectedAh.info;
               panelAhStatus.con.txtLink.text = _selectedAh.share_url;
               panelAhStatus.con.txtDate.text = _selectedAh.created_datetime;
               panelAhStatus.con.txtDateInfo.text = _selectedAh.info_datetime;
               truncateTF(panelAhStatus.con.txtName);
               truncateTF(panelAhStatus.con.txtInfo);
               truncateTF(panelAhStatus.con.txtLink);
               truncateTF(panelAhStatus.con.txtDate);
               truncateTF(panelAhStatus.con.txtDateInfo);
               panelAhStatus.con.bstatus.gotoAndStop(int(_selectedAh.publish) + 1);
               panelAhStatus.con.close.addEventListener(MouseEvent.CLICK,closePanelAhStatus);
               panelAhStatus.con.bopen.addEventListener(MouseEvent.CLICK,openAhShareUrl);
               panelAhStatus.con.bcopy.addEventListener(MouseEvent.CLICK,copyAhShareUrl);
               panelAhStatus.con.imageBG.addEventListener(MouseEvent.CLICK,openAhImage);
               panelAhStatus.con.brefresh.addEventListener(MouseEvent.CLICK,refreshAhStatus);
               panelAhStatus.con.bstatus.addEventListener(MouseEvent.CLICK,changeAhStatus);
               panelAhStatus.con.bshare0.addEventListener(MouseEvent.CLICK,shareAh);
               panelAhStatus.con.bshare1.addEventListener(MouseEvent.CLICK,shareAh);
               panelAhStatus.con.bshare2.addEventListener(MouseEvent.CLICK,shareAh);
               panelAhStatus.con.bexport.addEventListener(MouseEvent.CLICK,exportAh);
               removeItems(panelAhStatus.con.contentAhStatus);
               _i = 0;
               panelAhStatus.con.txtTotal.text = "Toplam " + _selectedAh.list.length + " kişi";
               for each(_u in _selectedAh.list)
               {
                  _u.mc = new libAhStatusItem();
                  _u.mc.name = _i.toString();
                  _u.mc.txtName.text = _u.name;
                  truncateTF(_u.mc.txtName);
                  _u.mc.txtTime.text = "Süre : " + _u.min;
                  _u.mc.txtPoint.text = "Puan : " + _u.point;
                  _u.mc.txtMove.text = "Adım : " + _u.number_of_moves;
                  _u.mc.txtStatus.text = "Durum : " + _u.status;
                  _u.mc.txtDate.text = _u.datetime;
                  _u.mc.y = _i * _u.mc.height;
                  panelAhStatus.con.contentAhStatus.addChild(_u.mc);
                  _u.mc.txtOpen.addEventListener(MouseEvent.CLICK,ahStatusItemHandler);
                  _i++;
               }
               if(_selectedAh.list.length == 0)
               {
                  panelAhStatus.con.txtError.text = "Ödevi yapan öğrenci bulunmamaktadır.";
                  panelAhStatus.con.txtError.visible = true;
               }
               else
               {
                  panelAhStatus.con.txtError.text = "";
                  panelAhStatus.con.txtError.visible = false;
               }
               panelAhStatus.con.contentAhStatus.y = panelAhStatus.con.mcMask.y;
               panelAhStatus.con.contentAhStatus.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandlerK);
               ScrollClass.remove(panelAhStatus.con.contentAhStatus);
               ScrollClass.add(panelAhStatus.con.contentAhStatus,panelAhStatus.con.mcMask);
               ScrollClass.enable(panelAhStatus.con.contentAhStatus);
               panelAhStatus.visible = true;
               addStage(panelAhStatus);
            }
            else
            {
               warning("İşlem sırasında hata oluştu. Lütfen tekrar deneyin.");
            }
         };
         _json.start();
      }
      
      public function closePanelAhStatus(e:MouseEvent = null) : *
      {
         this.panelAhStatus.visible = false;
         this.panelAhStatus.con.close.removeEventListener(MouseEvent.CLICK,this.closePanelAhStatus);
         this.panelAhStatus.con.bopen.removeEventListener(MouseEvent.CLICK,this.openAhShareUrl);
         this.panelAhStatus.con.bcopy.removeEventListener(MouseEvent.CLICK,this.copyAhShareUrl);
         this.panelAhStatus.con.imageBG.removeEventListener(MouseEvent.CLICK,this.openAhImage);
         this.panelAhStatus.con.brefresh.removeEventListener(MouseEvent.CLICK,this.refreshAhStatus);
         this.panelAhStatus.con.bstatus.removeEventListener(MouseEvent.CLICK,this.changeAhStatus);
         this.panelAhStatus.con.contentAhStatus.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandlerK);
         this.panelAhStatus.con.bshare0.removeEventListener(MouseEvent.CLICK,this.shareAh);
         this.panelAhStatus.con.bshare1.removeEventListener(MouseEvent.CLICK,this.shareAh);
         this.panelAhStatus.con.bshare2.removeEventListener(MouseEvent.CLICK,this.shareAh);
         this.panelAhStatus.con.bexport.removeEventListener(MouseEvent.CLICK,this.exportAh);
         this.panelAhStatus.con.txtName.text = "";
         this.panelAhStatus.con.txtInfo.text = "";
         this.panelAhStatus.con.txtLink.text = "";
         this.panelAhStatus.con.txtDate.text = "";
         this.panelAhStatus.con.txtDateInfo.text = "";
         if(this._imageLoaderAh)
         {
            if(this._imageLoaderAh.rawContent)
            {
               if(this.panelAhStatus.con.contains(this._imageLoaderAh.rawContent))
               {
                  this.panelAhStatus.con.removeChild(this._imageLoaderAh.rawContent);
               }
            }
            this._imageLoaderAh.dispose(true);
            this._imageLoaderAh = null;
         }
         this.removeItems(this.panelAhStatus.con.contentAhStatus);
         ScrollClass.disable(this.panelAhStatus.con.contentAhStatus);
         ScrollClass.remove(this.panelAhStatus.con.contentAhStatus);
      }
      
      public function exportAh(e:MouseEvent) : *
      {
         navigateToURL(new URLRequest(this._selectedAh.export_url));
      }
      
      public function openAhShareUrl(e:MouseEvent) : *
      {
         navigateToURL(new URLRequest(this._selectedAh.share_url));
      }
      
      public function copyAhShareUrl(e:MouseEvent) : *
      {
         Clipboard.generalClipboard.clear();
         Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT,this._selectedAh.share_url,false);
         this.warning("Bağlantı kopyalandı.");
      }
      
      public function openAhImage(e:MouseEvent) : *
      {
         var _path:* = undefined;
         _path = "";
         if(new File(this._assPath + this._selectedAh.file).exists)
         {
            _path = this._assPath + this._selectedAh.file;
         }
         else
         {
            _path = this._selectedAh.file_url;
         }
         this.openObjectPanel(_path,"img");
      }
      
      public function refreshAhStatus(e:MouseEvent) : *
      {
         this.closePanelAhStatus();
         this.openPanelAhStatus(this._selectedAh);
      }
      
      public function ahStatusItemHandler(e:MouseEvent) : *
      {
         navigateToURL(new URLRequest(this._selectedAh.list[e.currentTarget.parent.name].url));
      }
      
      public function shareAh(e:MouseEvent) : *
      {
         var _type:String = null;
         if(e.currentTarget.name == "bshare0")
         {
            _type = "whatsapp";
         }
         if(e.currentTarget.name == "bshare1")
         {
            _type = "telegram";
         }
         if(e.currentTarget.name == "bshare2")
         {
            _type = "qr";
         }
         if(e.currentTarget.name == "bshare2")
         {
            this.openObjectPanel(String(this._selectedAh.share + "&type=" + _type),"img");
         }
         else
         {
            navigateToURL(new URLRequest(String(this._selectedAh.share + "&type=" + _type)));
         }
      }
      
      public function changeAhStatus(e:MouseEvent) : *
      {
         this.ask(function():*
         {
            var _urlRequest:URLRequest = null;
            var _urlVariable:URLVariables = null;
            var _json:KryJSON = null;
            showLoading();
            _urlRequest = new URLRequest(_cloudBase);
            _urlVariable = new URLVariables();
            _urlVariable.action = "activehomework_change_publish";
            _urlVariable.token = User.token;
            _urlVariable.file = _selectedAh.file;
            _urlVariable.publish = _selectedAh.publish == 0 ? 1 : 0;
            _urlRequest.data = _urlVariable;
            _urlRequest.method = URLRequestMethod.POST;
            _json = new KryJSON(_urlRequest,true);
            _json.onError = function():*
            {
               hideLoading();
               warning("İşlem sırasında hata oluştu. Lütfen tekrar deneyin.");
            };
            _json.onComplete = function(e:*):*
            {
               hideLoading();
               if(e.error)
               {
                  warning(String(e.error));
                  return;
               }
               if(e.status)
               {
                  _selectedAh.publish = e.publish;
                  panelAhStatus.con.bstatus.gotoAndStop(int(_selectedAh.publish) + 1);
               }
               else
               {
                  warning("İşlem sırasında hata oluştu. Lütfen tekrar deneyin.");
               }
            };
            _json.start();
         },this._selectedAh.name + " isimli ödevin durumunu değiştirmek istiyor musunuz?");
      }
      
      public function openPanelMeeting(e:MouseEvent = null) : *
      {
         if(!Network.status)
         {
            this.warning("İnternet bağlantınıza erişim yok. İnternet bağlantızı kontrol edip tekrar deneyin.");
            return;
         }
         if(!User.token)
         {
            this.accountHandler();
            return;
         }
         if(this.panelMeeting.visible)
         {
            this.closePanelMeeting();
            return;
         }
         TweenMax.killTweensOf(this.panelMeeting);
         if(this.panelVideoSolution.visible)
         {
            this.videoSolutionHandler();
         }
         if(this.mcEbaPanel.visible)
         {
            this.closeEbaList();
         }
         if(this.panelVV.visible)
         {
            this.vvPanelHandler();
         }
         if(this.panelAh.visible)
         {
            this.closePanelAh();
         }
         this.footer.btnMeeting.gotoAndStop(2);
         this.footer.btnMeeting.bg.gotoAndPlay(2);
         this.panelMeeting.visible = true;
         TweenMax.to(this.panelMeeting,this._tweenTime,{"x":this._capX - this.panelAh.width});
         this.addStage(this.panelMeeting);
         this.panelMeeting.close.addEventListener(MouseEvent.CLICK,this.closePanelMeeting);
         this.panelMeeting.bnew.addEventListener(MouseEvent.CLICK,this.newMeeting);
         this.panelMeeting.brefresh.addEventListener(MouseEvent.CLICK,this.getMeetingData);
         this.panelMeeting.bsort.addEventListener(MouseEvent.CLICK,this.meetingdatesort_handler);
         this.getMeetingData();
      }
      
      public function closePanelMeeting(e:MouseEvent = null) : *
      {
         TweenMax.killTweensOf(this.panelMeeting);
         this.footer.btnMeeting.gotoAndStop(1);
         this.footer.btnMeeting.bg.gotoAndPlay(2);
         TweenMax.to(this.panelMeeting,this._tweenTime,{
            "x":this._capX,
            "visible":false
         });
         this.panelMeeting.contentMeeting.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandlerK);
         this.panelMeeting.close.removeEventListener(MouseEvent.CLICK,this.closePanelMeeting);
         this.panelMeeting.bnew.removeEventListener(MouseEvent.CLICK,this.newMeeting);
         this.panelMeeting.brefresh.removeEventListener(MouseEvent.CLICK,this.getMeetingData);
         this.panelMeeting.bsort.removeEventListener(MouseEvent.CLICK,this.meetingdatesort_handler);
         this._meetingData = null;
         this._selectedMeeting = null;
         this.removeItems(this.panelMeeting.contentMeeting);
         ScrollClass.disable(this.panelMeeting.contentMeeting);
         ScrollClass.remove(this.panelMeeting.contentMeeting);
      }
      
      public function meetingdatesort_handler(e:MouseEvent = null) : *
      {
         this._meetingDateSort = this._meetingDateSort == 0 ? 1 : 0;
         this.panelMeeting.bsort.gotoAndStop(this._meetingDateSort + 1);
         this.getMeetingData();
      }
      
      public function getMeetingData(e:MouseEvent = null) : *
      {
         var _urlRequest:URLRequest = null;
         var _urlVariable:URLVariables = null;
         var _json:KryJSON = null;
         this.showLoading();
         _urlRequest = new URLRequest(this._cloudBase);
         _urlVariable = new URLVariables();
         _urlVariable.action = "onlineclassroom_get_data";
         _urlVariable.token = User.token;
         _urlVariable.date_sort = this._meetingDateSort;
         _urlRequest.data = _urlVariable;
         _urlRequest.method = URLRequestMethod.POST;
         _json = new KryJSON(_urlRequest,true);
         _json.onError = function():*
         {
            hideLoading();
            closePanelMeeting();
            warning("İşlem sırasında hata oluştu. Lütfen tekrar deneyin.");
         };
         _json.onComplete = function(e:*):*
         {
            hideLoading();
            if(e.error)
            {
               warning(String(e.error));
               closePanelMeeting();
               return;
            }
            if(e.status)
            {
               _meetingData = new Object();
               _meetingData.list = e.list;
               _meetingData.providers = e.providers;
               _meetingData.zoom_authorization = e.zoom_authorization;
               _meetingData.zoom_account = e.zoom_account;
               panelMeeting.txtCode.text = e.book_code;
               updateMeetingList();
            }
            else
            {
               warning("İşlem sırasında hata oluştu. Lütfen tekrar deneyin.");
               closePanelMeeting();
            }
         };
         _json.start();
      }
      
      public function updateMeetingList() : *
      {
         var _i:* = undefined;
         var _u:Object = null;
         this.removeItems(this.panelMeeting.contentMeeting);
         _i = 0;
         for each(_u in this._meetingData.list)
         {
            _u.mc = null;
            _u.mc = new libMeetingListItem();
            _u.mc.name = _i.toString();
            _u.mc.txtName.text = _u.name;
            _u.mc.txtDate.text = _u.start_datetime;
            this.truncateTF(_u.mc.txtName);
            this.truncateTF(_u.mc.txtDate);
            _u.mc.y = _i * _u.mc.height;
            _u.mc.bshow.addEventListener(MouseEvent.CLICK,this.meetingListItemHandler);
            _u.mc.bdelete.addEventListener(MouseEvent.CLICK,this.meetingListItemHandler);
            this.panelMeeting.contentMeeting.addChild(_u.mc);
            _i++;
         }
         this.panelMeeting.contentMeeting.y = this.panelMeeting.mcMask.y;
         this.panelMeeting.contentMeeting.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandlerK);
         ScrollClass.remove(this.panelMeeting.contentMeeting);
         ScrollClass.add(this.panelMeeting.contentMeeting,this.panelMeeting.mcMask);
         ScrollClass.enable(this.panelMeeting.contentMeeting);
         this.zoomStatusUpdate();
      }
      
      public function zoomStatusUpdate(e:MouseEvent = null) : *
      {
         this.panelMeeting.txtZoom.text = this._meetingData.zoom_account;
         this.truncateTF(this.panelMeeting.txtZoom);
         this.panelMeeting.bzoom.removeEventListener(MouseEvent.CLICK,this.zoomConfirm);
         this.panelMeeting.bzoom.removeEventListener(MouseEvent.CLICK,this.zoomCancel);
         if(this._meetingData.zoom_authorization)
         {
            this.panelMeeting.bzoom.gotoAndStop(1);
            this.panelMeeting.bzoom.addEventListener(MouseEvent.CLICK,this.zoomConfirm);
         }
         else
         {
            this.panelMeeting.bzoom.gotoAndStop(2);
            this.panelMeeting.bzoom.addEventListener(MouseEvent.CLICK,this.zoomCancel);
         }
      }
      
      public function newMeeting(e:MouseEvent = null) : *
      {
         if(this._meetingData == null)
         {
            return;
         }
         this.panelMeetingAdd.con.setProvider(this._meetingData.providers);
         this.panelMeetingAdd.visible = true;
         this.panelMeetingAdd.con.datePicker.refreshDate();
         this.addStage(this.panelMeetingAdd);
         this.panelMeetingAdd.con.close.addEventListener(MouseEvent.CLICK,this.closeNewMeeting);
         this.panelMeetingAdd.con.bsave.addEventListener(MouseEvent.CLICK,this.saveNewMeeting);
      }
      
      public function closeNewMeeting(e:MouseEvent = null) : *
      {
         this.panelMeetingAdd.visible = false;
         this.panelMeetingAdd.con.close.removeEventListener(MouseEvent.CLICK,this.closeNewMeeting);
         this.panelMeetingAdd.con.bsave.removeEventListener(MouseEvent.CLICK,this.saveNewMeeting);
         this.panelMeetingAdd.con.txtName.text = "";
      }
      
      public function saveNewMeeting(e:MouseEvent = null) : *
      {
         if(this.panelMeetingAdd.con.txtName.text == "")
         {
            this.warning("Lütfen bir isim girin.");
            return;
         }
         if(!User.token)
         {
            this.accountHandler();
            return;
         }
         if(this.panelMeetingAdd.con.comboProvider.selectedItem.data.toString() == "zoom" && this._meetingData.zoom_authorization)
         {
            this.zoomConfirm(null,this.confirmNewMeeting);
         }
         else
         {
            this.confirmNewMeeting();
         }
      }
      
      public function zoomConfirm(e:MouseEvent = null, _f:Function = null) : *
      {
         this._zoomFunc = _f;
         navigateToURL(new URLRequest(this._meetingData.zoom_authorization));
         this.panelZoom.con.bcancel.addEventListener(MouseEvent.CLICK,this.cancelZoomAuth);
         this.addStage(this.panelZoom);
         this.panelZoom.visible = true;
         this._zoomInterval = setInterval(this.checkZoomAuth,10000);
      }
      
      public function zoomCancel(e:MouseEvent = null) : *
      {
         this.ask(this.zoomCancelConfirm,"Zoom hesabından çıkış yapmak istiyor musunuz?");
      }
      
      public function zoomCancelConfirm(e:MouseEvent = null) : *
      {
         var _urlRequest:URLRequest = null;
         var _urlVariable:URLVariables = null;
         if(this._zoomJson)
         {
            this._zoomJson.dispose();
            this._zoomJson = null;
         }
         this.showLoading();
         _urlRequest = new URLRequest(this._cloudBase);
         _urlVariable = new URLVariables();
         _urlVariable.action = "onlineclassroom_uncheck_zoom";
         _urlVariable.token = User.token;
         _urlRequest.data = _urlVariable;
         _urlRequest.method = URLRequestMethod.POST;
         this._zoomJson = new KryJSON(_urlRequest,true);
         this._zoomJson.onError = function():*
         {
            hideLoading();
            warning("İşlem sırasında hata oluştu. Tekrar deneyin.");
         };
         this._zoomJson.onComplete = function(e:*):*
         {
            hideLoading();
            if(e.error)
            {
               warning(String(e.error));
               return;
            }
            if(e.status)
            {
               _meetingData.zoom_authorization = e.zoom_authorization;
               _meetingData.zoom_account = e.zoom_account;
               zoomStatusUpdate();
            }
         };
         this._zoomJson.start();
      }
      
      public function checkZoomAuth(e:MouseEvent = null) : *
      {
         var _urlRequest:URLRequest = null;
         var _urlVariable:URLVariables = null;
         if(this._zoomJson)
         {
            this._zoomJson.dispose();
            this._zoomJson = null;
         }
         _urlRequest = new URLRequest(this._cloudBase);
         _urlVariable = new URLVariables();
         _urlVariable.action = "onlineclassroom_check_zoom";
         _urlVariable.token = User.token;
         _urlRequest.data = _urlVariable;
         _urlRequest.method = URLRequestMethod.POST;
         this._zoomJson = new KryJSON(_urlRequest,true);
         this._zoomJson.onError = function():*
         {
            trace("zoom error");
         };
         this._zoomJson.onComplete = function(e:*):*
         {
            if(e.error)
            {
               trace(String(e.error));
               return;
            }
            if(e.status)
            {
               cancelZoomAuth();
               _meetingData.zoom_authorization = e.zoom_authorization;
               _meetingData.zoom_account = e.zoom_account;
               zoomStatusUpdate();
               if(_zoomFunc != null)
               {
                  _zoomFunc();
               }
            }
         };
         this._zoomJson.start();
      }
      
      public function cancelZoomAuth(e:MouseEvent = null) : *
      {
         this.panelZoom.con.bcancel.removeEventListener(MouseEvent.CLICK,this.cancelZoomAuth);
         clearInterval(this._zoomInterval);
         if(this._zoomJson)
         {
            this._zoomJson.dispose();
            this._zoomJson = null;
         }
         this.panelZoom.visible = false;
      }
      
      public function confirmNewMeeting(e:MouseEvent = null) : *
      {
         var _urlRequest:URLRequest = null;
         var _urlVariable:URLVariables = null;
         var _json:KryJSON = null;
         this.showLoading();
         _urlRequest = new URLRequest(this._cloudBase);
         _urlVariable = new URLVariables();
         _urlVariable.action = "onlineclassroom_save";
         _urlVariable.token = User.token;
         _urlVariable.name = this.panelMeetingAdd.con.txtName.text;
         _urlVariable.provider = this.panelMeetingAdd.con.comboProvider.selectedItem.data;
         _urlVariable.duration = this.panelMeetingAdd.con.comboDuration.selectedItem.data;
         _urlVariable.start_datetime = this.panelMeetingAdd.con.datePicker.getStart();
         _urlRequest.data = _urlVariable;
         _urlRequest.method = URLRequestMethod.POST;
         _json = new KryJSON(_urlRequest,true);
         _json.onError = function():*
         {
            hideLoading();
            warning("İşlem sırasında hata oluştu. Lütfen tekrar deneyin.");
         };
         _json.onComplete = function(e:*):*
         {
            var _w:Object = null;
            hideLoading();
            if(e.error)
            {
               warning(String(e.error));
               return;
            }
            if(e.status)
            {
               closeNewMeeting();
               warning(e.success);
               _w = new Object();
               _w.name = e.onlineclassroom.name;
               _w.start_datetime = e.onlineclassroom.start_datetime;
               _w.id = e.onlineclassroom.id;
               _w.url_client = e.onlineclassroom.url_client;
               _w.url_host = e.onlineclassroom.url_host;
               _w.provider = e.onlineclassroom.provider;
               _w.share = e.onlineclassroom.share;
               if(_meetingData == null)
               {
                  _meetingData = new Object();
               }
               if(_meetingData.list == null)
               {
                  _meetingData.list = new Array();
               }
               if(_meetingDateSort == 0)
               {
                  _meetingData.list.insertAt(0,_w);
               }
               else
               {
                  _meetingData.list.push(_w);
               }
               updateMeetingList();
            }
            else
            {
               warning("İşlem sırasında hata oluştu. Lütfen tekrar deneyin.");
            }
         };
         _json.start();
      }
      
      public function meetingListItemHandler(e:MouseEvent = null) : *
      {
         var _index:* = undefined;
         _index = int(e.currentTarget.parent.name);
         this._selectedMeeting = this._meetingData.list[_index];
         if(e.currentTarget.name == "bshow")
         {
            this.panelMeetingInfo.con.txtName.text = this._selectedMeeting.name;
            this.panelMeetingInfo.con.txtInfo.text = this._selectedMeeting.start_datetime + "\n" + this._selectedMeeting.provider;
            this.panelMeetingInfo.con.txtLink1.text = this._selectedMeeting.url_host;
            this.panelMeetingInfo.con.txtLink2.text = this._selectedMeeting.url_client;
            this.truncateTF(this.panelMeetingInfo.con.txtName);
            this.truncateTF(this.panelMeetingInfo.con.txtInfo);
            this.truncateTF(this.panelMeetingInfo.con.txtLink1);
            this.truncateTF(this.panelMeetingInfo.con.txtLink2);
            this.panelMeetingInfo.visible = true;
            this.addStage(this.panelMeetingInfo);
            this.panelMeetingInfo.con.close.addEventListener(MouseEvent.CLICK,this.closeMeetingInfo);
            this.panelMeetingInfo.con.bcopy1.addEventListener(MouseEvent.CLICK,this.meetingInfoHandler);
            this.panelMeetingInfo.con.bopen1.addEventListener(MouseEvent.CLICK,this.meetingInfoHandler);
            this.panelMeetingInfo.con.bcopy2.addEventListener(MouseEvent.CLICK,this.meetingInfoHandler);
            this.panelMeetingInfo.con.bopen2.addEventListener(MouseEvent.CLICK,this.meetingInfoHandler);
            this.panelMeetingInfo.con.bshare0.addEventListener(MouseEvent.CLICK,this.meetingInfoHandler);
            this.panelMeetingInfo.con.bshare1.addEventListener(MouseEvent.CLICK,this.meetingInfoHandler);
            this.panelMeetingInfo.con.bshare2.addEventListener(MouseEvent.CLICK,this.meetingInfoHandler);
         }
         else
         {
            this.ask(function():*
            {
               var _urlRequest:URLRequest = null;
               var _urlVariable:URLVariables = null;
               var _json:KryJSON = null;
               showLoading();
               _urlRequest = new URLRequest(_cloudBase);
               _urlVariable = new URLVariables();
               _urlVariable.action = "onlineclassroom_delete";
               _urlVariable.token = User.token;
               _urlVariable.id = _selectedMeeting.id;
               _urlRequest.data = _urlVariable;
               _urlRequest.method = URLRequestMethod.POST;
               _json = new KryJSON(_urlRequest,true);
               _json.onError = function():*
               {
                  hideLoading();
                  warning("İşlem sırasında hata oluştu. Lütfen tekrar deneyin.");
               };
               _json.onComplete = function(e:*):*
               {
                  hideLoading();
                  if(e.error)
                  {
                     warning(String(e.error));
                     return;
                  }
                  if(e.status)
                  {
                     _meetingData.list.splice(_index,1);
                     updateMeetingList();
                  }
                  else
                  {
                     warning("İşlem sırasında hata oluştu. Lütfen tekrar deneyin.");
                  }
               };
               _json.start();
            },this._selectedMeeting.name + " isimli canlı dersi silmek istiyor musunuz?");
         }
      }
      
      public function closeMeetingInfo(e:MouseEvent = null) : *
      {
         this.panelMeetingInfo.visible = false;
         this.panelMeetingInfo.con.close.removeEventListener(MouseEvent.CLICK,this.closeMeetingInfo);
         this.panelMeetingInfo.con.bcopy1.removeEventListener(MouseEvent.CLICK,this.meetingInfoHandler);
         this.panelMeetingInfo.con.bopen1.removeEventListener(MouseEvent.CLICK,this.meetingInfoHandler);
         this.panelMeetingInfo.con.bcopy2.removeEventListener(MouseEvent.CLICK,this.meetingInfoHandler);
         this.panelMeetingInfo.con.bopen2.removeEventListener(MouseEvent.CLICK,this.meetingInfoHandler);
         this.panelMeetingInfo.con.bshare0.removeEventListener(MouseEvent.CLICK,this.meetingInfoHandler);
         this.panelMeetingInfo.con.bshare1.removeEventListener(MouseEvent.CLICK,this.meetingInfoHandler);
         this.panelMeetingInfo.con.bshare2.removeEventListener(MouseEvent.CLICK,this.meetingInfoHandler);
      }
      
      public function meetingInfoHandler(e:MouseEvent = null) : *
      {
         if(e.currentTarget.name == "bcopy1")
         {
            Clipboard.generalClipboard.clear();
            Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT,this._selectedMeeting.url_host,false);
            this.warning("Bağlantı kopyalandı.");
         }
         else if(e.currentTarget.name == "bopen1")
         {
            navigateToURL(new URLRequest(this._selectedMeeting.url_host));
         }
         else if(e.currentTarget.name == "bcopy2")
         {
            Clipboard.generalClipboard.clear();
            Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT,this._selectedMeeting.url_client,false);
            this.warning("Bağlantı kopyalandı.");
         }
         else if(e.currentTarget.name == "bopen2")
         {
            navigateToURL(new URLRequest(this._selectedMeeting.url_client));
         }
         else if(e.currentTarget.name == "bshare0")
         {
            navigateToURL(new URLRequest(String(this._selectedMeeting.share + "&type=whatsapp")));
         }
         else if(e.currentTarget.name == "bshare1")
         {
            navigateToURL(new URLRequest(String(this._selectedMeeting.share + "&type=telegram")));
         }
         else if(e.currentTarget.name == "bshare2")
         {
            this.openObjectPanel(String(this._selectedMeeting.share + "&type=qr"),"img");
         }
      }
      
      public function truncateTF(textField:TextField, addElipsis:Boolean = true, ellipsis:String = "…") : void
      {
         var _str:* = undefined;
         var margin:Number = 4;
         var stat:* = false;
         _str = textField.text;
         while(textField.textWidth > textField.width || textField.textHeight > textField.height)
         {
            _str = _str.slice(0,-4);
            textField.text = _str + "...";
         }
      }
      
      public function showVectorVideo(_r:Rectangle, _s:Number, _xoff:Number, _yoff:Number) : *
      {
         var _bmpDataT:BitmapData = null;
         var _m:Matrix = null;
         var _bd:BitmapData = null;
         if(this.selectItems.length - 1 == this.guncelIm)
         {
            return;
         }
         _bmpDataT = new BitmapData(this._book.width * _s,this._book.height * _s);
         _m = new Matrix();
         _m.scale(_s,_s);
         _bmpDataT.draw(this._book,_m,null,null,null,true);
         _bd = new BitmapData(_r.width * _s,_r.height * _s);
         _bd.copyPixels(_bmpDataT,new Rectangle(_r.x * _s,_r.y * _s,_r.width * _s,_r.height * _s),new Point());
         _bmpDataT = null;
         this._vectorVideo.showPanel(_bd,new Point(this._imPadding,this._imPadding),_s,"z_" + this._bookName + "_" + this.guncelIm,this._assPath,this.guncelSayfa - this._jump,this.guncelIm);
      }
      
      public function hideVectorVideo() : *
      {
         this._vectorVideo.hidePanel();
      }
      
      public function showLoadingText() : *
      {
         this.addStage(this.loadingText);
         this.loadingText.visible = true;
      }
      
      public function hideLoadingText() : *
      {
         this.loadingText.visible = false;
      }
      
      public function onStartedVV() : *
      {
         this.eraseScreen();
      }
      
      public function checkBookUpdate() : *
      {
         var _urlRequest:URLRequest = null;
         var _urlVariable:URLVariables = null;
         var _kk:KryJSON = null;
         if(this._operatingSystem != "windows")
         {
            return;
         }
         if(!FileManager.exists(this._mainFolderPath + this._mainFilename))
         {
            return;
         }
         _urlRequest = new URLRequest(this._publisherApi);
         _urlVariable = new URLVariables();
         _urlVariable.action = "check_book_update";
         _urlVariable.size = new File(this._mainFolderPath + this._mainFilename).size;
         _urlRequest.data = _urlVariable;
         _urlRequest.method = URLRequestMethod.POST;
         _kk = new KryJSON(_urlRequest,true);
         _kk.onComplete = function(e:*):*
         {
            var _nativeWindowInitOptions:NativeWindowInitOptions = null;
            if(e.status)
            {
               _panelUpdate = new libUpdatePanel();
               _panelUpdate.scaleX = _panelUpdate.scaleY = _realScale;
               _nativeWindowInitOptions = new NativeWindowInitOptions();
               _nativeWindowInitOptions.systemChrome = NativeWindowSystemChrome.STANDARD;
               _nativeWindowInitOptions.transparent = false;
               _nativeWindowInitOptions.resizable = false;
               _nativeWindowInitOptions.maximizable = false;
               _windowUpdate = new NativeWindow(_nativeWindowInitOptions);
               _windowUpdate.stage.frameRate = 60;
               _windowUpdate.title = "Kitap Güncelleştirmesi";
               _windowUpdate.stage.align = StageAlign.TOP_LEFT;
               _windowUpdate.stage.scaleMode = StageScaleMode.NO_SCALE;
               _windowUpdate.stage.stageWidth = _panelUpdate.width;
               _windowUpdate.stage.stageHeight = _panelUpdate.height;
               _windowUpdate.stage.addChild(_panelUpdate);
               _windowUpdate.x = (Capabilities.screenResolutionX - _windowUpdate.width) / 2;
               _windowUpdate.y = (Capabilities.screenResolutionY - _windowUpdate.height) / 2;
               _windowUpdate.addEventListener(Event.CLOSE,windowUpdateCloseEvent);
               _windowUpdate.activate();
               _panelUpdate.onComplete = bookUpdateComplete;
               _panelUpdate.onError = bookUpdateError;
               _panelUpdate.start(e.url,_mainFolderPath,_mainFilename);
            }
         };
         _kk.start();
      }
      
      public function windowUpdateCloseEvent(e:Event = null) : *
      {
         if(this._panelUpdate)
         {
            this._panelUpdate.disposeData();
            this._panelUpdate = null;
         }
         if(this._windowUpdate)
         {
            this._windowUpdate.removeEventListener(Event.CLOSE,this.windowUpdateCloseEvent);
            this._windowUpdate.close();
            this._windowUpdate = null;
         }
      }
      
      public function bookUpdateError(e:Event = null) : *
      {
         this.windowUpdateCloseEvent();
         this.warning("Kitap güncelleştirme sırasında hata oluştu.");
      }
      
      public function bookUpdateComplete(e:Event = null) : *
      {
         this.windowUpdateCloseEvent();
         this.warning("Kitap güncelleştirmesi tamamlandı. Güncel sürüm kullanmak için kitabı tekrar açın.");
      }
      
      public function setIntro() : *
      {
         var _videoBg:Shape = null;
         var _videoNS:NetStream = null;
         var _videoMc:Video = null;
         var _duration:Number = NaN;
         var nc:NetConnection = null;
         var _c:Object = null;
         var closeIntro:Function = null;
         closeIntro = function(e:Event):void
         {
            if(Math.floor(_duration) == Math.floor(_videoNS.time))
            {
               stage.removeEventListener(Event.ENTER_FRAME,closeIntro);
               removeStage(_videoMc);
               removeStage(_videoBg);
               _videoMc = null;
               _videoBg = null;
               _videoNS.close();
               _videoNS = null;
               startApp();
            }
         };
         if(this._operatingSystem != "windows")
         {
            this.startApp();
            return;
         }
         _videoBg = new Shape();
         _videoBg.graphics.beginFill(0);
         _videoBg.graphics.drawRect(0,0,this._capX,this._capY);
         _videoBg.graphics.endFill();
         this.addStage(_videoBg);
         nc = new NetConnection();
         nc.connect(null);
         _videoNS = new NetStream(nc);
         _c = new Object();
         _c.onMetaData = function(e:*):*
         {
            var _s:Number = NaN;
            _s = Math.min(_capX / e.width,_capY / e.height);
            _videoMc.width = e.width * _s;
            _videoMc.height = e.height * _s;
            stageAlignCenter(_videoMc);
            _duration = e.duration;
         };
         _videoNS.client = _c;
         _videoMc = new Video();
         _videoMc.attachNetStream(_videoNS);
         _videoMc.smoothing = true;
         this.addStage(_videoMc);
         stage.addEventListener(Event.ENTER_FRAME,closeIntro);
         _videoNS.play(new File(this._tempPath + this._introVideoFile).url);
      }
      
      public function open_activity(e:MouseEvent = null) : *
      {
         var _zip:String = null;
         this._selectedActivity = this._activities[e.currentTarget.name.split("_")[1]];
         _zip = this._selectedActivity.file;
         this.showLoading();
         FileManager.deleteDirectoryAsync(this._tempPath + "assets",function():*
         {
            unzipFile(new File(_tempPath + _zip).url,_tempPath,function():*
            {
               var _lc:LoaderContext = null;
               if(_activityLoader)
               {
                  if(_activityLoader.content)
                  {
                     MovieClip(_activityLoader.content).disposeAll();
                  }
                  _activityLoader.unloadAndStop();
                  _activityLoader = null;
               }
               if(_activityDataLoader)
               {
                  _activityDataLoader.dispose(true);
                  _activityDataLoader = null;
               }
               _lc = new LoaderContext(false,new ApplicationDomain(),null);
               _lc.allowCodeImport = true;
               _activityDataLoader = new DataLoader(new File(_tempPath + "activityengine.swf").url,{
                  "name":"swf",
                  "format":"binary",
                  "onComplete":loadSwfActivity
               });
               _activityDataLoader.load(true);
            });
         });
      }
      
      public function loadSwfActivity(e:*) : void
      {
         var ctx:LoaderContext = null;
         this._activityLoader = new Loader();
         this._activityLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.openActivityPanel);
         ctx = new LoaderContext(false,ApplicationDomain.currentDomain,null);
         ctx.allowCodeImport = true;
         ctx.allowLoadBytesCodeExecution = true;
         this._activityLoader.loadBytes(this._activityDataLoader.content,ctx);
      }
      
      public function openActivityPanel(e:*) : void
      {
         if(this._activityDataLoader)
         {
            this._activityDataLoader.dispose(true);
            this._activityDataLoader = null;
         }
         this._activityPanel = new libActivityPanel();
         this._activityPanel.mcEnd.visible = false;
         this._activityPanel.mcEnd.cacheAsBitmap = true;
         this._activityPanel.mcBg.cacheAsBitmap = true;
         this._activityPanel.close.cacheAsBitmap = true;
         this.stageFill(this._activityPanel.mcBg);
         this._activityPanel.container.x = this._activityPanel.mcEnd.x = (this._capX - 1024) / 2;
         this._activityPanel.container.y = this._activityPanel.mcEnd.y = (this._capY - 768) / 2;
         this._activityPanel.container.addChild(this._activityLoader.content);
         this.addStage(this._activityPanel);
         this.showLoading();
         MovieClip(this._activityLoader.content).start(this._tempPath,this._selectedActivity,this.hideLoading,this.openActivityInfo,this.openActivityEnd,this.playGameSound,this.playGameVideo);
         this.stageCoor(this._activityPanel.close,this._capX - this._activityPanel.close.width - 10,10);
         this._activityPanel.close.addEventListener(MouseEvent.CLICK,this.closeActivityPanel);
      }
      
      public function closeActivityPanel(e:MouseEvent = null) : void
      {
         if(this._activityPanel)
         {
            for(this.removeStage(this._activityPanel); this._activityPanel.container.numChildren > 1; )
            {
               this._activityPanel.container.removeChildAt(1);
            }
            this._activityPanel = null;
         }
         if(this._activityDataLoader)
         {
            this._activityDataLoader.dispose(true);
            this._activityDataLoader = null;
         }
         if(this._activityLoader)
         {
            if(this._activityLoader.content)
            {
               MovieClip(this._activityLoader.content).disposeAll();
            }
            this._activityLoader.unloadAndStop();
            this._activityLoader = null;
         }
         this.closeVVSolutionPlayer();
         SoundMixer.soundTransform = new SoundTransform(1);
      }
      
      public function openActivityInfo(_t:*) : void
      {
         this.showAlert("YÖNERGE",_t);
      }
      
      public function openActivityEnd() : void
      {
         this._activityPanel.mcEnd.visible = true;
         this._activityPanel.mcEnd.close.addEventListener(MouseEvent.CLICK,this.closeActivityEnd);
      }
      
      public function closeActivityEnd(e:MouseEvent = null) : void
      {
         this._activityPanel.mcEnd.visible = false;
         this._activityPanel.mcEnd.close.removeEventListener(MouseEvent.CLICK,this.closeActivityEnd);
         MovieClip(this._activityLoader.content).restart();
      }
      
      public function playGameSound(_file:String) : String
      {
         return this._tempPath + _file;
      }
      
      public function playGameVideo(_file:String) : *
      {
         var _f:String = null;
         _f = _file;
         var _s:Object = null;
         if(-1 < _f.indexOf("|"))
         {
            _f = _file.split("|")[0];
            _s = _file.split("|")[1] + "|stream|";
            if(_file.split("|")[2])
            {
               _s = _file.split("|")[1];
            }
         }
         this.openPlayer(this._tempPath + _f);
      }
      
      public function permission_status(e:PermissionEvent = null) : void
      {
         this._microphoneCheck = null;
      }
      
      public function mainWindowCloseEvent(e:Event = null) : *
      {
         if(this._tempAppFolder == "")
         {
            return;
         }
         FileManager.deleteFile(this._tempPath + this._tempAppFolder + "/");
      }
      
      public function mainWindowClosingEvent(e:Event = null) : *
      {
         this.closeZincPlayer();
         this.windowUpdateCloseEvent();
      }
      
      public function windowState_handler(e:NativeWindowDisplayStateEvent) : *
      {
         this._windowDisplayState = e.afterDisplayState;
      }
      
      public function check_acpectRatio(e:NativeWindowBoundsEvent) : *
      {
         TweenMax.killDelayedCallsTo(this.calculateWindowSize);
         TweenMax.delayedCall(0.1,this.calculateWindowSize,[new Point(e.beforeBounds.width,e.beforeBounds.height),new Point(e.afterBounds.width,e.afterBounds.height)]);
      }
      
      public function calculateWindowSize(beforeBounds:Point, afterBounds:Point) : *
      {
         var _xOff:Number = NaN;
         var _yOff:Number = NaN;
         var _percent:Number = NaN;
         if(this._windowDisplayState != "normal")
         {
            return;
         }
         TweenMax.killDelayedCallsTo(this.calculateWindowSize);
         this._window.removeEventListener(NativeWindowBoundsEvent.RESIZE,this.check_acpectRatio);
         _xOff = this._windowBounds.x - this._stageBounds.x;
         _yOff = this._windowBounds.y - this._stageBounds.y;
         _percent = 1;
         _percent = afterBounds.x / this._windowBounds.x;
         this._window.width = this._stageBounds.x * _percent + _xOff;
         this._window.height = this._stageBounds.y * _percent + _yOff;
         this._window.addEventListener(NativeWindowBoundsEvent.RESIZE,this.check_acpectRatio);
      }
      
      public function setWindow(e:NativeWindowDisplayStateEvent) : *
      {
         this._window.removeEventListener(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGE,this.setWindow);
         this._stageBounds = new Point(stage.stageWidth,stage.stageHeight);
         this.checkWindowsStatus();
      }
      
      public function windowResize(e:NativeWindowBoundsEvent) : *
      {
         this._window.removeEventListener(NativeWindowBoundsEvent.RESIZE,this.windowResize);
         this._windowBounds = new Point(e.afterBounds.width,e.afterBounds.height);
         this.checkWindowsStatus();
      }
      
      public function macwindowResize(e:NativeWindowBoundsEvent) : *
      {
         this._macwindow.removeEventListener(NativeWindowBoundsEvent.RESIZE,this.macwindowResize);
         this._macwindowBounds = new Point(this._macwindow.stage.stageWidth,this._macwindow.stage.stageHeight);
         this.checkWindowsStatus();
      }
      
      public function onInvoke(e:InvokeEvent) : void
      {
         var _s:String = null;
         this._invokeS = true;
         if(e.arguments[0])
         {
            _s = e.arguments[0].replace("\"","");
            if(this._operatingSystem == "windows")
            {
               this._mainFolderPath = _s.split("||")[0];
               this._tempPath = new File(_s.split("||")[1]).url + "/";
               this._mainFilename = _s.split("||")[2];
               this._tempAppFolder = _s.split("||")[3];
               this._kxkPath = this._tempPath + "publisher.kxk";
            }
            else if(this._operatingSystem == "linux" || this._operatingSystem == "mac")
            {
               this._tempPath = new File(_s.split("||")[0]).url + "/";
               this._kxkPath = new File(_s.split("||")[1]).url;
               this._mainFolderPath = new File(_s.split("||")[2]).url + "/";
            }
            this.checkWindowsStatus();
         }
         else
         {
            this.closeApp();
         }
         NativeApplication.nativeApplication.removeEventListener(InvokeEvent.INVOKE,this.onInvoke);
      }
      
      public function checkWindowsStatus() : *
      {
         var _status:Boolean = false;
         _status = true;
         if(this._operatingSystem == "windows")
         {
            _status = this._invokeS && this._stageBounds && this._windowBounds;
         }
         else if(this._operatingSystem == "mac")
         {
            _status = this._invokeS && this._stageBounds && this._windowBounds && this._macwindowBounds;
            if(_status)
            {
               this._stageBounds = this._macwindowBounds;
               this._macwindow.close();
               this._macwindow = null;
               this._macoptions = null;
            }
         }
         else if(this._operatingSystem == "linux")
         {
            _status = this._invokeS;
            stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
            this._stageBounds = new Point(Capabilities.screenResolutionX,Capabilities.screenResolutionY);
            this._window.width = this._stageBounds.x;
            this._window.height = this._stageBounds.y;
         }
         if(_status)
         {
            this.loadPublisherData();
         }
      }
      
      public function loadPublisherData() : *
      {
         var _kk:KK = null;
         var _urlLoader:URLLoader = null;
         var _list:Array = null;
         var _i:uint = 0;
         try
         {
            _kk = new KK();
            _urlLoader = new URLLoader();
            _urlLoader.addEventListener(Event.COMPLETE,function(e:Event):void
            {
               var _s:* = undefined;
               var _d:* = undefined;
               var _kry:KrySWFCrypto = null;
               var _p:* = undefined;
               var _f:Object = null;
               var _w:* = undefined;
               var _b:* = undefined;
               var _fileManager:FileManager = null;
               _s = _kk.fd1(e.target.data,"pub1isher1l0O");
               _d = Base64.decodeToByteArray(_s);
               _kry = new KrySWFCrypto();
               _p = "fernus";
               _f = new Object();
               _w = _kk.fd1("RxQFOUiQdw1D2ACf8dyW8ERWEIEcEMiJ","pub1isher1l0O");
               _f.f1 = int(_w.split("x")[0]) + _p.length;
               _f.f2 = int(_w.split("x")[1]) + _p.length;
               _f.f3 = int(_w.split("x")[2]) + _p.length;
               _b = _kry.decrypte(_d,_f);
               _fileManager = new FileManager();
               _fileManager.addEventListener(Event.COMPLETE,function():*
               {
                  var _l:Loader = null;
                  _l = new Loader();
                  _l.contentLoaderInfo.addEventListener(Event.COMPLETE,onComplete);
                  _l.load(new URLRequest(File.applicationStorageDirectory.resolvePath("p.dll").url));
               });
               _fileManager.writeFile(File.applicationStorageDirectory.resolvePath("p.dll").url,_b);
            });
            if(this._operatingSystem == "windows" && new File(this._mainFolderPath + "kk-db.db").exists)
            {
               _list = new File(this._mainFolderPath).getDirectoryListing();
               for(_i = 0; _i < _list.length; _i++)
               {
                  if(_list[_i].isDirectory)
                  {
                     if(-1 < _list[_i].name.indexOf("-windows"))
                     {
                        this._kxkPath = _list[_i].url + "/publisher.kxk";
                        _urlLoader.load(new URLRequest(new File(this._kxkPath).url));
                        break;
                     }
                  }
               }
            }
            else
            {
               _urlLoader.load(new URLRequest(new File(this._kxkPath).url));
            }
         }
         catch(e:*)
         {
            closeApp();
         }
      }
      
      public function onComplete(e:Event) : void
      {
         var _kk:KK = null;
         var _j:* = undefined;
         var _f:* = undefined;
         var _logo1:MovieClip = null;
         var _logo2:MovieClip = null;
         var _logo3:MovieClip = null;
         var _logo4:MovieClip = null;
         var _ds:Array = null;
         FileManager.deleteFile(File.applicationStorageDirectory.resolvePath("p.dll").url);
         _kk = new KK();
         _j = JSON.parse(_kk.fd1(String(e.currentTarget.loader.content.byte),"pub1isher1l0O"));
         this._pkxkname = String(_j.pkxkname);
         this._publisher = String(_j.publisher);
         _f = _kk.fd1(String(_j.fernusCode),"pub1isher1l0O");
         this._kkObject.f1 = int(_f.split("x")[0]) + this._pkxkname.length;
         this._kkObject.f2 = int(_f.split("x")[1]) + this._pkxkname.length;
         this._kkObject.f3 = int(_f.split("x")[2]) + this._pkxkname.length;
         this._passwordStatus = Boolean(_j.passwordStatus);
         if(_j.dateLimit)
         {
            _ds = _j.dateLimit.split(".");
            this._dateLimit = new Date(_ds[1] + "/" + _ds[0] + "/" + _ds[2]);
         }
         this._introVideoFile = _j.introVideoFile;
         this._logoClass = e.currentTarget.applicationDomain.getDefinition("libLogo") as Class;
         _logo1 = new this._logoClass();
         _logo2 = new this._logoClass();
         _logo3 = new this._logoClass();
         _logo4 = new this._logoClass();
         this.removeItems(this.pnlKey.con.mcLogo);
         this.removeItems(this.mcLoading.mcAni.mcLogo);
         this.removeItems(this.toolBar.logo);
         this.removeItems(this.toolZeng.mcBg.logo);
         this.pnlKey.con.mcLogo.addChild(_logo1);
         this.mcLoading.mcAni.mcLogo.addChild(_logo2);
         this.toolBar.logo.addChild(_logo3);
         this.toolZeng.mcBg.logo.addChild(_logo4);
         this._cloudBase = this._cloudBase + "?publisher=" + this._pkxkname + "&os=" + this._operatingSystem + "&ln=" + this._appLanguage;
         this._soKXKKey = this._pkxkname + "key.sys";
         this._soKXKBlackKey = File.applicationStorageDirectory.resolvePath(this._pkxkname + "book.sys").url;
         if(_j.serverStatus)
         {
            this._fernusLink = String(_j.server) + "?publisher=" + this._pkxkname + "&os=" + this._operatingSystem + "&ln=" + this._appLanguage;
         }
         else
         {
            this._fernusLink = this._fernusLink + "?publisher=" + this._pkxkname + "&os=" + this._operatingSystem + "&ln=" + this._appLanguage;
         }
         this._publisherApi = String(_j.server) + "?publisher=" + this._pkxkname + "&os=" + this._operatingSystem + "&ln=" + this._appLanguage;
         if(_j.hasOwnProperty("geoGebra"))
         {
            this._geoGebra = _j.geoGebra;
         }
         else
         {
            this._geoGebra = false;
         }
         if(!this._geoGebra)
         {
            this.closeProMode(this.sidePanel.btnGeoGebra);
         }
         if(_j.hasOwnProperty("proMode"))
         {
            this._proMode = _j.proMode;
         }
         else
         {
            this._proMode = true;
         }
         this._appType = "lite";
         if(this._proMode)
         {
            this._appType = "pro";
         }
         if(_j.hasOwnProperty("appType"))
         {
            this._appType = _j.appType;
         }
         if(this._appType == "lite")
         {
            this.closeProMode(this.footer.btnSolution);
            this.closeProMode(this.footer.btnEba);
            this.closeProMode(this.footer.btnDO);
            this.closeProMode(this.footer.btnAH);
            this.closeProMode(this.footer.btnMeeting);
            this.closeProMode(this.footer.btnAccount);
            this.closeProMode(this.sidePanel.btnMessage);
            this.closeProMode(this.panelVector);
            this.toolBar.fernus.gotoAndStop(1);
         }
         else if(this._appType == "pro")
         {
            this.closeProMode(this.footer.btnAH);
            this.closeProMode(this.footer.btnMeeting);
            this.toolBar.fernus.gotoAndStop(2);
         }
         else if(this._appType == "max")
         {
            this.toolBar.fernus.gotoAndStop(3);
         }
         this._realScale = Math.min(this._stageBounds.x / 1024,this._stageBounds.y / 768);
         this._capX = this._stageBounds.x / this._realScale;
         this._capY = this._stageBounds.y / this._realScale;
         if(this._introVideoFile)
         {
            this.setIntro();
         }
         else
         {
            this.startApp();
         }
         if(this._operatingSystem != "linux")
         {
            this._window.addEventListener(NativeWindowBoundsEvent.RESIZE,this.check_acpectRatio);
            this._window.addEventListener(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGE,this.windowState_handler);
            this._window.maximize();
         }
      }
      
      public function closeProMode(_w:*) : *
      {
         _w.visible = false;
         _w.alpha = 0;
         _w.mouseChildren = false;
         _w.mouseEnabled = false;
      }
      
      function frame1() : *
      {
         TweenPlugin.activate([ThrowPropsPlugin]);
         Multitouch.inputMode = MultitouchInputMode.GESTURE;
         stage.align = StageAlign.TOP_LEFT;
         try
         {
            Security.allowDomain("*");
         }
         catch(e:*)
         {
         }
         this._serverAdress = "rtmfp://p2p.rtmfp.net/c45aabf9cff014391e5c0f15-b538cead9d35";
         this._overColor = 15751714;
         this._bookdataName = "sysb.dll";
         this._maskdataName = "sysm.dll";
         this._maskChecker = false;
         this._joints = "round";
         this._fSnm = "koray";
         this._fernusKey = "kxk";
         this._empBoolean = false;
         this._objArray = new Array();
         this._urlLoader = new URLLoader();
         this._loader = new Loader();
         this._xml = new XML();
         this._bookName = "";
         this._int = 0;
         this._empArray = new Array();
         this._pages = new Array();
         this._canvas = new MovieClip();
         this._book = new MovieClip();
         this._maskBook = new MovieClip();
         this._maskLayer = new MovieClip();
         this._empMovieClip = new MovieClip();
         this.activeColor = 0;
         this.activeTool = 0;
         this.isNote = false;
         this.myColorTransform = new ColorTransform();
         this.activeLineWidth = 1;
         this._empPoint = new Point();
         this._firstPos = new Point();
         this.guncelSayfa = 1;
         this.tempLayer = new MovieClip();
         this.itemMc = new MovieClip();
         this.startPoint = new Point(0,0);
         this.lastPoint = new Point(0,0);
         this.selectItems = new Array();
         this.drawAreas = new Array();
         this.pageItems = new Array();
         this._masks = new Array();
         this._tweenTime = 0.3;
         this._num = 0.3;
         this.mcEraser = new eMc();
         this.verticalPanel = true;
         this.proB = false;
         this.tempShape = new Shape();
         this.isIm = false;
         this.isSelectDrawing = false;
         this.isSquareDrawing = false;
         this.isTriangeDrawing = false;
         this.isCircleDrawing = false;
         this.isErasing = false;
         this.isArrowDrawing = false;
         this.isLineDrawing = false;
         this.isDrawing = false;
         this.isMarking = false;
         this.currentPoint = new Point();
         this.silgiler = new Array();
         this.silinecek = new Array();
         this.brushAreas = new Array();
         this.brushLayer = 0;
         this.imMode = 0;
         this._mcNo = 0;
         this._selectBg = new Sprite();
         this._selectBg.blendMode = BlendMode.LAYER;
         this._selectBg.mouseEnabled = false;
         this._selectBg.mouseChildren = false;
         this._blockErase = false;
         this._blankBg = new Sprite();
         this._blankBg.graphics.beginFill(0,1);
         this._blankBg.graphics.drawRect(0,0,5,5);
         this._blankBg.graphics.endFill();
         this._blankBg.blendMode = BlendMode.ERASE;
         this._selectBg.addChild(this._blankBg);
         this._blankBg.mouseEnabled = false;
         this._blankBg.mouseChildren = false;
         this._kapBl = false;
         this._rect = new Rectangle();
         this.noteSizes = new Array();
         this.drawAreas2 = new Array();
         this.guncelNotlar = new Array();
         this.hangiNot = 0;
         this.mcEraser2 = new eMc();
         this.resizeB = false;
         this.rectX = new Rectangle(0,21,650,0);
         this.rectY = new Rectangle(0,0,0,650);
         this.brushAreas2 = new Array();
         this.brushLayer2 = 0;
         this.itemMask = new Sprite();
         this.itemMask.graphics.beginFill(16711680,0);
         this.itemMask.graphics.drawRect(0,0,1,1);
         this.itemMask.graphics.endFill();
         this.itemMask.mouseChildren = false;
         this.itemMask.mouseEnabled = false;
         this._blankWhite = new Sprite();
         this._blankWhite.visible = false;
         this._isWhite = false;
         this.zengIm = true;
         this.guncelIm = -1;
         this._white = new Sprite();
         this._bytes = new ByteArray();
         this._mcObj = new Array();
         this._byteArr = new Array();
         this._obj = new Object();
         this._swf = new Array();
         this._page = 0;
         this._mcBlank = new bosArka();
         this._coorsS1 = new Point(19,89);
         this._coorsS2 = new Point(315,89);
         this._tScale = 3;
         this._bmpMatrix = new Matrix();
         this._bmpMatrix.scale(this._tScale,this._tScale);
         this._objArr = new Array();
         this.boundsRect = new Rectangle(0,0,100,0);
         this._unitStatus = true;
         this.tempLayerZeng = new MovieClip();
         this._currMc = new MovieClip();
         this.zengImGuncel = -1;
         this.zenbB = false;
         this._blackBg = new blackBg();
         this.isSelectDrawingZeng = false;
         this.kayitB = 0;
         this.kayitB2 = 0;
         this._glowF = new GlowFilter();
         this._glowF.color = 14572858;
         this._glowF.blurX = 5;
         this._glowF.blurY = 5;
         this._objZeng = new Array();
         this._intZeng = new Array();
         this._nameInt = 0;
         this._intZeng[0] = this._intZeng[1] = this._intZeng[2] = this._intZeng[3] = this._intZeng[4] = this._intZeng[5] = this._intZeng[6] = this._intZeng[7] = this._intZeng[8] = 0;
         this._objZeng[0] = new Array();
         this._objZeng[1] = new Array();
         this._objZeng[2] = new Array();
         this._objZeng[3] = new Array();
         this._objZeng[4] = new Array();
         this._objZeng[5] = new Array();
         this._objZeng[6] = new Array();
         this._objZeng[7] = new Array();
         this._objZeng[8] = new Array();
         this._bilgiler = new Array();
         this._icnPage = new Array();
         this._bilgiler[0] = ["İşaretlemek istediğiniz bölgeyi seçin","Bölge Seçme","Kaydetmek istediğiniz bölgeyi işaretleyin","İşlem tamamlandı. Seçme işlemini ekleyebilirsiniz."];
         this._bilgiler[1] = ["Bilgisayarınızdan resim dosyası ekleyin","Resim Ekleme","Eklemek istediğiniz resim dosyasını seçin","Resim dosyası seçildi. Resim dosyasını ekleyebilirsiniz."];
         this._bilgiler[2] = ["Bilgisayarınızdan ses dosyası ekleyin","Ses Ekleme","Eklemek istediğiniz ses dosyasını seçin","Ses dosyası seçildi. Ses dosyasını ekleyebilirsiniz."];
         this._bilgiler[3] = ["Bilgisayarınızdan video dosyası ekleyin","Video Ekleme","Eklemek istediğiniz video dosyasını seçin","Video dosyası seçildi. Video dosyasını ekleyebilirsiniz."];
         this._bilgiler[4] = ["Bilgisayarınızdan SWF dosyası ekleyin","SWF Ekleme","Eklemek istediğiniz SWF dosyasını seçin","SWF dosyası seçildi. SWF dosyasını ekleyebilirsiniz."];
         this._bilgiler[5] = ["Bilgisayarınızdan içerik açın","İçerik Ekleme","Eklemek istediğiniz içerik dosyasını seçin","İçerik dosyası seçildi. İçerik dosyasını ekleyebilirsiniz."];
         this._bilgiler[6] = ["Bağlantı adresi girin","Bağlantı Ekleme","Eklemek istediğiniz bağlantının adresini yazın","Bağlantı adresi girildi. Bağlantı adresini ekleyebilirsiniz."];
         this._bilgiler[7] = ["Metin girin","Metin Ekleme","Eklemek istediğiniz metni yazın","Metni ekleyebilirsiniz."];
         this._themeB = false;
         this._sndChannel = new SoundChannel();
         this._sndTransform = this._sndChannel.soundTransform;
         this._snd = new Sound();
         this._date = new Date();
         this._timer = new Timer(1000);
         this._bigErase = false;
         this._na = 1;
         this._conts = new Array();
         this._format = new TextFormat();
         this._txtSize = 10;
         this.lineGeneral = new LineGeneralization();
         this.pointler = new Array();
         this.lastLine = new Array();
         this._urlManager = new URLManager();
         this._user = new Object();
         this._users = new Array();
         this._connectionObj = new Object();
         this._connectStat = false;
         this._writing = false;
         this._permissionStat = false;
         this._permission = false;
         this._lockStat = false;
         this._locked = false;
         this._dataType = "user";
         this.mcSnm.visible = false;
         this.searchPanel.visible = false;
         this._note.visible = false;
         this.preRecordPanel.visible = false;
         this.preRecordPanel.btnAns.visible = false;
         this.preRecordPanel.btnSaveAns.visible = false;
         this.preRecordPanel.btnGoster.visible = false;
         this.preRecordPanel.btnNavi.visible = false;
         this.linkPanel.visible = false;
         this.btnSnm.visible = false;
         this.pnlConnect.visible = false;
         this.mcAniPanel.visible = false;
         this.toolZeng.visible = false;
         this.footer.nextIm.visible = false;
         this.footer.previousIm.visible = false;
         this._unitHolder.visible = false;
         this.panelChronometer.visible = false;
         this.calcPanel.visible = false;
         this.panelNums.visible = false;
         this.kayitPanel.visible = false;
         this.silPanel.visible = false;
         this.bilgiPanel.visible = false;
         this.mcUsers.visible = false;
         this.soruPanel.visible = false;
         this.mcAsk.visible = false;
         this.loading.visible = false;
         this.loadingText.visible = false;
         this.panelVector.visible = false;
         this.panelVectorVideoInfo.visible = false;
         this.panelMeeting.visible = false;
         this.panelMeetingAdd.visible = false;
         this.panelZoom.visible = false;
         this.panelAhSave.visible = false;
         this.panelGeoGebra.visible = false;
         this.panelGeoGebraOpener.visible = false;
         this.panelMeetingInfo.visible = false;
         this.panelAhStatus.visible = false;
         this.panelAccount.visible = false;
         this.panelBG.visible = false;
         this.sidePanel.visible = false;
         this.footer.visible = false;
         this.panelWebview.visible = false;
         this.panelVV.visible = false;
         this.panelAh.visible = false;
         this.panelAhStatus.visible = false;
         this.panelVideoSolution.visible = false;
         this._curtain.visible = false;
         this.panelStudent.visible = false;
         this.panelCast.visible = false;
         this.mcEbaPanel.visible = false;
         this.cloudSettings.visible = false;
         this.panelConfirmation.visible = false;
         this._fileManager = FileManager;
         this._aniMasks = new Array();
         this._currAniObject = null;
         this._sidePanelStatus = false;
         this.toolBar.logo.mouseEnabled = false;
         this.toolBar.logo.mouseChildren = false;
         this._scrollMc2 = new MovieClip();
         this._mouseDownCoor = new Point();
         this.trs = new TransformGesture(this._canvas);
         this.trs.enabled = false;
         this.trs.addEventListener(GestureEvent.GESTURE_BEGAN,this.onGesture);
         this.trs.addEventListener(GestureEvent.GESTURE_CHANGED,this.onGesture);
         this.sekilB = 2;
         this._objectFullStatus = false;
         this.myFont = new Font1();
         this._txtPadding = 10;
         this._popformat1 = new TextFormat();
         this._popformat1.font = this.myFont.fontName;
         this._popformat1.size = 15;
         this._poptxtfield = new TextField();
         this._poptxtfield.textColor = 4342338;
         this._poptxtfield.defaultTextFormat = this._popformat1;
         this._poptxtfield.x = this._txtPadding;
         this._poptxtfield.y = this._txtPadding;
         this._poptxtfield.width = this.pnlPop.popContent.width - this._txtPadding * 2;
         this._poptxtfield.autoSize = TextFieldAutoSize.LEFT;
         this._poptxtfield.multiline = true;
         this._poptxtfield.wordWrap = true;
         this._poptxtfield.selectable = false;
         this.pnlPop.popContent.addChild(this._poptxtfield);
         this._txtShape = new Shape();
         this.sidePanel.btnConnect.addEventListener(MouseEvent.CLICK,this.openConnectionPnl);
         this.panelCast.btnPermission.alpha = 0.3;
         this._typeCheck = false;
         this._snmStat = false;
         this.mcSnm.visible = false;
         this.stageFill(this.mcSnm.bg);
         this.stageAlignCenter(this.mcSnm.txt);
         this.stageCoor(this.mcSnm,0,0);
         stage.focus = null;
         this._chroTotalTime = 60;
         this._arrayTF = new Array();
         this._tfStatus = false;
         this._inputLayer = new MovieClip();
         this._trsStat = false;
         this._inputTextStatus = false;
         this._ebaList = new Array();
         this._ebaArray = new Array();
         this._treeArray = new Array();
         this._videoPageNo = 0;
         this._perPage = 20;
         this._lastPageNo = 0;
         this._videoList = new Array();
         this._videoMainList = new Array();
         this._sortSet = "";
         this._dragStatus = false;
         this._ebaLoadStatus = false;
         this.panelVideoSolution.clickControl = this.clickControl;
         this._ahDateSort = 0;
         this._ahPageSort = 0;
         this._ahSelectStatus = false;
         this._meetingDateSort = 0;
         this._imPadding = 50;
         this.panelVector.pnl2.visible = false;
         this._operatingSystem = "windows";
         if(File.applicationDirectory.resolvePath("META-INF/kxkwindows.txt").exists)
         {
            this._operatingSystem = "windows";
         }
         if(File.applicationDirectory.resolvePath("META-INF/kxklinux.txt").exists)
         {
            this._operatingSystem = "linux";
         }
         if(File.applicationDirectory.resolvePath("META-INF/kxkmac.txt").exists)
         {
            this._operatingSystem = "mac";
         }
         this._appLanguage = "tr";
         this._pkxkname = "fernus";
         this._publisher = "FERNUS";
         this._fernusCode = "29_10_31";
         this._passwordStatus = true;
         this._cloudBase = "http://derstekrari.com/api/action.php";
         this._fernusLink = "http://www.fernusconnect.com/checker.php";
         this._publisherApi = "";
         this._soKXKKey = this._pkxkname + "key.sys";
         this._soKXKBlackKey = this._pkxkname + "book.sys";
         this._mainFolderPath = new File(File.applicationDirectory.nativePath).url + "/";
         this._tempPath = new File(this._mainFolderPath + "files").url + "/";
         this._mainFilename = new File(File.applicationDirectory.nativePath).url + "z-kitap-kxk.swf";
         this._tempAppFolder = "";
         this._invokeS = false;
         this._capYOffset = 35;
         this._kkObject = new Object();
         this._appType = "lite";
         this._proMode = true;
         this._geoGebra = false;
         this._kxkPath = "";
         this.root.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR,function handleUncaughtErrors(event:UncaughtErrorEvent):void
         {
            var _loc2_:String = null;
            if(event.error is Error)
            {
               _loc2_ = Error(event.error).message;
            }
            else if(event.error is ErrorEvent)
            {
               _loc2_ = ErrorEvent(event.error).text;
            }
            else
            {
               _loc2_ = event.error.toString();
            }
            event.preventDefault();
         });
         this.mcLoading.mcAni.btnClose.addEventListener(MouseEvent.CLICK,this.closeApp);
         this.toolBar.btnMin.addEventListener(MouseEvent.CLICK,this.minApp);
         this.toolBar.btnClose.addEventListener(MouseEvent.CLICK,this.closeApp);
         this._window = stage.nativeWindow;
         this._window.visible = false;
         this._window.x = 0;
         this._window.y = 0;
         if(this._operatingSystem == "windows")
         {
            this._window.addEventListener(Event.CLOSING,this.mainWindowClosingEvent);
            this._window.addEventListener(Event.CLOSE,this.mainWindowCloseEvent);
         }
         else if(this._operatingSystem == "mac")
         {
            this._macoptions = new NativeWindowInitOptions();
            this._macoptions.systemChrome = NativeWindowSystemChrome.STANDARD;
            this._macoptions.transparent = false;
            this._macoptions.maximizable = true;
            this._macoptions.resizable = true;
            this._macwindow = new NativeWindow(this._macoptions);
            this._macwindow.stage.frameRate = 24;
            this._macwindow.stage.align = StageAlign.TOP_LEFT;
            this._macwindow.stage.scaleMode = StageScaleMode.NO_SCALE;
            this._macwindow.stage.nativeWindow.x = 0;
            this._macwindow.stage.nativeWindow.y = 0;
            this._macwindow.addEventListener(NativeWindowBoundsEvent.RESIZE,this.macwindowResize);
            this._macwindow.activate();
            this._macwindow.maximize();
            if(Microphone.isSupported)
            {
               this._microphoneCheck = Microphone.getMicrophone();
               if(Microphone.permissionStatus != PermissionStatus.GRANTED)
               {
                  this._microphoneCheck.addEventListener(PermissionEvent.PERMISSION_STATUS,this.permission_status);
                  try
                  {
                     this._microphoneCheck.requestPermission();
                  }
                  catch(e:Error)
                  {
                     permission_status();
                  }
               }
               else
               {
                  this.permission_status();
               }
            }
         }
         NativeApplication.nativeApplication.addEventListener(InvokeEvent.INVOKE,this.onInvoke);
         this.addKeyboardEvents();
         ScrollClass.init(this);
         Network.initialize();
         if(this._operatingSystem != "linux")
         {
            this._window.addEventListener(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGE,this.setWindow);
            this._window.addEventListener(NativeWindowBoundsEvent.RESIZE,this.windowResize);
            this._window.maximize();
         }
      }
   }
}
