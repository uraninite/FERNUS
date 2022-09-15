package mx.resources
{
   import flash.utils.getDefinitionByName;
   import mx.core.Singleton;
   import mx.utils.PerfUtil;
   
   public class ResourceManager
   {
      
      private static var implClassDependency:ResourceManagerImpl;
      
      private static var instance:IResourceManager;
       
      
      public function ResourceManager()
      {
         super();
      }
      
      public static function getInstance() : IResourceManager
      {
         var perfUtil:PerfUtil = null;
         if(!instance)
         {
            perfUtil = PerfUtil.getInstance();
            perfUtil.markTime("ResourceManager.getInstance().start");
            if(!Singleton.getClass("mx.resources::IResourceManager"))
            {
               Singleton.registerClass("mx.resources::IResourceManager",Class(getDefinitionByName("mx.resources::ResourceManagerImpl")));
            }
            try
            {
               instance = IResourceManager(Singleton.getInstance("mx.resources::IResourceManager"));
            }
            catch(e:Error)
            {
            }
            if(!instance)
            {
               instance = new ResourceManagerImpl();
            }
            perfUtil.markTime("ResourceManager.getInstance().end");
         }
         return instance;
      }
   }
}
