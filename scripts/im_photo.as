package
{
   import flash.display.MovieClip;
   
   public dynamic class im_photo extends MovieClip
   {
       
      
      public function im_photo()
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
