on(press){
   var v = _parent.nativeVisibleCheck();
   if(v === false)
   {
      return undefined;
   }
   this.echosuppression = !this.echosuppression;
   _parent.onChange(this._name,this.echosuppression);
}
