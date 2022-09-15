package vectorrecord
{
   import flash.events.Event;
   
   public class KryEvent extends Event
   {
      
      public static const SHOW_LOADING:String = "SHOW_LOADING";
      
      public static const COMPLETE:String = "COMPLETE";
      
      public static const PROGRESS:String = "PROGRESS";
      
      public static const START:String = "START";
      
      public static const TIME:String = "TIME";
      
      public static const VV_DELETED:String = "VV_DELETED";
      
      public static const VV_CHANGED:String = "VV_CHANGED";
      
      public static const VV_ADDED:String = "VV_ADDED";
       
      
      public var data:Object;
      
      public function KryEvent(type:String, data:Object = null, bubbles:Boolean = false, cancelable:Boolean = false)
      {
         super(type,bubbles,cancelable);
         this.data = data;
      }
      
      override public function clone() : Event
      {
         return new KryEvent(type,this.data,bubbles,cancelable);
      }
   }
}
