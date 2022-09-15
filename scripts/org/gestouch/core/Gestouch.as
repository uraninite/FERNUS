package org.gestouch.core
{
   import flash.display.DisplayObject;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   import org.gestouch.extensions.native.NativeDisplayListAdapter;
   
   public final class Gestouch
   {
      
      private static const _displayListAdaptersMap:Dictionary = new Dictionary();
      
      private static var _inputAdapter:IInputAdapter;
      
      private static var _touchesManager:TouchesManager;
      
      private static var _gesturesManager:GesturesManager;
       
      
      public function Gestouch()
      {
         super();
      }
      
      public static function get inputAdapter() : IInputAdapter
      {
         return _inputAdapter;
      }
      
      public static function set inputAdapter(value:IInputAdapter) : void
      {
         if(_inputAdapter == value)
         {
            return;
         }
         _inputAdapter = value;
         if(inputAdapter)
         {
            inputAdapter.touchesManager = touchesManager;
            inputAdapter.init();
         }
      }
      
      public static function get touchesManager() : TouchesManager
      {
         return _touchesManager = _touchesManager || new TouchesManager(gesturesManager);
      }
      
      public static function get gesturesManager() : GesturesManager
      {
         return _gesturesManager = _gesturesManager || new GesturesManager();
      }
      
      public static function addDisplayListAdapter(targetClass:Class, adapter:IDisplayListAdapter) : void
      {
         if(!targetClass || !adapter)
         {
            throw new Error("Argument error: both arguments required.");
         }
         _displayListAdaptersMap[targetClass] = adapter;
      }
      
      public static function addTouchHitTester(hitTester:ITouchHitTester, priority:int = 0) : void
      {
         touchesManager.gestouch_internal::addTouchHitTester(hitTester,priority);
      }
      
      public static function removeTouchHitTester(hitTester:ITouchHitTester) : void
      {
         touchesManager.gestouch_internal::removeInputAdapter(hitTester);
      }
      
      gestouch_internal static function createGestureTargetAdapter(target:Object) : IDisplayListAdapter
      {
         var adapter:IDisplayListAdapter = Gestouch.gestouch_internal::getDisplayListAdapter(target);
         if(!adapter && target is DisplayObject)
         {
            adapter = new NativeDisplayListAdapter();
            Gestouch.addDisplayListAdapter(DisplayObject,adapter);
         }
         if(adapter)
         {
            return new adapter.reflect()(target);
         }
         throw new Error("Cannot create adapter for target " + target + " of type " + getQualifiedClassName(target) + ".");
      }
      
      gestouch_internal static function getDisplayListAdapter(object:Object) : IDisplayListAdapter
      {
         var key:* = null;
         var targetClass:Class = null;
         for(key in _displayListAdaptersMap)
         {
            targetClass = key as Class;
            if(object is targetClass)
            {
               return _displayListAdaptersMap[key] as IDisplayListAdapter;
            }
         }
         return null;
      }
   }
}
