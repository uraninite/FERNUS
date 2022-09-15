package org.gestouch.extensions.native
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.InteractiveObject;
   import flash.display.Stage;
   import flash.geom.Point;
   
   public class DisplayObjectUtils
   {
       
      
      public function DisplayObjectUtils()
      {
         super();
      }
      
      public static function getTopTarget(stage:Stage, point:Point, mouseChildren:Boolean = true, startFrom:uint = 0) : InteractiveObject
      {
         var i:int = 0;
         var target:DisplayObject = null;
         var lastMouseActive:InteractiveObject = null;
         var parent:DisplayObjectContainer = null;
         var targets:Array = stage.getObjectsUnderPoint(point);
         if(!targets.length)
         {
            return stage;
         }
         var startIndex:int = targets.length - 1 - startFrom;
         if(startIndex < 0)
         {
            return stage;
         }
         for(i = startIndex; i >= 0; i--)
         {
            target = targets[i] as DisplayObject;
            while(target != stage)
            {
               if(target is InteractiveObject)
               {
                  if((target as InteractiveObject).mouseEnabled)
                  {
                     if(mouseChildren)
                     {
                        lastMouseActive = target as InteractiveObject;
                        parent = target.parent;
                        while(parent)
                        {
                           if(!lastMouseActive && parent.mouseEnabled)
                           {
                              lastMouseActive = parent;
                           }
                           else if(!parent.mouseChildren)
                           {
                              if(parent.mouseEnabled)
                              {
                                 lastMouseActive = parent;
                              }
                              else
                              {
                                 lastMouseActive = null;
                              }
                           }
                           parent = parent.parent;
                        }
                        if(lastMouseActive)
                        {
                           return lastMouseActive;
                        }
                        return stage;
                     }
                     return target as InteractiveObject;
                  }
                  break;
               }
               target = target.parent;
            }
         }
         return stage;
      }
   }
}
