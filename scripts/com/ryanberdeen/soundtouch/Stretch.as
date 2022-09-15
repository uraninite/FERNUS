package com.ryanberdeen.soundtouch
{
   public class Stretch extends AbstractFifoSamplePipe implements IFifoSamplePipe
   {
      
      public static const USE_AUTO_SEQUENCE_LEN:int = 0;
      
      public static const DEFAULT_SEQUENCE_MS:int = USE_AUTO_SEQUENCE_LEN;
      
      public static const USE_AUTO_SEEKWINDOW_LEN:int = 0;
      
      public static const DEFAULT_SEEKWINDOW_MS:int = USE_AUTO_SEEKWINDOW_LEN;
      
      public static const DEFAULT_OVERLAP_MS:int = 8;
      
      private static const SCAN_OFFSETS:Array = [[124,186,248,310,372,434,496,558,620,682,744,806,868,930,992,1054,1116,1178,1240,1302,1364,1426,1488,0],[-100,-75,-50,-25,25,50,75,100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[-20,-15,-10,-5,5,10,15,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[-4,-3,-2,-1,1,2,3,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]];
      
      private static const AUTOSEQ_TEMPO_LOW:Number = 0.5;
      
      private static const AUTOSEQ_TEMPO_TOP:Number = 2;
      
      private static const AUTOSEQ_AT_MIN:Number = 125;
      
      private static const AUTOSEQ_AT_MAX:Number = 50;
      
      private static const AUTOSEQ_K:Number = (AUTOSEQ_AT_MAX - AUTOSEQ_AT_MIN) / (AUTOSEQ_TEMPO_TOP - AUTOSEQ_TEMPO_LOW);
      
      private static const AUTOSEQ_C:Number = AUTOSEQ_AT_MIN - AUTOSEQ_K * AUTOSEQ_TEMPO_LOW;
      
      private static const AUTOSEEK_AT_MIN:Number = 25;
      
      private static const AUTOSEEK_AT_MAX:Number = 15;
      
      private static const AUTOSEEK_K:Number = (AUTOSEEK_AT_MAX - AUTOSEEK_AT_MIN) / (AUTOSEQ_TEMPO_TOP - AUTOSEQ_TEMPO_LOW);
      
      private static const AUTOSEEK_C:Number = AUTOSEEK_AT_MIN - AUTOSEEK_K * AUTOSEQ_TEMPO_LOW;
       
      
      private var sampleReq:int;
      
      private var _tempo:Number;
      
      private var pMidBuffer:Vector.<Number>;
      
      private var pRefMidBuffer:Vector.<Number>;
      
      private var overlapLength:int;
      
      private var seekLength:int;
      
      private var seekWindowLength:int;
      
      private var nominalSkip:Number;
      
      private var skipFract:Number;
      
      private var bQuickSeek:Boolean;
      
      private var bMidBufferDirty:Boolean;
      
      private var sampleRate:int;
      
      private var sequenceMs:int;
      
      private var seekWindowMs:int;
      
      private var overlapMs:int;
      
      private var bAutoSeqSetting:Boolean;
      
      private var bAutoSeekSetting:Boolean;
      
      public function Stretch(createBuffers:Boolean = true)
      {
         super(createBuffers);
         this.bQuickSeek = true;
         this.bMidBufferDirty = false;
         this.pMidBuffer = null;
         this.overlapLength = 0;
         this.bAutoSeqSetting = true;
         this.bAutoSeekSetting = true;
         this._tempo = 1;
         this.setParameters(44100,DEFAULT_SEQUENCE_MS,DEFAULT_SEEKWINDOW_MS,DEFAULT_OVERLAP_MS);
      }
      
      override public function clear() : void
      {
         super.clear();
         this.clearMidBuffer();
      }
      
      private function clearMidBuffer() : void
      {
         if(this.bMidBufferDirty)
         {
            this.bMidBufferDirty = false;
            this.pMidBuffer = null;
         }
      }
      
      public function setParameters(aSampleRate:int, aSequenceMS:int, aSeekWindowMS:int, aOverlapMS:int) : void
      {
         if(aSampleRate > 0)
         {
            this.sampleRate = aSampleRate;
         }
         if(aOverlapMS > 0)
         {
            this.overlapMs = aOverlapMS;
         }
         if(aSequenceMS > 0)
         {
            this.sequenceMs = aSequenceMS;
            this.bAutoSeqSetting = false;
         }
         else
         {
            this.bAutoSeqSetting = true;
         }
         if(aSeekWindowMS > 0)
         {
            this.seekWindowMs = aSeekWindowMS;
            this.bAutoSeekSetting = false;
         }
         else
         {
            this.bAutoSeekSetting = true;
         }
         this.calcSeqParameters();
         this.calculateOverlapLength(this.overlapMs);
         this.tempo = this._tempo;
      }
      
      public function set tempo(newTempo:Number) : void
      {
         var intskip:int = 0;
         this._tempo = newTempo;
         this.calcSeqParameters();
         this.nominalSkip = this._tempo * (this.seekWindowLength - this.overlapLength);
         this.skipFract = 0;
         intskip = int(this.nominalSkip + 0.5);
         this.sampleReq = Math.max(intskip + this.overlapLength,this.seekWindowLength) + this.seekLength;
      }
      
      public function get tempo() : Number
      {
         return this._tempo;
      }
      
      public function get inputChunkSize() : int
      {
         return this.sampleReq;
      }
      
      public function get outputChunkSize() : int
      {
         return this.overlapLength + Math.max(0,this.seekWindowLength - 2 * this.overlapLength);
      }
      
      private function calculateOverlapLength(overlapInMsec:int) : void
      {
         var newOvl:int = 0;
         newOvl = this.sampleRate * overlapInMsec / 1000;
         if(newOvl < 16)
         {
            newOvl = 16;
         }
         newOvl -= newOvl % 8;
         this.overlapLength = newOvl;
         this.pRefMidBuffer = new Vector.<Number>();
      }
      
      private function checkLimits(x:Number, mi:Number, ma:Number) : Number
      {
         return x < mi ? Number(mi) : (x > ma ? Number(ma) : Number(x));
      }
      
      private function calcSeqParameters() : void
      {
         var seq:Number = NaN;
         var seek:Number = NaN;
         if(this.bAutoSeqSetting)
         {
            seq = AUTOSEQ_C + AUTOSEQ_K * this._tempo;
            seq = this.checkLimits(seq,AUTOSEQ_AT_MAX,AUTOSEQ_AT_MIN);
            this.sequenceMs = int(seq + 0.5);
         }
         if(this.bAutoSeekSetting)
         {
            seek = AUTOSEEK_C + AUTOSEEK_K * this._tempo;
            seek = this.checkLimits(seek,AUTOSEEK_AT_MAX,AUTOSEEK_AT_MIN);
            this.seekWindowMs = int(seek + 0.5);
         }
         this.seekWindowLength = this.sampleRate * this.sequenceMs / 1000;
         this.seekLength = this.sampleRate * this.seekWindowMs / 1000;
      }
      
      public function set quickSeek(enable:Boolean) : void
      {
         this.bQuickSeek = enable;
      }
      
      public function clone() : IFifoSamplePipe
      {
         var result:Stretch = new Stretch();
         result.tempo = this.tempo;
         result.setParameters(this.sampleRate,this.sequenceMs,this.seekWindowMs,this.overlapMs);
         return result;
      }
      
      private function seekBestOverlapPosition() : int
      {
         if(this.bQuickSeek)
         {
            return this.seekBestOverlapPositionStereoQuick();
         }
         return this.seekBestOverlapPositionStereo();
      }
      
      private function seekBestOverlapPositionStereo() : int
      {
         var bestOffs:int = 0;
         var bestCorr:Number = NaN;
         var corr:Number = NaN;
         var i:int = 0;
         this.precalcCorrReferenceStereo();
         bestCorr = int.MIN_VALUE;
         bestOffs = 0;
         for(i = 0; i < this.seekLength; i++)
         {
            corr = this.calcCrossCorrStereo(2 * i,this.pRefMidBuffer);
            if(corr > bestCorr)
            {
               bestCorr = corr;
               bestOffs = i;
            }
         }
         return bestOffs;
      }
      
      private function seekBestOverlapPositionStereoQuick() : int
      {
         var j:int = 0;
         var bestOffs:int = 0;
         var bestCorr:Number = NaN;
         var corr:Number = NaN;
         var scanCount:int = 0;
         var corrOffset:int = 0;
         var tempOffset:int = 0;
         this.precalcCorrReferenceStereo();
         bestCorr = int.MIN_VALUE;
         bestOffs = 0;
         corrOffset = 0;
         tempOffset = 0;
         for(scanCount = 0; scanCount < 4; scanCount++)
         {
            j = 0;
            while(SCAN_OFFSETS[scanCount][j])
            {
               tempOffset = corrOffset + SCAN_OFFSETS[scanCount][j];
               if(tempOffset >= this.seekLength)
               {
                  break;
               }
               corr = this.calcCrossCorrStereo(2 * tempOffset,this.pRefMidBuffer);
               if(corr > bestCorr)
               {
                  bestCorr = corr;
                  bestOffs = tempOffset;
               }
               j++;
            }
            corrOffset = bestOffs;
         }
         return bestOffs;
      }
      
      private function precalcCorrReferenceStereo() : void
      {
         var i:int = 0;
         var cnt2:int = 0;
         var temp:int = 0;
         for(i = 0; i < this.overlapLength; i++)
         {
            temp = i * (this.overlapLength - i);
            cnt2 = i * 2;
            this.pRefMidBuffer[cnt2] = this.pMidBuffer[cnt2] * temp;
            this.pRefMidBuffer[cnt2 + 1] = this.pMidBuffer[cnt2 + 1] * temp;
         }
      }
      
      private function calcCrossCorrStereo(mixingPos:int, compare:Vector.<Number>) : Number
      {
         var corr:Number = NaN;
         var i:int = 0;
         var mixingOffset:int = 0;
         var mixing:Vector.<Number> = _inputBuffer.vector;
         mixingPos += _inputBuffer.startIndex;
         corr = 0;
         for(i = 2; i < 2 * this.overlapLength; i += 2)
         {
            mixingOffset = i + mixingPos;
            corr += mixing[mixingOffset] * compare[i] + mixing[mixingOffset + 1] * compare[i + 1];
         }
         return corr;
      }
      
      private function overlap(ovlPos:uint) : void
      {
         this.overlapStereo(2 * ovlPos);
      }
      
      private function overlapStereo(pInputPos:int) : void
      {
         var i:int = 0;
         var cnt2:int = 0;
         var fTemp:Number = NaN;
         var fScale:Number = NaN;
         var fi:Number = NaN;
         var pInputOffset:int = 0;
         var pOutputOffset:int = 0;
         var pInput:Vector.<Number> = _inputBuffer.vector;
         pInputPos += _inputBuffer.startIndex;
         var pOutput:Vector.<Number> = _outputBuffer.vector;
         var pOutputPos:int = _outputBuffer.endIndex;
         fScale = 1 / this.overlapLength;
         for(i = 0; i < this.overlapLength; i++)
         {
            fTemp = (this.overlapLength - i) * fScale;
            fi = i * fScale;
            cnt2 = 2 * i;
            pInputOffset = cnt2 + pInputPos;
            pOutputOffset = cnt2 + pOutputPos;
            pOutput[pOutputOffset + 0] = pInput[pInputOffset + 0] * fi + this.pMidBuffer[cnt2 + 0] * fTemp;
            pOutput[pOutputOffset + 1] = pInput[pInputOffset + 1] * fi + this.pMidBuffer[cnt2 + 1] * fTemp;
         }
      }
      
      public function process() : void
      {
         var ovlSkip:int = 0;
         var offset:int = 0;
         var temp:int = 0;
         var i:int = 0;
         var output:Vector.<Number> = null;
         if(this.pMidBuffer == null)
         {
            if(_inputBuffer.frameCount < this.overlapLength)
            {
               return;
            }
            this.pMidBuffer = new Vector.<Number>(this.overlapLength * 2);
            _inputBuffer.receiveSamples(this.pMidBuffer,this.overlapLength);
         }
         while(_inputBuffer.frameCount >= this.sampleReq)
         {
            offset = this.seekBestOverlapPosition();
            _outputBuffer.ensureAdditionalCapacity(this.overlapLength);
            this.overlap(uint(offset));
            _outputBuffer.put(this.overlapLength);
            temp = this.seekWindowLength - 2 * this.overlapLength;
            if(temp > 0)
            {
               _outputBuffer.putBuffer(_inputBuffer,offset + this.overlapLength,temp);
            }
            this.pMidBuffer = new Vector.<Number>();
            this.appendInput(this.pMidBuffer,2 * (offset + this.seekWindowLength - this.overlapLength),2 * this.overlapLength);
            this.skipFract += this.nominalSkip;
            ovlSkip = int(this.skipFract);
            this.skipFract -= ovlSkip;
            _inputBuffer.receive(ovlSkip);
         }
      }
      
      private function appendInput(dest:Vector.<Number>, sourceOffset:int, length:int) : void
      {
         var source:Vector.<Number> = _inputBuffer.vector;
         sourceOffset += _inputBuffer.startIndex;
         var destOffset:int = dest.length;
         dest.length += length;
         for(var i:int = 0; i < length; i++)
         {
            dest[i + destOffset] = source[i + sourceOffset];
         }
      }
   }
}
