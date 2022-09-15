package z_kitap_kxk_fla
{
   import fl.controls.ComboBox;
   import fl.data.DataProvider;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public dynamic class Symbol344_467 extends MovieClip
   {
       
      
      public var bsave:MovieClip;
      
      public var close:libClose;
      
      public var comboDuration:ComboBox;
      
      public var comboProvider:ComboBox;
      
      public var datePicker:MovieClip;
      
      public var txtName:TextField;
      
      public var _durations;
      
      public function Symbol344_467()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function setProvider(_a:Array) : *
      {
         this.comboProvider.dataProvider = new DataProvider(_a);
         this.comboProvider.selectedIndex = 0;
      }
      
      function frame1() : *
      {
         this._durations = new Array();
         this._durations.push({
            "label":"15",
            "data":15
         });
         this._durations.push({
            "label":"30",
            "data":30
         });
         this._durations.push({
            "label":"45",
            "data":45
         });
         this.comboDuration.dataProvider = new DataProvider(this._durations);
         this.comboDuration.selectedIndex = 2;
      }
   }
}
