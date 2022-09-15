package com.motiondraw.geometry
{
   public class CatmullRomSpline
   {
       
      
      var verteces:Array;
      
      var lengths:Array;
      
      var totalLength:Number;
      
      public var numPoints:Number;
      
      private var __APPROXLINELENGTH = 5;
      
      private var vertecesPlus:Array;
      
      public function CatmullRomSpline(vertexPoints:Array)
      {
         super();
         this.lengths = new Array();
         this.verteces = vertexPoints;
      }
      
      private function catmullRom(t:Number, P0:Object, P1:Object, P2:Object, P3:Object) : Object
      {
         var t2:* = t * t;
         var t3:* = t * t2;
         return {
            "x":0.5 * (2 * P1.x + (-P0.x + P2.x) * t + (2 * P0.x - 5 * P1.x + 4 * P2.x - P3.x) * t2 + (-P0.x + 3 * P1.x - 3 * P2.x + P3.x) * t3),
            "y":0.5 * (2 * P1.y + (-P0.y + P2.y) * t + (2 * P0.y - 5 * P1.y + 4 * P2.y - P3.y) * t2 + (-P0.y + 3 * P1.y - 3 * P2.y + P3.y) * t3)
         };
      }
      
      public function plotAll(graphics:*, approxLineLength:Number) : void
      {
         var i:* = undefined;
         var p:* = this.getAllPoints(approxLineLength);
         if(p.length)
         {
            graphics.moveTo(p[0].x,p[0].y);
            for(i = 1; i < p.length; i++)
            {
               graphics.lineTo(p[i].x,p[i].y);
            }
         }
      }
      
      public function getAllPoints(approxLineLength:Number) : Array
      {
         var p1:* = undefined;
         var p2:* = undefined;
         var pMid:* = undefined;
         var dist:Number = NaN;
         var t:Number = NaN;
         var j:* = undefined;
         if(!approxLineLength)
         {
            approxLineLength = this.__APPROXLINELENGTH;
         }
         if(!this.vertecesPlus)
         {
            this.makeVertecesPlus();
         }
         var v:Array = this.vertecesPlus;
         var p:Array = new Array();
         var c:Number = 0;
         var len:* = len = v.length;
         for(var i:* = 0; i < len - 3; i++)
         {
            p1 = v[i + 1];
            p2 = v[i + 2];
            pMid = this.catmullRom(0.5,v[i],p1,p2,v[i + 3]);
            dist = Math.sqrt(Math.abs(Math.pow(pMid.x - p1.x,2)) + Math.abs(Math.pow(pMid.y - p1.y,2))) + Math.sqrt(Math.abs(Math.pow(pMid.x - p2.x,2)) + Math.abs(Math.pow(pMid.y - p2.y,2)));
            this.lengths[i] = dist;
            t = 1 / (dist / approxLineLength);
            for(j = 0; j < 1; j += t)
            {
               p[c] = this.catmullRom(j,v[i],p1,p2,v[i + 3]);
               p[c++].vertex = i;
            }
         }
         var l:* = p.length;
         p[l - 1].x = v[len - 1].x;
         p[l - 1].y = v[len - 1].y;
         this.numPoints = p.length;
         return p;
      }
      
      function getPointsInRange(fromT:Number, toT:Number, approxLineLength:Number) : Array
      {
         var p1:* = undefined;
         var p2:* = undefined;
         var dist:Number = NaN;
         var t:Number = NaN;
         var l2:* = undefined;
         var j:* = undefined;
         if(!this.lengths.length)
         {
            this.getSegmentLengths();
         }
         if(!approxLineLength)
         {
            approxLineLength = this.__APPROXLINELENGTH;
         }
         var v:Array = this.vertecesPlus;
         var p:Array = new Array();
         var c:Number = 0;
         for(var i:* = 0,var l1:* = v.length; i < l1 - 3; i++)
         {
            p1 = v[i + 1];
            p2 = v[i + 2];
            if(fromT >= p1.t && fromT < p2.t)
            {
               dist = this.lengths[i];
               t = 1 / (dist / approxLineLength);
               l2 = toT > p2.t ? 1 : (toT - p1.t) / (p2.t - p1.t);
               for(j = (fromT - p1.t) / (p2.t - p1.t); j < l2; j += t)
               {
                  p[c] = this.catmullRom(j,v[i],p1,p2,v[i + 3]);
                  p[c++].vertex = i;
               }
               p[c] = this.catmullRom(l2,v[i],p1,p2,v[i + 3]);
               p[c++].vertex = i;
               if(toT > p2.t)
               {
                  fromT = p2.t;
               }
               else if(l2 <= 1)
               {
                  break;
               }
            }
         }
         return p;
      }
      
      function getPointAtT(t:Number) : Object
      {
         var p1:* = undefined;
         var p2:* = undefined;
         var t2:Number = NaN;
         var o:* = undefined;
         if(!this.lengths.length)
         {
            this.getSegmentLengths();
         }
         var v:Array = this.vertecesPlus;
         var c:Number = 0;
         for(var i:* = 0,var l1:* = v.length; i < l1 - 3; i++)
         {
            p1 = v[i + 1];
            p2 = v[i + 2];
            if(t >= p1.t && t <= p2.t)
            {
               t2 = (t - p1.t) / (p2.t - p1.t);
               o = this.catmullRom(t2,v[i],p1,p2,v[i + 3]);
               break;
            }
         }
         return o;
      }
      
      function getTOfVertex(index:Number) : Number
      {
         if(!this.lengths.length)
         {
            this.getSegmentLengths();
         }
         return this.verteces[index].t;
      }
      
      function getSegmentLengths() : void
      {
         var p1:* = undefined;
         var p2:* = undefined;
         var pMid:* = undefined;
         var dist:* = undefined;
         if(!this.vertecesPlus)
         {
            this.makeVertecesPlus();
         }
         var v:Array = this.vertecesPlus;
         this.lengths = new Array();
         this.totalLength = 0;
         for(var i:* = 0,var len:* = v.length; i < len - 3; i++)
         {
            p1 = v[i + 1];
            p2 = v[i + 2];
            pMid = this.catmullRom(0.5,v[i],p1,p2,v[i + 3]);
            dist = Math.sqrt(Math.abs(Math.pow(pMid.x - p1.x,2)) + Math.abs(Math.pow(pMid.y - p1.y,2))) + Math.sqrt(Math.abs(Math.pow(pMid.x - p2.x,2)) + Math.abs(Math.pow(pMid.y - p2.y,2)));
            this.lengths[i] = dist;
            this.totalLength += dist;
         }
         this.verteces[0].t = 0;
         var sum:* = 0;
         for(var ii:* = 0,var len2:* = this.lengths.length; ii < len2; ii++)
         {
            sum += this.lengths[ii];
            this.verteces[i + 1].t = sum / this.totalLength;
         }
      }
      
      private function makeVertecesPlus() : void
      {
         this.vertecesPlus = this.verteces.slice(0);
         this.vertecesPlus.splice(0,0,this.vertecesPlus[0]);
         this.vertecesPlus.push(this.vertecesPlus[this.vertecesPlus.length - 1]);
      }
   }
}
