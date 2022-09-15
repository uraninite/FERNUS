package fl.controls
{
   import fl.managers.IFocusManager;
   import fl.managers.IFocusManagerGroup;
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   
   public class RadioButton extends LabelButton implements IFocusManagerGroup
   {
      
      private static var defaultStyles:Object = {
         "icon":null,
         "upIcon":"RadioButton_upIcon",
         "downIcon":"RadioButton_downIcon",
         "overIcon":"RadioButton_overIcon",
         "disabledIcon":"RadioButton_disabledIcon",
         "selectedDisabledIcon":"RadioButton_selectedDisabledIcon",
         "selectedUpIcon":"RadioButton_selectedUpIcon",
         "selectedDownIcon":"RadioButton_selectedDownIcon",
         "selectedOverIcon":"RadioButton_selectedOverIcon",
         "focusRectSkin":null,
         "focusRectPadding":null,
         "textFormat":null,
         "disabledTextFormat":null,
         "embedFonts":null,
         "textPadding":5
      };
      
      public static var createAccessibilityImplementation:Function;
       
      
      protected var _value:Object;
      
      protected var _group:RadioButtonGroup;
      
      protected var defaultGroupName:String = "RadioButtonGroup";
      
      public function RadioButton()
      {
         super();
         mode = "border";
         this.groupName = this.defaultGroupName;
      }
      
      public static function getStyleDefinition() : Object
      {
         return defaultStyles;
      }
      
      override public function get toggle() : Boolean
      {
         return true;
      }
      
      override public function set toggle(param1:Boolean) : void
      {
         throw new Error("Warning: You cannot change a RadioButtons toggle.");
      }
      
      override public function get autoRepeat() : Boolean
      {
         return false;
      }
      
      override public function set autoRepeat(param1:Boolean) : void
      {
      }
      
      override public function get selected() : Boolean
      {
         return super.selected;
      }
      
      override public function set selected(param1:Boolean) : void
      {
         if(param1 == false || this.selected)
         {
            return;
         }
         if(this._group != null)
         {
            this._group.selection = this;
         }
         else
         {
            super.selected = param1;
         }
      }
      
      override protected function configUI() : void
      {
         super.configUI();
         super.toggle = true;
         var _loc1_:Shape = new Shape();
         var _loc2_:Graphics = _loc1_.graphics;
         _loc2_.beginFill(0,0);
         _loc2_.drawRect(0,0,100,100);
         _loc2_.endFill();
         background = _loc1_ as DisplayObject;
         addChildAt(background,0);
         addEventListener(MouseEvent.CLICK,this.handleClick,false,0,true);
      }
      
      override protected function drawLayout() : void
      {
         super.drawLayout();
         var _loc1_:Number = Number(getStyleValue("textPadding"));
         switch(_labelPlacement)
         {
            case ButtonLabelPlacement.RIGHT:
               icon.x = _loc1_;
               textField.x = icon.x + (icon.width + _loc1_);
               background.width = textField.x + textField.width + _loc1_;
               background.height = Math.max(textField.height,icon.height) + _loc1_ * 2;
               break;
            case ButtonLabelPlacement.LEFT:
               icon.x = width - icon.width - _loc1_;
               textField.x = width - icon.width - _loc1_ * 2 - textField.width;
               background.width = textField.width + icon.width + _loc1_ * 3;
               background.height = Math.max(textField.height,icon.height) + _loc1_ * 2;
               break;
            case ButtonLabelPlacement.TOP:
            case ButtonLabelPlacement.BOTTOM:
               background.width = Math.max(textField.width,icon.width) + _loc1_ * 2;
               background.height = textField.height + icon.height + _loc1_ * 3;
         }
         background.x = Math.min(icon.x - _loc1_,textField.x - _loc1_);
         background.y = Math.min(icon.y - _loc1_,textField.y - _loc1_);
      }
      
      public function get groupName() : String
      {
         return this._group == null ? null : this._group.name;
      }
      
      public function set groupName(param1:String) : void
      {
         if(this._group != null)
         {
            this._group.removeRadioButton(this);
            this._group.removeEventListener(Event.CHANGE,this.handleChange);
         }
         this._group = param1 == null ? null : RadioButtonGroup.getGroup(param1);
         if(this._group != null)
         {
            this._group.addRadioButton(this);
            this._group.addEventListener(Event.CHANGE,this.handleChange,false,0,true);
         }
      }
      
      public function get group() : RadioButtonGroup
      {
         return this._group;
      }
      
      public function set group(param1:RadioButtonGroup) : void
      {
         this.groupName = param1.name;
      }
      
      public function get value() : Object
      {
         return this._value;
      }
      
      public function set value(param1:Object) : void
      {
         this._value = param1;
      }
      
      override public function drawFocus(param1:Boolean) : void
      {
         var _loc2_:Number = NaN;
         super.drawFocus(param1);
         if(param1)
         {
            _loc2_ = Number(getStyleValue("focusRectPadding"));
            uiFocusRect.x = background.x - _loc2_;
            uiFocusRect.y = background.y - _loc2_;
            uiFocusRect.width = background.width + _loc2_ * 2;
            uiFocusRect.height = background.height + _loc2_ * 2;
         }
      }
      
      protected function handleChange(param1:Event) : void
      {
         super.selected = this._group.selection == this;
         dispatchEvent(new Event(Event.CHANGE,true));
      }
      
      protected function handleClick(param1:MouseEvent) : void
      {
         if(this._group == null)
         {
            return;
         }
         this._group.dispatchEvent(new MouseEvent(MouseEvent.CLICK,true));
      }
      
      override protected function draw() : void
      {
         super.draw();
      }
      
      override protected function drawBackground() : void
      {
      }
      
      override protected function initializeAccessibility() : void
      {
         if(RadioButton.createAccessibilityImplementation != null)
         {
            RadioButton.createAccessibilityImplementation(this);
         }
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         switch(param1.keyCode)
         {
            case Keyboard.DOWN:
               this.setNext(!param1.ctrlKey);
               param1.stopPropagation();
               break;
            case Keyboard.UP:
               this.setPrev(!param1.ctrlKey);
               param1.stopPropagation();
               break;
            case Keyboard.LEFT:
               this.setPrev(!param1.ctrlKey);
               param1.stopPropagation();
               break;
            case Keyboard.RIGHT:
               this.setNext(!param1.ctrlKey);
               param1.stopPropagation();
               break;
            case Keyboard.SPACE:
               this.setThis();
               _toggle = false;
            default:
               super.keyDownHandler(param1);
         }
      }
      
      override protected function keyUpHandler(param1:KeyboardEvent) : void
      {
         super.keyUpHandler(param1);
         if(param1.keyCode == Keyboard.SPACE && !_toggle)
         {
            _toggle = true;
         }
      }
      
      private function setPrev(param1:Boolean = true) : void
      {
         var _loc6_:RadioButton = null;
         var _loc2_:RadioButtonGroup = this._group;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IFocusManager = focusManager;
         if(_loc3_)
         {
            _loc3_.showFocusIndicator = true;
         }
         var _loc5_:int;
         if((_loc5_ = int(_loc2_.getRadioButtonIndex(this))) != -1)
         {
            do
            {
               _loc5_ = --_loc5_ == -1 ? int(_loc2_.numRadioButtons - 1) : int(_loc5_);
               if((_loc6_ = _loc2_.getRadioButtonAt(_loc5_)) && _loc6_.enabled)
               {
                  if(param1)
                  {
                     _loc2_.selection = _loc6_;
                  }
                  _loc6_.setFocus();
                  return;
               }
               if(param1 && _loc2_.getRadioButtonAt(_loc5_) != _loc2_.selection)
               {
                  _loc2_.selection = this;
               }
               this.drawFocus(true);
            }
            while(_loc5_ != _loc4_);
            
         }
      }
      
      private function setNext(param1:Boolean = true) : void
      {
         var _loc7_:RadioButton = null;
         var _loc2_:RadioButtonGroup = this._group;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IFocusManager = focusManager;
         if(_loc3_)
         {
            _loc3_.showFocusIndicator = true;
         }
         var _loc4_:int = _loc2_.getRadioButtonIndex(this);
         var _loc5_:Number = _loc2_.numRadioButtons;
         var _loc6_:int = _loc4_;
         if(_loc4_ != -1)
         {
            do
            {
               _loc6_++;
               _loc6_ = _loc6_ > _loc2_.numRadioButtons - 1 ? 0 : int(_loc6_);
               if((_loc7_ = _loc2_.getRadioButtonAt(_loc6_)) && _loc7_.enabled)
               {
                  if(param1)
                  {
                     _loc2_.selection = _loc7_;
                  }
                  _loc7_.setFocus();
                  return;
               }
               if(param1 && _loc2_.getRadioButtonAt(_loc6_) != _loc2_.selection)
               {
                  _loc2_.selection = this;
               }
               this.drawFocus(true);
            }
            while(_loc6_ != _loc4_);
            
         }
      }
      
      private function setThis() : void
      {
         var _loc1_:RadioButtonGroup = this._group;
         if(_loc1_ != null)
         {
            if(_loc1_.selection != this)
            {
               _loc1_.selection = this;
            }
         }
         else
         {
            super.selected = true;
         }
      }
   }
}
