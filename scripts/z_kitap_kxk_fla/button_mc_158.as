package z_kitap_kxk_fla
{
   import flash.display.MovieClip;
   
   public dynamic class button_mc_158 extends MovieClip
   {
       
      
      public var btn:MovieClip;
      
      public var label:MovieClip;
      
      public function button_mc_158()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function setKey(num:*) : *
      {
         this.label.gotoAndStop(num);
      }
      
      function frame1() : *
      {
         this.buttonMode = true;
         this.label.mouseEnabled = false;
      }
   }
}
