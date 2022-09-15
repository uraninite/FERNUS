on(press){
   var v = _parent.nativeVisibleCheck();
   if(v === false)
   {
      return undefined;
   }
   this.safefullscreen = !this.safefullscreen;
   _parent.onChange(this._name,this.safefullscreen);
}
