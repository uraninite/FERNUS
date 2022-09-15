package com.greensock.loading
{
   import com.greensock.events.LoaderEvent;
   import com.greensock.loading.core.DisplayObjectLoader;
   import com.greensock.loading.core.LoaderItem;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   
   public class ImageLoader extends DisplayObjectLoader
   {
      
      private static var _classActivated:Boolean = _activateClass("ImageLoader",ImageLoader,"jpg,jpeg,png,gif,bmp");
       
      
      public function ImageLoader(urlOrRequest:*, vars:Object = null)
      {
         super(urlOrRequest,vars);
         _type = "ImageLoader";
      }
      
      override protected function _load() : void
      {
         var loaders:Array = null;
         var loader:LoaderItem = null;
         var i:int = 0;
         if(this.vars.noCache != true)
         {
            loaders = _globalRootLoader.getChildren(true,true);
            i = loaders.length;
            while(--i > -1)
            {
               loader = loaders[i];
               if(loader.url == _url && loader != this && loader.status == LoaderStatus.COMPLETED && loader is ImageLoader && ImageLoader(loader).rawContent is Bitmap)
               {
                  _closeStream();
                  _content = new Bitmap(ImageLoader(loader).rawContent.bitmapData,"auto",Boolean(this.vars.smoothing != false));
                  Object(_sprite).rawContent = _content as DisplayObject;
                  _initted = true;
                  _progressHandler(new ProgressEvent(ProgressEvent.PROGRESS,false,false,loader.bytesLoaded,loader.bytesTotal));
                  dispatchEvent(new LoaderEvent(LoaderEvent.INIT,this));
                  _completeHandler(null);
                  return;
               }
            }
         }
         super._load();
      }
      
      override protected function _initHandler(event:Event) : void
      {
         _determineScriptAccess();
         if(!_scriptAccessDenied)
         {
            _content = Bitmap(_loader.content);
            _content.smoothing = Boolean(this.vars.smoothing != false);
         }
         else
         {
            _content = _loader;
         }
         super._initHandler(event);
      }
   }
}
