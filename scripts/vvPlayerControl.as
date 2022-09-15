package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public dynamic class vvPlayerControl extends MovieClip
   {
       
      
      public var bar:MovieClip;
      
      public var bg:MovieClip;
      
      public var btnPlayPause:MovieClip;
      
      public var txt:TextField;
      
      public function vvPlayerControl()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      function frame1() : *
      {
      }
   }
}
