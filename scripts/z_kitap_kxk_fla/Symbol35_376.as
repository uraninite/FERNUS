package z_kitap_kxk_fla
{
   import com.kxk.KryJSON;
   import com.kxk.ScrollClass;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public dynamic class Symbol35_376 extends MovieClip
   {
       
      
      public var bar:MovieClip;
      
      public var bback:MovieClip;
      
      public var bsearch:MovieClip;
      
      public var close:MovieClip;
      
      public var contentSolution:MovieClip;
      
      public var loading:MovieClip;
      
      public var mmask:MovieClip;
      
      public var psearch:MovieClip;
      
      public var thumb:MovieClip;
      
      public var txt:TextField;
      
      public var urlBase:String;
      
      public var _currentID:String;
      
      public var _path:Array;
      
      public var _listStatus:Boolean;
      
      public var _list:Array;
      
      public var openVideo:Function;
      
      public var onError:Function;
      
      public var clickControl:Function;
      
      public var _kk:KryJSON;
      
      public var _string:String;
      
      public function Symbol35_376()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function disposeData() : *
      {
         this.closeSearchPanel();
         this.loading.visible = false;
         this._list = null;
         this.removeItems(this.contentSolution);
         this.contentSolution.y = this.mmask.y;
         ScrollClass.disable(this.contentSolution);
         ScrollClass.remove(this.contentSolution);
         this.bsearch.removeEventListener(MouseEvent.CLICK,this.openSearchPanel);
      }
      
      public function start() : *
      {
         this.disposeData();
         this._list = new Array();
         this.list_updateHandler();
         this.bsearch.addEventListener(MouseEvent.CLICK,this.openSearchPanel);
      }
      
      public function openSearchPanel(e:MouseEvent) : *
      {
         this.closeSearchPanel();
         this.psearch.visible = true;
         this.psearch.bclose.addEventListener(MouseEvent.CLICK,this.closeSearchPanel);
         this.stage.focus = this.psearch.txt;
         stage.addEventListener(Event.ENTER_FRAME,this.textChange);
      }
      
      public function closeSearchPanel(e:MouseEvent = null) : *
      {
         this.psearch.bclose.removeEventListener(MouseEvent.CLICK,this.closeSearchPanel);
         this.psearch.txt.removeEventListener(Event.CHANGE,this.textChange);
         stage.removeEventListener(Event.ENTER_FRAME,this.textChange);
         this.psearch.visible = false;
         this.psearch.txt.text = "";
         if(e)
         {
            this.textChange();
         }
         this._string = "";
      }
      
      public function textChange(e:Event = null) : void
      {
         var _k:* = null;
         if(this._string == this.psearch.txt.text || this._list.length == 0)
         {
            return;
         }
         this._string = this.psearch.txt.text;
         var _y:Number = 0;
         for(_k in this._list)
         {
            if(this.compare(this._list[_k].nm,this._string))
            {
               this._list[_k].mc.y = _y;
               _y += this._list[_k].mc.height;
               this.contentSolution.addChild(this._list[_k].mc);
            }
            else if(this.contentSolution.contains(this._list[_k].mc))
            {
               this.contentSolution.removeChild(this._list[_k].mc);
            }
         }
         this.contentSolution.y = this.mmask.y;
         this.thumb.y = this.mmask.y;
         ScrollClass.update(this.contentSolution);
      }
      
      public function compare(item:String, textToMatch:String) : Boolean
      {
         return this.trtoen(String(item)).toLowerCase().indexOf(this.trtoen(textToMatch).toLowerCase()) > -1;
      }
      
      public function trtoen(_str:String) : String
      {
         var _key:* = null;
         var tr:Array = new Array("ı","ş","ç","ü","ö","ğ","İ","Ş","Ç","Ü","Ö","Ğ");
         var en:Array = new Array("i","s","c","u","o","g","I","S","C","U","O","G");
         var _s:String = _str;
         for(_key in tr)
         {
            _s = _s.replace(tr[_key],en[_key]);
         }
         return _s;
      }
      
      public function list_updateHandler(event:Event = null) : void
      {
         var _urlRequest:URLRequest = new URLRequest(this.urlBase);
         var _urlVariables:URLVariables = new URLVariables();
         _urlVariables.id = this._currentID;
         _urlVariables.action = "video_solution";
         _urlRequest.data = _urlVariables;
         _urlRequest.method = URLRequestMethod.POST;
         this.loadData(_urlRequest);
      }
      
      public function loadData(_urlR:URLRequest) : *
      {
         this.loading.visible = true;
         this.bar.visible = false;
         this.thumb.visible = false;
         this.removeItems(this.contentSolution);
         if(this._kk)
         {
            this._kk.dispose();
         }
         this._kk = new KryJSON(_urlR);
         this._kk.onError = this.onErrorJ;
         this._kk.onComplete = this.onCompleteJ;
         this._kk.start();
      }
      
      public function onErrorJ() : void
      {
         this.loading.visible = false;
         if(this._kk)
         {
            this._kk.dispose();
            this._kk = null;
         }
      }
      
      public function onCompleteJ(e:*) : void
      {
         var _k:* = null;
         this.onErrorJ();
         if(e.error)
         {
            if(this.onError != null)
            {
               this.onError(e.error);
            }
            return;
         }
         this._list = e.sources as Array;
         var _y:Number = 0;
         for(_k in this._list)
         {
            this._list[_k].mc = new Sprite();
            this._list[_k].tf = this.createTF();
            this._list[_k].tf.text = this._list[_k].nm;
            this._list[_k].tf.width = 310;
            this._list[_k].tf.x = 10;
            this._list[_k].tf.y = 5;
            this._list[_k].mc.graphics.beginFill(16711680,0);
            this._list[_k].mc.graphics.drawRect(0,0,330,10 + this._list[_k].tf.height);
            this._list[_k].mc.graphics.endFill();
            this._list[_k].mc.graphics.lineStyle(1,14737632);
            this._list[_k].mc.addChild(this._list[_k].tf);
            this._list[_k].mc.graphics.moveTo(10,this._list[_k].mc.height);
            this._list[_k].mc.graphics.lineTo(330,this._list[_k].mc.height);
            this._list[_k].mc.y = _y;
            _y += this._list[_k].mc.height;
            this._list[_k].mc.name = _k;
            this._list[_k].mc.cacheAsBitmap = true;
            this.contentSolution.addChild(this._list[_k].mc);
            this._list[_k].mc.addEventListener(MouseEvent.CLICK,this.goin);
         }
         this.contentSolution.y = this.mmask.y;
         ScrollClass.remove(this.contentSolution);
         ScrollClass.add(this.contentSolution,this.mmask);
         ScrollClass.enable(this.contentSolution);
         ScrollClass.update(this.contentSolution);
         this.txt.text = e.name;
         if(this._path.length == 0)
         {
            this._path.push(this._currentID);
         }
         else if(this._currentID != this._path[this._path.length - 1])
         {
            this._path.push(this._currentID);
         }
         if(this._currentID == "-1")
         {
            this.bback.visible = false;
            this.bback.removeEventListener(MouseEvent.CLICK,this.button_backHandler);
         }
         else
         {
            this.bback.visible = true;
            this.bback.addEventListener(MouseEvent.CLICK,this.button_backHandler);
         }
      }
      
      public function goin(e:MouseEvent) : *
      {
         if(this.clickControl != null)
         {
            if(!this.clickControl())
            {
               return;
            }
         }
         var _object:Object = this._list[e.currentTarget.name];
         if(_object.parent == "true")
         {
            this._currentID = _object.id;
            this.closeSearchPanel();
            this.list_updateHandler();
         }
         else if(this.openVideo != null)
         {
            this.openVideo(_object);
         }
      }
      
      public function button_backHandler(e:Event = null) : void
      {
         if(this._kk)
         {
            return;
         }
         this._path.pop();
         this._currentID = this._path.pop();
         this.list_updateHandler();
      }
      
      public function removeItems(_obj:MovieClip) : void
      {
         while(_obj.numChildren > 0)
         {
            _obj.removeChildAt(0);
         }
      }
      
      public function createTF(_size:int = 12, _color:uint = 4539717, _border:Boolean = false) : *
      {
         var _textFormat:TextFormat = new TextFormat();
         _textFormat.size = _size;
         _textFormat.font = "Roboto";
         var _tf:TextField = new TextField();
         _tf.defaultTextFormat = _textFormat;
         _tf.border = _border;
         _tf.embedFonts = true;
         _tf.multiline = true;
         _tf.wordWrap = true;
         _tf.autoSize = TextFieldAutoSize.LEFT;
         _tf.mouseEnabled = false;
         _tf.needsSoftKeyboard = false;
         _tf.textColor = _color;
         return _tf;
      }
      
      function frame1() : *
      {
         this._currentID = "-1";
         this._path = new Array();
         this._listStatus = false;
         this.txt.text = "Liste";
         this.bback.visible = false;
         this.disposeData();
         this._string = "";
      }
   }
}
