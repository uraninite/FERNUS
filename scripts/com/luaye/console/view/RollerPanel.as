package com.luaye.console.view
{
   import com.luaye.console.Console;
   import com.luaye.console.utils.Utils;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.TextEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.utils.Dictionary;
   
   public class RollerPanel extends AbstractPanel
   {
       
      
      private var _txtField:TextField;
      
      private var _base:DisplayObjectContainer;
      
      public function RollerPanel(m:Console)
      {
         super(m);
         name = Console.PANEL_ROLLER;
         init(60,100,false);
         this._txtField = new TextField();
         this._txtField.name = "rollerprints";
         this._txtField.multiline = true;
         this._txtField.autoSize = TextFieldAutoSize.LEFT;
         this._txtField.styleSheet = style.css;
         this._txtField.addEventListener(TextEvent.LINK,this.linkHandler,false,0,true);
         registerRollOverTextField(this._txtField);
         this._txtField.addEventListener(AbstractPanel.TEXT_LINK,this.onMenuRollOver,false,0,true);
         registerDragger(this._txtField);
         addChild(this._txtField);
      }
      
      public function start(base:DisplayObjectContainer) : void
      {
         this._base = base;
         addEventListener(Event.ENTER_FRAME,this._onFrame,false,0,true);
      }
      
      public function capture() : String
      {
         return this.getMapString(true);
      }
      
      private function onMenuRollOver(e:TextEvent) : void
      {
         master.panels.tooltip(!!e.text ? "Close" : null,this);
      }
      
      private function _onFrame(e:Event) : void
      {
         if(!this._base.stage)
         {
            this.close();
            return;
         }
         this._txtField.htmlText = "<ro>" + this.getMapString() + "</ro>";
         this._txtField.autoSize = TextFieldAutoSize.LEFT;
         this._txtField.setSelection(0,0);
         width = this._txtField.width + 4;
         height = this._txtField.height;
      }
      
      private function getMapString(dolink:Boolean = false) : String
      {
         var child:DisplayObject = null;
         var chain:Array = null;
         var par:DisplayObjectContainer = null;
         var len:uint = 0;
         var i:uint = 0;
         var obj:DisplayObject = null;
         var j:uint = 0;
         var stg:Stage = this._base.stage;
         var str:* = "";
         var objs:Array = stg.getObjectsUnderPoint(new Point(stg.mouseX,stg.mouseY));
         var stepMap:Dictionary = new Dictionary(true);
         if(objs.length == 0)
         {
            objs.push(stg);
         }
         for each(child in objs)
         {
            chain = new Array(child);
            par = child.parent;
            while(par)
            {
               chain.unshift(par);
               par = par.parent;
            }
            len = chain.length;
            for(i = 0; i < len; i++)
            {
               obj = chain[i];
               if(stepMap[obj] == undefined)
               {
                  stepMap[obj] = i;
                  if(dolink)
                  {
                     str += "<br/>";
                  }
                  for(j = i; j > 0; j--)
                  {
                     str += j == 1 ? " ∟" : " -";
                  }
                  if(dolink)
                  {
                     if(obj == stg)
                     {
                        str += "<p3><a href=\'event:sclip_\'><i>Stage</i></a> [" + stg.mouseX + "," + stg.mouseY + "]</p3>";
                     }
                     else if(i == len - 1)
                     {
                        str += "<p5><a href=\'event:sclip_" + this.mapUpward(obj) + "\'>" + obj.name + "(" + Utils.shortClassName(obj) + ")</a></p5>";
                     }
                     else
                     {
                        str += "<p2><a href=\'event:sclip_" + this.mapUpward(obj) + "\'><i>" + obj.name + "(" + Utils.shortClassName(obj) + ")</i></a></p2>";
                     }
                  }
                  else if(obj == stg)
                  {
                     str += "<menu> <a href=\"event:close\"><b>X</b></a></menu> <i>Stage</i> [" + stg.mouseX + "," + stg.mouseY + "]<br/>";
                  }
                  else if(i == len - 1)
                  {
                     str += "<roBold>" + obj.name + "(" + Utils.shortClassName(obj) + ")</roBold>";
                  }
                  else
                  {
                     str += "<i>" + obj.name + "(" + Utils.shortClassName(obj) + ")</i><br/>";
                  }
               }
            }
         }
         return str;
      }
      
      private function mapUpward(mc:DisplayObject) : String
      {
         var arr:Array = [mc.name];
         mc = mc.parent;
         while(mc && mc != mc.stage)
         {
            arr.push(mc.name);
            mc = mc.parent;
         }
         return arr.reverse().join(Console.MAPPING_SPLITTER);
      }
      
      override public function close() : void
      {
         removeEventListener(Event.ENTER_FRAME,this._onFrame);
         this._base = null;
         super.close();
         master.panels.updateMenu();
      }
      
      protected function linkHandler(e:TextEvent) : void
      {
         TextField(e.currentTarget).setSelection(0,0);
         if(e.text == "close")
         {
            this.close();
         }
         e.stopPropagation();
      }
   }
}
