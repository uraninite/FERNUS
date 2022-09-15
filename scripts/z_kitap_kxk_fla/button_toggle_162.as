package z_kitap_kxk_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public dynamic class button_toggle_162 extends MovieClip
   {
       
      
      public var f;
      
      public var toggled;
      
      public function button_toggle_162()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function toggleBtn(e:Event) : *
      {
         if(!this.toggled)
         {
            this.down();
            this.toggled = true;
         }
         else
         {
            this.up();
            this.toggled = false;
         }
      }
      
      public function down() : *
      {
         gotoAndStop(2);
         this.y = 1;
         MovieClip(this.parent).btn.filters = undefined;
      }
      
      public function up() : *
      {
         gotoAndStop(1);
         this.y = 0;
         MovieClip(this.parent).btn.filters = this.f;
      }
      
      function frame1() : *
      {
         stop();
         if(!this.init)
         {
            this.f = MovieClip(this.parent).btn.filters;
            this.toggled = false;
            this.init = true;
            this.addEventListener(MouseEvent.CLICK,this.toggleBtn);
         }
      }
   }
}
