package com.luaye.console.view
{
   import com.luaye.console.Console;
   import flash.events.TextEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public class ChannelsPanel extends AbstractPanel
   {
       
      
      private var _txtField:TextField;
      
      private var _channels:Array;
      
      public function ChannelsPanel(m:Console)
      {
         super(m);
         name = Console.PANEL_CHANNELS;
         init(10,10,false);
         this._txtField = new TextField();
         this._txtField.name = "channelsField";
         this._txtField.wordWrap = true;
         this._txtField.width = 160;
         this._txtField.multiline = true;
         this._txtField.autoSize = TextFieldAutoSize.LEFT;
         this._txtField.styleSheet = style.css;
         this._txtField.addEventListener(TextEvent.LINK,this.linkHandler,false,0,true);
         registerRollOverTextField(this._txtField);
         this._txtField.addEventListener(AbstractPanel.TEXT_LINK,this.onMenuRollOver,false,0,true);
         registerDragger(this._txtField);
         addChild(this._txtField);
      }
      
      public function start(channels:Array) : void
      {
         this._channels = channels;
         this.update();
      }
      
      public function update() : void
      {
         this._txtField.wordWrap = false;
         this._txtField.width = 80;
         var str:String = "<w><menu> <b><a href=\"event:close\">X</a></b></menu> " + master.panels.mainPanel.getChannelsLink();
         this._txtField.htmlText = str + "</w>";
         if(this._txtField.width > 160)
         {
            this._txtField.wordWrap = true;
            this._txtField.width = 160;
         }
         width = this._txtField.width + 4;
         height = this._txtField.height;
      }
      
      private function onMenuRollOver(e:TextEvent) : void
      {
         master.panels.mainPanel.onMenuRollOver(e,this);
      }
      
      protected function linkHandler(e:TextEvent) : void
      {
         this._txtField.setSelection(0,0);
         if(e.text == "close")
         {
            master.channelsPanel = false;
         }
         else if(e.text.substring(0,8) == "channel_")
         {
            master.panels.mainPanel.onChannelPressed(e.text.substring(8));
         }
         this._txtField.setSelection(0,0);
         e.stopPropagation();
      }
   }
}
