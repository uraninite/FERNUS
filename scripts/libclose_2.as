package
{
   import flash.display.MovieClip;
   
   public dynamic class libclose extends MovieClip
   {
       
      
      public function libclose()
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
