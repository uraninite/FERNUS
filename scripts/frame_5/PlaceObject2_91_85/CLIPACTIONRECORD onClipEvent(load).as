onClipEvent(load){
   function UpdateGain()
   {
      g = this._x - this.left + 1;
      if(g <= 0.2)
      {
         g = 0;
      }
      else if(g >= 100)
      {
         g = 100;
      }
      _parent.playerSettings.data.gain = g;
      _parent.AlertResponse = "gain";
   }
   if(_parent.playerSettings.data.gain == undefined)
   {
      _parent.playerSettings.data.gain = 75;
   }
   mg = _parent.playerSettings.data.gain;
   this._x = _parent.crib2._x + mg;
   left = _parent.crib2._x;
   right = left + 100;
   top = this._y;
   bottom = top;
}
