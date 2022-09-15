on(press){
   var v = _parent.nativeVisibleCheck();
   if(v === false)
   {
      return undefined;
   }
   this.gotoAndStop(3);
   _parent.DenyLSO.gotoAndStop(1);
   _root.changeKlimit(-2);
}
