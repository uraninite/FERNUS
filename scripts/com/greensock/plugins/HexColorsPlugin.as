package com.greensock.plugins
{
   import com.greensock.TweenLite;
   
   public class HexColorsPlugin extends TweenPlugin
   {
      
      public static const API:Number = 2;
       
      
      protected var _colors:Array;
      
      public function HexColorsPlugin()
      {
         super("hexColors");
         _overwriteProps = [];
         this._colors = [];
      }
      
      override public function _onInitTween(target:Object, value:*, tween:TweenLite) : Boolean
      {
         var p:* = null;
         for(p in value)
         {
            this._initColor(target,p,uint(value[p]));
         }
         return true;
      }
      
      public function _initColor(target:Object, p:String, end:uint) : void
      {
         var r:uint = 0;
         var g:uint = 0;
         var b:uint = 0;
         var isFunc:* = typeof target[p] == "function";
         var start:uint = !isFunc ? uint(target[p]) : uint(target[p.indexOf("set") || !("get" + p.substr(3) in target) ? p : "get" + p.substr(3)]());
         if(start != end)
         {
            r = start >> 16;
            g = start >> 8 & 255;
            b = start & 255;
            this._colors[this._colors.length] = new ColorProp(target,p,isFunc,r,(end >> 16) - r,g,(end >> 8 & 255) - g,b,(end & 255) - b);
            _overwriteProps[_overwriteProps.length] = p;
         }
      }
      
      override public function _kill(lookup:Object) : Boolean
      {
         var i:int = this._colors.length;
         while(i--)
         {
            if(lookup[this._colors[i].p] != null)
            {
               this._colors.splice(i,1);
            }
         }
         return super._kill(lookup);
      }
      
      override public function setRatio(v:Number) : void
      {
         var clr:ColorProp = null;
         var val:Number = NaN;
         var i:int = this._colors.length;
         while(--i > -1)
         {
            clr = this._colors[i];
            val = clr.rs + v * clr.rc << 16 | clr.gs + v * clr.gc << 8 | clr.bs + v * clr.bc;
            if(clr.f)
            {
               clr.t[clr.p](val);
            }
            else
            {
               clr.t[clr.p] = val;
            }
         }
      }
   }
}

class ColorProp
{
    
   
   public var t:Object;
   
   public var p:String;
   
   public var f:Boolean;
   
   public var rs:int;
   
   public var rc:int;
   
   public var gs:int;
   
   public var gc:int;
   
   public var bs:int;
   
   public var bc:int;
   
   function ColorProp(t:Object, p:String, f:Boolean, rs:int, rc:int, gs:int, gc:int, bs:int, bc:int)
   {
      super();
      this.t = t;
      this.p = p;
      this.f = f;
      this.rs = rs;
      this.rc = rc;
      this.gs = gs;
      this.gc = gc;
      this.bs = bs;
      this.bc = bc;
   }
}
