onClipEvent(enterFrame){
   if(_root.doVisibilityCheck())
   {
      this._visible = 0;
      this._x = -210;
   }
   else
   {
      this._visible = 1;
      this._x = 0;
   }
}
