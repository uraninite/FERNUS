package com.greensock.plugins
{
   import com.greensock.TweenLite;
   import flash.filters.BitmapFilter;
   import flash.filters.BlurFilter;
   
   public class FilterPlugin extends TweenPlugin
   {
      
      public static const API:Number = 2;
       
      
      protected var _target:Object;
      
      protected var _type:Class;
      
      protected var _filter:BitmapFilter;
      
      protected var _index:int;
      
      protected var _remove:Boolean;
      
      private var _tween:TweenLite;
      
      public function FilterPlugin(props:String = "", priority:Number = 0)
      {
         super(props,priority);
      }
      
      protected function _initFilter(target:*, props:Object, tween:TweenLite, type:Class, defaultFilter:BitmapFilter, propNames:Array) : Boolean
      {
         var p:String = null;
         var i:int = 0;
         var colorTween:HexColorsPlugin = null;
         this._target = target;
         this._tween = tween;
         this._type = type;
         var filters:Array = this._target.filters;
         var extras:Object = props is BitmapFilter ? {} : props;
         if(extras.index != null)
         {
            this._index = extras.index;
         }
         else
         {
            this._index = filters.length;
            if(extras.addFilter != true)
            {
               while(--this._index > -1 && !(filters[this._index] is this._type))
               {
               }
            }
         }
         if(this._index < 0 || !(filters[this._index] is this._type))
         {
            if(this._index < 0)
            {
               this._index = filters.length;
            }
            if(this._index > filters.length)
            {
               i = filters.length - 1;
               while(++i < this._index)
               {
                  filters[i] = new BlurFilter(0,0,1);
               }
            }
            filters[this._index] = defaultFilter;
            this._target.filters = filters;
         }
         this._filter = filters[this._index];
         this._remove = extras.remove == true;
         i = propNames.length;
         while(--i > -1)
         {
            p = propNames[i];
            if(p in props && this._filter[p] != props[p])
            {
               if(p == "color" || p == "highlightColor" || p == "shadowColor")
               {
                  colorTween = new HexColorsPlugin();
                  colorTween._initColor(this._filter,p,props[p]);
                  _addTween(colorTween,"setRatio",0,1,_propName);
               }
               else if(p == "quality" || p == "inner" || p == "knockout" || p == "hideObject")
               {
                  this._filter[p] = props[p];
               }
               else
               {
                  _addTween(this._filter,p,this._filter[p],props[p],_propName);
               }
            }
         }
         return true;
      }
      
      override public function setRatio(v:Number) : void
      {
         super.setRatio(v);
         var filters:Array = this._target.filters;
         if(!(filters[this._index] is this._type))
         {
            this._index = filters.length;
            while(--this._index > -1 && !(filters[this._index] is this._type))
            {
            }
            if(this._index == -1)
            {
               this._index = filters.length;
            }
         }
         if(v == 1 && this._remove && this._tween._time == this._tween._duration && this._tween.data != "isFromStart")
         {
            if(this._index < filters.length)
            {
               filters.splice(this._index,1);
            }
         }
         else
         {
            filters[this._index] = this._filter;
         }
         this._target.filters = filters;
      }
   }
}
