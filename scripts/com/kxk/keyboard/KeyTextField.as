package com.kxk.keyboard
{
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class KeyTextField extends TextField
   {
       
      
      public function KeyTextField(_text:String, _size:int, _color:uint)
      {
         super();
         var _textFormat:TextFormat = new TextFormat();
         _textFormat.size = _size;
         _textFormat.font = "Raleway";
         this.defaultTextFormat = _textFormat;
         this.embedFonts = true;
         this.textColor = _color;
         this.selectable = false;
         this.autoSize = TextFieldAutoSize.LEFT;
         this.text = _text;
         this.border = false;
         this.mouseEnabled = false;
      }
   }
}
