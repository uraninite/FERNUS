on(press){
   var v = _parent.nativeVisibleCheck();
   if(v === false)
   {
      return undefined;
   }
   this.always = !this.always;
   _parent.onChange(this._name,this.always);
}
