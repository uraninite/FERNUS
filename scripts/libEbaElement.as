package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public dynamic class libEbaElement extends MovieClip
   {
       
      
      public var mcBg:MovieClip;
      
      public var txt:TextField;
      
      public function libEbaElement()
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
