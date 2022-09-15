on(release){
   var v = _parent.nativeVisibleCheck();
   if(v === false)
   {
      return undefined;
   }
   _parent.DP_dl_retry();
}
