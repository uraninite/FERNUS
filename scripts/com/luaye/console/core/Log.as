package com.luaye.console.core
{
   public class Log
   {
       
      
      public var text:String;
      
      public var c:String;
      
      public var p:int;
      
      public var r:Boolean;
      
      public var s:Boolean;
      
      public var next:Log;
      
      public var prev:Log;
      
      public function Log(t:String, ch:String, pr:int, repeating:Boolean = false, skipSafe:Boolean = false)
      {
         super();
         this.text = t;
         this.c = ch;
         this.p = pr;
         this.r = repeating;
         this.s = skipSafe;
      }
      
      public function toObject() : Object
      {
         return {
            "text":this.text,
            "c":this.c,
            "p":this.p,
            "r":this.r,
            "s":this.s
         };
      }
      
      public function toString() : String
      {
         return "[" + this.c + "] " + this.text;
      }
   }
}
