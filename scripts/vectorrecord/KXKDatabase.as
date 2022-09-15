package vectorrecord
{
   import com.adobe.air.crypto.EncryptionKeyGenerator;
   import flash.data.SQLConnection;
   import flash.data.SQLMode;
   import flash.data.SQLStatement;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.SQLErrorEvent;
   import flash.events.SQLEvent;
   import flash.filesystem.File;
   
   public class KXKDatabase
   {
      
      public static const DB_FILENAME:String = "frn.kxk";
      
      public static const DB_VERSION:String = "2";
      
      private static var _sqlConnection:SQLConnection;
      
      private static var _createStatus:Boolean;
      
      private static var _fileDB:File;
      
      private static var _keyGenerator:EncryptionKeyGenerator;
      
      private static var _tableCounter:int = 0;
      
      public static var assPath:String;
      
      public static var dbStatus:Boolean = false;
      
      private static var _dispatcher:EventDispatcher = new EventDispatcher();
       
      
      public function KXKDatabase()
      {
         super();
      }
      
      public static function initialize() : void
      {
         trace(KXKDatabase,"initialize");
         dbStatus = false;
         _fileDB = new File(assPath + DB_FILENAME);
         _createStatus = _fileDB.exists;
         connectDB();
      }
      
      public static function connectDB() : void
      {
         trace(KXKDatabase,"connectDB");
         _keyGenerator = new EncryptionKeyGenerator();
         _sqlConnection = new SQLConnection();
         _sqlConnection.addEventListener(SQLEvent.OPEN,openDBHandler);
         _sqlConnection.addEventListener(SQLErrorEvent.ERROR,errorDBHandler);
         _sqlConnection.openAsync(_fileDB,!!_createStatus ? SQLMode.UPDATE : SQLMode.CREATE);
      }
      
      private static function errorDBHandler(event:SQLErrorEvent) : void
      {
         trace(KXKDatabase,"Error message:",event.error.message);
         trace(KXKDatabase,"Details:",event.error.details);
      }
      
      private static function openDBHandler(event:SQLEvent) : void
      {
         runQuery("CREATE TABLE IF NOT EXISTS db_version(" + "version VARCHAR NOT NULL);",sqlResut);
         runQuery("CREATE TABLE IF NOT EXISTS login(" + "mail VARCHAR NOT NULL," + "password VARCHAR NOT NULL " + ");" + "DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci",sqlResut);
         runQuery("CREATE TABLE IF NOT EXISTS area(" + "id INTEGER PRIMARY KEY AUTOINCREMENT," + "areaID INTEGER, " + "name VARCHAR UNIQUE NOT NULL, " + "upload BIT NOT NULL, " + "page INTEGER," + "info VARCHAR" + ");" + "DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci",sqlResut);
         runQuery("CREATE TABLE IF NOT EXISTS area_pre(" + "id INTEGER PRIMARY KEY AUTOINCREMENT," + "areaID INTEGER, " + "data TEXT NOT NULL" + ");" + "DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci",sqlResut);
         runQuery("CREATE TABLE IF NOT EXISTS enrichment(" + "id INTEGER PRIMARY KEY AUTOINCREMENT," + "type VARCHAR NOT NULL," + "data TEXT NOT NULL" + ");" + "DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci",sqlResut);
         runQuery("CREATE TABLE IF NOT EXISTS textfields(" + "data TEXT NOT NULL" + ");" + "DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci",sqlResut);
         runQuery("CREATE TABLE IF NOT EXISTS background(" + "data INTEGER NOT NULL" + ");" + "DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci",sqlResut);
         runQuery("CREATE TABLE IF NOT EXISTS activehomework(" + "id INTEGER PRIMARY KEY AUTOINCREMENT," + "file VARCHAR UNIQUE NOT NULL, " + "upload BIT NOT NULL, " + "page INTEGER," + "pdf_page INTEGER," + "book_name VARCHAR," + "name VARCHAR," + "info VARCHAR," + "start_date VARCHAR," + "end_date VARCHAR," + "x INTEGER," + "y INTEGER," + "width INTEGER," + "height INTEGER" + ");" + "DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci",sqlResut);
      }
      
      private static function sqlResut(e:Object = null) : void
      {
         ++_tableCounter;
         if(_tableCounter != 8)
         {
            return;
         }
         dbStatus = true;
         if(!_createStatus)
         {
            insert_versionData(DB_VERSION);
         }
         _dispatcher.dispatchEvent(new Event(Event.COMPLETE));
      }
      
      public static function runQuery(_query:String, _function:Function = null) : void
      {
         var _ss:SQLStatement = null;
         if(_sqlConnection)
         {
            _ss = new SQLStatement();
            _ss.sqlConnection = _sqlConnection;
            _ss.addEventListener(SQLEvent.RESULT,function():void
            {
               if(_function != null)
               {
                  _function(_ss.getResult().data);
               }
            });
            _ss.text = _query;
            _ss.execute();
         }
      }
      
      public static function insert_versionData(_data:String, _function:Function = null) : void
      {
         runQuery("INSERT INTO db_version VALUES (\'" + _data + "\')",_function);
      }
      
      public static function insert_background(_data:int, _function:Function = null) : void
      {
         runQuery("INSERT INTO background VALUES (\'" + _data + "\')",_function);
      }
      
      public static function get_background(_f:Function = null) : void
      {
         if(!_sqlConnection)
         {
            return;
         }
         runQuery("SELECT * FROM background",_f);
      }
      
      public static function delete_background(_f:Function = null) : void
      {
         if(!_sqlConnection)
         {
            return;
         }
         runQuery("DELETE FROM background",_f);
      }
      
      public static function insertLogin(_mail:String, _password:String, _f:Function = null) : void
      {
         if(!_sqlConnection)
         {
            return;
         }
         runQuery("INSERT INTO login VALUES (\'" + _mail + "\',\'" + _password + "\')",_f);
      }
      
      public static function getLogin(_f:Function = null) : void
      {
         if(!_sqlConnection)
         {
            return;
         }
         runQuery("SELECT * FROM login",_f);
      }
      
      public static function deleteLogin(_f:Function = null) : void
      {
         if(!_sqlConnection)
         {
            return;
         }
         runQuery("DELETE FROM login",_f);
      }
      
      public static function insertData(_data:Object, _f:Function = null) : void
      {
         if(!_sqlConnection)
         {
            return;
         }
         runQuery("INSERT INTO area VALUES (null, " + int(_data.areaID) + ", \'" + String(_data.name) + "\', " + String(_data.upload) + ", " + String(_data.page) + ",\'\')",_f);
      }
      
      public static function updateData(_data:Object, _f:Function = null) : void
      {
         if(!_sqlConnection)
         {
            return;
         }
         runQuery("UPDATE area SET upload=" + String(_data.upload) + " WHERE areaID=" + String(_data.areaID),_f);
      }
      
      public static function getUploadData(_upload:int = 1, _f:Function = null) : void
      {
         if(!_sqlConnection)
         {
            return;
         }
         runQuery("SELECT * FROM area WHERE upload=" + _upload + " ORDER BY areaID ASC LIMIT 1",_f);
      }
      
      public static function existsData(_im:int = -1, _f:Function = null) : void
      {
         if(!_sqlConnection)
         {
            return;
         }
         runQuery("SELECT * FROM area WHERE areaID=" + _im,_f);
      }
      
      public static function deleteData(_data:Object, _f:Function = null) : void
      {
         if(!_sqlConnection)
         {
            return;
         }
         runQuery("DELETE FROM area WHERE areaID=" + String(_data.areaID),_f);
      }
      
      public static function getAllAreaData(_f:Function = null) : void
      {
         if(!_sqlConnection)
         {
            return;
         }
         runQuery("SELECT * FROM area",_f);
      }
      
      public static function insertAh(_data:Object, _f:Function = null) : void
      {
         if(!_sqlConnection)
         {
            return;
         }
         runQuery("INSERT INTO activehomework VALUES (null,\'" + _data.file + "\'," + _data.upload + "," + _data.page + "," + _data.pdf_page + ",\'" + _data.book_name + "\',\'" + _data.name + "\',\'" + _data.info + "\' ,\'" + _data.start_date + "\',\'" + _data.end_date + "\'," + _data.x + "," + _data.y + "," + _data.width + "," + _data.height + ")",_f);
      }
      
      public static function updateAh(_data:Object, _f:Function = null) : void
      {
         if(!_sqlConnection)
         {
            return;
         }
         runQuery("UPDATE activehomework SET upload=" + String(_data.upload) + " WHERE file=\'" + String(_data.file) + "\'",_f);
      }
      
      public static function getUploadAh(_upload:int = 1, _f:Function = null) : void
      {
         if(!_sqlConnection)
         {
            return;
         }
         runQuery("SELECT * FROM activehomework WHERE upload=" + _upload + " ORDER BY id ASC LIMIT 1",_f);
      }
      
      public static function existsAh(_data:Object, _f:Function = null) : void
      {
         if(!_sqlConnection)
         {
            return;
         }
         runQuery("SELECT * FROM activehomework WHERE file=\'" + String(_data.file) + "\'",_f);
      }
      
      public static function deleteAh(_data:Object, _f:Function = null) : void
      {
         if(!_sqlConnection)
         {
            return;
         }
         runQuery("DELETE FROM activehomework WHERE file=\'" + String(_data.file) + "\'",_f);
      }
      
      public static function getAllAh(_f:Function = null) : void
      {
         if(!_sqlConnection)
         {
            return;
         }
         runQuery("SELECT * FROM activehomework",_f);
      }
      
      public static function insertPreData(_data:Object, _f:Function = null) : void
      {
         if(!_sqlConnection)
         {
            return;
         }
         runQuery("INSERT INTO area_pre VALUES (null, " + int(_data.areaID) + ", \'" + String(_data.base64) + "\')",_f);
      }
      
      public static function deletePreData(_im:int = -1, _f:Function = null) : void
      {
         if(!_sqlConnection)
         {
            return;
         }
         runQuery("DELETE FROM area_pre WHERE areaID=" + String(_im),_f);
      }
      
      public static function existsPreData(_im:int = -1, _f:Function = null) : void
      {
         if(!_sqlConnection)
         {
            return;
         }
         runQuery("SELECT * FROM area_pre WHERE areaID=" + _im,_f);
      }
      
      public static function getPreData(_im:int = -1, _f:Function = null) : void
      {
         if(!_sqlConnection)
         {
            return;
         }
         runQuery("SELECT * FROM area_pre WHERE areaID=" + String(_im),_f);
      }
      
      public static function insertEnrichmentData(_type:String, _data:String, _f:Function = null) : void
      {
         if(!_sqlConnection)
         {
            return;
         }
         runQuery("INSERT INTO enrichment VALUES (null, \"" + _type + "\",\"" + _data + "\")",_f);
      }
      
      public static function getEnrichmentData(_where:String, _f:Function = null) : void
      {
         if(!_sqlConnection)
         {
            return;
         }
         runQuery("SELECT * FROM enrichment WHERE type=\'" + _where + "\'",_f);
      }
      
      public static function deleteEnrichmentData(_where:String, _f:Function = null) : void
      {
         if(!_sqlConnection)
         {
            return;
         }
         runQuery("DELETE FROM enrichment WHERE type=\'" + _where + "\'",_f);
      }
      
      public static function insertTextfields(_data:String, _f:Function = null) : void
      {
         if(!_sqlConnection)
         {
            return;
         }
         runQuery("INSERT INTO textfields VALUES (\'" + _data + "\')",_f);
      }
      
      public static function getTextfields(_f:Function = null) : void
      {
         if(!_sqlConnection)
         {
            return;
         }
         runQuery("SELECT * FROM textfields",_f);
      }
      
      public static function deleteTextfields(_f:Function = null) : void
      {
         if(!_sqlConnection)
         {
            return;
         }
         runQuery("DELETE FROM textfields",_f);
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
      
      public static function dispose() : void
      {
         if(_sqlConnection)
         {
            _sqlConnection.addEventListener(SQLEvent.CLOSE,deleteDB);
            _sqlConnection.cancel();
            _sqlConnection.close();
         }
         _createStatus = false;
         dbStatus = false;
         _tableCounter = 0;
      }
      
      private static function deleteDB(e:SQLEvent = null) : void
      {
         trace(KXKDatabase,"db deleted");
         _sqlConnection = null;
         if(_fileDB)
         {
            if(_fileDB.exists)
            {
               _fileDB.deleteFile();
            }
         }
         _fileDB = null;
         _dispatcher.dispatchEvent(new Event(Event.CLOSE));
      }
   }
}
