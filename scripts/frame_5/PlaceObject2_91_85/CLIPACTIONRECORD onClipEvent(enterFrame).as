onClipEvent(enterFrame){
   if(this.pressed)
   {
      UpdateGain();
   }
   level = _parent.myMic.activityLevel;
   if(level == -1)
   {
      _parent.meter.gmask._width = 0;
   }
   else
   {
      if(level > 100)
      {
         level = 100;
      }
      _parent.meter.gmask._width = level;
   }
}
