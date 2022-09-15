package org.gestouch.extensions.native
{
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.geom.Point;
   import org.gestouch.core.ITouchHitTester;
   
   public class NativeTouchHitTester implements ITouchHitTester
   {
       
      
      private var stage:Stage;
      
      public function NativeTouchHitTester(stage:Stage)
      {
         super();
         if(!stage)
         {
            throw ArgumentError("Missing stage argument.");
         }
         this.stage = stage;
      }
      
      public function hitTest(point:Point, possibleTarget:Object = null) : Object
      {
         if(possibleTarget && possibleTarget is DisplayObject)
         {
            return possibleTarget;
         }
         return DisplayObjectUtils.getTopTarget(this.stage,point);
      }
   }
}
