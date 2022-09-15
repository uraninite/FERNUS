package com.ryanberdeen.soundtouch
{
   public class AbstractFifoSamplePipe
   {
       
      
      protected var _inputBuffer:FifoSampleBuffer;
      
      protected var _outputBuffer:FifoSampleBuffer;
      
      public function AbstractFifoSamplePipe(createBuffers:Boolean = true)
      {
         super();
         if(createBuffers)
         {
            this.inputBuffer = new FifoSampleBuffer();
            this.outputBuffer = new FifoSampleBuffer();
         }
      }
      
      public function get inputBuffer() : FifoSampleBuffer
      {
         return this._inputBuffer;
      }
      
      public function set inputBuffer(inputBuffer:FifoSampleBuffer) : void
      {
         this._inputBuffer = inputBuffer;
      }
      
      public function get outputBuffer() : FifoSampleBuffer
      {
         return this._outputBuffer;
      }
      
      public function set outputBuffer(outputBuffer:FifoSampleBuffer) : void
      {
         this._outputBuffer = outputBuffer;
      }
      
      public function clear() : void
      {
         this._inputBuffer.clear();
         this._outputBuffer.clear();
      }
   }
}
