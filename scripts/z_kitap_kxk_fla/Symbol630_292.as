package z_kitap_kxk_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.LocationChangeEvent;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.media.StageWebView;
   
   public dynamic class Symbol630_292 extends MovieClip
   {
       
      
      public var bg:MovieClip;
      
      public var con:MovieClip;
      
      public var _stageWebView:StageWebView;
      
      public function Symbol630_292()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function openWeb(_url:String, _scale:*) : *
      {
         this.closeWeb();
         this._stageWebView = new StageWebView(false);
         this._stageWebView.stage = this.stage;
         var _bounds:Rectangle = this.con.mcframe.getBounds(this);
         this._stageWebView.viewPort = new Rectangle(_bounds.x,_bounds.y,_bounds.width,_bounds.height);
         this._stageWebView.addEventListener(Event.COMPLETE,this.locationComplete);
         this._stageWebView.addEventListener(LocationChangeEvent.LOCATION_CHANGE,this.locationChange);
         this._stageWebView.loadURL(_url + "&width=" + String(_bounds.width * _scale) + "&height=" + String(_bounds.height * _scale));
      }
      
      public function closeWeb(e:MouseEvent = null) : *
      {
         if(this._stageWebView)
         {
            this._stageWebView.viewPort = null;
            this._stageWebView.dispose();
            this._stageWebView = null;
         }
      }
      
      public function locationComplete(e:Event = null) : *
      {
      }
      
      public function locationChange(e:LocationChangeEvent = null) : *
      {
         var _status:* = undefined;
         var _responseURL:String = this._stageWebView.location;
         if(-1 < _responseURL.indexOf("status"))
         {
            _status = _responseURL.split("status=")[1];
            trace("locationChange --- ",_status);
         }
      }
      
      function frame1() : *
      {
      }
   }
}
