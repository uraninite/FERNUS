on(press){
   var v = _parent.nativeVisibleCheck();
   var secure = Boolean(_parent.inputState.secure);
   if(v === false)
   {
      return undefined;
   }
   this.gotoAndStop(3);
   _parent.Allow.gotoAndStop(1);
   if(secure)
   {
      _parent.domainSettings.data.allowSecure = false;
   }
   else
   {
      _parent.domainSettings.data.allow = false;
   }
   _parent.AlertResponse = "allow";
}
