package com.reyco1.multiuser.debug
{
   import flash.text.TextField;
   import flash.utils.getQualifiedClassName;
   
   public class Logger
   {
      
      public static const NONE:int = 0;
      
      public static const ALL:int = 1;
      
      public static const NET_STATUS_ONLY:int = 2;
      
      public static const ALL_BUT_NET_STATUS:int = 3;
      
      public static const OWN:int = -1;
      
      public static var LEVEL:int = OWN;
      
      public static var textArea:TextField;
       
      
      public function Logger()
      {
         super();
      }
      
      public static function log(traceStr:String, owner:* = null, isNetstatusTrace:Boolean = false) : void
      {
         var classString:String = getQualifiedClassName(owner).split("::")[1] || "Logger";
         var toTrace:String = "[" + classString + "] " + traceStr;
         if(LEVEL > NONE)
         {
            if(shouldTrace(isNetstatusTrace))
            {
               write(toTrace);
            }
         }
         else if(LEVEL == OWN && classString == "Logger")
         {
            write(toTrace);
         }
      }
      
      private static function shouldTrace(isNetstatusTrace:Boolean) : Boolean
      {
         return LEVEL == ALL || isNetstatusTrace && LEVEL == NET_STATUS_ONLY || !isNetstatusTrace && LEVEL == ALL_BUT_NET_STATUS;
      }
      
      private static function write(toTrace:String) : void
      {
         trace(toTrace);
         if(textArea)
         {
            textArea.appendText(toTrace + "\n");
         }
      }
   }
}
