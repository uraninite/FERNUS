package com.greensock.easing
{
   public final class ExpoIn extends Ease
   {
      
      public static var ease:ExpoIn = new ExpoIn();
       
      
      public function ExpoIn()
      {
         super();
      }
      
      override public function getRatio(p:Number) : Number
      {
         return Math.pow(2,10 * (p - 1)) - 0.001;
      }
   }
}
