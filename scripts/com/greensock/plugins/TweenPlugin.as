package com.greensock.plugins
{
   import com.greensock.TweenLite;
   import com.greensock.core.PropTween;
   
   public class TweenPlugin
   {
      
      public static const version:String = "12.0.13";
      
      public static const API:Number = 2;
       
      
      public var _propName:String;
      
      public var _overwriteProps:Array;
      
      public var _priority:int = 0;
      
      protected var _firstPT:PropTween;
      
      public function TweenPlugin(props:String = "", priority:int = 0)
      {
         super();
         this._overwriteProps = props.split(",");
         this._propName = this._overwriteProps[0];
         this._priority = int(priority) || 0;
      }
      
      private static function _onTweenEvent(type:String, tween:TweenLite) : Boolean
      {
         var changed:Boolean = false;
         var pt2:PropTween = null;
         var first:PropTween = null;
         var last:PropTween = null;
         var next:PropTween = null;
         var pt:PropTween = tween._firstPT;
         if(type == "_onInitAllProps")
         {
            while(pt)
            {
               next = pt._next;
               pt2 = first;
               while(pt2 && pt2.pr > pt.pr)
               {
                  pt2 = pt2._next;
               }
               if(pt._prev = !!pt2 ? pt2._prev : last)
               {
                  pt._prev._next = pt;
               }
               else
               {
                  first = pt;
               }
               if(pt._next = pt2)
               {
                  pt2._prev = pt;
               }
               else
               {
                  last = pt;
               }
               pt = next;
            }
            pt = tween._firstPT = first;
         }
         while(pt)
         {
            if(pt.pg)
            {
               if(type in pt.t)
               {
                  if(pt.t[type]())
                  {
                     changed = true;
                  }
               }
            }
            pt = pt._next;
         }
         return changed;
      }
      
      public static function activate(plugins:Array) : Boolean
      {
         TweenLite._onPluginEvent = TweenPlugin._onTweenEvent;
         var i:int = plugins.length;
         while(--i > -1)
         {
            if(plugins[i].API == TweenPlugin.API)
            {
               TweenLite._plugins[new (plugins[i] as Class)()._propName] = plugins[i];
            }
         }
         return true;
      }
      
      public function _onInitTween(target:Object, value:*, tween:TweenLite) : Boolean
      {
         return false;
      }
      
      protected function _addTween(target:Object, propName:String, start:Number, end:*, overwriteProp:String = null, round:Boolean = false) : PropTween
      {
         var c:Number = NaN;
         if(end != null && (c = typeof end === "number" || end.charAt(1) !== "=" ? Number(Number(end) - start) : Number(int(end.charAt(0) + "1") * Number(end.substr(2)))))
         {
            this._firstPT = new PropTween(target,propName,start,c,overwriteProp || propName,false,this._firstPT);
            this._firstPT.r = round;
            return this._firstPT;
         }
         return null;
      }
      
      public function setRatio(v:Number) : void
      {
         var val:Number = NaN;
         var pt:PropTween = this._firstPT;
         while(pt)
         {
            val = pt.c * v + pt.s;
            if(pt.r)
            {
               val = val + (val > 0 ? 0.5 : -0.5) | 0;
            }
            if(pt.f)
            {
               pt.t[pt.p](val);
            }
            else
            {
               pt.t[pt.p] = val;
            }
            pt = pt._next;
         }
      }
      
      public function _roundProps(lookup:Object, value:Boolean = true) : void
      {
         var pt:PropTween = this._firstPT;
         while(pt)
         {
            if(this._propName in lookup || pt.n != null && pt.n.split(this._propName + "_").join("") in lookup)
            {
               pt.r = value;
            }
            pt = pt._next;
         }
      }
      
      public function _kill(lookup:Object) : Boolean
      {
         var i:int = 0;
         if(this._propName in lookup)
         {
            this._overwriteProps = [];
         }
         else
         {
            i = this._overwriteProps.length;
            while(--i > -1)
            {
               if(this._overwriteProps[i] in lookup)
               {
                  this._overwriteProps.splice(i,1);
               }
            }
         }
         var pt:PropTween = this._firstPT;
         while(pt)
         {
            if(pt.n in lookup)
            {
               if(pt._next)
               {
                  pt._next._prev = pt._prev;
               }
               if(pt._prev)
               {
                  pt._prev._next = pt._next;
                  pt._prev = null;
               }
               else if(this._firstPT == pt)
               {
                  this._firstPT = pt._next;
               }
            }
            pt = pt._next;
         }
         return false;
      }
   }
}
