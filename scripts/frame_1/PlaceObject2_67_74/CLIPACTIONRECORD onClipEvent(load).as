onClipEvent(load){
   var secure = Boolean(_parent.inputState.secure);
   var data = _parent.domainSettings.data;
   if(secure)
   {
      this.always = Boolean(data.alwaysSecure);
   }
   else
   {
      this.always = Boolean(data.always);
   }
   if(this.always)
   {
      this.gotoAndStop(2);
   }
   else
   {
      this.gotoAndStop(1);
   }
}
