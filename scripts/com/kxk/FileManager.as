package com.kxk
{
   import flash.desktop.NativeProcess;
   import flash.desktop.NativeProcessStartupInfo;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.NativeProcessExitEvent;
   import flash.events.ProgressEvent;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.utils.ByteArray;
   
   public class FileManager extends EventDispatcher
   {
       
      
      private var _fileStream:FileStream;
      
      private var _file:File;
      
      private var _fileBytes:ByteArray;
      
      private var _nativeProcess:NativeProcess;
      
      private var _nativeProcessStartupInfo:NativeProcessStartupInfo;
      
      private var _zipOutput:String;
      
      public function FileManager()
      {
         super();
      }
      
      public static function moveFileAsync(_path1:String, _path2:String, _complete:Function = null, _error:Function = null) : void
      {
         var _f:* = new File(_path1);
         _f.addEventListener(Event.COMPLETE,function():*
         {
            if(_complete != null)
            {
               _complete();
            }
         });
         _f.addEventListener(IOErrorEvent.IO_ERROR,function():*
         {
            if(_error != null)
            {
               _error();
            }
         });
         _f.moveToAsync(new File(_path2));
      }
      
      public static function deleteFileAsync(_path:String, _func:Function) : void
      {
         var _f:* = new File(_path);
         _f.addEventListener(Event.COMPLETE,function():*
         {
            _func();
         });
         if(_f.exists)
         {
            _f.deleteFileAsync();
         }
         else
         {
            _func();
         }
      }
      
      public static function moveToTrashAsync(_path:String, _func:Function) : void
      {
         var _f:* = new File(_path);
         _f.addEventListener(Event.COMPLETE,function():*
         {
            _func();
         });
         if(_f.exists)
         {
            _f.moveToTrashAsync();
         }
         else
         {
            _func();
         }
      }
      
      public static function deleteFile(_path:String) : void
      {
         var _f:* = new File(_path);
         if(_f.exists)
         {
            _f.deleteFile();
         }
      }
      
      public static function exists(_path:String) : Boolean
      {
         var _f:* = new File(_path);
         if(_f.exists)
         {
            return true;
         }
         return false;
      }
      
      public static function deleteDirectoryAsync(_path:String, _func:Function) : void
      {
         var _f:* = new File(_path);
         _f.addEventListener(Event.COMPLETE,function():*
         {
            _func();
         });
         if(_f.exists)
         {
            try
            {
               _f.deleteDirectoryAsync(true);
            }
            catch(e:*)
            {
               _func();
            }
         }
         else
         {
            _func();
         }
      }
      
      public function unzipFileSFX(_sfxPath:String, _targetFolder:String) : void
      {
         try
         {
            this._nativeProcessStartupInfo = new NativeProcessStartupInfo();
            this._nativeProcessStartupInfo.executable = new File(_sfxPath);
            this._nativeProcessStartupInfo.workingDirectory = new File(_targetFolder);
            this._nativeProcess = new NativeProcess();
            this._nativeProcess.addEventListener(ProgressEvent.STANDARD_ERROR_DATA,this.onErrorData);
            this._nativeProcess.addEventListener(IOErrorEvent.STANDARD_OUTPUT_IO_ERROR,this.error_function);
            this._nativeProcess.addEventListener(IOErrorEvent.STANDARD_ERROR_IO_ERROR,this.error_function);
            this._nativeProcess.addEventListener(ProgressEvent.STANDARD_OUTPUT_DATA,this.output_data);
            this._nativeProcess.addEventListener(NativeProcessExitEvent.EXIT,this.onExit);
            this._nativeProcess.start(this._nativeProcessStartupInfo);
         }
         catch(e:*)
         {
            error_function();
         }
      }
      
      public function unzipFileOnMac(_zipPath:String, _targetFolder:String) : void
      {
         var _executable:File = null;
         var _processArgs:Vector.<String> = new Vector.<String>();
         _executable = new File("/usr/bin/unzip");
         _processArgs.push("-q");
         _processArgs.push("-o");
         _processArgs.push(new File(_zipPath).nativePath);
         _processArgs.push("-d");
         _processArgs.push(new File(_targetFolder).nativePath);
         try
         {
            this._nativeProcessStartupInfo = new NativeProcessStartupInfo();
            this._nativeProcessStartupInfo.executable = _executable;
            this._nativeProcessStartupInfo.arguments = _processArgs;
            this._nativeProcessStartupInfo.workingDirectory = new File(_targetFolder);
            this._nativeProcess = new NativeProcess();
            this._nativeProcess.addEventListener(ProgressEvent.STANDARD_ERROR_DATA,this.onErrorData);
            this._nativeProcess.addEventListener(IOErrorEvent.STANDARD_OUTPUT_IO_ERROR,this.error_function);
            this._nativeProcess.addEventListener(IOErrorEvent.STANDARD_ERROR_IO_ERROR,this.error_function);
            this._nativeProcess.addEventListener(ProgressEvent.STANDARD_OUTPUT_DATA,this.output_data);
            this._nativeProcess.addEventListener(NativeProcessExitEvent.EXIT,this.onExit);
            this._nativeProcess.start(this._nativeProcessStartupInfo);
         }
         catch(e:Error)
         {
            error_function();
         }
      }
      
      private function removeTabsAndNewLines($str:String) : String
      {
         var rex:RegExp = /(\t|\n|\r)/gi;
         return $str.replace(rex,"");
      }
      
      public function onErrorData(event:ProgressEvent) : void
      {
         var str:String = null;
         if(this._nativeProcess)
         {
            if(!this._nativeProcess.running)
            {
               return;
            }
            str = this._nativeProcess.standardError.readUTFBytes(this._nativeProcess.standardError.bytesAvailable);
            this.clearNativeProcess();
         }
      }
      
      public function error_function(e:* = null) : void
      {
         var str:String = null;
         if(this._nativeProcess && e)
         {
            if(!this._nativeProcess.running)
            {
               return;
            }
            str = this._nativeProcess.standardOutput.readUTFBytes(this._nativeProcess.standardOutput.bytesAvailable);
         }
         this.clearNativeProcess();
      }
      
      public function output_data(event:ProgressEvent) : void
      {
         var str:String = null;
         if(this._nativeProcess)
         {
            if(!this._nativeProcess.running)
            {
               return;
            }
            str = this.removeTabsAndNewLines(this._nativeProcess.standardOutput.readUTFBytes(this._nativeProcess.standardOutput.bytesAvailable));
         }
      }
      
      public function clearNativeProcess() : void
      {
         if(this._nativeProcess)
         {
            this._nativeProcess.removeEventListener(ProgressEvent.STANDARD_ERROR_DATA,this.error_function);
            this._nativeProcess.removeEventListener(IOErrorEvent.STANDARD_OUTPUT_IO_ERROR,this.error_function);
            this._nativeProcess.removeEventListener(IOErrorEvent.STANDARD_ERROR_IO_ERROR,this.error_function);
            this._nativeProcess.removeEventListener(ProgressEvent.STANDARD_OUTPUT_DATA,this.output_data);
            if(this._nativeProcess.running)
            {
               this._nativeProcess.exit(true);
            }
            this._nativeProcessStartupInfo = null;
            this._nativeProcess = null;
         }
      }
      
      public function onExit(event:NativeProcessExitEvent) : void
      {
         this._zipOutput = String(event.exitCode);
         this.clearNativeProcess();
         this.exit_zip();
      }
      
      public function exit_zip() : void
      {
         if(this._zipOutput)
         {
            if(this._zipOutput != "0")
            {
               this.zip_error();
            }
            else
            {
               this.dispatchEvent(new Event(Event.COMPLETE));
            }
         }
         else
         {
            this.zip_error();
         }
      }
      
      private function zip_error(e:* = null) : void
      {
         this.fileErrorHandler();
      }
      
      public function writeFile(_path:String, _bytes:ByteArray) : void
      {
         this._fileStream = new FileStream();
         this._file = new File(_path);
         this._fileStream.addEventListener(Event.CLOSE,this.fileWriteCompleteHandler);
         this._fileStream.addEventListener(ProgressEvent.PROGRESS,this.fileProgressHandler);
         this._fileStream.addEventListener(IOErrorEvent.IO_ERROR,this.fileErrorHandler);
         this._fileStream.openAsync(this._file,FileMode.WRITE);
         this._fileStream.writeBytes(_bytes);
         this._fileStream.close();
      }
      
      private function fileWriteCompleteHandler(e:Event) : void
      {
         this.dispatchEvent(new Event(Event.COMPLETE));
         this.dispose();
      }
      
      public function writeUTFFile(_path:String, _string:String) : void
      {
         this.dispose();
         this._file = new File(_path);
         this._fileStream = new FileStream();
         this._fileStream.addEventListener(Event.CLOSE,this.fileWriteCompleteHandler);
         this._fileStream.addEventListener(ProgressEvent.PROGRESS,this.fileProgressHandler);
         this._fileStream.addEventListener(IOErrorEvent.IO_ERROR,this.fileErrorHandler);
         this._fileStream.openAsync(this._file,FileMode.WRITE);
         this._fileStream.writeUTFBytes(_string);
         this._fileStream.close();
      }
      
      public function readFile(_path:String) : void
      {
         this._fileStream = new FileStream();
         this._fileBytes = new ByteArray();
         this._file = new File(_path);
         this._fileStream.addEventListener(Event.COMPLETE,this.fileReadCompleteHandler);
         this._fileStream.addEventListener(ProgressEvent.PROGRESS,this.fileProgressHandler);
         this._fileStream.addEventListener(IOErrorEvent.IO_ERROR,this.fileErrorHandler);
         this._fileStream.openAsync(this._file,FileMode.READ);
         this._fileStream.close();
      }
      
      private function fileReadCompleteHandler(e:Event) : void
      {
         this._fileStream.readBytes(this._fileBytes,0);
         this._fileStream.close();
         this.dispatchEvent(new Event(Event.COMPLETE));
         this.dispose();
      }
      
      private function fileProgressHandler(e:ProgressEvent) : void
      {
      }
      
      private function fileErrorHandler(e:IOErrorEvent = null) : void
      {
         this.dispatchEvent(new IOErrorEvent(IOErrorEvent.IO_ERROR));
      }
      
      public function dispose() : void
      {
         if(this._fileStream)
         {
            this._fileStream.close();
         }
         if(this._file)
         {
            this._file.cancel();
         }
         this._fileStream = null;
         this._file = null;
         this._fileBytes = null;
      }
   }
}
