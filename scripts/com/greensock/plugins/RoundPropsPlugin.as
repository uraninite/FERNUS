package com.greensock.plugins
{
   import com.greensock.TweenLite;
   import com.greensock.core.PropTween;
   
   public class RoundPropsPlugin extends TweenPlugin
   {
      
      public static const API:Number = 2;
       
      
      protected var _tween:TweenLite;
      
      public function RoundPropsPlugin()
      {
         super("roundProps",-1);
         _overwriteProps.length = 0;
      }
      
      override public function _onInitTween(target:Object, value:*, tween:TweenLite) : Boolean
      {
         this._tween = tween;
         return true;
      }
      
      public function _onInitAllProps() : Boolean
      {
         var prop:String = null;
         var pt:PropTween = null;
         var next:PropTween = null;
         var rp:Array = this._tween.vars.roundProps is Array ? this._tween.vars.roundProps : this._tween.vars.roundProps.split(",");
         var i:int = rp.length;
         var lookup:Object = {};
         var rpt:PropTween = this._tween._propLookup.roundProps;
         while(--i > -1)
         {
            lookup[rp[i]] = 1;
         }
         i = rp.length;
         while(--i > -1)
         {
            prop = rp[i];
            pt = this._tween._firstPT;
            while(pt)
            {
               next = pt._next;
               if(pt.pg)
               {
                  pt.t._roundProps(lookup,true);
               }
               else if(pt.n == prop)
               {
                  this._add(pt.t,prop,pt.s,pt.c);
                  if(next)
                  {
                     next._prev = pt._prev;
                  }
                  if(pt._prev)
                  {
                     pt._prev._next = next;
                  }
                  else if(this._tween._firstPT == pt)
                  {
                     this._tween._firstPT = next;
                  }
                  pt._next = pt._prev = null;
                  this._tween._propLookup[prop] = rpt;
               }
               pt = next;
            }
         }
         return false;
      }
      
      public function _add(target:Object, p:String, s:Number, c:Number) : void
      {
         _addTween(target,p,s,s + c,p,true);
         _overwriteProps[_overwriteProps.length] = p;
      }
   }
}
