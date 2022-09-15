package
{
   import flash.display.MovieClip;
   
   public dynamic class im_link extends MovieClip
   {
       
      
      public function im_link()
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
