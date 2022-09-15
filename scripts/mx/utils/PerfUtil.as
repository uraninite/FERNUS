package mx.utils
{
   import flash.display.DisplayObject;
   import flash.utils.getTimer;
   
   public final class PerfUtil
   {
      
      private static var _instance:PerfUtil;
      
      public static var detailedSampling:Boolean = false;
       
      
      private var idVector:Vector.<String>;
      
      private var timeVector:Vector.<uint>;
      
      private var startSamplingCount:int = 0;
      
      private var detailedSamplingCount:int = 0;
      
      private const MARK:uint = 0;
      
      private const START:uint = 536870912;
      
      private const END:uint = 1073741824;
      
      private const TEST_CASE_START_ABSOLUTE:uint = 1610612736;
      
      private const TEST_CASE_START_RELATIVE:uint = 2.147483648E9;
      
      private const TEST_CASE_END:uint = 2.68435456E9;
      
      private const IGNORE:uint = 3.221225472E9;
      
      private const TIME_MASK:uint = 536870911;
      
      private const FLAG_MASK:uint = ~this.TIME_MASK;
      
      public function PerfUtil()
      {
         super();
         this.idVector = new Vector.<String>();
         this.timeVector = new Vector.<uint>();
      }
      
      public static function getInstance() : PerfUtil
      {
         if(!_instance)
         {
            _instance = new PerfUtil();
         }
         return _instance;
      }
      
      public function startSampling(testCase:String, absoluteTime:Boolean) : void
      {
         ++this.startSamplingCount;
         this.timeVector.push(!!absoluteTime ? this.TEST_CASE_START_ABSOLUTE : this.TEST_CASE_START_RELATIVE);
         this.idVector.push(testCase);
         this.markTime(testCase);
      }
      
      public function finishSampling(testCase:String) : void
      {
         this.timeVector.push(this.TEST_CASE_END);
         this.idVector.push(testCase);
         this.markTime(testCase);
         --this.startSamplingCount;
      }
      
      public function markStart() : int
      {
         if(this.startSamplingCount <= 0)
         {
            return -1;
         }
         var time:uint = getTimer();
         this.idVector.push(null);
         time |= this.START;
         this.timeVector.push(time);
         return this.timeVector.length - 1;
      }
      
      public function markEnd(name:String, token:int, tolerance:int = 0, idObject:Object = null) : void
      {
         if(this.startSamplingCount <= 0 || token < 0)
         {
            return;
         }
         var time:uint = getTimer();
         var startTime:uint = this.timeVector[token] & this.TIME_MASK;
         if(time - startTime < tolerance)
         {
            if(token == this.timeVector.length - 1)
            {
               this.timeVector.pop();
               this.idVector.pop();
            }
            else
            {
               this.timeVector[token] = this.IGNORE;
            }
            return;
         }
         if(idObject)
         {
            if(idObject is DisplayObject)
            {
               name = (idObject as DisplayObject).name + name;
            }
            else
            {
               name = idObject.toString() + name;
            }
         }
         this.idVector[token] = name;
         this.idVector.push(name);
         time |= this.END;
         this.timeVector.push(time);
      }
      
      public function markTime(name:String) : void
      {
         if(this.startSamplingCount <= 0)
         {
            return;
         }
         var time:int = getTimer();
         this.timeVector.push(time);
         this.idVector.push(name);
      }
      
      public function getSummary() : String
      {
         var flag:uint = 0;
         var testCaseName:String = null;
         var k:int = 0;
         var testCases:Vector.<String> = new Vector.<String>();
         var testCasesStart:Vector.<int> = new Vector.<int>();
         var summary:String = "";
         var count:int = this.timeVector.length;
         for(var i:int = 0; i < count; i++)
         {
            flag = this.flagAt(i);
            if(flag == this.TEST_CASE_START_ABSOLUTE || flag == this.TEST_CASE_START_RELATIVE)
            {
               testCasesStart.push(i);
               testCases.push(this.idVector[i]);
            }
            else if(flag == this.TEST_CASE_END)
            {
               testCaseName = this.idVector[i];
               for(k = testCases.length - 1; k >= 0; k--)
               {
                  if(testCases[k] == testCaseName)
                  {
                     summary += this.getSummaryFor(testCaseName,testCasesStart[k],i + 1);
                     break;
                  }
               }
            }
         }
         return summary;
      }
      
      private function flagAt(index:int) : uint
      {
         return this.timeVector[index] & this.FLAG_MASK;
      }
      
      private function timeAt(index:int) : uint
      {
         return this.timeVector[index] & this.TIME_MASK;
      }
      
      private function getSummaryFor(name:String, startIndex:int, endIndex:int) : String
      {
         var stampName:* = null;
         var flag:uint = 0;
         var timeStamp:uint = 0;
         var timeOffset:int = this.flagAt(startIndex) == this.TEST_CASE_START_ABSOLUTE ? 0 : int(this.timeAt(startIndex + 1));
         var summary:String = "--------------------\n" + name;
         if(timeOffset > 0)
         {
            summary += ", time stamps relative to " + this.timeAt(startIndex + 1);
         }
         summary += "\n" + "\n";
         for(var i:int = startIndex; i < endIndex; i++)
         {
            flag = this.flagAt(i);
            if(flag != this.IGNORE)
            {
               if(flag == this.TEST_CASE_START_ABSOLUTE || flag == this.TEST_CASE_START_RELATIVE || flag == this.TEST_CASE_END)
               {
                  i++;
               }
               else
               {
                  timeStamp = this.timeAt(i);
                  stampName = this.idVector[i];
                  if(flag == this.START)
                  {
                     stampName += " .start";
                  }
                  else if(flag == this.END)
                  {
                     stampName += " .end";
                  }
                  summary += (timeStamp - timeOffset).toString() + " : " + stampName + "\n";
               }
            }
         }
         return summary;
      }
   }
}
