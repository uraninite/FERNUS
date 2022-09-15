function constantCallback()
{
   var _loc5_ = getTimer();
   var _loc3_ = _loc5_ - startTime;
   if(_loc3_ > initialDisplayTime + fadeOutTime)
   {
      clearInterval(intervalId);
      var _loc6_ = this.createEmptyMovieClip("empty",this.getNextHighestDepth());
      _loc6_.swapDepths(FullScreen_MC);
      FullScreen_MC.removeMovieClip();
      FullScreen_MC.FullScreen_text.text = "";
      _root.AlertResponseOverlayMessage = "close";
   }
   else if(_loc3_ > initialDisplayTime)
   {
      §§pop() extends §§pop() >>> §§pop();
      return getProperty(§§pop(), _X);
   }
}
