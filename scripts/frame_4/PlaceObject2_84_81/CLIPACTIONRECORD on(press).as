on(press){
   var v = _parent.nativeVisibleCheck();
   if(v === false)
   {
      return undefined;
   }
   this.gotoAndStop(3);
   _parent.AllowLSO.gotoAndStop(1);
   _root.changeKlimit(-1);
}
