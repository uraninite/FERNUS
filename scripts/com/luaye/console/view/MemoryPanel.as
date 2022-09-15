package com.luaye.console.view
{
   import com.luaye.console.Console;
   import flash.events.Event;
   import flash.events.TextEvent;
   
   public class MemoryPanel extends GraphingPanel
   {
       
      
      public function MemoryPanel(m:Console)
      {
         super(m,80,40);
         name = Console.PANEL_MEMORY;
         updateEvery = 5;
         drawEvery = 5;
         minimumWidth = 32;
         add(this,"current",5267711,"Memory");
      }
      
      override public function close() : void
      {
         super.close();
         master.panels.updateMenu();
      }
      
      public function get current() : Number
      {
         return Math.round(master.currentMemory / 10485.76) / 100;
      }
      
      override protected function onFrame(e:Event) : Boolean
      {
         if(super.onFrame(e))
         {
            this.updateKeyText();
            return true;
         }
         return false;
      }
      
      override public function updateKeyText() : void
      {
         var mem:Number = getCurrentOf(0);
         if(mem > 0)
         {
            keyTxt.htmlText = "<r><s>" + mem.toFixed(2) + "mb <menu><a href=\"event:gc\">G</a> <a href=\"event:reset\">R</a> <a href=\"event:close\">X</a></menu></r></s>";
         }
         else
         {
            keyTxt.htmlText = "<r><s><y>no mem input</y> <menu><a href=\"event:close\">X</a></menu></s></r>";
         }
      }
      
      override protected function linkHandler(e:TextEvent) : void
      {
         if(e.text == "gc")
         {
            master.gc();
         }
         super.linkHandler(e);
      }
      
      override protected function onMenuRollOver(e:TextEvent) : void
      {
         var txt:String = !!e.text ? e.text.replace("event:","") : null;
         if(txt == "gc")
         {
            txt = "Garbage collect::Requires debugger version of flash player";
         }
         master.panels.tooltip(txt,this);
      }
   }
}
