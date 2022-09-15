package
{
   import flash.display.MovieClip;
   
   public dynamic class im_eba extends MovieClip
   {
       
      
      public function im_eba()
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
