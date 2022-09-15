package fl.display
{
   import fl.events.ProLoaderRSLPreloaderSandboxEvent;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.display.Sprite;
   import flash.events.EventDispatcher;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import flash.utils.getQualifiedClassName;
   
   public class ProLoader extends Sprite
   {
       
      
      private var _cli:ProLoaderInfo;
      
      private var _loader:Loader;
      
      private var _realContentLoader:Loader;
      
      private var _loading:Boolean;
      
      private var _hasRequestedContentParentProp:Boolean;
      
      public function ProLoader()
      {
         super();
         this._loader = new Loader();
         this._loader.contentLoaderInfo.sharedEvents.addEventListener(ProLoaderRSLPreloaderSandboxEvent.PROLOADER_RSLPRELOADER_SANDBOX,this.handleProLoaderRSLPreloaderSandboxEvent,false,0,true);
         super.addChild(this._loader);
         this._realContentLoader = null;
         this._cli = new ProLoaderInfo(this);
         this._loading = false;
         this._hasRequestedContentParentProp = false;
      }
      
      private function handleProLoaderRSLPreloaderSandboxEvent(param1:Object) : void
      {
         var _loc2_:DisplayObjectContainer = null;
         if(param1.loaderInfo != null)
         {
            try
            {
               this._realContentLoader = param1.loaderInfo.loader;
            }
            catch(se:SecurityError)
            {
               _realContentLoader = null;
            }
            this._cli.realContentLoaderInfo = param1.loaderInfo;
         }
         else if(param1.shape != null && getQualifiedClassName(param1.shape) == "flash.display::Shape")
         {
            try
            {
               _loc2_ = param1.shape.parent;
               if(_loc2_ != null)
               {
                  _loc2_.removeChild(param1.shape);
                  if(super.numChildren < 2)
                  {
                     super.addChild(_loc2_);
                  }
               }
            }
            catch(se:SecurityError)
            {
            }
         }
      }
      
      function loadDoneCallback(param1:DisplayObject) : Boolean
      {
         var _loc2_:DisplayObjectContainer = null;
         if(!this._loading)
         {
            this._loader.unload();
            return false;
         }
         this._loading = false;
         if(param1 != null)
         {
            try
            {
               if(this._cli.realContentLoaderInfo == null)
               {
                  if(param1.loaderInfo.loader != this._loader)
                  {
                     this._realContentLoader = param1.loaderInfo.loader;
                     this._cli.realContentLoaderInfo = this._realContentLoader.contentLoaderInfo;
                     if(this._hasRequestedContentParentProp)
                     {
                        _loc2_ = this._loader.content.parent as DisplayObjectContainer;
                        if(_loc2_ == this || _loc2_ == null)
                        {
                           while(super.numChildren > 1)
                           {
                              super.removeChildAt(1);
                           }
                           super.addChild(param1);
                        }
                        else
                        {
                           _loc2_.addChildAt(param1,_loc2_.getChildIndex(this._loader.content));
                           _loc2_.removeChild(this._loader.content);
                        }
                     }
                     else
                     {
                        super.addChild(param1);
                     }
                  }
                  else if(!this._hasRequestedContentParentProp || this._cli._lcRequestedContentParentSet && param1.parent != this)
                  {
                     super.addChild(param1);
                  }
               }
               else if(this._hasRequestedContentParentProp)
               {
                  if(param1.parent == this)
                  {
                     while(super.numChildren > 2)
                     {
                        super.removeChildAt(1);
                     }
                  }
               }
               else
               {
                  super.addChild(param1);
               }
            }
            catch(se:SecurityError)
            {
            }
         }
         return true;
      }
      
      public function get realLoader() : Loader
      {
         return this._loader.contentLoaderInfo.loader;
      }
      
      public function get realContentLoader() : Loader
      {
         return this._realContentLoader == null ? null : this._realContentLoader.contentLoaderInfo.loader;
      }
      
      public function get content() : DisplayObject
      {
         if(super.numChildren > 1)
         {
            return super.getChildAt(1);
         }
         if(this._realContentLoader)
         {
            return this._realContentLoader.content;
         }
         return this._loader.content;
      }
      
      public function get contentLoaderInfo() : ProLoaderInfo
      {
         return this._cli;
      }
      
      public function close() : void
      {
         if(this._loading)
         {
            this._loading = false;
            try
            {
               this._loader.close();
            }
            catch(err:Error)
            {
            }
         }
         else
         {
            this._loader.close();
         }
      }
      
      public function load(param1:URLRequest, param2:LoaderContext = null) : void
      {
         var _loc3_:DisplayObjectContainer = null;
         while(super.numChildren > 1)
         {
            super.removeChildAt(1);
         }
         this._realContentLoader = null;
         this._hasRequestedContentParentProp = false;
         this._cli.reset();
         if(param2 == null)
         {
            param2 = new LoaderContext();
         }
         if(param2.hasOwnProperty("requestedContentParent"))
         {
            this._hasRequestedContentParentProp = true;
            _loc3_ = param2["requestedContentParent"];
            if(_loc3_ == null)
            {
               param2["requestedContentParent"] = this;
               this._cli._lcRequestedContentParentSet = true;
            }
         }
         this._loader.load(param1,param2);
         this._loading = true;
      }
      
      public function loadBytes(param1:ByteArray, param2:LoaderContext = null) : void
      {
         var _loc3_:DisplayObjectContainer = null;
         while(super.numChildren > 1)
         {
            super.removeChildAt(1);
         }
         this._realContentLoader = null;
         this._hasRequestedContentParentProp = false;
         this._cli.reset();
         if(param2 == null)
         {
            param2 = new LoaderContext();
         }
         if(param2.hasOwnProperty("requestedContentParent"))
         {
            this._hasRequestedContentParentProp = true;
            _loc3_ = param2["requestedContentParent"];
            if(_loc3_ == null)
            {
               param2["requestedContentParent"] = this;
               this._cli._lcRequestedContentParentSet = true;
            }
         }
         this._loader.loadBytes(param1,param2);
         this._loading = true;
      }
      
      public function loadFilePromise(param1:Object, param2:LoaderContext = null) : void
      {
         var _loc3_:DisplayObjectContainer = null;
         while(super.numChildren > 1)
         {
            super.removeChildAt(1);
         }
         this._realContentLoader = null;
         this._hasRequestedContentParentProp = false;
         this._cli.reset();
         if(param2 == null)
         {
            param2 = new LoaderContext();
         }
         if(param2.hasOwnProperty("requestedContentParent"))
         {
            this._hasRequestedContentParentProp = true;
            _loc3_ = param2["requestedContentParent"];
            if(_loc3_ == null)
            {
               param2["requestedContentParent"] = this;
               this._cli._lcRequestedContentParentSet = true;
            }
         }
         this._loader["loadFilePromise"](param1,param2);
         this._loading = true;
      }
      
      public function unload() : void
      {
         if(!this._loading)
         {
            while(super.numChildren > 1)
            {
               super.removeChildAt(1);
            }
            this._loader.unload();
         }
      }
      
      public function unloadAndStop(param1:Boolean = true) : void
      {
         if(!this._loading)
         {
            while(super.numChildren > 1)
            {
               super.removeChildAt(1);
            }
            this._loader["unloadAndStop"](param1);
         }
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         if(this._realContentLoader != null && this._realContentLoader.content == param1 || this._loader.content == param1)
         {
            return super.addChild(param1);
         }
         throw new Error("Error #2069: The ProLoader class does not implement this method.");
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         throw new Error("Error #2069: The ProLoader class does not implement this method.");
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         throw new Error("Error #2069: The ProLoader class does not implement this method.");
      }
      
      override public function removeChildAt(param1:int) : DisplayObject
      {
         throw new Error("Error #2069: The ProLoader class does not implement this method.");
      }
      
      override public function setChildIndex(param1:DisplayObject, param2:int) : void
      {
         throw new Error("Error #2069: The ProLoader class does not implement this method.");
      }
      
      override public function get numChildren() : int
      {
         return super.numChildren - 1;
      }
      
      override public function getChildAt(param1:int) : DisplayObject
      {
         if(param1 >= 0)
         {
            param1++;
         }
         return super.getChildAt(param1);
      }
      
      override public function getChildIndex(param1:DisplayObject) : int
      {
         return super.getChildIndex(param1) - 1;
      }
      
      public function get uncaughtErrorEvents() : EventDispatcher
      {
         return this._loader["uncaughtErrorEvents"];
      }
   }
}
