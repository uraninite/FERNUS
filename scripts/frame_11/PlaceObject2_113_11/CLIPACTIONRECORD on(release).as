on(release){
   var v = _parent.nativeVisibleCheck();
   if(v === false)
   {
      return undefined;
   }
   if(_parent.securityRemember.always)
   {
      _parent.AlertResponse = "always_allow";
   }
   else
   {
      _parent.AlertResponse = "allow";
   }
}
