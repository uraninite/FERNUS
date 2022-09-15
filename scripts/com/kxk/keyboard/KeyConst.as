package com.kxk.keyboard
{
   public class KeyConst
   {
      
      public static var LANGUAGE:String = "tr";
      
      public static const KEY_WIDHT:int = 50;
      
      public static const KEY_HEIGHT:int = 50;
      
      public static const SPACE:int = 5;
      
      public static const KEYBOARD_BACKGROUND_COLOR:uint = 1252129;
      
      public static const KEY_BACKGROUND_COLOR_UP:uint = 2041649;
      
      public static const KEY_BACKGROUND_COLOR_DOWN:uint = 956404;
      
      public static const KEY_TEXT_COLOR_ON:uint = 15790320;
      
      public static const KEY_TEXT_COLOR_OFF:uint = 6120302;
      
      public static var keys:Object = Object({
         "layer1":[{
            "t1":"\"",
            "t2":"é"
         },{
            "t1":"1",
            "t2":"!"
         },{
            "t1":"2",
            "t2":"\'"
         },{
            "t1":"3",
            "t2":"#"
         },{
            "t1":"4",
            "t2":"+"
         },{
            "t1":"5",
            "t2":"%"
         },{
            "t1":"6",
            "t2":"&"
         },{
            "t1":"7",
            "t2":"/"
         },{
            "t1":"8",
            "t2":"("
         },{
            "t1":"9",
            "t2":")"
         },{
            "t1":"0",
            "t2":"="
         },{
            "t1":"*",
            "t2":"?"
         },{
            "t1":"-",
            "t2":"_"
         },{"t1":"Geri Al"}],
         "layer2":[{"t1":"Sekme"},{
            "t1":"q",
            "t2":"@",
            "upper":"Q"
         },{
            "t1":"w",
            "upper":"W"
         },{
            "t1":"e",
            "upper":"E"
         },{
            "t1":"r",
            "upper":"R"
         },{
            "t1":"t",
            "upper":"T"
         },{
            "t1":"y",
            "upper":"Y"
         },{
            "t1":"u",
            "upper":"U"
         },{
            "t1":"ı",
            "upper":"I"
         },{
            "t1":"o",
            "t2":"{",
            "upper":"O"
         },{
            "t1":"p",
            "t2":"[",
            "upper":"P"
         },{
            "t1":"ğ",
            "t2":"]",
            "upper":"Ğ"
         },{
            "t1":"ü",
            "t2":"}",
            "upper":"Ü"
         },{"t1":"Giriş"}],
         "layer3":[{"t1":"Büyük Harf"},{
            "t1":"a",
            "upper":"A"
         },{
            "t1":"s",
            "upper":"S"
         },{
            "t1":"d",
            "upper":"D"
         },{
            "t1":"f",
            "upper":"F"
         },{
            "t1":"g",
            "upper":"G"
         },{
            "t1":"h",
            "upper":"H"
         },{
            "t1":"j",
            "upper":"J"
         },{
            "t1":"k",
            "upper":"K"
         },{
            "t1":"l",
            "upper":"L"
         },{
            "t1":"ş",
            "upper":"Ş"
         },{
            "t1":"i",
            "upper":"İ"
         },{
            "t1":",",
            "t2":";"
         },{"t1":"Sil"}],
         "layer4":[{"t1":"Üst"},{
            "t1":"<",
            "t2":">"
         },{
            "t1":"z",
            "upper":"Z"
         },{
            "t1":"x",
            "upper":"X"
         },{
            "t1":"c",
            "upper":"C"
         },{
            "t1":"v",
            "upper":"V"
         },{
            "t1":"b",
            "upper":"B"
         },{
            "t1":"n",
            "upper":"N"
         },{
            "t1":"m",
            "upper":"M"
         },{
            "t1":"ö",
            "upper":"Ö"
         },{
            "t1":"ç",
            "upper":"Ç"
         },{
            "t1":".",
            "t2":":"
         },{"t1":"Yukarı"},{"t1":"Üst"}],
         "layer5":[{"t1":"Boşluk"},{"t1":"Sol"},{"t1":"Aşağı"},{"t1":"Sağ"}]
      });
      
      public static var keysEn:Object = Object({
         "layer1":[{
            "t1":"\"",
            "t2":"é"
         },{
            "t1":"1",
            "t2":"!"
         },{
            "t1":"2",
            "t2":"\'"
         },{
            "t1":"3",
            "t2":"#"
         },{
            "t1":"4",
            "t2":"+"
         },{
            "t1":"5",
            "t2":"%"
         },{
            "t1":"6",
            "t2":"&"
         },{
            "t1":"7",
            "t2":"/"
         },{
            "t1":"8",
            "t2":"("
         },{
            "t1":"9",
            "t2":")"
         },{
            "t1":"0",
            "t2":"="
         },{
            "t1":"*",
            "t2":"?"
         },{
            "t1":"-",
            "t2":"_"
         },{"t1":"Backspace"}],
         "layer2":[{"t1":"Tab"},{
            "t1":"q",
            "t2":"@",
            "upper":"Q"
         },{
            "t1":"w",
            "upper":"W"
         },{
            "t1":"e",
            "upper":"E"
         },{
            "t1":"r",
            "upper":"R"
         },{
            "t1":"t",
            "upper":"T"
         },{
            "t1":"y",
            "upper":"Y"
         },{
            "t1":"u",
            "upper":"U"
         },{
            "t1":"ı",
            "upper":"I"
         },{
            "t1":"o",
            "t2":"{",
            "upper":"O"
         },{
            "t1":"p",
            "t2":"[",
            "upper":"P"
         },{
            "t1":"ğ",
            "t2":"]",
            "upper":"Ğ"
         },{
            "t1":"ü",
            "t2":"}",
            "upper":"Ü"
         },{"t1":"Enter"}],
         "layer3":[{"t1":"Caps Lock"},{
            "t1":"a",
            "upper":"A"
         },{
            "t1":"s",
            "upper":"S"
         },{
            "t1":"d",
            "upper":"D"
         },{
            "t1":"f",
            "upper":"F"
         },{
            "t1":"g",
            "upper":"G"
         },{
            "t1":"h",
            "upper":"H"
         },{
            "t1":"j",
            "upper":"J"
         },{
            "t1":"k",
            "upper":"K"
         },{
            "t1":"l",
            "upper":"L"
         },{
            "t1":"ş",
            "upper":"Ş"
         },{
            "t1":"i",
            "upper":"İ"
         },{
            "t1":",",
            "t2":";"
         },{"t1":"Delete"}],
         "layer4":[{"t1":"Shift"},{
            "t1":"<",
            "t2":">"
         },{
            "t1":"z",
            "upper":"Z"
         },{
            "t1":"x",
            "upper":"X"
         },{
            "t1":"c",
            "upper":"C"
         },{
            "t1":"v",
            "upper":"V"
         },{
            "t1":"b",
            "upper":"B"
         },{
            "t1":"n",
            "upper":"N"
         },{
            "t1":"m",
            "upper":"M"
         },{
            "t1":"ö",
            "upper":"Ö"
         },{
            "t1":"ç",
            "upper":"Ç"
         },{
            "t1":".",
            "t2":":"
         },{"t1":"Up"},{"t1":"Shift"}],
         "layer5":[{"t1":"Space"},{"t1":"Left"},{"t1":"Down"},{"t1":"Right"}]
      });
       
      
      public function KeyConst()
      {
         super();
      }
   }
}