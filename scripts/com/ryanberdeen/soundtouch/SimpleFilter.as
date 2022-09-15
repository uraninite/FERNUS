package com.ryanberdeen.soundtouch
{
   import flash.events.SampleDataEvent;
   import flash.media.Sound;
   import flash.utils.ByteArray;
   
   public class SimpleFilter extends FilterSupport
   {
       
      
      private var sourceSound:Sound;
      
      private var historyBufferSize:int;
      
      private var _sourcePosition:int;
      
      private var outputBufferPosition:int;
      
      private var _position:int;
      
      public function SimpleFilter(sourceSound:Sound, pipe:IFifoSamplePipe)
      {
         super(pipe);
         this.sourceSound = sourceSound;
         this.historyBufferSize = 22050;
         this._sourcePosition = 0;
         this.outputBufferPosition = 0;
      }
      
      public function get position() : int
      {
         return this._position;
      }
      
      public function set position(position:int) : void
      {
         if(position > this._position)
         {
            position = this._position;
         }
         var newOutputBufferPosition:int = this.outputBufferPosition - (this._position - position);
         if(newOutputBufferPosition < 0)
         {
            newOutputBufferPosition = 0;
         }
         this.outputBufferPosition = newOutputBufferPosition;
         this._position = position;
      }
      
      public function get sourcePosition() : int
      {
         return this._sourcePosition;
      }
      
      public function set sourcePosition(sourcePosition:int) : void
      {
         this.clear();
         this._sourcePosition = sourcePosition;
      }
      
      override protected function fillInputBuffer(numFrames:int) : void
      {
         var bytes:ByteArray = new ByteArray();
         var numFramesExtracted:uint = this.sourceSound.extract(bytes,numFrames,this._sourcePosition);
         this._sourcePosition += numFramesExtracted;
         inputBuffer.putBytes(bytes);
      }
      
      public function extract(target:ByteArray, numFrames:int) : int
      {
         fillOutputBuffer(this.outputBufferPosition + numFrames);
         var numFramesExtracted:int = Math.min(numFrames,outputBuffer.frameCount - this.outputBufferPosition);
         outputBuffer.extract(target,this.outputBufferPosition,numFramesExtracted);
         var currentFrames:int = this.outputBufferPosition + numFramesExtracted;
         this.outputBufferPosition = Math.min(this.historyBufferSize,currentFrames);
         outputBuffer.receive(Math.max(currentFrames - this.historyBufferSize,0));
         this._position += numFramesExtracted;
         return numFramesExtracted;
      }
      
      public function handleSampleData(e:SampleDataEvent) : void
      {
         this.extract(e.data,4096);
      }
      
      override public function clear() : void
      {
         super.clear();
         this.outputBufferPosition = 0;
      }
   }
}
