package com.kxk.keyboard
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class KryKeyboard extends Sprite
   {
       
      
      public var raleway:Class;
      
      private var _width:Number;
      
      private var _height:Number;
      
      private var _layer1:Sprite;
      
      private var _layer2:Sprite;
      
      private var _layer3:Sprite;
      
      private var _layer4:Sprite;
      
      private var _layer5:Sprite;
      
      private var _capsLock:Boolean = false;
      
      private var _shift:Boolean = false;
      
      private var _text:String = "";
      
      private var _targetTF:TextField;
      
      private var _keys:Object;
      
      public function KryKeyboard(_targetTF:TextField)
      {
         this.raleway = KryKeyboard_raleway;
         super();
         if(KeyConst.LANGUAGE == "tr")
         {
            this._keys = KeyConst.keys;
         }
         else
         {
            this._keys = KeyConst.keysEn;
         }
         this._targetTF = _targetTF;
         this.initialize();
      }
      
      private function initialize(e:Event = null) : void
      {
         var _l1:Array = this._keys.layer1;
         var _l2:Array = this._keys.layer2;
         var _l3:Array = this._keys.layer3;
         var _l4:Array = this._keys.layer4;
         var _l5:Array = this._keys.layer5;
         this._layer1 = this.addButton(_l1);
         this._layer2 = this.addButton(_l2);
         this._layer3 = this.addButton(_l3);
         this._layer4 = this.addButton(_l4);
         this._layer5 = this.addButton(_l5);
         this._layer1.y = KeyConst.SPACE * 2;
         this._layer2.y = this._layer1.y + this._layer1.height + KeyConst.SPACE;
         this._layer3.y = this._layer2.y + this._layer2.height + KeyConst.SPACE;
         this._layer4.y = this._layer3.y + this._layer3.height + KeyConst.SPACE;
         this._layer5.y = this._layer4.y + this._layer4.height + KeyConst.SPACE;
         this._layer1.x = KeyConst.SPACE * 2;
         this._layer2.x = KeyConst.SPACE * 2;
         this._layer3.x = KeyConst.SPACE * 2;
         this._layer4.x = KeyConst.SPACE * 2;
         this._layer5.x = KeyConst.SPACE * 2;
         this.addChild(this._layer1);
         this.addChild(this._layer2);
         this.addChild(this._layer3);
         this.addChild(this._layer4);
         this.addChild(this._layer5);
         this._layer1.addEventListener(MouseEvent.CLICK,this.onButtonClick);
         this._layer2.addEventListener(MouseEvent.CLICK,this.onButtonClick);
         this._layer3.addEventListener(MouseEvent.CLICK,this.onButtonClick);
         this._layer4.addEventListener(MouseEvent.CLICK,this.onButtonClick);
         this._layer5.addEventListener(MouseEvent.CLICK,this.onButtonClick);
         this.graphics.beginFill(KeyConst.KEYBOARD_BACKGROUND_COLOR);
         this.graphics.drawRect(0,0,this.width + KeyConst.SPACE * 4,this.height + KeyConst.SPACE * 4);
         this.graphics.endFill();
      }
      
      private function onButtonClick(e:MouseEvent) : void
      {
         var _key:Object = null;
         var _string:String = null;
         var _button:Key = Key(e.target);
         if(KeyConst.LANGUAGE == "tr")
         {
            switch(_button.name.split("_")[2])
            {
               case "Geri Al":
                  this.deleteLetter(-1,0);
                  break;
               case "Sekme":
                  this.updateTargetTF("     ");
                  break;
               case "Giriş":
                  this.updateTargetTF("\n");
                  break;
               case "Büyük Harf":
                  this._capsLock = !this._capsLock;
                  _button.toggle = this._capsLock;
                  this.setButtonCase();
                  break;
               case "Sil":
                  this.deleteLetter(0,1);
                  break;
               case "Üst":
                  this._shift = !this._shift;
                  this.setButtonShift();
                  break;
               case "Boşluk":
                  this.updateTargetTF(" ");
                  break;
               case "Yukarı":
                  this.moveCaret("up");
                  break;
               case "Aşağı":
                  this.moveCaret("down");
                  break;
               case "Sol":
                  if(0 < this._targetTF.caretIndex)
                  {
                     this._targetTF.setSelection(this._targetTF.caretIndex - 1,this._targetTF.caretIndex - 1);
                  }
                  break;
               case "Sağ":
                  if(this._targetTF.caretIndex < this._targetTF.text.length)
                  {
                     this._targetTF.setSelection(this._targetTF.caretIndex + 1,this._targetTF.caretIndex + 1);
                  }
                  break;
               default:
                  _key = this.findSingleButtonFromName(_button.name.split("_")[2]);
                  _string = _key.t1;
                  if(this._capsLock)
                  {
                     if(_key.upper)
                     {
                        _string = _key.upper;
                     }
                  }
                  if(this._shift)
                  {
                     if(_key.t2)
                     {
                        _string = _key.t2;
                     }
                  }
                  this.updateTargetTF(_string);
            }
         }
         else
         {
            switch(_button.name.split("_")[2])
            {
               case "Backspace":
                  this.deleteLetter(-1,0);
                  break;
               case "Tab":
                  this.updateTargetTF("     ");
                  break;
               case "Enter":
                  if(this._targetTF.multiline)
                  {
                     this.updateTargetTF("\n");
                  }
                  break;
               case "Caps Lock":
                  this._capsLock = !this._capsLock;
                  _button.toggle = this._capsLock;
                  this.setButtonCase();
                  break;
               case "Delete":
                  this.deleteLetter(0,1);
                  break;
               case "Shift":
                  this._shift = !this._shift;
                  this.setButtonShift();
                  break;
               case "Space":
                  this.updateTargetTF(" ");
                  break;
               case "Up":
                  this.moveCaret("up");
                  break;
               case "Down":
                  this.moveCaret("down");
                  break;
               case "Left":
                  if(0 < this._targetTF.caretIndex)
                  {
                     this._targetTF.setSelection(this._targetTF.caretIndex - 1,this._targetTF.caretIndex - 1);
                  }
                  break;
               case "Right":
                  if(this._targetTF.caretIndex < this._targetTF.text.length)
                  {
                     this._targetTF.setSelection(this._targetTF.caretIndex + 1,this._targetTF.caretIndex + 1);
                  }
                  break;
               default:
                  _key = this.findSingleButtonFromName(_button.name.split("_")[2]);
                  _string = _key.t1;
                  if(this._capsLock)
                  {
                     if(_key.upper)
                     {
                        _string = _key.upper;
                     }
                  }
                  if(this._shift)
                  {
                     if(_key.t2)
                     {
                        _string = _key.t2;
                     }
                  }
                  this.updateTargetTF(_string);
            }
         }
         stage.focus = this._targetTF;
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function updateTargetTF(_string:String) : void
      {
         var _initialText:String = this._targetTF.text;
         var _ci:int = this._targetTF.caretIndex;
         var newText:String = _initialText.substring(0,_ci) + _string + _initialText.substring(_ci,_initialText.length);
         this._targetTF.text = newText;
         this._targetTF.setSelection(_ci + _string.length,_ci + _string.length);
      }
      
      public function deleteLetter(_back:int, _forward:int = 0) : void
      {
         var newText:String = null;
         var _initialText:String = this._targetTF.text;
         var _ci:int = this._targetTF.caretIndex;
         if(this._targetTF.text != "")
         {
            newText = _initialText.substring(0,_ci + _back) + _initialText.substring(_ci + _forward,_initialText.length);
            this._targetTF.text = newText;
            this._targetTF.setSelection(_ci + _back,_ci + _back);
         }
      }
      
      public function moveCaret(_type:String) : void
      {
         var _index:int = 0;
         var _i:int = 0;
         var _ci:int = 0;
         if(1 < this._targetTF.numLines)
         {
            _index = this._targetTF.getLineIndexOfChar(this._targetTF.caretIndex - 1);
            _i = 0;
            if(_type == "up")
            {
               if(-1 < _index - 1)
               {
                  for(_i = 0; _i < _index; _i++)
                  {
                     _ci += this._targetTF.getLineLength(_i);
                  }
                  _ci--;
                  this._targetTF.setSelection(_ci,_ci);
               }
            }
            else if(_index + 1 < this._targetTF.numLines)
            {
               for(_i = 0; _i < _index + 2; _i++)
               {
                  _ci += this._targetTF.getLineLength(_i);
               }
               _ci--;
               if(this._targetTF.text.length - 1 == _ci)
               {
                  _ci = this._targetTF.text.length;
               }
               this._targetTF.setSelection(_ci,_ci);
            }
         }
      }
      
      private function setButtonShift() : void
      {
         var _array:Array = null;
         var _key:* = null;
         _array = this.findButtonFromName(KeyConst.LANGUAGE == "tr" ? "Üst" : "Shift");
         for(_key in _array)
         {
            _array[_key].key.toggle = this._shift;
         }
         _array = this.findButtonFromProperty("t2");
         for(_key in _array)
         {
            _array[_key].key.shift = this._shift;
         }
      }
      
      private function setButtonCase() : void
      {
         var _key:* = null;
         var _array:Array = this.findButtonFromProperty("upper");
         for(_key in _array)
         {
            if(this._capsLock)
            {
               _array[_key].key.text = _array[_key].upper;
            }
            else
            {
               _array[_key].key.text = _array[_key].t1;
            }
         }
      }
      
      private function findButtonFromProperty(_propName:String) : Array
      {
         var _layer:* = null;
         var _key:* = null;
         var _a:Array = new Array();
         for(_layer in this._keys)
         {
            for(_key in this._keys[_layer])
            {
               if(this._keys[_layer][_key][_propName])
               {
                  _a.push(this._keys[_layer][_key]);
               }
            }
         }
         return _a;
      }
      
      private function findButtonFromName(_name:String) : Array
      {
         var _layer:* = null;
         var _key:* = null;
         var _a:Array = new Array();
         for(_layer in this._keys)
         {
            for(_key in this._keys[_layer])
            {
               if(this._keys[_layer][_key].t1 == _name)
               {
                  _a.push(this._keys[_layer][_key]);
               }
            }
         }
         return _a;
      }
      
      private function findSingleButtonFromName(_name:String) : Object
      {
         var _k:Object = null;
         var _layer:* = null;
         var _key:* = null;
         for(_layer in this._keys)
         {
            for(_key in this._keys[_layer])
            {
               if(this._keys[_layer][_key].t1 == _name)
               {
                  _k = this._keys[_layer][_key];
               }
            }
         }
         return _k;
      }
      
      private function addButton(_array:Array) : Sprite
      {
         var _key:String = null;
         var _w:Number = NaN;
         var _container:Sprite = new Sprite();
         var _x:Number = 0;
         for(var _loc6_:int = 0,var _loc7_:* = _array; §§hasnext(_loc7_,_loc6_); _array[_key].key = new Key(_array[_key],_w,KeyConst.KEY_HEIGHT,KeyConst.KEY_HEIGHT / 10),_array[_key].key.x = _x,_array[_key].key.name = "b_" + _key + "_" + _array[_key].t1,_container.addChild(_array[_key].key),_x += _array[_key].key.width + KeyConst.SPACE)
         {
            _key = §§nextname(_loc6_,_loc7_);
            _w = KeyConst.KEY_WIDHT;
            if(KeyConst.LANGUAGE == "tr")
            {
               switch(_array[_key].t1)
               {
                  case "Geri Al":
                     _w *= 2.5;
                     break;
                  case "Sekme":
                     _w *= 1.5;
                     break;
                  case "Giriş":
                     _w *= 2;
                     break;
                  case "Büyük Harf":
                     _w *= 2;
                     break;
                  case "Sil":
                     _w *= 1.5;
                     break;
                  case "Üst":
                     _w *= 1.5;
                     break;
                  case "Yukarı":
                     _w *= 1.5;
                     break;
                  case "Boşluk":
                     _w *= 12;
                     break;
                  case "Sol":
                     _w *= 1.5;
                     break;
                  case "Aşağı":
                     _w *= 1.5;
                     break;
                  case "Sağ":
                     _w *= 1.5;
               }
               continue;
            }
            switch(_array[_key].t1)
            {
               case "Backspace":
                  _w *= 2.5;
                  break;
               case "Tab":
                  _w *= 1.5;
                  break;
               case "Enter":
                  _w *= 2;
                  break;
               case "Caps Lock":
                  _w *= 2;
                  break;
               case "Delete":
                  _w *= 1.5;
                  break;
               case "Shift":
                  _w *= 1.5;
                  break;
               case "Up":
                  _w *= 1.5;
                  break;
               case "Space":
                  _w *= 12;
                  break;
               case "Left":
                  _w *= 1.5;
                  break;
               case "Down":
                  _w *= 1.5;
                  break;
               case "Right":
                  _w *= 1.5;
                  break;
            }
         }
         return _container;
      }
      
      public function disposeAll() : void
      {
         this._layer1 = null;
         this._layer2 = null;
         this._layer3 = null;
         this._layer4 = null;
         this._layer5 = null;
      }
   }
}
