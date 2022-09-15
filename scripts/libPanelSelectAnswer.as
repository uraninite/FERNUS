package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public dynamic class libPanelSelectAnswer extends MovieClip
   {
       
      
      public var bg:MovieClip;
      
      public var bshow:MovieClip;
      
      public var txt:TextField;
      
      public function libPanelSelectAnswer()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function button_handler(e:MouseEvent) : *
      {
         this.bshow.visible = !this.bshow.visible;
      }
      
      function frame1() : *
      {
         buttonMode = true;
         this.addEventListener(MouseEvent.CLICK,this.button_handler);
      }
   }
}
