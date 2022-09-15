package com.greensock.plugins
{
   import com.greensock.TweenLite;
   import flash.geom.Point;
   
   public class BezierPlugin extends TweenPlugin
   {
      
      public static const API:Number = 2;
      
      protected static const _RAD2DEG:Number = 180 / Math.PI;
      
      protected static var _r1:Array = [];
      
      protected static var _r2:Array = [];
      
      protected static var _r3:Array = [];
      
      protected static var _corProps:Object = {};
       
      
      protected var _target:Object;
      
      protected var _autoRotate:Array;
      
      protected var _round:Object;
      
      protected var _lengths:Array;
      
      protected var _segments:Array;
      
      protected var _length:Number;
      
      protected var _func:Object;
      
      protected var _props:Array;
      
      protected var _l1:Number;
      
      protected var _l2:Number;
      
      protected var _li:Number;
      
      protected var _curSeg:Array;
      
      protected var _s1:Number;
      
      protected var _s2:Number;
      
      protected var _si:Number;
      
      protected var _beziers:Object;
      
      protected var _segCount:int;
      
      protected var _prec:Number;
      
      protected var _timeRes:int;
      
      public function BezierPlugin()
      {
         super("bezier");
         this._overwriteProps.pop();
         this._func = {};
         this._round = {};
      }
      
      public static function bezierThrough(values:Array, curviness:Number = 1, quadratic:Boolean = false, basic:Boolean = false, correlate:String = "x,y,z", prepend:Object = null) : Object
      {
         var props:Array = null;
         var i:int = 0;
         var p:* = null;
         var j:int = 0;
         var a:Array = null;
         var l:int = 0;
         var r:Number = NaN;
         var seamless:Boolean = false;
         var last:Object = null;
         var obj:Object = {};
         var first:Object = prepend || values[0];
         correlate = "," + correlate + ",";
         if(first is Point)
         {
            props = ["x","y"];
         }
         else
         {
            props = [];
            for(p in first)
            {
               props.push(p);
            }
         }
         if(values.length > 1)
         {
            last = values[values.length - 1];
            seamless = true;
            i = props.length;
            while(--i > -1)
            {
               p = props[i];
               if(Math.abs(first[p] - last[p]) > 0.05)
               {
                  seamless = false;
                  break;
               }
            }
            if(seamless)
            {
               values = values.concat();
               if(prepend)
               {
                  values.unshift(prepend);
               }
               values.push(values[1]);
               prepend = values[values.length - 3];
            }
         }
         _r1.length = _r2.length = _r3.length = 0;
         i = props.length;
         while(--i > -1)
         {
            p = props[i];
            _corProps[p] = correlate.indexOf("," + p + ",") !== -1;
            obj[p] = _parseAnchors(values,p,_corProps[p],prepend);
         }
         i = _r1.length;
         while(--i > -1)
         {
            _r1[i] = Math.sqrt(_r1[i]);
            _r2[i] = Math.sqrt(_r2[i]);
         }
         if(!basic)
         {
            i = props.length;
            while(--i > -1)
            {
               if(_corProps[p])
               {
                  a = obj[props[i]];
                  l = a.length - 1;
                  for(j = 0; j < l; j++)
                  {
                     r = a[j + 1].da / _r2[j] + a[j].da / _r1[j];
                     _r3[j] = (_r3[j] || 0) + r * r;
                  }
               }
            }
            i = _r3.length;
            while(--i > -1)
            {
               _r3[i] = Math.sqrt(_r3[i]);
            }
         }
         i = props.length;
         j = !!quadratic ? 4 : 1;
         while(--i > -1)
         {
            p = props[i];
            a = obj[p];
            _calculateControlPoints(a,curviness,quadratic,basic,_corProps[p]);
            if(seamless)
            {
               a.splice(0,j);
               a.splice(a.length - j,j);
            }
         }
         return obj;
      }
      
      public static function _parseBezierData(values:Array, type:String, prepend:Object = null) : Object
      {
         var a:Number = NaN;
         var b:Number = NaN;
         var c:Number = NaN;
         var d:Number = NaN;
         var cur:Array = null;
         var props:Array = null;
         var i:int = 0;
         var j:int = 0;
         var l:int = 0;
         var p:* = null;
         var cnt:int = 0;
         var tmp:Object = null;
         type = type || "soft";
         var obj:Object = {};
         var inc:int = type === "cubic" ? 3 : 2;
         var soft:* = type === "soft";
         if(soft && prepend)
         {
            values = [prepend].concat(values);
         }
         if(values == null || values.length < inc + 1)
         {
            throw new Error("invalid Bezier data");
         }
         if(values[1] is Point)
         {
            props = ["x","y"];
         }
         else
         {
            props = [];
            for(p in values[0])
            {
               props.push(p);
            }
         }
         i = props.length;
         while(--i > -1)
         {
            p = props[i];
            obj[p] = cur = [];
            cnt = 0;
            l = values.length;
            for(j = 0; j < l; j++)
            {
               a = prepend == null ? Number(values[j][p]) : (typeof (tmp = values[j][p]) === "string" && tmp.charAt(1) === "=" ? Number(prepend[p] + Number(tmp.charAt(0) + tmp.substr(2))) : Number(Number(tmp)));
               if(soft)
               {
                  if(j > 1)
                  {
                     if(j < l - 1)
                     {
                        var _loc19_:*;
                        cur[_loc19_ = cnt++] = (a + cur[cnt - 2]) / 2;
                     }
                  }
               }
               cur[_loc19_ = cnt++] = a;
            }
            l = cnt - inc + 1;
            cnt = 0;
            for(j = 0; j < l; j += inc)
            {
               a = cur[j];
               b = cur[j + 1];
               c = cur[j + 2];
               d = inc === 2 ? Number(0) : Number(cur[j + 3]);
               cur[_loc19_ = cnt++] = inc === 3 ? new Segment(a,b,c,d) : new Segment(a,(2 * b + a) / 3,(2 * b + c) / 3,c);
            }
            cur.length = cnt;
         }
         return obj;
      }
      
      protected static function _parseAnchors(values:Array, p:String, correlate:Boolean, prepend:Object) : Array
      {
         var l:int = 0;
         var i:int = 0;
         var p1:Number = NaN;
         var p2:Number = NaN;
         var p3:Number = NaN;
         var tmp:Object = null;
         var a:Array = [];
         if(prepend)
         {
            values = [prepend].concat(values);
            i = values.length;
            while(--i > -1)
            {
               if(typeof (tmp = values[i][p]) === "string")
               {
                  if(tmp.charAt(1) === "=")
                  {
                     values[i][p] = prepend[p] + Number(tmp.charAt(0) + tmp.substr(2));
                  }
               }
            }
         }
         l = values.length - 2;
         if(l < 0)
         {
            a[0] = new Segment(values[0][p],0,0,values[l < -1 ? 0 : 1][p]);
            return a;
         }
         for(i = 0; i < l; i++)
         {
            p1 = values[i][p];
            p2 = values[i + 1][p];
            a[i] = new Segment(p1,0,0,p2);
            if(correlate)
            {
               p3 = values[i + 2][p];
               _r1[i] = (_r1[i] || 0) + (p2 - p1) * (p2 - p1);
               _r2[i] = (_r2[i] || 0) + (p3 - p2) * (p3 - p2);
            }
         }
         a[i] = new Segment(values[i][p],0,0,values[i + 1][p]);
         return a;
      }
      
      protected static function _calculateControlPoints(a:Array, curviness:Number = 1, quad:Boolean = false, basic:Boolean = false, correlate:Boolean = false) : void
      {
         var i:int = 0;
         var p1:Number = NaN;
         var p2:Number = NaN;
         var p3:Number = NaN;
         var seg:Segment = null;
         var m1:Number = NaN;
         var m2:Number = NaN;
         var mm:Number = NaN;
         var cp2:Number = NaN;
         var qb:Array = null;
         var r1:Number = NaN;
         var r2:Number = NaN;
         var tl:Number = NaN;
         var l:int = a.length - 1;
         var ii:int = 0;
         var cp1:Number = a[0].a;
         for(i = 0; i < l; i++)
         {
            seg = a[ii];
            p1 = seg.a;
            p2 = seg.d;
            p3 = a[ii + 1].d;
            if(correlate)
            {
               r1 = _r1[i];
               r2 = _r2[i];
               tl = (r2 + r1) * curviness * 0.25 / (!!basic ? 0.5 : _r3[i] || 0.5);
               m1 = p2 - (p2 - p1) * (!!basic ? curviness * 0.5 : (r1 !== 0 ? tl / r1 : 0));
               m2 = p2 + (p3 - p2) * (!!basic ? curviness * 0.5 : (r2 !== 0 ? tl / r2 : 0));
               mm = p2 - (m1 + ((m2 - m1) * (r1 * 3 / (r1 + r2) + 0.5) / 4 || 0));
            }
            else
            {
               m1 = p2 - (p2 - p1) * curviness * 0.5;
               m2 = p2 + (p3 - p2) * curviness * 0.5;
               mm = p2 - (m1 + m2) / 2;
            }
            m1 += mm;
            m2 += mm;
            seg.c = cp2 = m1;
            if(i != 0)
            {
               seg.b = cp1;
            }
            else
            {
               seg.b = cp1 = seg.a + (seg.c - seg.a) * 0.6;
            }
            seg.da = p2 - p1;
            seg.ca = cp2 - p1;
            seg.ba = cp1 - p1;
            if(quad)
            {
               qb = cubicToQuadratic(p1,cp1,cp2,p2);
               a.splice(ii,1,qb[0],qb[1],qb[2],qb[3]);
               ii += 4;
            }
            else
            {
               ii++;
            }
            cp1 = m2;
         }
         seg = a[ii];
         seg.b = cp1;
         seg.c = cp1 + (seg.d - cp1) * 0.4;
         seg.da = seg.d - seg.a;
         seg.ca = seg.c - seg.a;
         seg.ba = cp1 - seg.a;
         if(quad)
         {
            qb = cubicToQuadratic(seg.a,cp1,seg.c,seg.d);
            a.splice(ii,1,qb[0],qb[1],qb[2],qb[3]);
         }
      }
      
      public static function cubicToQuadratic(a:Number, b:Number, c:Number, d:Number) : Array
      {
         var q1:Object = {"a":a};
         var q2:Object = {};
         var q3:Object = {};
         var q4:Object = {"c":d};
         var mab:Number = (a + b) / 2;
         var mbc:Number = (b + c) / 2;
         var mcd:Number = (c + d) / 2;
         var mabc:Number = (mab + mbc) / 2;
         var mbcd:Number = (mbc + mcd) / 2;
         var m8:Number = (mbcd - mabc) / 8;
         q1.b = mab + (a - mab) / 4;
         q2.b = mabc + m8;
         q1.c = q2.a = (q1.b + q2.b) / 2;
         q2.c = q3.a = (mabc + mbcd) / 2;
         q3.b = mbcd - m8;
         q4.b = mcd + (d - mcd) / 4;
         q3.c = q4.a = (q3.b + q4.b) / 2;
         return [q1,q2,q3,q4];
      }
      
      public static function quadraticToCubic(a:Number, b:Number, c:Number) : Object
      {
         return new Segment(a,(2 * b + a) / 3,(2 * b + c) / 3,c);
      }
      
      protected static function _parseLengthData(obj:Object, precision:uint = 6) : Object
      {
         var p:* = null;
         var i:int = 0;
         var l:int = 0;
         var index:Number = NaN;
         var a:Array = [];
         var lengths:Array = [];
         var d:Number = 0;
         var total:Number = 0;
         var threshold:int = precision - 1;
         var segments:Array = [];
         var curLS:Array = [];
         for(p in obj)
         {
            _addCubicLengths(obj[p],a,precision);
         }
         l = a.length;
         for(i = 0; i < l; i++)
         {
            d += Math.sqrt(a[i]);
            index = i % precision;
            curLS[index] = d;
            if(index == threshold)
            {
               total += d;
               index = i / precision >> 0;
               segments[index] = curLS;
               lengths[index] = total;
               d = 0;
               curLS = [];
            }
         }
         return {
            "length":total,
            "lengths":lengths,
            "segments":segments
         };
      }
      
      private static function _addCubicLengths(a:Array, steps:Array, precision:uint = 6) : void
      {
         var d:Number = NaN;
         var d1:Number = NaN;
         var s:Number = NaN;
         var da:Number = NaN;
         var ca:Number = NaN;
         var ba:Number = NaN;
         var p:Number = NaN;
         var i:int = 0;
         var inv:Number = NaN;
         var bez:Segment = null;
         var index:int = 0;
         var inc:Number = 1 / precision;
         var j:int = a.length;
         while(--j > -1)
         {
            bez = a[j];
            s = bez.a;
            da = bez.d - s;
            ca = bez.c - s;
            ba = bez.b - s;
            d = d1 = 0;
            for(i = 1; i <= precision; i++)
            {
               p = inc * i;
               inv = 1 - p;
               d = d1 - (d1 = (p * p * da + 3 * inv * (p * ca + inv * ba)) * p);
               index = j * precision + i - 1;
               steps[index] = (steps[index] || 0) + d * d;
            }
         }
      }
      
      override public function _onInitTween(target:Object, value:*, tween:TweenLite) : Boolean
      {
         var p:* = null;
         var isFunc:Boolean = false;
         var i:int = 0;
         var j:int = 0;
         var ar:Array = null;
         var prepend:Object = null;
         var ld:Object = null;
         this._target = target;
         var vars:Object = value is Array ? {"values":value} : value;
         this._props = [];
         this._timeRes = vars.timeResolution == null ? 6 : int(int(vars.timeResolution));
         var values:Array = vars.values || [];
         var first:Object = {};
         var second:Object = values[0];
         var autoRotate:Object = vars.autoRotate || tween.vars.orientToBezier;
         this._autoRotate = !!autoRotate ? (autoRotate is Array ? autoRotate as Array : [["x","y","rotation",autoRotate === true ? 0 : Number(autoRotate)]]) : null;
         if(second is Point)
         {
            this._props = ["x","y"];
         }
         else
         {
            for(p in second)
            {
               this._props.push(p);
            }
         }
         i = this._props.length;
         while(--i > -1)
         {
            p = this._props[i];
            this._overwriteProps.push(p);
            isFunc = this._func[p] = target[p] is Function;
            first[p] = !isFunc ? target[p] : target[p.indexOf("set") || !("get" + p.substr(3) in target) ? p : "get" + p.substr(3)]();
            if(!prepend)
            {
               if(first[p] !== values[0][p])
               {
                  prepend = first;
               }
            }
         }
         this._beziers = vars.type !== "cubic" && vars.type !== "quadratic" && vars.type !== "soft" ? bezierThrough(values,!!isNaN(vars.curviness) ? Number(1) : Number(vars.curviness),false,vars.type === "thruBasic",vars.correlate || "x,y,z",prepend) : _parseBezierData(values,vars.type,first);
         this._segCount = this._beziers[p].length;
         if(this._timeRes)
         {
            ld = _parseLengthData(this._beziers,this._timeRes);
            this._length = ld.length;
            this._lengths = ld.lengths;
            this._segments = ld.segments;
            this._l1 = this._li = this._s1 = this._si = 0;
            this._l2 = this._lengths[0];
            this._curSeg = this._segments[0];
            this._s2 = this._curSeg[0];
            this._prec = 1 / this._curSeg.length;
         }
         if(ar = this._autoRotate)
         {
            if(!(ar[0] is Array))
            {
               this._autoRotate = ar = [ar];
            }
            i = ar.length;
            while(--i > -1)
            {
               for(j = 0; j < 3; j++)
               {
                  p = ar[i][j];
                  this._func[p] = target[p] is Function ? target[p.indexOf("set") || !("get" + p.substr(3) in target) ? p : "get" + p.substr(3)] : false;
               }
            }
         }
         return true;
      }
      
      override public function _kill(lookup:Object) : Boolean
      {
         var p:* = null;
         var i:int = 0;
         var a:Array = this._props;
         for(p in this._beziers)
         {
            if(p in lookup)
            {
               delete this._beziers[p];
               delete this._func[p];
               i = a.length;
               while(--i > -1)
               {
                  if(a[i] === p)
                  {
                     a.splice(i,1);
                  }
               }
            }
         }
         return super._kill(lookup);
      }
      
      override public function _roundProps(lookup:Object, value:Boolean = true) : void
      {
         var op:Array = this._overwriteProps;
         var i:int = op.length;
         while(--i > -1)
         {
            if(op[i] in lookup || "bezier" in lookup || "bezierThrough" in lookup)
            {
               this._round[op[i]] = value;
            }
         }
      }
      
      override public function setRatio(v:Number) : void
      {
         var curIndex:int = 0;
         var inv:Number = NaN;
         var i:int = 0;
         var p:String = null;
         var b:Segment = null;
         var t:Number = NaN;
         var val:Number = NaN;
         var l:int = 0;
         var lengths:Array = null;
         var curSeg:Array = null;
         var ar:Array = null;
         var b2:Segment = null;
         var x1:Number = NaN;
         var y1:Number = NaN;
         var x2:Number = NaN;
         var y2:Number = NaN;
         var add:Number = NaN;
         var conv:Number = NaN;
         var segments:int = this._segCount;
         var func:Object = this._func;
         var target:Object = this._target;
         if(this._timeRes == 0)
         {
            curIndex = v < 0 ? 0 : (v >= 1 ? int(segments - 1) : segments * v >> 0);
            t = (v - curIndex * (1 / segments)) * segments;
         }
         else
         {
            lengths = this._lengths;
            curSeg = this._curSeg;
            v *= this._length;
            i = this._li;
            if(v > this._l2 && i < segments - 1)
            {
               l = segments - 1;
               while(i < l && (this._l2 = lengths[++i]) <= v)
               {
               }
               this._l1 = lengths[i - 1];
               this._li = i;
               this._s2 = (this._curSeg = this._segments[i])[this._s1 = this._si = 0];
            }
            else if(v < this._l1 && i > 0)
            {
               while(i > 0 && (this._l1 = lengths[--i]) >= v)
               {
               }
               if(i === 0 && v < this._l1)
               {
                  this._l1 = 0;
               }
               else
               {
                  i++;
               }
               this._l2 = lengths[i];
               this._li = i;
               this._s1 = Number((this._curSeg = this._segments[i])[(this._si = curSeg.length - 1) - 1]) || Number(0);
               this._s2 = curSeg[this._si];
            }
            curIndex = i;
            v -= this._l1;
            i = this._si;
            if(v > this._s2 && i < curSeg.length - 1)
            {
               l = curSeg.length - 1;
               while(i < l && (this._s2 = curSeg[++i]) <= v)
               {
               }
               this._s1 = curSeg[i - 1];
               this._si = i;
            }
            else if(v < this._s1 && i > 0)
            {
               while(i > 0 && (this._s1 = curSeg[--i]) >= v)
               {
               }
               if(i === 0 && v < this._s1)
               {
                  this._s1 = 0;
               }
               else
               {
                  i++;
               }
               this._s2 = curSeg[i];
               this._si = i;
            }
            t = (i + (v - this._s1) / (this._s2 - this._s1)) * this._prec;
         }
         inv = 1 - t;
         i = this._props.length;
         while(--i > -1)
         {
            p = this._props[i];
            b = this._beziers[p][curIndex];
            val = (t * t * b.da + 3 * inv * (t * b.ca + inv * b.ba)) * t + b.a;
            if(this._round[p])
            {
               val = val + (val > 0 ? 0.5 : -0.5) >> 0;
            }
            if(func[p])
            {
               target[p](val);
            }
            else
            {
               target[p] = val;
            }
         }
         if(this._autoRotate != null)
         {
            ar = this._autoRotate;
            i = ar.length;
            while(--i > -1)
            {
               p = ar[i][2];
               add = Number(ar[i][3]) || Number(0);
               conv = ar[i][4] == true ? Number(1) : Number(_RAD2DEG);
               b = this._beziers[ar[i][0]][curIndex];
               b2 = this._beziers[ar[i][1]][curIndex];
               x1 = b.a + (b.b - b.a) * t;
               x2 = b.b + (b.c - b.b) * t;
               x1 += (x2 - x1) * t;
               x2 += (b.c + (b.d - b.c) * t - x2) * t;
               y1 = b2.a + (b2.b - b2.a) * t;
               y2 = b2.b + (b2.c - b2.b) * t;
               y1 += (y2 - y1) * t;
               y2 += (b2.c + (b2.d - b2.c) * t - y2) * t;
               val = Math.atan2(y2 - y1,x2 - x1) * conv + add;
               if(func[p])
               {
                  target[p](val);
               }
               else
               {
                  target[p] = val;
               }
            }
         }
      }
   }
}

class Segment
{
    
   
   public var a:Number;
   
   public var b:Number;
   
   public var c:Number;
   
   public var d:Number;
   
   public var da:Number;
   
   public var ca:Number;
   
   public var ba:Number;
   
   function Segment(a:Number, b:Number, c:Number, d:Number)
   {
      super();
      this.a = a;
      this.b = b;
      this.c = c;
      this.d = d;
      this.da = d - a;
      this.ca = c - a;
      this.ba = b - a;
   }
}
