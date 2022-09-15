on(press){
   var v = _parent.nativeVisibleCheck();
   if(v === false)
   {
      return undefined;
   }
   startDrag(this,0,left,top,right,bottom);
   pressed = true;
}
