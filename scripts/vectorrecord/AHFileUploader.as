package vectorrecord
{
   import com.greensock.TweenMax;
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
   
   public class AHFileUploader extends EventDispatcher
   {
      
      private static var _isUploading:Boolean = false;
      
      private static var _object:Object;
      
      private static var _file:File;
      
      public static var assPath:String;
      
      public static var url:String;
       
      
      public var onError:Function;
      
      public var onComplete:Function;
      
      public var onProgress:Function;
      
      public function AHFileUploader()
      {
         this.onError = new Function();
         this.onComplete = new Function();
         this.onProgress = new Function();
         super();
      }
      
      public function start(_o:Object) : void
      {
         var _urlRequest:URLRequest = null;
         var authHeader2:URLRequestHeader = null;
         var authHeader3:URLRequestHeader = null;
         var authHeader4:URLRequestHeader = null;
         var authHeader5:URLRequestHeader = null;
         var headers:Array = null;
         var _urlVariables:URLVariables = null;
         _object = _o;
         _file = null;
         _file = new File(assPath + _object.file);
         if(_file.exists)
         {
            _isUploading = true;
            _file.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA,this.file_dataEvent);
            _file.addEventListener(Event.COMPLETE,this.file_complete);
            _file.addEventListener(IOErrorEvent.IO_ERROR,this.file_error);
            _file.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.file_error);
            _file.addEventListener(HTTPStatusEvent.HTTP_STATUS,this.file_error_status);
            _file.addEventListener(HTTPStatusEvent.HTTP_RESPONSE_STATUS,this.file_error_status_respo);
            _file.addEventListener(ProgressEvent.PROGRESS,this.file_progress);
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
            _urlVariables.action = "activehomework_upload";
            _urlVariables.token = User.token;
            _urlVariables.file = _object.file;
            _urlVariables.page = _object.page;
            _urlVariables.pdf_page = _object.pdf_page;
            _urlVariables.book_name = _object.book_name;
            _urlVariables.name = _object.name;
            _urlVariables.info = _object.info;
            _urlVariables.end_date = _object.end_date;
            _urlVariables.x = _object.x;
            _urlVariables.y = _object.y;
            _urlVariables.width = _object.width;
            _urlVariables.height = _object.height;
            _urlVariables.date_sort = _object.date_sort;
            _urlRequest.data = _urlVariables;
            _urlRequest.method = URLRequestMethod.POST;
            _file.upload(_urlRequest);
         }
         else
         {
            this.onError("Ödev kaydedilirken hata oluştu. Lütfen tekrar deneyin.");
         }
      }
      
      private function file_error_status_respo(e:HTTPStatusEvent) : void
      {
         trace(e.status);
      }
      
      private function file_error_status(e:HTTPStatusEvent) : void
      {
         trace(e.status + "---" + String(e));
      }
      
      private function file_complete(e:Event) : void
      {
         trace("file uploaded");
      }
      
      private function file_progress(e:ProgressEvent) : void
      {
         this.onProgress(Math.floor(100 * (e.bytesLoaded / e.bytesTotal)));
      }
      
      private function file_dataEvent(e:DataEvent) : void
      {
         var _d:Object = null;
         trace("server response");
         try
         {
            _d = JSON.parse(e.data);
            if(_d.status)
            {
               this.disposeAllData();
               this.onComplete(_d);
            }
            else
            {
               this.disposeAllData();
               this.onError(_d.error);
            }
         }
         catch(e:*)
         {
            file_error();
         }
      }
      
      private function file_error(e:* = null) : void
      {
         this.disposeAllData();
         this.onError("Ödev kaydedilirken hata oluştu. Lütfen tekrar deneyin.");
      }
      
      public function disposeAllData() : void
      {
         TweenMax.killDelayedCallsTo(this.start);
         _isUploading = false;
         if(_file)
         {
            _file.cancel();
            _file.removeEventListener(DataEvent.UPLOAD_COMPLETE_DATA,this.file_dataEvent);
            _file.removeEventListener(Event.COMPLETE,this.file_complete);
            _file.removeEventListener(IOErrorEvent.IO_ERROR,this.file_error);
            _file.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.file_error);
            _file.removeEventListener(HTTPStatusEvent.HTTP_STATUS,this.file_error_status);
            _file.removeEventListener(HTTPStatusEvent.HTTP_RESPONSE_STATUS,this.file_error_status_respo);
            _file.removeEventListener(ProgressEvent.PROGRESS,this.file_progress);
            _file = null;
         }
         _object = null;
      }
   }
}
