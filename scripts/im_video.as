package
{
   import flash.display.MovieClip;
   
   public dynamic class im_video extends MovieClip
   {
       
      
      public function im_video()
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
