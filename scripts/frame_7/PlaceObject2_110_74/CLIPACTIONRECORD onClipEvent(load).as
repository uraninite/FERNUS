onClipEvent(load){
   if(_parent.playerSettings.data.safefullscreen == undefined)
   {
      this.safefullscreen = false;
   }
   else
   {
      this.safefullscreen = _parent.playerSettings.data.safefullscreen;
   }
   if(this.safefullscreen == true)
   {
      this.gotoAndStop(1);
   }
   else
   {
      this.gotoAndStop(2);
   }
}
