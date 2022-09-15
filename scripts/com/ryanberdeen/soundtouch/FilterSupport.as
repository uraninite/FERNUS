package com.ryanberdeen.soundtouch
{
   public class FilterSupport
   {
       
      
      private var _pipe:IFifoSamplePipe;
      
      public function FilterSupport(pipe:IFifoSamplePipe)
      {
         super();
         this._pipe = pipe;
      }
      
      public function get pipe() : IFifoSamplePipe
      {
         return this._pipe;
      }
      
      protected function get inputBuffer() : FifoSampleBuffer
      {
         return this._pipe.inputBuffer;
      }
      
      protected function get outputBuffer() : FifoSampleBuffer
      {
         return this._pipe.outputBuffer;
      }
      
      protected function fillInputBuffer(numFrames:int) : void
      {
         throw new Error("fillInputBuffer() not overridden");
      }
      
      protected function fillOutputBuffer(numFrames:int) : void
      {
         var numInputFrames:uint = 0;
         while(this.outputBuffer.frameCount < numFrames)
         {
            numInputFrames = 8192 - this.inputBuffer.frameCount;
            this.fillInputBuffer(numInputFrames);
            if(this.inputBuffer.frameCount < 8192)
            {
               break;
            }
            this._pipe.process();
         }
      }
      
      public function clear() : void
      {
         this._pipe.clear();
      }
   }
}
