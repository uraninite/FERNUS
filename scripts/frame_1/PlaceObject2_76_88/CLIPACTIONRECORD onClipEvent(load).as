onClipEvent(load){
   var secure = Boolean(_parent.inputState.secure);
   var data = _parent.domainSettings.data;
   var checked;
   if(secure)
   {
      checked = !Boolean(data.allowSecure);
   }
   else
   {
      checked = !Boolean(data.allow);
   }
   if(Boolean(checked))
   {
      this.gotoAndStop(3);
   }
}
