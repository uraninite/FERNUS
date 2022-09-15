package vectorrecord
{
   import com.greensock.TimelineLite;
   import com.greensock.TweenMax;
   import com.greensock.easing.Linear;
   import com.motiondraw.LineGeneralization;
   import com.motiondraw.geometry.CatmullRomSpline;
   import flash.display.BlendMode;
   import flash.display.CapsStyle;
   import flash.display.DisplayObject;
   import flash.display.JointStyle;
   import flash.display.LineScaleMode;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class ViewSWF extends Sprite
   {
       
      
      private var _layerSWF:DisplayObject;
      
      private var _layerDrawing:Sprite;
      
      private var _layerGraphics:Sprite;
      
      private var _layerWhite:Sprite;
      
      private var _drawer:Sprite;
      
      private var _lineGeneral:LineGeneralization;
      
      private var _shape:Shape;
      
      private var _timeline:TimelineLite;
      
      private var _size:Point;
      
      private var _scale:Number;
      
      private var _padding:Point;
      
      private var _mobile:Boolean = false;
      
      private var _swfList:Array;
      
      private var _info:Array;
      
      public var _circleW:Number;
      
      public var _circleH:Number;
      
      public function ViewSWF(_swfList:Array, _info:Array, _mobile:Boolean = true)
      {
         super();
         this._swfList = _swfList;
         this._mobile = _mobile;
         this._info = _info;
         this._size = new Point(_info[0],_info[1]);
         this._scale = _info[2];
         if(_info[3] && _info[4])
         {
            this._padding = new Point(_info[3],_info[4]);
         }
         else
         {
            this._padding = new Point(0,0);
         }
         if(_info[5])
         {
            this._layerSWF = this._swfList[_info[5]].swf;
         }
         else
         {
            this._layerSWF = this._swfList[0].swf;
         }
         this.initialize();
      }
      
      private function initialize(e:Event = null) : void
      {
         this._lineGeneral = new LineGeneralization();
         this._layerGraphics = new Sprite();
         this._layerDrawing = new Sprite();
         this.drawBG(this);
         this.drawBG(this._layerGraphics,0);
         this.drawBG(this._layerDrawing,0);
         this._layerDrawing.blendMode = BlendMode.LAYER;
         this._drawer = new Sprite();
         this._layerSWF.x = this._padding.x;
         this._layerSWF.y = this._padding.y;
         this._layerSWF.scaleX = this._scale;
         this._layerSWF.scaleY = this._scale;
         this._layerDrawing.addChild(this._drawer);
         this.addChild(this._layerSWF);
         this.addChild(this._layerGraphics);
         this.addChild(this._layerDrawing);
      }
      
      private function drawBG(_sprite:Sprite, _alpha:Number = 1) : void
      {
         _sprite.graphics.beginFill(16777215,_alpha);
         _sprite.graphics.drawRect(0,0,this._size.x,this._size.y);
         _sprite.graphics.endFill();
      }
      
      public function newProcess(_object:Object, _status:Boolean = false, _addObject:Object = null) : void
      {
         if(this._timeline)
         {
            this._timeline.clear();
            this._timeline = null;
         }
         switch(_object.type)
         {
            case "line":
               if(_object.dashed == "true")
               {
                  this.addLineDashed(_object,_status);
               }
               else
               {
                  this.addLine(_object,_status);
               }
               break;
            case "eraser":
               this.addEraser(_object,_status);
               break;
            case "arrow":
               this.addArrow(_object,_status);
               break;
            case "triangle":
               this.addTriangle(_object,_status);
               break;
            case "rectangle":
               this.addRectangle(_object,_status);
               break;
            case "circle":
               this.addCircle(_object,_status);
               break;
            case "delete":
               this.removeShape(_object);
               break;
            case "add":
               this.newProcess(_addObject,_status);
               break;
            case "scale":
               this.changeScale(_object);
               break;
            case "swf":
               this.changeSWF(_object);
         }
      }
      
      private function changeScale(_object:Object) : void
      {
         var _s:Number = Number(String(_object.objectID).substr(2,String(_object.objectID).length));
         this._layerSWF.scaleX = _s;
         this._layerSWF.scaleY = _s;
      }
      
      private function changeSWF(_object:Object) : void
      {
         var _str:String = String(_object.objectID).substr(2,String(_object.objectID).length);
         var _i:int = int(_str.split("-")[0]);
         var _s:Number = Number(_str.split("-")[1]);
         if(this.contains(this._layerSWF))
         {
            this.removeChild(this._layerSWF);
         }
         this._layerSWF.scaleX = 1;
         this._layerSWF.scaleY = 1;
         this._layerSWF = null;
         this._layerSWF = this._swfList[_i].swf;
         this._layerSWF.x = this._padding.x;
         this._layerSWF.y = this._padding.y;
         this._layerSWF.scaleX = _s;
         this._layerSWF.scaleY = _s;
         this.addChild(this._layerSWF);
         this.addChild(this._layerGraphics);
         this.addChild(this._layerDrawing);
      }
      
      public function pauseTween() : void
      {
         if(this._timeline)
         {
            this._timeline.pause();
         }
      }
      
      public function playTween() : void
      {
         if(this._timeline)
         {
            this._timeline.play();
         }
      }
      
      public function clearAllShapes() : void
      {
         if(this._timeline)
         {
            this._timeline.clear();
            this._timeline = null;
         }
         this.removeItems(this._layerGraphics);
         this.removeItems(this._layerDrawing);
         this._shape = null;
         if(this.contains(this._layerSWF))
         {
            this.removeChild(this._layerSWF);
         }
         this._layerSWF.scaleX = 1;
         this._layerSWF.scaleY = 1;
         this._layerSWF = null;
         if(this._info[5])
         {
            this._layerSWF = this._swfList[this._info[5]].swf;
         }
         else
         {
            this._layerSWF = this._swfList[0].swf;
         }
         this._layerSWF.scaleX = this._scale;
         this._layerSWF.scaleY = this._scale;
         this.addChild(this._layerSWF);
         this.addChild(this._layerGraphics);
         this.addChild(this._layerDrawing);
         this._shape = null;
      }
      
      public function removeItems(_do:Sprite) : void
      {
         while(_do.numChildren > 0)
         {
            _do.removeChildAt(0);
         }
      }
      
      private function directDraw(_points:Array) : void
      {
         var _key:* = null;
         for(_key in _points)
         {
            this._drawer.x = _points[_key].x;
            this._drawer.y = _points[_key].y;
            this.drawLine();
         }
      }
      
      private function drawLine() : void
      {
         this._shape.graphics.lineTo(this._drawer.x,this._drawer.y);
      }
      
      private function addLine(_object:Object, _status:Boolean) : void
      {
         var _i:* = undefined;
         this._drawer.x = _object.points[0].x;
         this._drawer.y = _object.points[0].y;
         this._shape = new Shape();
         this._shape.name = _object.id;
         this._shape.graphics.lineStyle(_object.size,_object.color,_object.highlight == "true" ? Number(0.5) : Number(1),false,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
         this._shape.graphics.moveTo(this._drawer.x,this._drawer.y);
         this._layerDrawing.addChild(this._shape);
         if(!_status && 1 < _object.points.length)
         {
            this._timeline = new TimelineLite();
            this._timeline.add(TweenMax.to(this._drawer,_object.duration,{
               "bezier":{
                  "curviness":0,
                  "timeResolution":0,
                  "autoRotate":false,
                  "values":this.simplify(_object.points)
               },
               "ease":Linear.easeNone,
               "onUpdate":this.drawLine,
               "onComplete":this.completeLine,
               "onCompleteParams":[_object.highlight,_object.points,_object.size,_object.color]
            }));
         }
         else
         {
            if(1 == _object.points.length)
            {
               _i = 1;
               _object.points.push(new Point(_object.points[0].x - _i,_object.points[0].y));
               _object.points.push(new Point(_object.points[0].x,_object.points[0].y - _i));
               _object.points.push(new Point(_object.points[0].x + _i,_object.points[0].y));
               _object.points.push(new Point(_object.points[0].x,_object.points[0].y + _i));
            }
            this.directDraw(this.simplify(_object.points));
         }
      }
      
      private function completeLine(_highlight:String, _points:Array, _size:Number, _color:uint) : void
      {
         _points = this.simplify(_points);
         this._shape.graphics.clear();
         this._shape.graphics.lineStyle(_size,_color,_highlight == "true" ? Number(0.5) : Number(1),false,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
         this._shape.graphics.moveTo(_points[0].x,_points[0].y);
         for(var _i:int = 1; _i < _points.length; _i++)
         {
            this._shape.graphics.lineTo(_points[_i].x,_points[_i].y);
         }
      }
      
      private function addLineDashed(_object:Object, _status:Boolean) : void
      {
         this._drawer.x = _object.points[0].x;
         this._drawer.y = _object.points[0].y;
         this._shape = new Shape();
         this._shape.name = _object.id;
         this._layerDrawing.addChild(this._shape);
         if(!_status && 1 < _object.points.length)
         {
            this._timeline = new TimelineLite();
            this._timeline.add(TweenMax.to(this._drawer,_object.duration,{
               "bezier":{
                  "curviness":0,
                  "timeResolution":0,
                  "autoRotate":false,
                  "values":this.simplify(_object.points)
               },
               "ease":Linear.easeNone,
               "onUpdate":this.drawLineDashed,
               "onComplete":this.drawLineDashed,
               "onCompleteParams":[_object],
               "onUpdateParams":[_object]
            }));
         }
         else
         {
            this._drawer.x = _object.points[1].x;
            this._drawer.y = _object.points[1].y;
            this.drawLineDashed(_object);
         }
      }
      
      private function drawLineDashed(_object:Object) : void
      {
         var startX:* = _object.points[0].x;
         var startY:* = _object.points[0].y;
         var endX:* = this._drawer.x;
         var endY:* = this._drawer.y;
         var strokeLength:* = _object.size * 1.5;
         var gap:* = _object.size * 2;
         this._shape.graphics.clear();
         this._shape.graphics.lineStyle(_object.size,_object.color,_object.highlight == "true" ? Number(0.5) : Number(1),false,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
         var segmentLength:Number = strokeLength + gap;
         var deltaX:Number = endX - startX;
         var deltaY:Number = endY - startY;
         var _delta:Number = Math.sqrt(deltaX * deltaX + deltaY * deltaY);
         var segmentsCount:Number = Math.floor(Math.abs(_delta / segmentLength));
         var radians:Number = Math.atan2(deltaY,deltaX);
         var aX:Number = startX;
         var aY:Number = startY;
         deltaX = Math.cos(radians) * segmentLength;
         deltaY = Math.sin(radians) * segmentLength;
         for(var i:int = 0; i < segmentsCount; i++)
         {
            this._shape.graphics.moveTo(aX,aY);
            this._shape.graphics.lineTo(aX + Math.cos(radians) * strokeLength,aY + Math.sin(radians) * strokeLength);
            aX += deltaX;
            aY += deltaY;
         }
         this._shape.graphics.moveTo(aX,aY);
         _delta = Math.sqrt((endX - aX) * (endX - aX) + (endY - aY) * (endY - aY));
         if(_delta > segmentLength)
         {
            this._shape.graphics.lineTo(aX + Math.cos(radians) * strokeLength,aY + Math.sin(radians) * strokeLength);
         }
         else if(_delta > 0)
         {
            this._shape.graphics.lineTo(aX + Math.cos(radians) * _delta,aY + Math.sin(radians) * _delta);
         }
         this._shape.graphics.lineTo(endX,endY);
      }
      
      private function addEraser(_object:Object, _status:Boolean) : void
      {
         this._drawer.x = _object.points[0].x;
         this._drawer.y = _object.points[0].y;
         this._shape = new Shape();
         this._shape.name = _object.id;
         this._shape.blendMode = BlendMode.ERASE;
         this._shape.graphics.lineStyle(_object.size,_object.color,1,false,LineScaleMode.NORMAL,CapsStyle.SQUARE,JointStyle.MITER);
         this._shape.graphics.moveTo(this._drawer.x,this._drawer.y);
         this._layerDrawing.addChild(this._shape);
         if(!_status)
         {
            this._timeline = new TimelineLite();
            this._timeline.add(TweenMax.to(this._drawer,_object.duration,{
               "bezier":{
                  "curviness":0,
                  "timeResolution":0,
                  "autoRotate":false,
                  "values":_object.points
               },
               "ease":Linear.easeNone,
               "onUpdate":this.drawLine
            }));
         }
         else
         {
            this.directDraw(_object.points);
         }
      }
      
      private function addArrow(_object:Object, _status:Boolean) : void
      {
         var _startPoint:Point = new Point(_object.points[0].x,_object.points[0].y);
         var _endPoint:Point = new Point(_object.points[1].x,_object.points[1].y);
         var _lineWidth:Number = _object.size;
         this._shape = new Shape();
         this._shape.name = _object.id;
         if(this._mobile)
         {
            this._layerDrawing.addChild(this._shape);
         }
         else
         {
            this._layerGraphics.addChild(this._shape);
         }
         this._drawer.x = _object.points[0].x;
         this._drawer.y = _object.points[0].y;
         if(!_status)
         {
            this._timeline = new TimelineLite();
            this._timeline.add(TweenMax.to(this._drawer,_object.duration,{
               "x":_object.points[1].x,
               "y":_object.points[1].y,
               "ease":Linear.easeNone,
               "onUpdate":this.drawArrow,
               "onUpdateParams":[_object.size,_object.color,_startPoint,_lineWidth]
            }));
         }
         else
         {
            this._drawer.x = _endPoint.x;
            this._drawer.y = _endPoint.y;
            this.drawArrow(_object.size,_object.color,_startPoint,_lineWidth);
         }
      }
      
      private function drawArrow(param1:Number, param2:uint, param3:Point, param4:Number) : void
      {
         var _loc5_:Number = 45;
         param1 = param4;
         var _loc6_:Number = this.polarAngle(new Point(this._drawer.x,this._drawer.y),new Point(param3.x,param3.y));
         this._shape.graphics.clear();
         this._shape.graphics.lineStyle(param1,param2,1,false,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
         this._shape.graphics.moveTo(param3.x,param3.y);
         this._shape.graphics.lineTo(this._drawer.x,this._drawer.y);
         param1 = param1 * 5 / 2;
         this._shape.graphics.moveTo(this._drawer.x + 0 * Math.cos(_loc6_ * Math.PI / 180),this._drawer.y + 0 * Math.sin(_loc6_ * Math.PI / 180));
         this._shape.graphics.lineTo(this._drawer.x - param1 * Math.cos((_loc6_ - _loc5_) * Math.PI / 180),this._drawer.y - param1 * Math.sin((_loc6_ - _loc5_) * Math.PI / 180));
         this._shape.graphics.moveTo(this._drawer.x + 0 * Math.cos(_loc6_ * Math.PI / 180),this._drawer.y + 0 * Math.sin(_loc6_ * Math.PI / 180));
         this._shape.graphics.lineTo(this._drawer.x - param1 * Math.cos((_loc6_ + _loc5_) * Math.PI / 180),this._drawer.y - param1 * Math.sin((_loc6_ + _loc5_) * Math.PI / 180));
      }
      
      private function addTriangle(_object:Object, _status:Boolean) : void
      {
         var _duration:Number = NaN;
         this._drawer.x = _object.points[0].x;
         this._drawer.y = _object.points[0].y;
         this._shape = new Shape();
         this._shape.name = _object.id;
         if(_object.fill == "true")
         {
            this._shape.graphics.beginFill(_object.color);
         }
         else
         {
            this._shape.graphics.lineStyle(_object.size,_object.color,1,false,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
         }
         this._shape.graphics.moveTo(this._drawer.x,this._drawer.y);
         if(this._mobile)
         {
            this._layerDrawing.addChild(this._shape);
         }
         else
         {
            this._layerGraphics.addChild(this._shape);
         }
         if(!_status)
         {
            _duration = _object.duration / 3;
            this._timeline = new TimelineLite();
            this._timeline.add(TweenMax.to(this._drawer,_duration,{
               "x":_object.points[1].x,
               "y":_object.points[1].y,
               "ease":Linear.easeNone,
               "onUpdate":this.drawLine
            }));
            this._timeline.add(TweenMax.to(this._drawer,_duration,{
               "x":_object.points[2].x,
               "y":_object.points[2].y,
               "ease":Linear.easeNone,
               "onUpdate":this.drawLine
            }));
            this._timeline.add(TweenMax.to(this._drawer,_duration,{
               "x":_object.points[3].x,
               "y":_object.points[3].y,
               "ease":Linear.easeNone,
               "onUpdate":this.drawLine
            }));
         }
         else
         {
            this.directDraw(_object.points);
         }
      }
      
      private function addRectangle(_object:Object, _status:Boolean) : void
      {
         var _duration:Number = NaN;
         this._drawer.x = _object.points[0].x;
         this._drawer.y = _object.points[0].y;
         this._shape = new Shape();
         this._shape.name = _object.id;
         if(_object.fill == "true")
         {
            this._shape.graphics.beginFill(_object.color);
         }
         else
         {
            this._shape.graphics.lineStyle(_object.size,_object.color,1,false,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
         }
         this._shape.graphics.moveTo(this._drawer.x,this._drawer.y);
         if(this._mobile)
         {
            this._layerDrawing.addChild(this._shape);
         }
         else
         {
            this._layerGraphics.addChild(this._shape);
         }
         if(!_status)
         {
            _duration = _object.duration / 4;
            this._timeline = new TimelineLite();
            this._timeline.add(TweenMax.to(this._drawer,_duration,{
               "x":_object.points[1].x,
               "y":_object.points[1].y,
               "ease":Linear.easeNone,
               "onUpdate":this.drawLine
            }));
            this._timeline.add(TweenMax.to(this._drawer,_duration,{
               "x":_object.points[2].x,
               "y":_object.points[2].y,
               "ease":Linear.easeNone,
               "onUpdate":this.drawLine
            }));
            this._timeline.add(TweenMax.to(this._drawer,_duration,{
               "x":_object.points[3].x,
               "y":_object.points[3].y,
               "ease":Linear.easeNone,
               "onUpdate":this.drawLine
            }));
            this._timeline.add(TweenMax.to(this._drawer,_duration,{
               "x":_object.points[4].x,
               "y":_object.points[4].y,
               "ease":Linear.easeNone,
               "onUpdate":this.drawLine
            }));
         }
         else
         {
            this.directDraw(_object.points);
         }
      }
      
      private function addCircle(_object:Object, _status:Boolean) : void
      {
         this._shape = new Shape();
         this._shape.name = _object.id;
         this._circleW = this._circleH = 0;
         if(this._mobile)
         {
            this._layerDrawing.addChild(this._shape);
         }
         else
         {
            this._layerGraphics.addChild(this._shape);
         }
         if(!_status)
         {
            this._timeline = new TimelineLite();
            this._timeline.add(TweenMax.to(this,_object.duration,{
               "_circleW":_object.rectangle.width,
               "_circleH":_object.rectangle.height,
               "ease":Linear.easeNone,
               "onUpdate":this.drawCircle,
               "onUpdateParams":[_object]
            }));
         }
         else
         {
            this._circleW = _object.rectangle.width;
            this._circleH = _object.rectangle.height;
            this.drawCircle(_object);
         }
      }
      
      private function drawCircle(_object:Object) : void
      {
         this._shape.graphics.clear();
         if(_object.fill == "true")
         {
            this._shape.graphics.beginFill(_object.color);
         }
         else
         {
            this._shape.graphics.lineStyle(_object.size,_object.color,1,false,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
         }
         this._shape.graphics.drawEllipse(_object.rectangle.x,_object.rectangle.y,this._circleW,this._circleH);
      }
      
      private function removeShape(_object:Object) : void
      {
         if(this._layerDrawing.getChildByName(_object.objectID))
         {
            this._layerDrawing.removeChild(this._layerDrawing.getChildByName(_object.objectID));
         }
         if(this._layerGraphics.getChildByName(_object.objectID))
         {
            this._layerGraphics.removeChild(this._layerGraphics.getChildByName(_object.objectID));
         }
      }
      
      public function get rWidth() : Number
      {
         return this._size.x;
      }
      
      public function get rHeight() : Number
      {
         return this._size.y;
      }
      
      private function simplify(_points:Array) : Array
      {
         var lookAhead:Number = NaN;
         var tolerance:Number = NaN;
         var simplifiedLine:Array = null;
         var spline:CatmullRomSpline = null;
         var approxDist:Number = NaN;
         var points:Array = null;
         var lastPoints:Array = null;
         var _key:* = null;
         if(2 < _points.length)
         {
            lookAhead = 2 < _points.length ? Number(2) : Number(_points.length - 1);
            tolerance = 2;
            simplifiedLine = this._lineGeneral.simplifyLang(lookAhead,tolerance,_points);
            spline = new CatmullRomSpline(simplifiedLine);
            approxDist = 1;
            points = spline.getAllPoints(approxDist);
            lastPoints = new Array();
            for(_key in points)
            {
               lastPoints.push({
                  "x":points[_key].x,
                  "y":points[_key].y
               });
            }
            return lastPoints;
         }
         return _points;
      }
      
      private function polarAngle(point:Point, center:Point = null) : Number
      {
         if(!center)
         {
            center = new Point(0,0);
         }
         return Math.atan2(point.y - center.y,point.x - center.x) * 180 / Math.PI;
      }
      
      public function dispose() : void
      {
         if(this._timeline)
         {
            this._timeline.clear();
            this._timeline = null;
         }
         this._layerSWF = null;
         this._layerDrawing = null;
         this._layerGraphics = null;
         this._layerWhite = null;
         this._drawer = null;
         this._lineGeneral = null;
         this._shape = null;
      }
   }
}
