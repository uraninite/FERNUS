package com.ryanberdeen.soundtouch
{
   public interface IFifoSamplePipe
   {
       
      
      function get inputBuffer() : FifoSampleBuffer;
      
      function get outputBuffer() : FifoSampleBuffer;
      
      function process() : void;
      
      function clear() : void;
      
      function clone() : IFifoSamplePipe;
   }
}
