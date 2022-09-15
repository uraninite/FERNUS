package
{
   import flash.display.MovieClip;
   
   public dynamic class libMainKBCon extends MovieClip
   {
       
      
      public var btnClose:libClose;
      
      public var mcHeader:MovieClip;
      
      public function libMainKBCon()
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
