package vectorrecord
{
   import flash.display.Sprite;
   
   public class ActObject
   {
      
      public static var TYPE_LINE:String = "line";
      
      public static var TYPE_CIRCLE:String = "circle";
      
      public static var TYPE_SQUARE:String = "rectangle";
      
      public static var TYPE_TRIANGLE:String = "triangle";
      
      public static var TYPE_ARROW:String = "arrow";
      
      public static var TYPE_ERASER:String = "eraser";
      
      public static var TYPE_ADD:String = "add";
      
      public static var TYPE_DELETE:String = "delete";
       
      
      public var startTime:Number;
      
      public var duration:Number;
      
      public var id:Number;
      
      public var size:Number;
      
      public var shapeID:Number;
      
      public var type:String;
      
      public var color:String;
      
      public var highlight:Boolean;
      
      public var points:Array;
      
      public var sprite:Sprite;
      
      public function ActObject()
      {
         this.points = new Array();
         super();
      }
   }
}
