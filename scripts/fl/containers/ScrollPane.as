package fl.containers
{
   import fl.controls.ScrollPolicy;
   import fl.core.InvalidationType;
   import fl.display.ProLoader;
   import fl.events.ScrollEvent;
   import fl.managers.IFocusManagerComponent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.ui.Keyboard;
   
   public class ScrollPane extends BaseScrollPane implements IFocusManagerComponent
   {
      
      private static var defaultStyles:Object = {
         "upSkin":"ScrollPane_upSkin",
         "disabledSkin":"ScrollPane_disabledSkin",
         "focusRectSkin":null,
         "focusRectPadding":null,
         "contentPadding":0
      };
       
      
      protected var _source:Object = "";
      
      protected var _scrollDrag:Boolean = false;
      
      protected var contentClip:Sprite;
      
      protected var loader:ProLoader;
      
      protected var xOffset:Number;
      
      protected var yOffset:Number;
      
      protected var scrollDragHPos:Number;
      
      protected var scrollDragVPos:Number;
      
      protected var currentContent:Object;
      
      public function ScrollPane()
      {
         super();
      }
      
      public static function getStyleDefinition() : Object
      {
         return mergeStyles(defaultStyles,BaseScrollPane.getStyleDefinition());
      }
      
      public function get scrollDrag() : Boolean
      {
         return this._scrollDrag;
      }
      
      public function set scrollDrag(param1:Boolean) : void
      {
         this._scrollDrag = param1;
         invalidate(InvalidationType.STATE);
      }
      
      public function get percentLoaded() : Number
      {
         if(this.loader != null)
         {
            return Math.round(this.bytesLoaded / this.bytesTotal * 100);
         }
         return 0;
      }
      
      public function get bytesLoaded() : Number
      {
         return this.loader == null || this.loader.contentLoaderInfo == null ? Number(0) : Number(this.loader.contentLoaderInfo.bytesLoaded);
      }
      
      public function get bytesTotal() : Number
      {
         return this.loader == null || this.loader.contentLoaderInfo == null ? Number(0) : Number(this.loader.contentLoaderInfo.bytesTotal);
      }
      
      public function refreshPane() : void
      {
         if(this._source is URLRequest)
         {
            this._source = this._source.url;
         }
         this.source = this._source;
      }
      
      public function update() : void
      {
         var _loc1_:DisplayObject = this.contentClip.getChildAt(0);
         setContentSize(_loc1_.width,_loc1_.height);
      }
      
      public function get content() : DisplayObject
      {
         var _loc1_:Object = this.currentContent;
         if(_loc1_ is URLRequest)
         {
            _loc1_ = this.loader.content;
         }
         return _loc1_ as DisplayObject;
      }
      
      public function get source() : Object
      {
         return this._source;
      }
      
      public function set source(param1:Object) : void
      {
         var _loc2_:* = undefined;
         this.clearContent();
         if(isLivePreview)
         {
            return;
         }
         this._source = param1;
         if(this._source == "" || this._source == null)
         {
            return;
         }
         this.currentContent = getDisplayObjectInstance(param1);
         if(this.currentContent != null)
         {
            _loc2_ = this.contentClip.addChild(this.currentContent as DisplayObject);
            dispatchEvent(new Event(Event.INIT));
            this.update();
         }
         else
         {
            this.load(new URLRequest(this._source.toString()));
         }
      }
      
      public function load(param1:URLRequest, param2:LoaderContext = null) : void
      {
         if(param2 == null)
         {
            param2 = new LoaderContext(false,ApplicationDomain.currentDomain);
         }
         this.clearContent();
         this.initLoader();
         this.currentContent = this._source = param1;
         this.loader.load(param1,param2);
      }
      
      override protected function setVerticalScrollPosition(param1:Number, param2:Boolean = false) : void
      {
         var _loc3_:* = this.contentClip.scrollRect;
         _loc3_.y = param1;
         this.contentClip.scrollRect = _loc3_;
      }
      
      override protected function setHorizontalScrollPosition(param1:Number, param2:Boolean = false) : void
      {
         var _loc3_:* = this.contentClip.scrollRect;
         _loc3_.x = param1;
         this.contentClip.scrollRect = _loc3_;
      }
      
      override protected function drawLayout() : void
      {
         super.drawLayout();
         contentScrollRect = this.contentClip.scrollRect;
         contentScrollRect.width = availableWidth;
         contentScrollRect.height = availableHeight;
         this.contentClip.cacheAsBitmap = useBitmapScrolling;
         this.contentClip.scrollRect = contentScrollRect;
         this.contentClip.x = this.contentClip.y = contentPadding;
      }
      
      protected function onContentLoad(param1:Event) : void
      {
         this.update();
         var _loc2_:* = this.calculateAvailableHeight();
         calculateAvailableSize();
         horizontalScrollBar.setScrollProperties(availableWidth,0,!!useFixedHorizontalScrolling ? Number(_maxHorizontalScrollPosition) : Number(contentWidth - availableWidth),availableWidth);
         verticalScrollBar.setScrollProperties(_loc2_,0,contentHeight - _loc2_,_loc2_);
         this.passEvent(param1);
      }
      
      protected function passEvent(param1:Event) : void
      {
         dispatchEvent(param1);
      }
      
      protected function initLoader() : void
      {
         this.loader = new ProLoader();
         this.loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.handleError,false,0,true);
         this.loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.handleError,false,0,true);
         this.loader.contentLoaderInfo.addEventListener(Event.OPEN,this.passEvent,false,0,true);
         this.loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,this.passEvent,false,0,true);
         this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onContentLoad,false,0,true);
         this.loader.contentLoaderInfo.addEventListener(Event.INIT,this.passEvent,false,0,true);
         this.loader.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS,this.passEvent,false,0,true);
         this.contentClip.addChild(this.loader);
      }
      
      override protected function handleScroll(param1:ScrollEvent) : void
      {
         this.passEvent(param1);
         super.handleScroll(param1);
      }
      
      protected function handleError(param1:Event) : void
      {
         this.passEvent(param1);
         this.clearLoadEvents();
         this.loader.contentLoaderInfo.removeEventListener(Event.INIT,this.handleInit);
      }
      
      protected function handleInit(param1:Event) : void
      {
         this.loader.contentLoaderInfo.removeEventListener(Event.INIT,this.handleInit);
         this.passEvent(param1);
         invalidate(InvalidationType.SIZE);
      }
      
      protected function clearLoadEvents() : void
      {
         this.loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.handleError);
         this.loader.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.handleError);
         this.loader.contentLoaderInfo.removeEventListener(Event.OPEN,this.passEvent);
         this.loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,this.passEvent);
         this.loader.contentLoaderInfo.removeEventListener(HTTPStatusEvent.HTTP_STATUS,this.passEvent);
         this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.onContentLoad);
      }
      
      protected function doDrag(param1:MouseEvent) : void
      {
         var _loc2_:* = this.scrollDragVPos - (mouseY - this.yOffset);
         _verticalScrollBar.setScrollPosition(_loc2_);
         this.setVerticalScrollPosition(_verticalScrollBar.scrollPosition,true);
         var _loc3_:* = this.scrollDragHPos - (mouseX - this.xOffset);
         _horizontalScrollBar.setScrollPosition(_loc3_);
         this.setHorizontalScrollPosition(_horizontalScrollBar.scrollPosition,true);
      }
      
      protected function doStartDrag(param1:MouseEvent) : void
      {
         if(!enabled)
         {
            return;
         }
         this.xOffset = mouseX;
         this.yOffset = mouseY;
         this.scrollDragHPos = horizontalScrollPosition;
         this.scrollDragVPos = verticalScrollPosition;
         focusManager.form.addEventListener(MouseEvent.MOUSE_MOVE,this.doDrag,false,0,true);
      }
      
      protected function endDrag(param1:MouseEvent) : void
      {
         focusManager.form.removeEventListener(MouseEvent.MOUSE_MOVE,this.doDrag);
      }
      
      protected function setScrollDrag() : void
      {
         if(this._scrollDrag)
         {
            this.contentClip.addEventListener(MouseEvent.MOUSE_DOWN,this.doStartDrag,false,0,true);
            focusManager.form.addEventListener(MouseEvent.MOUSE_UP,this.endDrag,false,0,true);
         }
         else
         {
            this.contentClip.removeEventListener(MouseEvent.MOUSE_DOWN,this.doStartDrag);
            focusManager.form.removeEventListener(MouseEvent.MOUSE_UP,this.endDrag);
            removeEventListener(MouseEvent.MOUSE_MOVE,this.doDrag);
         }
         this.contentClip.buttonMode = this._scrollDrag;
      }
      
      override protected function draw() : void
      {
         if(isInvalid(InvalidationType.STYLES))
         {
            this.drawBackground();
         }
         if(isInvalid(InvalidationType.STATE))
         {
            this.setScrollDrag();
         }
         super.draw();
      }
      
      override protected function drawBackground() : void
      {
         var _loc1_:DisplayObject = background;
         background = getDisplayObjectInstance(getStyleValue(!!enabled ? "upSkin" : "disabledSkin"));
         background.width = width;
         background.height = height;
         addChildAt(background,0);
         if(_loc1_ != null && _loc1_ != background)
         {
            removeChild(_loc1_);
         }
      }
      
      protected function clearContent() : void
      {
         if(this.contentClip.numChildren == 0)
         {
            return;
         }
         this.contentClip.removeChildAt(0);
         this.currentContent = null;
         if(this.loader != null)
         {
            try
            {
               this.loader.close();
            }
            catch(e:*)
            {
            }
            try
            {
               this.loader.unload();
            }
            catch(e:*)
            {
            }
            this.loader = null;
         }
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         var _loc2_:int = this.calculateAvailableHeight();
         switch(param1.keyCode)
         {
            case Keyboard.DOWN:
               ++verticalScrollPosition;
               break;
            case Keyboard.UP:
               --verticalScrollPosition;
               break;
            case Keyboard.RIGHT:
               ++horizontalScrollPosition;
               break;
            case Keyboard.LEFT:
               --horizontalScrollPosition;
               break;
            case Keyboard.END:
               verticalScrollPosition = maxVerticalScrollPosition;
               break;
            case Keyboard.HOME:
               verticalScrollPosition = 0;
               break;
            case Keyboard.PAGE_UP:
               verticalScrollPosition -= _loc2_;
               break;
            case Keyboard.PAGE_DOWN:
               verticalScrollPosition += _loc2_;
         }
      }
      
      protected function calculateAvailableHeight() : Number
      {
         var _loc1_:Number = Number(getStyleValue("contentPadding"));
         return height - _loc1_ * 2 - (_horizontalScrollPolicy == ScrollPolicy.ON || _horizontalScrollPolicy == ScrollPolicy.AUTO && _maxHorizontalScrollPosition > 0 ? 15 : 0);
      }
      
      override protected function configUI() : void
      {
         super.configUI();
         this.contentClip = new Sprite();
         addChild(this.contentClip);
         this.contentClip.scrollRect = contentScrollRect;
         _horizontalScrollPolicy = ScrollPolicy.AUTO;
         _verticalScrollPolicy = ScrollPolicy.AUTO;
      }
   }
}
