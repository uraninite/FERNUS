package org.gestouch.core
{
   import flash.display.Stage;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   use namespace gestouch_internal;
   
   public class TouchesManager
   {
       
      
      protected var _gesturesManager:GesturesManager;
      
      protected var _touchesMap:Object;
      
      protected var _hitTesters:Vector.<ITouchHitTester>;
      
      protected var _hitTesterPrioritiesMap:Dictionary;
      
      protected var _activeTouchesCount:uint;
      
      public function TouchesManager(gesturesManager:GesturesManager)
      {
         this._touchesMap = {};
         this._hitTesters = new Vector.<ITouchHitTester>();
         this._hitTesterPrioritiesMap = new Dictionary(true);
         super();
         this._gesturesManager = gesturesManager;
      }
      
      public function get activeTouchesCount() : uint
      {
         return this._activeTouchesCount;
      }
      
      public function getTouches(target:Object = null) : Array
      {
         var i:uint = 0;
         var touch:Touch = null;
         var touches:Array = [];
         if(!target || target is Stage)
         {
            i = 0;
            for each(touch in this._touchesMap)
            {
               var _loc7_:*;
               touches[_loc7_ = i++] = touch;
            }
         }
         return touches;
      }
      
      gestouch_internal function addTouchHitTester(touchHitTester:ITouchHitTester, priority:int = 0) : void
      {
         if(!touchHitTester)
         {
            throw new ArgumentError("Argument must be non null.");
         }
         if(this._hitTesters.indexOf(touchHitTester) == -1)
         {
            this._hitTesters.push(touchHitTester);
         }
         this._hitTesterPrioritiesMap[touchHitTester] = priority;
         this._hitTesters.sort(this.hitTestersSorter);
      }
      
      gestouch_internal function removeInputAdapter(touchHitTester:ITouchHitTester) : void
      {
         if(!touchHitTester)
         {
            throw new ArgumentError("Argument must be non null.");
         }
         var index:int = this._hitTesters.indexOf(touchHitTester);
         if(index == -1)
         {
            throw new Error("This touchHitTester is not registered.");
         }
         this._hitTesters.splice(index,1);
         delete this._hitTesterPrioritiesMap[touchHitTester];
      }
      
      gestouch_internal function onTouchBegin(touchID:uint, x:Number, y:Number, possibleTarget:Object = null) : Boolean
      {
         var registeredTouch:Touch = null;
         var touch:Touch = null;
         var target:Object = null;
         var altTarget:Object = null;
         var hitTester:ITouchHitTester = null;
         if(touchID in this._touchesMap)
         {
            return false;
         }
         var location:Point = new Point(x,y);
         for each(registeredTouch in this._touchesMap)
         {
            if(Point.distance(registeredTouch.location,location) < 2)
            {
               return false;
            }
         }
         touch = this.createTouch();
         touch.id = touchID;
         for each(hitTester in this._hitTesters)
         {
            target = hitTester.hitTest(location,possibleTarget);
            if(target)
            {
               if(!(target is Stage))
               {
                  break;
               }
               altTarget = target;
            }
         }
         if(!target && !altTarget)
         {
            throw new Error("Not touch target found (hit test)." + "Something is wrong, at least flash.display::Stage should be found." + "See Gestouch#addTouchHitTester() and Gestouch#inputAdapter.");
         }
         touch.target = target || altTarget;
         touch.setLocation(x,y,getTimer());
         this._touchesMap[touchID] = touch;
         ++this._activeTouchesCount;
         this._gesturesManager.onTouchBegin(touch);
         return true;
      }
      
      gestouch_internal function onTouchMove(touchID:uint, x:Number, y:Number) : void
      {
         var touch:Touch = this._touchesMap[touchID] as Touch;
         if(!touch)
         {
            return;
         }
         if(touch.updateLocation(x,y,getTimer()))
         {
            this._gesturesManager.onTouchMove(touch);
         }
      }
      
      gestouch_internal function onTouchEnd(touchID:uint, x:Number, y:Number) : void
      {
         var touch:Touch = this._touchesMap[touchID] as Touch;
         if(!touch)
         {
            return;
         }
         touch.updateLocation(x,y,getTimer());
         delete this._touchesMap[touchID];
         --this._activeTouchesCount;
         this._gesturesManager.onTouchEnd(touch);
         touch.target = null;
      }
      
      gestouch_internal function onTouchCancel(touchID:uint, x:Number, y:Number) : void
      {
         var touch:Touch = this._touchesMap[touchID] as Touch;
         if(!touch)
         {
            return;
         }
         touch.updateLocation(x,y,getTimer());
         delete this._touchesMap[touchID];
         --this._activeTouchesCount;
         this._gesturesManager.onTouchCancel(touch);
         touch.target = null;
      }
      
      protected function createTouch() : Touch
      {
         return new Touch();
      }
      
      protected function hitTestersSorter(x:ITouchHitTester, y:ITouchHitTester) : Number
      {
         var d:int = int(this._hitTesterPrioritiesMap[x]) - int(this._hitTesterPrioritiesMap[y]);
         if(d > 0)
         {
            return -1;
         }
         if(d < 0)
         {
            return 1;
         }
         return this._hitTesters.indexOf(x) > this._hitTesters.indexOf(y) ? Number(1) : Number(-1);
      }
   }
}
