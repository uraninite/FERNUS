package com.luaye.console.core
{
   public class Logs
   {
       
      
      public var first:Log;
      
      public var last:Log;
      
      private var _length:uint;
      
      public function Logs()
      {
         super();
      }
      
      public function clear() : void
      {
         this.first = null;
         this.last = null;
         this._length = 0;
      }
      
      public function get length() : uint
      {
         return this._length;
      }
      
      public function push(v:Log) : void
      {
         if(this.last == null)
         {
            this.first = v;
         }
         else
         {
            this.last.next = v;
            v.prev = this.last;
         }
         this.last = v;
         ++this._length;
      }
      
      public function pop() : void
      {
         if(this.last)
         {
            this.last = this.last.prev;
            --this._length;
         }
      }
      
      public function shift(count:uint = 1) : void
      {
         while(this.first != null && count > 0)
         {
            this.first = this.first.next;
            count--;
            --this._length;
         }
      }
      
      public function remove(log:Log) : void
      {
         if(this.first == log)
         {
            this.first = log.next;
         }
         if(this.last == log)
         {
            this.last = log.prev;
         }
         if(log.next != null)
         {
            log.next.prev = log.prev;
         }
         if(log.prev != null)
         {
            log.prev.next = log.next;
         }
         --this._length;
      }
   }
}
