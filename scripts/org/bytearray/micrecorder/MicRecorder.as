package org.bytearray.micrecorder
{
   import com.kxk.KryTimer;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.SampleDataEvent;
   import flash.events.StatusEvent;
   import flash.media.Microphone;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   import org.bytearray.micrecorder.encoder.WaveEncoder;
   import org.bytearray.micrecorder.events.RecordingEvent;
   
   public final class MicRecorder extends EventDispatcher
   {
       
      
      private var _gain:uint;
      
      private var _rate:uint;
      
      private var _silenceLevel:uint;
      
      private var _timeOut:uint;
      
      private var _difference:uint;
      
      private var _microphone:Microphone;
      
      private var _buffer:ByteArray;
      
      private var _output:ByteArray;
      
      private var _encoder:IEncoder;
      
      private var _kxkTimer:KryTimer;
      
      private var _completeEvent:Event;
      
      private var _recordingEvent:RecordingEvent;
      
      public function MicRecorder(encoderVolume:Number, microphone:Microphone = null, gain:uint = 50, rate:uint = 44, silenceLevel:uint = 0, timeOut:uint = 1000)
      {
         this._buffer = new ByteArray();
         this._completeEvent = new Event(Event.COMPLETE);
         this._recordingEvent = new RecordingEvent(RecordingEvent.RECORDING,0);
         super();
         this._encoder = new WaveEncoder(encoderVolume);
         this._microphone = microphone;
         this._gain = gain;
         this._rate = rate;
         this._silenceLevel = silenceLevel;
         this._timeOut = timeOut;
      }
      
      public function record() : void
      {
         this._buffer.length = 0;
         this._difference = getTimer();
         if(this._microphone != null)
         {
            this._microphone = Microphone.getMicrophone();
            this._microphone.setSilenceLevel(this._silenceLevel,this._timeOut);
            this._microphone.gain = this._gain;
            this._microphone.rate = this._rate;
            this._microphone.setLoopBack(false);
            this._microphone.setUseEchoSuppression(true);
            this._microphone.addEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleData);
            this._microphone.addEventListener(StatusEvent.STATUS,this.onStatus);
         }
         else
         {
            this._kxkTimer = new KryTimer();
            this._kxkTimer.onTime = this.onSampleData;
            this.onStatus();
            this._kxkTimer.start();
         }
      }
      
      private function onStatus(event:StatusEvent = null) : void
      {
         this._difference = getTimer();
      }
      
      private function onSampleData(event:* = null) : void
      {
         this._recordingEvent.time = Number(getTimer() - this._difference);
         dispatchEvent(this._recordingEvent);
         if(this._microphone != null)
         {
            while(event.data.bytesAvailable > 0)
            {
               this._buffer.writeFloat(event.data.readFloat());
            }
         }
      }
      
      public function stop() : void
      {
         var _length:Number = NaN;
         var _i:int = 0;
         if(this._microphone != null)
         {
            this._microphone.removeEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleData);
         }
         if(this._kxkTimer != null)
         {
            this._kxkTimer.stop();
            this._kxkTimer.reset();
            this._buffer = new ByteArray();
            _length = this._recordingEvent.time * (this._rate == 44 ? 44.1 : 22.05);
            for(_i = 0; _i < _length; _i++)
            {
               this._buffer.writeFloat(0);
            }
         }
         this._buffer.position = 0;
         this._output = this._encoder.encode(this._buffer,1,16,this._rate == 44 ? 44100 : 22050);
         dispatchEvent(this._completeEvent);
      }
      
      public function pause() : void
      {
         if(this._microphone != null)
         {
            this._microphone.removeEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleData);
         }
         if(this._kxkTimer != null)
         {
            this._kxkTimer.stop();
         }
      }
      
      public function resume() : void
      {
         this._difference = getTimer() - this._recordingEvent.time;
         if(this._microphone != null)
         {
            this._microphone.addEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleData);
         }
         if(this._kxkTimer != null)
         {
            this._kxkTimer.start();
         }
      }
      
      public function get gain() : uint
      {
         return this._gain;
      }
      
      public function set gain(value:uint) : void
      {
         this._gain = value;
      }
      
      public function get rate() : uint
      {
         return this._rate;
      }
      
      public function set rate(value:uint) : void
      {
         this._rate = value;
      }
      
      public function get silenceLevel() : uint
      {
         return this._silenceLevel;
      }
      
      public function set silenceLevel(value:uint) : void
      {
         this._silenceLevel = value;
      }
      
      public function get microphone() : Microphone
      {
         return this._microphone;
      }
      
      public function set microphone(value:Microphone) : void
      {
         this._microphone = value;
      }
      
      public function get output() : ByteArray
      {
         return this._output;
      }
      
      override public function toString() : String
      {
         return "[MicRecorder gain=" + this._gain + " rate=" + this._rate + " silenceLevel=" + this._silenceLevel + " timeOut=" + this._timeOut + " microphone:" + this._microphone + "]";
      }
   }
}
