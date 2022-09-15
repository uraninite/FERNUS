on(press){
   var v = _parent.nativeVisibleCheck();
   var secure = Boolean(_parent.inputState.secure);
   if(v === false)
   {
      return undefined;
   }
   this.gotoAndStop(3);
   _parent.Deny.gotoAndStop(1);
   if(secure)
   {
      _parent.domainSettings.data.allowSecure = true;
   }
   else
   {
      _parent.domainSettings.data.allow = true;
   }
   _parent.AlertResponse = "allow";
}
