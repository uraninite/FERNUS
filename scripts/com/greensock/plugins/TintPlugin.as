package com.greensock.plugins
{
   import com.greensock.TweenLite;
   import com.greensock.core.PropTween;
   import flash.display.DisplayObject;
   import flash.geom.ColorTransform;
   import flash.geom.Transform;
   
   public class TintPlugin extends TweenPlugin
   {
      
      public static const API:Number = 2;
      
      protected static var _props:Array = ["redMultiplier","greenMultiplier","blueMultiplier","alphaMultiplier","redOffset","greenOffset","blueOffset","alphaOffset"];
       
      
      protected var _transform:Transform;
      
      public function TintPlugin()
      {
         super("tint,colorTransform,removeTint");
      }
      
      override public function _onInitTween(target:Object, value:*, tween:TweenLite) : Boolean
      {
         if(!(target is DisplayObject))
         {
            return false;
         }
         var end:ColorTransform = new ColorTransform();
         if(value != null && tween.vars.removeTint != true)
         {
            end.color = uint(value);
         }
         this._transform = DisplayObject(target).transform;
         var ct:ColorTransform = this._transform.colorTransform;
         end.alphaMultiplier = ct.alphaMultiplier;
         end.alphaOffset = ct.alphaOffset;
         this._init(ct,end);
         return true;
      }
      
      public function _init(start:ColorTransform, end:ColorTransform) : void
      {
         var p:String = null;
         var i:int = _props.length;
         while(--i > -1)
         {
            p = _props[i];
            if(start[p] != end[p])
            {
               _addTween(start,p,start[p],end[p],"tint");
            }
         }
      }
      
      override public function setRatio(v:Number) : void
      {
         var ct:ColorTransform = this._transform.colorTransform;
         var pt:PropTween = _firstPT;
         while(pt)
         {
            ct[pt.p] = pt.c * v + pt.s;
            pt = pt._next;
         }
         this._transform.colorTransform = ct;
      }
   }
}
