package com.ryanberdeen.soundtouch
{
   import flash.utils.ByteArray;
   
   public class FifoSampleBuffer
   {
       
      
      private var _vector:Vector.<Number>;
      
      private var _position:uint;
      
      private var _frameCount:uint;
      
      public function FifoSampleBuffer()
      {
         super();
         this._vector = new Vector.<Number>();
      }
      
      public function get vector() : Vector.<Number>
      {
         return this._vector;
      }
      
      public function get position() : uint
      {
         return this._position;
      }
      
      public function get startIndex() : uint
      {
         return this._position * 2;
      }
      
      public function get frameCount() : uint
      {
         return this._frameCount;
      }
      
      public function get endIndex() : uint
      {
         return (this._position + this._frameCount) * 2;
      }
      
      public function clear() : void
      {
         this.receive(this.frameCount);
         this.rewind();
      }
      
      public function put(numFrames:uint) : void
      {
         this._frameCount += numFrames;
      }
      
      public function putBytes(bytes:ByteArray) : void
      {
         bytes.position = 0;
         var numFrames:uint = bytes.bytesAvailable / 8;
         this.ensureCapacity(numFrames + this._frameCount);
         var newEndIndex:uint = this.endIndex + numFrames * 2;
         for(var i:int = this.endIndex; i < newEndIndex; i++)
         {
            this._vector[i] = bytes.readFloat();
         }
         this._frameCount += numFrames;
      }
      
      public function putSamples(samples:Vector.<Number>, position:uint = 0, numFrames:int = -1) : void
      {
         var sourceOffset:uint = position * 2;
         if(numFrames < 0)
         {
            numFrames = (samples.length - sourceOffset) / 2;
         }
         var numSamples:uint = numFrames * 2;
         this.ensureCapacity(numFrames + this._frameCount);
         var destOffset:uint = this.endIndex;
         for(var i:int = 0; i < numSamples; i++)
         {
            this._vector[i + destOffset] = samples[i + sourceOffset];
         }
         this._frameCount += numFrames;
      }
      
      public function putBuffer(buffer:FifoSampleBuffer, position:uint = 0, numFrames:int = -1) : void
      {
         if(numFrames < 0)
         {
            numFrames = buffer.frameCount - position;
         }
         this.putSamples(buffer.vector,buffer.position + position,numFrames);
      }
      
      public function receive(numFrames:int = -1) : void
      {
         if(numFrames < 0 || numFrames > this._frameCount)
         {
            numFrames = this._frameCount;
         }
         this._frameCount -= numFrames;
         this._position += numFrames;
      }
      
      public function receiveSamples(output:Vector.<Number>, numFrames:uint) : void
      {
         var numSamples:uint = numFrames * 2;
         var sourceOffset:uint = this.startIndex;
         for(var i:uint = 0; i < numSamples; i++)
         {
            output[i] = this._vector[i + sourceOffset];
         }
         this.receive(numFrames);
      }
      
      public function receiveBytes(output:ByteArray, numFrames:uint) : void
      {
         this.extract(output,0,numFrames);
         this.receive(numFrames);
      }
      
      public function extract(output:ByteArray, position:uint, numFrames:uint) : void
      {
         var sourceOffset:uint = this.startIndex + position * 2;
         var numSamples:uint = numFrames * 2;
         for(var i:uint = 0; i < numSamples; i++)
         {
            output.writeFloat(this._vector[i + sourceOffset]);
         }
      }
      
      public function ensureCapacity(numFrames:uint) : void
      {
         this.rewind();
         var minLength:uint = numFrames * 2;
         if(this._vector.length < minLength)
         {
            this._vector.length = minLength;
         }
      }
      
      public function ensureAdditionalCapacity(numFrames:uint) : void
      {
         this.ensureCapacity(this.frameCount + numFrames);
      }
      
      public function rewind() : void
      {
         var offset:int = 0;
         var numSamples:int = 0;
         var i:int = 0;
         if(this._position > 0)
         {
            offset = this.startIndex;
            numSamples = this.frameCount * 2;
            for(i = 0; i < numSamples; i++)
            {
               this._vector[i] = this._vector[i + offset];
            }
            this._position = 0;
         }
      }
   }
}
