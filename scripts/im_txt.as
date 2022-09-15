package
{
   import flash.display.MovieClip;
   
   public dynamic class im_txt extends MovieClip
   {
       
      
      public function im_txt()
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
