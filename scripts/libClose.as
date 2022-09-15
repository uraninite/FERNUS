package
{
   import flash.display.MovieClip;
   
   public dynamic class libClose extends MovieClip
   {
       
      
      public function libClose()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      function frame1() : *
      {
         buttonMode = true;
      }
   }
}
