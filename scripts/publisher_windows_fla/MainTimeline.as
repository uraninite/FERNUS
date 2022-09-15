package publisher_windows_fla
{
   import flash.display.MovieClip;
   
   public dynamic class MainTimeline extends MovieClip
   {
       
      
      public var pkxkname:String;
      
      public var publisher:String;
      
      public var fernusCode;
      
      public var color:uint;
      
      public var server:String;
      
      public var passwordStatus:Boolean;
      
      public var operatingSystem:String;
      
      public var byte;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      function frame1() : *
      {
         this.pkxkname = "fernus";
         this.publisher = "FERNUS";
         this.fernusCode = "QUU9XVksWVU=";
         this.color = 2301728;
         this.server = "http://www.fernus.com.tr/data_json.php";
         this.passwordStatus = false;
         this.operatingSystem = "windows";
         this.byte = "8RldIcxX1ESBXpjEOA2XhhXNtkQXCdFIpoQRHcAESxCEC4nFGpwCIxTCDczOV4BCVU0PGYFJ45TCbUgHakEJAhCfbMwFxUyKIkEKccCLxhhUKdhEFNyZwQBOXgWF7kTU+AiDppRAIwxUII3JRpyI9s3E/Yze29RSkIDD50VCDQyMAEnHShSHeI0KEBVBBECRUZ3H/swAZklVBMjFhNAf3oCB2AyUncCSbcmZapxVY8xB1lSMc0CSboBATkiOZUwCEhQO5pBUzIhJkoBB0gjCfAwODhDDCo0WIBTDekCRkM2SGojN4MQESYgdyZxVDowBAsyBVMyQCojXIlDDZBDH2FVTgYiQ4k2EX0VKZZmBBdhAIFyX1EDJlMCV3QCNGQQGaVkAR9DMwtzO/4TaAE0PO1lN80VJ4sFHEklHfElJQUgeGUCO";
      }
   }
}
