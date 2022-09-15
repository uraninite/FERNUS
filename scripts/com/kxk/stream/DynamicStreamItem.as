package com.kxk.stream
{
   public class DynamicStreamItem
   {
       
      
      private var streamArray:Array;
      
      public var start:Number;
      
      public var len:Number;
      
      public var reset:Boolean;
      
      public var streamCount:int;
      
      public var startRate:Number;
      
      public function DynamicStreamItem()
      {
         super();
         this.streamArray = new Array();
         this.streamCount = NaN;
         this.start = 0;
         this.len = -1;
         this.reset = true;
         this.startRate = -1;
      }
      
      public function addStream(streamName:String, bitRate:Number) : void
      {
         if(!isNaN(bitRate))
         {
            this.streamArray.push({
               "name":streamName,
               "rate":bitRate
            });
         }
         this.streamArray.sortOn("rate",Array.NUMERIC);
      }
      
      public function get streams() : Array
      {
         return this.streamArray;
      }
   }
}
