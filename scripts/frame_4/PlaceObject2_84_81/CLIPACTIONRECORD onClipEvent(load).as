onClipEvent(load){
   if(_parent.domainSettings.data.klimit == -1 || _parent.domainSettings.data.klimit == 0)
   {
      this.gotoAndStop(3);
   }
}
