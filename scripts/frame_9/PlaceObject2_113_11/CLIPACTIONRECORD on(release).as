on(release){
   var v = _parent.nativeVisibleCheck();
   if(v === false)
   {
      return undefined;
   }
   _parent.pop_changeKlimit(-2);
}
