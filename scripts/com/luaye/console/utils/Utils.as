package com.luaye.console.utils
{
   import flash.display.Graphics;
   import flash.geom.Point;
   import flash.utils.getQualifiedClassName;
   
   public class Utils
   {
       
      
      public function Utils()
      {
         super();
      }
      
      public static function round(n:Number, d:uint) : Number
      {
         return Math.round(n * d) / d;
      }
      
      public static function angle(srcP:Point, point:Point) : Number
      {
         var X:Number = point.x - srcP.x;
         var Y:Number = point.y - srcP.y;
         var a:Number = Math.atan2(Y,X) / Math.PI * 180;
         a += 90;
         if(a > 180)
         {
            a -= 360;
         }
         return a;
      }
      
      public static function drawCircleSegment(g:Graphics, radius:Number, pos:Point = null, deg:Number = 180, startDeg:Number = 0) : Point
      {
         var ra:Number = NaN;
         var diffr:Number = NaN;
         var offr:Number = NaN;
         var ap:Point = null;
         if(!pos)
         {
            pos = new Point();
         }
         var reversed:Boolean = false;
         if(deg < 0)
         {
            reversed = true;
            deg = Math.abs(deg);
         }
         var rad:Number = deg * Math.PI / 180;
         var rad2:Number = startDeg * Math.PI / 180;
         var p:Point = getPointOnCircle(radius,rad2);
         p.offset(pos.x,pos.y);
         g.moveTo(p.x,p.y);
         var pra:Number = 0;
         for(var i:int = 1; i <= rad + 1; i++)
         {
            ra = i <= rad ? Number(i) : Number(rad);
            diffr = ra - pra;
            offr = 1 + 0.12 * diffr * diffr;
            ap = getPointOnCircle(radius * offr,(ra - diffr / 2) * (!!reversed ? -1 : 1) + rad2);
            ap.offset(pos.x,pos.y);
            p = getPointOnCircle(radius,ra * (!!reversed ? -1 : 1) + rad2);
            p.offset(pos.x,pos.y);
            g.curveTo(ap.x,ap.y,p.x,p.y);
            pra = ra;
         }
         return p;
      }
      
      public static function getPointOnCircle(radius:Number, rad:Number) : Point
      {
         return new Point(radius * Math.cos(rad),radius * Math.sin(rad));
      }
      
      public static function averageOut(current:Number, addition:Number, over:Number) : Number
      {
         return current + (addition - current) / over;
      }
      
      public static function replaceByIndexes(str:String, replace:String, start:int, end:int) : String
      {
         return str.substring(0,start) + replace + str.substring(end);
      }
      
      public static function shortClassName(cls:Object) : String
      {
         var str:String = getQualifiedClassName(cls);
         var ind:int = str.lastIndexOf("::");
         return str.substring(ind >= 0 ? Number(ind + 2) : Number(0));
      }
   }
}
