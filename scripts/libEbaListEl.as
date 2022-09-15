package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public dynamic class libEbaListEl extends MovieClip
   {
       
      
      public var mcBg:MovieClip;
      
      public var mcCon:MovieClip;
      
      public var mcDrag:MovieClip;
      
      public var txtTitle:TextField;
      
      public function libEbaListEl()
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
