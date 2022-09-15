stop();
this.useHandCursor = false;
if(this._name != _parent.lastClip)
{
   this.bottom._visible = false;
}
this.onRollOver = function()
{
   if(this._name != "sel")
   {
      title.textColor = 16777215;
      bev._visible = true;
   }
   _parent.onSel = true;
};
this.onRollOut = function()
{
   title.textColor = 0;
   bev._visible = false;
   _parent.onSel = false;
};
this.onPress = function()
{
   if(this._name != "sel")
   {
      _parent._parent.showSel(this,_parent);
      _parent.onSel = false;
   }
};
