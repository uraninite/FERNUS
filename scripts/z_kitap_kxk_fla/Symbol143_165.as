package z_kitap_kxk_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public dynamic class Symbol143_165 extends MovieClip
   {
       
      
      public function Symbol143_165()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function toggle(e:Event) : *
      {
         gotoAndStop(currentFrame == 1 ? 2 : 1);
      }
      
      function frame1() : *
      {
         stop();
         if(!this.init)
         {
            this.init = true;
            this.addEventListener(MouseEvent.CLICK,this.toggle);
         }
         buttonMode = true;
      }
   }
}
