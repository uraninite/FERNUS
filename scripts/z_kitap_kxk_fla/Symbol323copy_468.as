package z_kitap_kxk_fla
{
   import fl.controls.ComboBox;
   import fl.data.DataProvider;
   import fl.data.SimpleCollectionItem;
   import flash.display.MovieClip;
   
   public dynamic class Symbol323copy_468 extends MovieClip
   {
       
      
      public var startDay:ComboBox;
      
      public var startHour:ComboBox;
      
      public var startMinute:ComboBox;
      
      public var startMonth:ComboBox;
      
      public var startYear:ComboBox;
      
      public var _date:Date;
      
      public var _days:Array;
      
      public var _months:Array;
      
      public var _years:Array;
      
      public var _hours:Array;
      
      public var _minutes:Array;
      
      public var _currentYear;
      
      public var _i;
      
      public var _s:String;
      
      public var _y;
      
      public function Symbol323copy_468()
      {
         super();
         addFrameScript(0,this.frame1);
         this.__setProp_startDay_Symbol323copy_Layer1_0();
         this.__setProp_startMonth_Symbol323copy_Layer1_0();
         this.__setProp_startYear_Symbol323copy_Layer1_0();
         this.__setProp_startHour_Symbol323copy_Layer1_0();
         this.__setProp_startMinute_Symbol323copy_Layer1_0();
      }
      
      public function refreshDate() : *
      {
         var _d:Date = new Date();
         _d.hours += 2;
         this.startDay.selectedIndex = this._date.date - 1;
         this.startMonth.selectedIndex = this._date.month;
         this.startYear.selectedIndex = this._currentYear;
         this.startHour.selectedIndex = _d.hours;
         this.startMinute.selectedIndex = 0;
      }
      
      public function getStart() : String
      {
         return this.startDay.selectedItem.data + "." + this.startMonth.selectedItem.data + "." + this.startYear.selectedItem.data + " " + this.startHour.selectedItem.data + ":" + this.startMinute.selectedItem.data;
      }
      
      function __setProp_startDay_Symbol323copy_Layer1_0() : *
      {
         var itemObj7:SimpleCollectionItem = null;
         var collProps7:Array = null;
         var collProp7:Object = null;
         var i7:int = 0;
         var j7:* = undefined;
         try
         {
            this.startDay["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         var collObj7:DataProvider = new DataProvider();
         collProps7 = [];
         for(i7 = 0; i7 < collProps7.length; i7++)
         {
            itemObj7 = new SimpleCollectionItem();
            collProp7 = collProps7[i7];
            for(j7 in collProp7)
            {
               itemObj7[j7] = collProp7[j7];
            }
            collObj7.addItem(itemObj7);
         }
         this.startDay.dataProvider = collObj7;
         this.startDay.editable = false;
         this.startDay.enabled = true;
         this.startDay.prompt = "16";
         this.startDay.restrict = "";
         this.startDay.rowCount = 5;
         this.startDay.visible = true;
         try
         {
            this.startDay["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      function __setProp_startMonth_Symbol323copy_Layer1_0() : *
      {
         var itemObj8:SimpleCollectionItem = null;
         var collProps8:Array = null;
         var collProp8:Object = null;
         var i8:int = 0;
         var j8:* = undefined;
         try
         {
            this.startMonth["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         var collObj8:DataProvider = new DataProvider();
         collProps8 = [];
         for(i8 = 0; i8 < collProps8.length; i8++)
         {
            itemObj8 = new SimpleCollectionItem();
            collProp8 = collProps8[i8];
            for(j8 in collProp8)
            {
               itemObj8[j8] = collProp8[j8];
            }
            collObj8.addItem(itemObj8);
         }
         this.startMonth.dataProvider = collObj8;
         this.startMonth.editable = false;
         this.startMonth.enabled = true;
         this.startMonth.prompt = "16";
         this.startMonth.restrict = "";
         this.startMonth.rowCount = 5;
         this.startMonth.visible = true;
         try
         {
            this.startMonth["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      function __setProp_startYear_Symbol323copy_Layer1_0() : *
      {
         var itemObj9:SimpleCollectionItem = null;
         var collProps9:Array = null;
         var collProp9:Object = null;
         var i9:int = 0;
         var j9:* = undefined;
         try
         {
            this.startYear["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         var collObj9:DataProvider = new DataProvider();
         collProps9 = [];
         for(i9 = 0; i9 < collProps9.length; i9++)
         {
            itemObj9 = new SimpleCollectionItem();
            collProp9 = collProps9[i9];
            for(j9 in collProp9)
            {
               itemObj9[j9] = collProp9[j9];
            }
            collObj9.addItem(itemObj9);
         }
         this.startYear.dataProvider = collObj9;
         this.startYear.editable = false;
         this.startYear.enabled = true;
         this.startYear.prompt = "2020";
         this.startYear.restrict = "";
         this.startYear.rowCount = 5;
         this.startYear.visible = true;
         try
         {
            this.startYear["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      function __setProp_startHour_Symbol323copy_Layer1_0() : *
      {
         var itemObj10:SimpleCollectionItem = null;
         var collProps10:Array = null;
         var collProp10:Object = null;
         var i10:int = 0;
         var j10:* = undefined;
         try
         {
            this.startHour["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         var collObj10:DataProvider = new DataProvider();
         collProps10 = [];
         for(i10 = 0; i10 < collProps10.length; i10++)
         {
            itemObj10 = new SimpleCollectionItem();
            collProp10 = collProps10[i10];
            for(j10 in collProp10)
            {
               itemObj10[j10] = collProp10[j10];
            }
            collObj10.addItem(itemObj10);
         }
         this.startHour.dataProvider = collObj10;
         this.startHour.editable = false;
         this.startHour.enabled = true;
         this.startHour.prompt = "16";
         this.startHour.restrict = "";
         this.startHour.rowCount = 5;
         this.startHour.visible = true;
         try
         {
            this.startHour["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      function __setProp_startMinute_Symbol323copy_Layer1_0() : *
      {
         var itemObj11:SimpleCollectionItem = null;
         var collProps11:Array = null;
         var collProp11:Object = null;
         var i11:int = 0;
         var j11:* = undefined;
         try
         {
            this.startMinute["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         var collObj11:DataProvider = new DataProvider();
         collProps11 = [];
         for(i11 = 0; i11 < collProps11.length; i11++)
         {
            itemObj11 = new SimpleCollectionItem();
            collProp11 = collProps11[i11];
            for(j11 in collProp11)
            {
               itemObj11[j11] = collProp11[j11];
            }
            collObj11.addItem(itemObj11);
         }
         this.startMinute.dataProvider = collObj11;
         this.startMinute.editable = false;
         this.startMinute.enabled = true;
         this.startMinute.prompt = "16";
         this.startMinute.restrict = "";
         this.startMinute.rowCount = 5;
         this.startMinute.visible = true;
         try
         {
            this.startMinute["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      function frame1() : *
      {
         this._date = new Date();
         this._days = new Array();
         this._months = new Array();
         this._years = new Array();
         this._hours = new Array();
         this._minutes = new Array();
         this._i = 0;
         for(this._i = 1; this._i < 32; ++this._i)
         {
            this._s = (this._i < 10 ? "0" : "") + this._i.toString();
            this._days.push({
               "label":this._s,
               "data":this._s
            });
         }
         for(this._i = 1; this._i < 13; ++this._i)
         {
            this._s = (this._i < 10 ? "0" : "") + this._i.toString();
            this._months.push({
               "label":this._s,
               "data":this._s
            });
         }
         for(this._i = 0; this._i < 15; ++this._i)
         {
            this._y = (this._date.fullYear + this._i).toString();
            if(this._y == this._date.fullYear)
            {
               this._currentYear = this._i;
            }
            this._years.push({
               "label":this._y,
               "data":this._y
            });
         }
         for(this._i = 0; this._i < 24; ++this._i)
         {
            this._s = (this._i < 10 ? "0" : "") + this._i.toString();
            this._hours.push({
               "label":this._s,
               "data":this._s
            });
         }
         for(this._i = 0; this._i < 60; this._i += 15)
         {
            this._s = (this._i < 10 ? "0" : "") + this._i.toString();
            this._minutes.push({
               "label":this._s,
               "data":this._s
            });
         }
         this.startDay.dataProvider = new DataProvider(this._days);
         this.startMonth.dataProvider = new DataProvider(this._months);
         this.startYear.dataProvider = new DataProvider(this._years);
         this.startHour.dataProvider = new DataProvider(this._hours);
         this.startMinute.dataProvider = new DataProvider(this._minutes);
      }
   }
}
