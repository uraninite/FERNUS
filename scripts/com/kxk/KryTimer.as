package com.kxk
{
   import flash.events.EventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class KryTimer extends EventDispatcher
   {
       
      
      public var hours:Number = 0;
      
      public var seconds:Number = 0;
      
      public var minutes:Number = 0;
      
      public var milliseconds:Number = 0;
      
      private var _currentTime:Number = 0;
      
      private var _pauseTime:Number = 0;
      
      private var _pauseTimeLength:Number = 0;
      
      private var _timer:Timer;
      
      private var _timeStatus:Boolean = false;
      
      public var onTime:Function;
      
      public function KryTimer()
      {
         this.onTime = new Function();
         super();
      }
      
      public function start() : void
      {
         if(!this._timer)
         {
            this._timer = new Timer(10);
            this._timer.addEventListener(TimerEvent.TIMER,this.onUpdateTime);
         }
         this.pauseTimer(false);
         this._timer.start();
      }
      
      public function stop() : void
      {
         this.pauseTimer(true);
         if(this._timer)
         {
            this._timer.stop();
         }
      }
      
      public function reset() : void
      {
         this.hours = 0;
         this.seconds = 0;
         this.minutes = 0;
         this.milliseconds = 0;
         this._currentTime = 0;
         this._pauseTime = 0;
         this._pauseTimeLength = 0;
         this._timeStatus = false;
      }
      
      private function pauseTimer(b:Boolean) : void
      {
         if(b)
         {
            this._pauseTime = getTimer() / 1000;
         }
         else
         {
            this._pauseTimeLength = getTimer() / 1000 - this._pauseTime + this._pauseTimeLength;
         }
         this._timeStatus = !b;
      }
      
      private function onUpdateTime(e:TimerEvent) : void
      {
         this._currentTime = getTimer() / 1000 - this._pauseTimeLength;
         if(this._timeStatus)
         {
            this.onTime(this.time);
         }
      }
      
      public function set time(_t:Number) : void
      {
         this.reset();
         this._pauseTimeLength = -_t;
         this._currentTime = _t;
      }
      
      public function get time() : Number
      {
         return this._currentTime;
      }
      
      public function timeString(_time:Number) : String
      {
         var _timeString:String = "00:00";
         if(this._timeStatus)
         {
            this.hours = Math.floor(_time / 3600);
            this.minutes = Math.floor((_time / 3600 - this.hours) * 60);
            this.seconds = Math.floor(((_time / 3600 - this.hours) * 60 - this.minutes) * 60);
            this.milliseconds = Math.floor((_time - (this.seconds + this.minutes * 60 + this.hours * 3600)) * 100);
            _timeString = this.format(this.minutes) + ":" + this.format(this.seconds);
         }
         return _timeString;
      }
      
      private function format(n:Number) : String
      {
         if(n < 10)
         {
            return "0" + n;
         }
         return n.toString();
      }
   }
}
