package fl.controls
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class RadioButtonGroup extends EventDispatcher
   {
      
      private static var groups:Object;
      
      private static var groupCount:uint = 0;
       
      
      protected var _name:String;
      
      protected var radioButtons:Array;
      
      protected var _selection:RadioButton;
      
      public function RadioButtonGroup(param1:String)
      {
         super();
         this._name = param1;
         this.radioButtons = [];
         registerGroup(this);
      }
      
      public static function getGroup(param1:String) : RadioButtonGroup
      {
         if(groups == null)
         {
            groups = {};
         }
         var _loc2_:RadioButtonGroup = groups[param1] as RadioButtonGroup;
         if(_loc2_ == null)
         {
            _loc2_ = new RadioButtonGroup(param1);
            if(++groupCount % 20 == 0)
            {
               cleanUpGroups();
            }
         }
         return _loc2_;
      }
      
      private static function registerGroup(param1:RadioButtonGroup) : void
      {
         if(groups == null)
         {
            groups = {};
         }
         groups[param1.name] = param1;
      }
      
      private static function cleanUpGroups() : void
      {
         var _loc1_:* = null;
         var _loc2_:RadioButtonGroup = null;
         for(_loc1_ in groups)
         {
            _loc2_ = groups[_loc1_] as RadioButtonGroup;
            if(_loc2_.radioButtons.length == 0)
            {
               delete groups[_loc1_];
            }
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function addRadioButton(param1:RadioButton) : void
      {
         if(param1.groupName != this.name)
         {
            param1.groupName = this.name;
            return;
         }
         this.radioButtons.push(param1);
         if(param1.selected)
         {
            this.selection = param1;
         }
      }
      
      public function removeRadioButton(param1:RadioButton) : void
      {
         var _loc2_:int = this.getRadioButtonIndex(param1);
         if(_loc2_ != -1)
         {
            this.radioButtons.splice(_loc2_,1);
         }
         if(this._selection == param1)
         {
            this._selection = null;
         }
      }
      
      public function get selection() : RadioButton
      {
         return this._selection;
      }
      
      public function set selection(param1:RadioButton) : void
      {
         if(this._selection == param1 || param1 == null || this.getRadioButtonIndex(param1) == -1)
         {
            return;
         }
         this._selection = param1;
         dispatchEvent(new Event(Event.CHANGE,true));
      }
      
      public function get selectedData() : Object
      {
         var _loc1_:RadioButton = this._selection;
         return _loc1_ == null ? null : _loc1_.value;
      }
      
      public function set selectedData(param1:Object) : void
      {
         var _loc3_:RadioButton = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.radioButtons.length)
         {
            _loc3_ = this.radioButtons[_loc2_] as RadioButton;
            if(_loc3_.value == param1)
            {
               this.selection = _loc3_;
               return;
            }
            _loc2_++;
         }
      }
      
      public function getRadioButtonIndex(param1:RadioButton) : int
      {
         var _loc3_:RadioButton = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.radioButtons.length)
         {
            _loc3_ = this.radioButtons[_loc2_] as RadioButton;
            if(_loc3_ == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function getRadioButtonAt(param1:int) : RadioButton
      {
         return RadioButton(this.radioButtons[param1]);
      }
      
      public function get numRadioButtons() : int
      {
         return this.radioButtons.length;
      }
   }
}
