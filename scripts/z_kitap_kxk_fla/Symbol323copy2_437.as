package z_kitap_kxk_fla
{
   import fl.controls.ComboBox;
   import fl.data.DataProvider;
   import fl.data.SimpleCollectionItem;
   import flash.display.MovieClip;
   
   public dynamic class Symbol323copy2_437 extends MovieClip
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
      
      public function Symbol323copy2_437()
      {
         super();
         addFrameScript(0,this.frame1);
         this.__setProp_startDay_Symbol323copy2_Layer1_0();
         this.__setProp_startMonth_Symbol323copy2_Layer1_0();
         this.__setProp_startYear_Symbol323copy2_Layer1_0();
         this.__setProp_startHour_Symbol323copy2_Layer1_0();
         this.__setProp_startMinute_Symbol323copy2_Layer1_0();
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
      
      function __setProp_startDay_Symbol323copy2_Layer1_0() : *
      {
         var itemObj0:SimpleCollectionItem = null;
         var collProps0:Array = null;
         var collProp0:Object = null;
         var i0:int = 0;
         var j0:* = undefined;
         try
         {
            this.startDay["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         var collObj0:DataProvider = new DataProvider();
         collProps0 = [];
         for(i0 = 0; i0 < collProps0.length; i0++)
         {
            itemObj0 = new SimpleCollectionItem();
            collProp0 = collProps0[i0];
            for(j0 in collProp0)
            {
               itemObj0[j0] = collProp0[j0];
            }
            collObj0.addItem(itemObj0);
         }
         this.startDay.dataProvider = collObj0;
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
      
      function __setProp_startMonth_Symbol323copy2_Layer1_0() : *
      {
         var itemObj1:SimpleCollectionItem = null;
         var collProps1:Array = null;
         var collProp1:Object = null;
         var i1:int = 0;
         var j1:* = undefined;
         try
         {
            this.startMonth["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         var collObj1:DataProvider = new DataProvider();
         collProps1 = [];
         for(i1 = 0; i1 < collProps1.length; i1++)
         {
            itemObj1 = new SimpleCollectionItem();
            collProp1 = collProps1[i1];
            for(j1 in collProp1)
            {
               itemObj1[j1] = collProp1[j1];
            }
            collObj1.addItem(itemObj1);
         }
         this.startMonth.dataProvider = collObj1;
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
      
      function __setProp_startYear_Symbol323copy2_Layer1_0() : *
      {
         var itemObj2:SimpleCollectionItem = null;
         var collProps2:Array = null;
         var collProp2:Object = null;
         var i2:int = 0;
         var j2:* = undefined;
         try
         {
            this.startYear["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         var collObj2:DataProvider = new DataProvider();
         collProps2 = [];
         for(i2 = 0; i2 < collProps2.length; i2++)
         {
            itemObj2 = new SimpleCollectionItem();
            collProp2 = collProps2[i2];
            for(j2 in collProp2)
            {
               itemObj2[j2] = collProp2[j2];
            }
            collObj2.addItem(itemObj2);
         }
         this.startYear.dataProvider = collObj2;
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
      
      function __setProp_startHour_Symbol323copy2_Layer1_0() : *
      {
         var itemObj3:SimpleCollectionItem = null;
         var collProps3:Array = null;
         var collProp3:Object = null;
         var i3:int = 0;
         var j3:* = undefined;
         try
         {
            this.startHour["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         var collObj3:DataProvider = new DataProvider();
         collProps3 = [];
         for(i3 = 0; i3 < collProps3.length; i3++)
         {
            itemObj3 = new SimpleCollectionItem();
            collProp3 = collProps3[i3];
            for(j3 in collProp3)
            {
               itemObj3[j3] = collProp3[j3];
            }
            collObj3.addItem(itemObj3);
         }
         this.startHour.dataProvider = collObj3;
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
      
      function __setProp_startMinute_Symbol323copy2_Layer1_0() : *
      {
         var itemObj4:SimpleCollectionItem = null;
         var collProps4:Array = null;
         var collProp4:Object = null;
         var i4:int = 0;
         var j4:* = undefined;
         try
         {
            this.startMinute["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         var collObj4:DataProvider = new DataProvider();
         collProps4 = [];
         for(i4 = 0; i4 < collProps4.length; i4++)
         {
            itemObj4 = new SimpleCollectionItem();
            collProp4 = collProps4[i4];
            for(j4 in collProp4)
            {
               itemObj4[j4] = collProp4[j4];
            }
            collObj4.addItem(itemObj4);
         }
         this.startMinute.dataProvider = collObj4;
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
