package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public dynamic class unitButton extends MovieClip
   {
       
      
      public var button_page:TextField;
      
      public var button_text:TextField;
      
      public var mcBg:MovieClip;
      
      public function unitButton()
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
