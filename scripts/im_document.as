package
{
   import flash.display.MovieClip;
   
   public dynamic class im_document extends MovieClip
   {
       
      
      public function im_document()
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
