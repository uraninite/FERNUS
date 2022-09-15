package
{
   import flash.display.MovieClip;
   
   public dynamic class libKeyboardCon extends MovieClip
   {
       
      
      public var btnColor:MovieClip;
      
      public var btnSize:MovieClip;
      
      public var mcHeader:MovieClip;
      
      public function libKeyboardCon()
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
