package
{
   import flash.display.MovieClip;
   
   public dynamic class im_sound extends MovieClip
   {
       
      
      public function im_sound()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      function frame1() : *
      {
         stop();
         buttonMode = true;
      }
   }
}
