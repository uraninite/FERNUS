package
{
   import flash.display.MovieClip;
   
   public dynamic class im_curtain extends MovieClip
   {
       
      
      public function im_curtain()
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
