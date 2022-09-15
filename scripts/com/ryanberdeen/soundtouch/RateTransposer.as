package com.ryanberdeen.soundtouch
{
   public class RateTransposer extends AbstractFifoSamplePipe implements IFifoSamplePipe
   {
       
      
      private var _rate:Number;
      
      private var slopeCount:Number;
      
      private var prevSampleL:Number;
      
      private var prevSampleR:Number;
      
      public function RateTransposer(createBuffers:Boolean = true)
      {
         super(createBuffers);
         this.reset();
         this.rate = 1;
      }
      
      public function set rate(rate:Number) : void
      {
         this._rate = rate;
      }
      
      private function reset() : void
      {
         this.slopeCount = 0;
         this.prevSampleL = 0;
         this.prevSampleR = 0;
      }
      
      public function clone() : IFifoSamplePipe
      {
         var result:RateTransposer = new RateTransposer();
         result.rate = this._rate;
         return result;
      }
      
      public function process() : void
      {
         var numFrames:int = _inputBuffer.frameCount;
         _outputBuffer.ensureAdditionalCapacity(numFrames / this._rate + 1);
         var numFramesOutput:int = this.transpose(numFrames);
         _inputBuffer.receive();
         _outputBuffer.put(numFramesOutput);
      }
      
      private function transpose(numFrames:int) : int
      {
         var srcIndex:int = 0;
         if(numFrames == 0)
         {
            return 0;
         }
         var src:Vector.<Number> = _inputBuffer.vector;
         var srcOffset:int = _inputBuffer.startIndex;
         var dest:Vector.<Number> = _outputBuffer.vector;
         var destOffset:int = _outputBuffer.endIndex;
         var used:int = 0;
         var i:int = 0;
         while(this.slopeCount < 1)
         {
            dest[destOffset + 2 * i] = (1 - this.slopeCount) * this.prevSampleL + this.slopeCount * src[srcOffset];
            dest[destOffset + 2 * i + 1] = (1 - this.slopeCount) * this.prevSampleR + this.slopeCount * src[srcOffset + 1];
            i++;
            this.slopeCount += this._rate;
         }
         this.slopeCount = this.slopeCount - 1;
         if(numFrames != 1)
         {
            while(true)
            {
               while(this.slopeCount > 1)
               {
                  this.slopeCount = this.slopeCount - 1;
                  used++;
                  if(used < numFrames - 1)
                  {
                     continue;
                  }
               }
               srcIndex = srcOffset + 2 * used;
               dest[destOffset + 2 * i] = (1 - this.slopeCount) * src[srcIndex] + this.slopeCount * src[srcIndex + 2];
               dest[destOffset + 2 * i + 1] = (1 - this.slopeCount) * src[srcIndex + 1] + this.slopeCount * src[srcIndex + 3];
               i++;
               this.slopeCount += this._rate;
            }
         }
         this.prevSampleL = src[srcOffset + 2 * numFrames - 2];
         this.prevSampleR = src[srcOffset + 2 * numFrames - 1];
         return i;
      }
   }
}
