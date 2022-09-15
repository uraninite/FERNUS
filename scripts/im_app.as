package
{
   import flash.display.MovieClip;
   
   public dynamic class im_app extends MovieClip
   {
       
      
      public function im_app()
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
