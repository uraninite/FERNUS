package z_kitap_kxk_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public dynamic class Symbol7_96 extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public var _selected;
      
      public function Symbol7_96()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function check(e:MouseEvent = null) : *
      {
         this._selected = !this._selected;
         this.icon.gotoAndStop(!!this._selected ? 2 : 1);
      }
      
      public function set selected(_v:Boolean) : *
      {
         this._selected = _v;
         this.icon.gotoAndStop(!!this._selected ? 2 : 1);
      }
      
      public function get selected() : *
      {
         return this._selected;
      }
      
      function frame1() : *
      {
         this._selected = false;
         this.addEventListener(MouseEvent.CLICK,this.check);
         buttonMode = true;
      }
   }
}
