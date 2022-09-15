package com.luaye.console.core
{
   import com.luaye.console.Console;
   import com.luaye.console.utils.WeakObject;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.utils.describeType;
   import flash.utils.getQualifiedClassName;
   
   public class CommandTools
   {
       
      
      private var _mapBases:WeakObject;
      
      private var _mapBaseIndex:uint = 1;
      
      private var _report:Function;
      
      public function CommandTools(f:Function)
      {
         super();
         this._report = f;
         this._mapBases = new WeakObject();
      }
      
      public function report(obj:*, priority:Number = 1, skipSafe:Boolean = true) : void
      {
         this._report(obj,priority,skipSafe);
      }
      
      public function inspect(obj:Object, viewAll:Boolean = true) : void
      {
         var nodes:XMLList = null;
         var extendX:XML = null;
         var implementX:XML = null;
         var constantX:XML = null;
         var methodX:XML = null;
         var arr:Array = null;
         var accessorX:XML = null;
         var variableX:XML = null;
         var X:String = null;
         var metadataX:XML = null;
         var mparamsList:XMLList = null;
         var params:Array = null;
         var paraX:XML = null;
         var mn:XMLList = null;
         var mc:DisplayObjectContainer = null;
         var clen:int = 0;
         var ci:int = 0;
         var theParent:DisplayObjectContainer = null;
         var child:DisplayObject = null;
         var pr:DisplayObjectContainer = null;
         var V:XML = describeType(obj);
         var cls:Object = obj is Class ? obj : obj.constructor;
         var clsV:XML = describeType(cls);
         var self:String = V.@name;
         var str:String = "<b>" + self + "</b>";
         var props:Array = [];
         var props2:Array = [];
         var staticPrefix:String = "<p1><i>[static]</i></p1>";
         if(V.@isDynamic == "true")
         {
            props.push("dynamic");
         }
         if(V.@isFinal == "true")
         {
            props.push("final");
         }
         if(V.@isStatic == "true")
         {
            props.push("static");
         }
         if(props.length > 0)
         {
            str += " <p-1>" + props.join(" | ") + "</p-1>";
         }
         this.report(str + "<br/>",-2);
         props = [];
         nodes = V.extendsClass;
         for each(extendX in nodes)
         {
            props.push(extendX.@type.toString());
            if(!viewAll)
            {
               break;
            }
         }
         if(props.length)
         {
            this.report("<p10>Extends:</p10> " + props.join("<p-1> &gt; </p-1>") + "<br/>",5);
         }
         props = [];
         nodes = V.implementsInterface;
         for each(implementX in nodes)
         {
            props.push(implementX.@type.toString());
         }
         if(props.length)
         {
            this.report("<p10>Implements:</p10> " + props.join("<p-1>; </p-1>") + "<br/>",5);
         }
         props = [];
         nodes = clsV..constant;
         for each(constantX in nodes)
         {
            props.push(constantX.@name + "<p0>(" + constantX.@type + ")</p0>");
         }
         if(props.length)
         {
            this.report("<p10>Constants:</p10> " + props.join("<p-1>; </p-1>") + "<br/>",5);
         }
         props = [];
         props2 = [];
         nodes = clsV..method;
         for each(methodX in nodes)
         {
            mparamsList = methodX.parameter;
            str = methodX.parent().name() == "factory" ? "" : staticPrefix;
            if(viewAll)
            {
               params = [];
               for each(paraX in mparamsList)
               {
                  params.push(paraX.@optional == "true" ? "<i>" + paraX.@type + "</i>" : paraX.@type);
               }
               str += methodX.@name + "<p0>(<i>" + params.join(",") + "</i>):" + methodX.@returnType + "</p0>";
            }
            else
            {
               str += methodX.@name + "<p0>(<i>" + mparamsList.length() + "</i>):" + methodX.@returnType + "</p0>";
            }
            arr = self == methodX.@declaredBy ? props : props2;
            arr.push(str);
         }
         this.makeInheritLine(props,props2,viewAll,"Methods",!!viewAll ? "<br/>" : "<p-1>; </p-1>");
         props = [];
         props2 = [];
         nodes = clsV..accessor;
         for each(accessorX in nodes)
         {
            str = accessorX.parent().name() == "factory" ? "" : staticPrefix;
            str += (accessorX.@access == "readonly" ? "<i>" + accessorX.@name + "</i>" : accessorX.@name) + "<p0>(" + accessorX.@type + ")</p0>";
            arr = self == accessorX.@declaredBy ? props : props2;
            arr.push(str);
         }
         this.makeInheritLine(props,props2,viewAll,"Accessors","<p-1>; </p-1>");
         props = [];
         nodes = clsV..variable;
         for each(variableX in nodes)
         {
            str = (variableX.parent().name() == "factory" ? "" : staticPrefix) + variableX.@name + "<p0>(" + variableX.@type + ")</p0>";
            props.push(str);
         }
         if(props.length)
         {
            this.report("<p10>Variables:</p10> " + props.join("<p-1>; </p-1>") + "<br/>",5);
         }
         props = [];
         for(X in obj)
         {
            props.push(X + "<p0>(" + getQualifiedClassName(obj[X]) + ")</p0>");
         }
         if(props.length)
         {
            this.report("<p10>Values:</p10> " + props.join("<p-1>; </p-1>") + "<br/>",5);
         }
         props = [];
         nodes = V.metadata;
         for each(metadataX in nodes)
         {
            if(metadataX.@name == "Event")
            {
               mn = metadataX.arg;
               var _loc7_:int = 0;
               var _loc8_:* = §§checkfilter(mn);
               var _loc6_:* = new XMLList("");
               §§push(mn.(@key == "name").@value + "<p0>(");
               mn.(@key == "type");
               §§pop().push(props + _loc6_.@value + ")</p0>");
            }
         }
         if(props.length)
         {
            this.report("<p10>Events:</p10> " + props.join("<p-1>; </p-1>") + "<br/>",5);
         }
         if(viewAll && obj is DisplayObjectContainer)
         {
            props = [];
            mc = obj as DisplayObjectContainer;
            clen = mc.numChildren;
            for(ci = 0; ci < clen; ci++)
            {
               child = mc.getChildAt(ci);
               props.push("<b>" + child.name + "</b>:(" + ci + ")" + getQualifiedClassName(child));
            }
            if(props.length)
            {
               this.report("<p10>Children:</p10> " + props.join("<p-1>; </p-1>") + "<br/>",5);
            }
            theParent = mc.parent;
            if(theParent)
            {
               props = ["(" + theParent.getChildIndex(mc) + ")"];
               while(theParent)
               {
                  pr = theParent;
                  theParent = theParent.parent;
                  props.push("<b>" + pr.name + "</b>:(" + (!!theParent ? theParent.getChildIndex(pr) : "") + ")" + getQualifiedClassName(pr));
               }
               if(props.length)
               {
                  this.report("<p10>Parents:</p10> " + props.join("<p-1>; </p-1>") + "<br/>",5);
               }
            }
         }
         if(!viewAll)
         {
            this.report("Tip: use /inspectfull to see full inspection with inheritance",-1);
         }
      }
      
      private function makeInheritLine(props:Array, props2:Array, viewAll:Boolean, type:String, breaker:String) : void
      {
         var str:String = "";
         if(props.length || props2.length)
         {
            str += "<p10>" + type + ":</p10> " + props.join(breaker);
            if(viewAll)
            {
               str += (!!props.length ? breaker : "") + "<p2>" + props2.join(breaker) + "</p2>";
            }
            else if(props2.length)
            {
               str += (!!props.length ? breaker : "") + "<p2>+ " + props2.length + " inherited</p2>";
            }
            this.report(str + "<br/>",5);
         }
      }
      
      public function map(base:DisplayObjectContainer, maxstep:uint = 0) : void
      {
         var wasHiding:Boolean = false;
         var X:* = null;
         var mcDO:DisplayObject = null;
         var mc:DisplayObjectContainer = null;
         var numC:int = 0;
         var i:int = 0;
         var child:DisplayObject = null;
         var str:String = null;
         var n:* = null;
         if(!base)
         {
            this.report("It is not a DisplayObjectContainer",10);
            return;
         }
         this._mapBases[this._mapBaseIndex] = base;
         var basestr:String = this._mapBaseIndex + Console.MAPPING_SPLITTER;
         var list:Array = new Array();
         var index:int = 0;
         list.push(base);
         while(index < list.length)
         {
            mcDO = list[index];
            if(mcDO is DisplayObjectContainer)
            {
               mc = mcDO as DisplayObjectContainer;
               numC = mc.numChildren;
               for(i = 0; i < numC; i++)
               {
                  child = mc.getChildAt(i);
                  list.splice(index + i + 1,0,child);
               }
            }
            index++;
         }
         var steps:int = 0;
         var lastmcDO:DisplayObject = null;
         var indexes:Array = new Array();
         for(X in list)
         {
            mcDO = list[X];
            if(lastmcDO)
            {
               if(lastmcDO is DisplayObjectContainer && (lastmcDO as DisplayObjectContainer).contains(mcDO))
               {
                  steps++;
                  indexes.push(mcDO.name);
               }
               else
               {
                  while(lastmcDO)
                  {
                     lastmcDO = lastmcDO.parent;
                     if(lastmcDO is DisplayObjectContainer)
                     {
                        if(steps > 0)
                        {
                           indexes.pop();
                           steps--;
                        }
                        if((lastmcDO as DisplayObjectContainer).contains(mcDO))
                        {
                           steps++;
                           indexes.push(mcDO.name);
                           break;
                        }
                     }
                  }
               }
            }
            str = "";
            for(i = 0; i < steps; i++)
            {
               str += i == steps - 1 ? " ∟ " : " - ";
            }
            if(maxstep <= 0 || steps <= maxstep)
            {
               wasHiding = false;
               n = "<a href=\'event:clip_" + basestr + indexes.join(Console.MAPPING_SPLITTER) + "\'>" + mcDO.name + "</a>";
               if(mcDO is DisplayObjectContainer)
               {
                  n = "<b>" + n + "</b>";
               }
               else
               {
                  n = "<i>" + n + "</i>";
               }
               str += n + " (" + getQualifiedClassName(mcDO) + ")";
               this.report(str,mcDO is DisplayObjectContainer ? Number(5) : Number(2));
            }
            else if(!wasHiding)
            {
               wasHiding = true;
               this.report(str + "...",5);
            }
            lastmcDO = mcDO;
         }
         ++this._mapBaseIndex;
         this.report(base.name + ":" + getQualifiedClassName(base) + " has " + list.length + " children/sub-children.",10);
         this.report("Click on the name to return a reference to the child clip. <br/>Note that clip references will be broken when display list is changed",-2);
      }
      
      public function reMap(path:String, mc:DisplayObjectContainer) : DisplayObject
      {
         var nn:String = null;
         var pathArr:Array = path.split(Console.MAPPING_SPLITTER);
         var first:String = pathArr.shift();
         if(first != "0")
         {
            mc = this._mapBases[first];
         }
         var child:DisplayObject = mc as DisplayObject;
         try
         {
            for each(nn in pathArr)
            {
               if(!nn)
               {
                  break;
               }
               child = mc.getChildByName(nn);
               if(!(child is DisplayObjectContainer))
               {
                  break;
               }
               mc = child as DisplayObjectContainer;
            }
            return child;
         }
         catch(e:Error)
         {
            report("Problem getting the clip reference. Display list must have changed since last map request",10);
            return null;
         }
      }
      
      public function printHelp() : void
      {
         this.report("____Command Line Help___",10);
         this.report("/filter (text) = filter/search logs for matching text",5);
         this.report("// = return to previous scope",5);
         this.report("/base = return to base scope (same as typing $base)",5);
         this.report("/store (name) = store current scope to that name (default is weak reference). to call back: $(name)",5);
         this.report("/savestrong (name) = store current scope as strong reference",5);
         this.report("/stored = list all stored variables",5);
         this.report("/inspect = get info of your current scope.",5);
         this.report("/inspectfull = get more detailed info of your current scope.",5);
         this.report("/map = get the display list map starting from your current scope",5);
         this.report("/strong true = turn on strong referencing, you need to turn this on if you want to start manipulating with instances that are newly created.",5);
         this.report("/string = return the param of this command as a string. This is useful if you want to paste a block of text to use in commandline.",5);
         this.report("Press up/down arrow keys to recall previous commands",2);
         this.report("__Examples:",10);
         this.report("<b>stage.width</b>",5);
         this.report("<b>stage.scaleMode = flash.display.StageScaleMode.NO_SCALE</b>",5);
         this.report("<b>stage.frameRate = 12</b>",5);
         this.report("__________",10);
      }
   }
}
