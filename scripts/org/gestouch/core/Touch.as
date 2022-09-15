package org.gestouch.core
{
   import flash.geom.Point;
   
   public class Touch
   {
       
      
      public var id:uint;
      
      public var target:Object;
      
      public var sizeX:Number;
      
      public var sizeY:Number;
      
      public var pressure:Number;
      
      protected var _location:Point;
      
      protected var _previousLocation:Point;
      
      protected var _beginLocation:Point;
      
      protected var _time:uint;
      
      protected var _beginTime:uint;
      
      public function Touch(id:uint = 0)
      {
         super();
         this.id = id;
      }
      
      public function get location() : Point
      {
         return this._location.clone();
      }
      
      gestouch_internal function setLocation(x:Number, y:Number, time:uint) : void
      {
         this._location = new Point(x,y);
         this._beginLocation = this._location.clone();
         this._previousLocation = this._location.clone();
         this._time = time;
         this._beginTime = time;
      }
      
      gestouch_internal function updateLocation(x:Number, y:Number, time:uint) : Boolean
      {
         if(this._location)
         {
            if(this._location.x == x && this._location.y == y)
            {
               return false;
            }
            this._previousLocation.x = this._location.x;
            this._previousLocation.y = this._location.y;
            this._location.x = x;
            this._location.y = y;
            this._time = time;
         }
         else
         {
            this.setLocation(x,y,time);
         }
         return true;
      }
      
      public function get previousLocation() : Point
      {
         return this._previousLocation.clone();
      }
      
      public function get beginLocation() : Point
      {
         return this._beginLocation.clone();
      }
      
      public function get locationOffset() : Point
      {
         return this._location.subtract(this._beginLocation);
      }
      
      public function get time() : uint
      {
         return this._time;
      }
      
      gestouch_internal function setTime(value:uint) : void
      {
         this._time = value;
      }
      
      public function get beginTime() : uint
      {
         return this._beginTime;
      }
      
      gestouch_internal function setBeginTime(value:uint) : void
      {
         this._beginTime = value;
      }
      
      public function clone() : Touch
      {
         var touch:Touch = new Touch(this.id);
         touch._location = this._location.clone();
         touch._beginLocation = this._beginLocation.clone();
         touch.target = this.target;
         touch.sizeX = this.sizeX;
         touch.sizeY = this.sizeY;
         touch.pressure = this.pressure;
         touch._time = this._time;
         touch._beginTime = this._beginTime;
         return touch;
      }
      
      public function toString() : String
      {
         return "Touch [id: " + this.id + ", location: " + this.location + ", ...]";
      }
   }
}
