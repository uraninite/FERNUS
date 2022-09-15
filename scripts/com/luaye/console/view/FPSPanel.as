package com.luaye.console.view
{
   import com.luaye.console.Console;
   import flash.events.Event;
   
   public class FPSPanel extends GraphingPanel
   {
       
      
      private var _cachedCurrent:Number;
      
      public function FPSPanel(m:Console)
      {
         super(m,80,40);
         name = Console.PANEL_FPS;
         lowest = 0;
         minimumWidth = 32;
         add(this,"current",16724787,"FPS");
      }
      
      override public function close() : void
      {
         super.close();
         master.panels.updateMenu();
      }
      
      override public function stop() : void
      {
         super.stop();
         reset();
      }
      
      override public function updateKeyText() : void
      {
         if(_history.length > 0)
         {
            keyTxt.htmlText = "<r><s>" + master.fps.toFixed(1) + " | " + getAverageOf(0).toFixed(1) + " <menu><a href=\"event:reset\">R</a> <a href=\"event:close\">X</a></menu></r></s>";
         }
         else
         {
            keyTxt.htmlText = "<r><s><y>no fps input</y> <menu><a href=\"event:close\">X</a></menu></s></r>";
         }
      }
      
      public function get current() : Number
      {
         if(isNaN(this._cachedCurrent))
         {
            return master.fps;
         }
         var mspf:Number = this._cachedCurrent;
         this._cachedCurrent = NaN;
         return mspf;
      }
      
      public function addCurrent(n:Number) : void
      {
         this._cachedCurrent = n;
         updateData();
      }
      
      override protected function onFrame(e:Event) : Boolean
      {
         var frames:int = 0;
         if(master.remote)
         {
            return false;
         }
         var mspf:Number = master.mspf;
         if(!isNaN(mspf))
         {
            if(super.onFrame(e))
            {
               this.updateKeyText();
               if(stage)
               {
                  fixed = true;
                  averaging = stage.frameRate;
                  highest = averaging;
                  frames = Math.floor(mspf / (1000 / highest));
                  if(frames > Console.FPS_MAX_LAG_FRAMES)
                  {
                     frames = Console.FPS_MAX_LAG_FRAMES;
                  }
                  while(frames > 1)
                  {
                     updateData();
                     frames--;
                  }
               }
               return true;
            }
         }
         return false;
      }
   }
}
