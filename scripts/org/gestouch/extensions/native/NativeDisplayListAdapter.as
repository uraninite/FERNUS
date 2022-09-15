package org.gestouch.extensions.native
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.utils.Dictionary;
   import org.gestouch.core.IDisplayListAdapter;
   
   public final class NativeDisplayListAdapter implements IDisplayListAdapter
   {
       
      
      private var _targetWeekStorage:Dictionary;
      
      public function NativeDisplayListAdapter(target:DisplayObject = null)
      {
         super();
         if(target)
         {
            this._targetWeekStorage = new Dictionary(true);
            this._targetWeekStorage[target] = true;
         }
      }
      
      public function get target() : Object
      {
         var key:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = this._targetWeekStorage;
         for(key in _loc3_)
         {
            return key;
         }
         return null;
      }
      
      public function contains(object:Object) : Boolean
      {
         var targetAsDOC:DisplayObjectContainer = this.target as DisplayObjectContainer;
         if(targetAsDOC is Stage)
         {
            return true;
         }
         var objectAsDO:DisplayObject = object as DisplayObject;
         if(objectAsDO)
         {
            return targetAsDOC && targetAsDOC.contains(objectAsDO);
         }
         return false;
      }
      
      public function getHierarchy(genericTarget:Object) : Vector.<Object>
      {
         var list:Vector.<Object> = new Vector.<Object>();
         var i:uint = 0;
         var target:DisplayObject = genericTarget as DisplayObject;
         while(target)
         {
            list[i] = target;
            target = target.parent;
            i++;
         }
         return list;
      }
      
      public function reflect() : Class
      {
         return NativeDisplayListAdapter;
      }
   }
}
