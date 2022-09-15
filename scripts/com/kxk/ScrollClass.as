package com.kxk
{
   import flash.display.MovieClip;
   
   public class ScrollClass
   {
      
      public static var list:Array = new Array();
      
      private static var _mc:MovieClip;
      
      private static var qwe:int = 0;
       
      
      public function ScrollClass()
      {
         super();
      }
      
      public static function init(_m:MovieClip) : void
      {
         _mc = _m;
      }
      
      public static function update(_m1:MovieClip) : void
      {
         var _key:* = _m1.name;
         if(list[_key])
         {
            if(_m1.y <= list[_key].maske.y && list[_key].maske.y + list[_key].maske.height <= _m1.y + _m1.height)
            {
               list[_key].scroll.updateSliderPosition();
            }
         }
      }
      
      public static function enable(_m1:MovieClip) : void
      {
         var _key:* = _m1.name;
         if(list[_key])
         {
            list[_key].scroll.enable();
            list[_key].scroll.updateSliderPosition();
         }
      }
      
      public static function disable(_m1:MovieClip) : void
      {
         var _key:* = _m1.name;
         if(list[_key])
         {
            list[_key].scroll.disable();
         }
      }
      
      public static function remove(_m1:MovieClip) : void
      {
         var _key:* = _m1.name;
         if(list[_key])
         {
            list[_key].scroll.destroy();
            list[_key] = null;
            delete list[_key];
         }
      }
      
      public static function add(_m1:MovieClip, _m2:MovieClip, _bar:MovieClip = null, _thumb:MovieClip = null) : void
      {
         var _key:* = _m1.name;
         if(!list[_key])
         {
            list[_key] = new Object();
            list[_key].maske = _m2;
            list[_key].scroll = new Scrollbar();
            if(_bar == null)
            {
               list[_key].scroll.init("y",_m1.getBounds(MovieClip(_m1.parent)),_m2.getBounds(MovieClip(_m1.parent)),_m1,MovieClip(_m1.parent).bar,MovieClip(_m1.parent).thumb);
            }
            else
            {
               list[_key].scroll.init("y",_m1.getBounds(MovieClip(_m1.parent)),_m2.getBounds(MovieClip(_m1.parent)),_m1,_bar,_thumb);
            }
            list[_key].scroll.disable();
            return;
         }
      }
   }
}
