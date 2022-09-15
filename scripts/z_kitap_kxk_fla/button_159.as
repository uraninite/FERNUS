package z_kitap_kxk_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public dynamic class button_159 extends MovieClip
   {
       
      
      public var f;
      
      public function button_159()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function down() : *
      {
         if(currentFrame == 1)
         {
            gotoAndStop(2);
         }
         else if(currentFrame == 3)
         {
            gotoAndStop(4);
         }
         else
         {
            gotoAndStop(6);
         }
         MovieClip(this.parent).btn.filters = undefined;
      }
      
      public function up() : *
      {
         if(currentFrame == 2 || currentFrame == 1)
         {
            gotoAndStop(1);
         }
         else if(currentFrame == 4 || currentFrame == 3)
         {
            gotoAndStop(3);
         }
         else
         {
            gotoAndStop(5);
         }
         MovieClip(this.parent).btn.filters = this.f;
      }
      
      function frame1() : *
      {
         stop();
         if(!this.init)
         {
            this.f = MovieClip(this.parent).btn.filters;
            this.init = true;
            this.addEventListener(MouseEvent.MOUSE_DOWN,function():*
            {
               down();
            });
            this.addEventListener(MouseEvent.MOUSE_UP,function():*
            {
               up();
            });
            this.addEventListener(MouseEvent.MOUSE_OUT,function():*
            {
               up();
            });
         }
      }
   }
}
