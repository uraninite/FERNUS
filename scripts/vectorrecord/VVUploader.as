package vectorrecord
{
   import com.greensock.TweenMax;
   import com.kxk.Network;
   import flash.events.DataEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.filesystem.File;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   
   public class VVUploader
   {
      
      private static var _isUploading:Boolean = false;
      
      private static var _object:Object;
      
      private static var _file:File;
      
      public static var assPath:String;
      
      public static var url:String;
      
      private static var _dispatcher:EventDispatcher = new EventDispatcher();
       
      
      public function VVUploader()
      {
         super();
      }
      
      public static function start() : void
      {
         if(_isUploading)
         {
            return;
         }
         if(!User.token)
         {
            return;
         }
         if(!Network.status)
         {
            TweenMax.delayedCall(150,start);
            return;
         }
         TweenMax.killDelayedCallsTo(start);
         KXKDatabase.getUploadData(1,function(e:*):*
         {
            if(e)
            {
               _object = e[0];
               upload();
            }
         });
      }
      
      public static function check(_o:Object) : void
      {
         if(_object)
         {
            if(_object.areaID == _o.areaID)
            {
               disposeAllData();
               start();
            }
         }
      }
      
      private static function upload() : void
      {
         var _urlRequest:URLRequest = null;
         var authHeader2:URLRequestHeader = null;
         var authHeader3:URLRequestHeader = null;
         var authHeader4:URLRequestHeader = null;
         var authHeader5:URLRequestHeader = null;
         var headers:Array = null;
         var _urlVariables:URLVariables = null;
         _file = null;
         _file = new File(assPath + _object.name);
         if(_file.exists)
         {
            _isUploading = true;
            _file.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA,file_dataEvent);
            _file.addEventListener(Event.COMPLETE,file_complete);
            _file.addEventListener(IOErrorEvent.IO_ERROR,file_error);
            _file.addEventListener(SecurityErrorEvent.SECURITY_ERROR,file_error);
            _file.addEventListener(HTTPStatusEvent.HTTP_STATUS,file_error_status);
            _file.addEventListener(HTTPStatusEvent.HTTP_RESPONSE_STATUS,file_error_status_respo);
            _file.addEventListener(ProgressEvent.PROGRESS,file_progress);
            _urlRequest = new URLRequest(url);
            authHeader2 = new URLRequestHeader("Content-Type","multipart/form-data");
            authHeader3 = new URLRequestHeader("Pragma","no-cache");
            authHeader4 = new URLRequestHeader("Cache-Control","no-cache, no-store, must-revalidate");
            authHeader5 = new URLRequestHeader("Expires","0");
            headers = new Array();
            headers.push(authHeader2);
            headers.push(authHeader3);
            headers.push(authHeader4);
            headers.push(authHeader5);
            _urlRequest.requestHeaders = headers;
            _urlVariables = new URLVariables();
            _urlVariables.action = "vector_video_upload";
            _urlVariables.token = User.token;
            _urlVariables.file_name = _object.name;
            _urlVariables.area_id = _object.areaID;
            _urlVariables.page = _object.page;
            _urlRequest.data = _urlVariables;
            _urlRequest.method = URLRequestMethod.POST;
            _file.upload(_urlRequest);
            _dispatcher.dispatchEvent(new KryEvent(KryEvent.START,_object));
         }
         else
         {
            KXKDatabase.deleteData(_object);
            start();
         }
      }
      
      private static function file_complete(e:Event) : void
      {
         trace("file uploaded");
      }
      
      private static function file_dataEvent(e:DataEvent) : void
      {
         var _d:Object = null;
         trace("server response");
         try
         {
            trace(e.data);
            _d = JSON.parse(e.data);
            if(_d.status)
            {
               _object.upload = 2;
               KXKDatabase.updateData(_object,function():*
               {
                  _dispatcher.dispatchEvent(new KryEvent(KryEvent.COMPLETE,_object));
                  disposeAllData();
                  start();
               });
            }
            else
            {
               file_error();
            }
         }
         catch(e:*)
         {
            file_error();
         }
      }
      
      private static function file_error(e:* = null) : void
      {
         disposeAllData();
         TweenMax.delayedCall(150,start);
      }
      
      private static function file_error_status_respo(e:HTTPStatusEvent) : void
      {
         trace(e.status);
      }
      
      private static function file_error_status(e:HTTPStatusEvent) : void
      {
         trace(e.status + "---" + String(e));
      }
      
      private static function file_progress(e:ProgressEvent) : void
      {
         _dispatcher.dispatchEvent(new KryEvent(KryEvent.PROGRESS,{
            "object":_object,
            "percent":Math.floor(100 * (e.bytesLoaded / e.bytesTotal))
         }));
      }
      
      public static function disposeAllData() : void
      {
         TweenMax.killDelayedCallsTo(start);
         _isUploading = false;
         if(_file)
         {
            _file.cancel();
            _file.removeEventListener(DataEvent.UPLOAD_COMPLETE_DATA,file_dataEvent);
            _file.removeEventListener(Event.COMPLETE,file_complete);
            _file.removeEventListener(IOErrorEvent.IO_ERROR,file_error);
            _file.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,file_error);
            _file.removeEventListener(HTTPStatusEvent.HTTP_STATUS,file_error_status);
            _file.removeEventListener(HTTPStatusEvent.HTTP_RESPONSE_STATUS,file_error_status_respo);
            _file.removeEventListener(ProgressEvent.PROGRESS,file_progress);
            _file = null;
         }
         _object = null;
      }
      
      public static function addEventListener(type:String, listener:Function) : void
      {
         _dispatcher.addEventListener(type,listener);
      }
      
      public static function removeEventListener(type:String, listener:Function) : void
      {
         _dispatcher.removeEventListener(type,listener);
      }
      
      public static function hasEventListener(type:String) : Boolean
      {
         return _dispatcher.hasEventListener(type);
      }
   }
}
