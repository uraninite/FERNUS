package com.motiondraw
{
   public class LineGeneralization
   {
       
      
      public function LineGeneralization()
      {
         super();
      }
      
      public function smoothMcMaster(points:Array) : Array
      {
         var j:* = undefined;
         var avX:* = undefined;
         var avY:* = undefined;
         var nL:* = [];
         var len:* = points.length;
         if(len < 5)
         {
            return points;
         }
         var i:* = len;
         while(i--)
         {
            if(i == len - 1 || i == len - 2 || i == 1 || i == 0)
            {
               nL[i] = {
                  "x":points[i].x,
                  "y":points[i].y
               };
            }
            else
            {
               j = 5;
               avX = 0;
               avY = 0;
               while(j--)
               {
                  avX += points[i + 2 - j].x;
                  avY += points[i + 2 - j].y;
               }
               avX /= 5;
               avY /= 5;
               nL[i] = nL[i] = {
                  "x":(points[i].x + avX) / 2,
                  "y":(points[i].y + avY) / 2
               };
            }
         }
         return nL;
      }
      
      public function simplifyLang(lookAhead:Number, tolerance:Number, points:Array) : Array
      {
         var offset:Number = NaN;
         var len:Number = NaN;
         var count:Number = NaN;
         if(lookAhead <= 1 || points.length < 3)
         {
            return points;
         }
         var nP:Array = new Array();
         len = points.length;
         if(lookAhead > len - 1)
         {
            lookAhead = len - 1;
         }
         nP[0] = {
            "x":points[0].x,
            "y":points[0].y
         };
         count = 1;
         for(var i:* = 0; i < len; i++)
         {
            if(i + lookAhead > len)
            {
               lookAhead = len - i - 1;
            }
            offset = this.recursiveToleranceBar(points,i,lookAhead,tolerance);
            if(offset > 0 && points[i + offset])
            {
               nP[count] = {
                  "x":points[i + offset].x,
                  "y":points[i + offset].y
               };
               i += offset - 1;
               count++;
            }
         }
         nP[count - 1] = {
            "x":points[len - 1].x,
            "y":points[len - 1].y
         };
         return nP;
      }
      
      private function recursiveToleranceBar(points:*, i:*, lookAhead:*, tolerance:*) : Number
      {
         var cP:* = undefined;
         var cLP:* = undefined;
         var v1:* = undefined;
         var v2:* = undefined;
         var angle:* = undefined;
         var dx:* = undefined;
         var dy:* = undefined;
         var lH:* = undefined;
         var n:* = lookAhead;
         cP = points[i];
         if(!points[i + n])
         {
            return 0;
         }
         v1 = {
            "x":points[i + n].x - cP.x,
            "y":points[i + n].y - cP.y
         };
         for(var j:* = 1; j <= n; j++)
         {
            cLP = points[i + j];
            v2 = {
               "x":cLP.x - cP.x,
               "y":cLP.y - cP.y
            };
            angle = Math.acos((v1.x * v2.x + v1.y * v2.y) / (Math.sqrt(v1.y * v1.y + v1.x * v1.x) * Math.sqrt(v2.y * v2.y + v2.x * v2.x)));
            if(isNaN(angle))
            {
               angle = 0;
            }
            dx = cP.x - cLP.x;
            dy = cP.y - cLP.y;
            lH = Math.sqrt(dx * dx + dy * dy);
            if(Math.sin(angle) * lH >= tolerance)
            {
               n--;
               if(n > 0)
               {
                  return this.recursiveToleranceBar(points,i,n,tolerance);
               }
               return 0;
            }
         }
         return n;
      }
      
      private function recursiveToleranceBar_old(points:*, i:*, lookAhead:*, tolerance:*) : Number
      {
         var cP:* = undefined;
         var cLP:* = undefined;
         var v1:* = undefined;
         var v2:* = undefined;
         var angle:* = undefined;
         var dx:* = undefined;
         var dy:* = undefined;
         var res:* = undefined;
         var lH:* = undefined;
         var n:* = lookAhead;
         cP = points[i];
         v1 = {
            "x":points[i + n].x - cP.x,
            "y":points[i + n].y - cP.y
         };
         for(var j:* = 1; j <= n; j++)
         {
            cLP = points[i + j];
            v2 = {
               "x":cLP.x - cP.x,
               "y":cLP.y - cP.y
            };
            angle = Math.acos((v1.x * v2.x + v1.y * v2.y) / (Math.sqrt(v1.y * v1.y + v1.x * v1.x) * Math.sqrt(v2.y * v2.y + v2.x * v2.x)));
            if(isNaN(angle))
            {
               angle = 0;
            }
            dx = cP.x - cLP.x;
            dy = cP.y - cLP.y;
            lH = Math.sqrt(dx * dx + dy * dy);
            if(Math.sin(angle) * lH >= tolerance)
            {
               n--;
               if(n > 0)
               {
                  res = this.recursiveToleranceBar(points,i,n,tolerance);
                  break;
               }
               res = 0;
               break;
            }
         }
         return res;
      }
   }
}
