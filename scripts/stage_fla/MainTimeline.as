package stage_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.ui.ContextMenu;
   
   public dynamic class MainTimeline extends MovieClip
   {
       
      
      public var mc:MovieClip;
      
      public var _menu:ContextMenu;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      function frame1() : *
      {
         addEventListener(MouseEvent.RIGHT_CLICK,function(param1:MouseEvent):void
         {
         });
         addEventListener(MouseEvent.CONTEXT_MENU,function(param1:MouseEvent):void
         {
         });
         this._menu = new ContextMenu();
         this._menu.hideBuiltInItems();
      }
   }
}
