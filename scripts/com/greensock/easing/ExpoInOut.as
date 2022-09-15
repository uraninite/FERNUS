package com.greensock.easing
{
   public final class ExpoInOut extends Ease
   {
      
      public static var ease:ExpoInOut = new ExpoInOut();
       
      
      public function ExpoInOut()
      {
         super();
      }
      
      override public function getRatio(p:Number) : Number
      {
         return (p = p * 2) < 1 ? Number(0.5 * Math.pow(2,10 * (p - 1))) : Number(0.5 * (2 - Math.pow(2,-10 * (p - 1))));
      }
   }
}
