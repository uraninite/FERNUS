package
{
   import flash.display.MovieClip;
   
   public dynamic class sIm extends MovieClip
   {
       
      
      public function sIm()
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
