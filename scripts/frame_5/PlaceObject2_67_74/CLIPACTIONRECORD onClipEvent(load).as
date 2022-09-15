onClipEvent(load){
   if(_parent.playerSettings.data.echosuppression == undefined)
   {
      this.echosuppression = false;
   }
   else
   {
      this.echosuppression = _parent.playerSettings.data.echosuppression;
   }
   if(this.echosuppression == true)
   {
      this.gotoAndStop(2);
   }
   else
   {
      this.gotoAndStop(1);
   }
}
