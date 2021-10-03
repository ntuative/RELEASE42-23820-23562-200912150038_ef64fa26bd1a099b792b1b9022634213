package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_122:DisplayObject;
      
      private var var_2220:uint;
      
      private var var_807:IWindowToolTipAgentService;
      
      private var var_808:IWindowMouseScalingService;
      
      private var var_397:IWindowContext;
      
      private var var_810:IWindowFocusManagerService;
      
      private var var_809:IWindowMouseListenerService;
      
      private var var_806:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2220 = 0;
         var_122 = param2;
         var_397 = param1;
         var_806 = new WindowMouseDragger(param2);
         var_808 = new WindowMouseScaler(param2);
         var_809 = new WindowMouseListener(param2);
         var_810 = new FocusManager(param2);
         var_807 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_808;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_810;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_807;
      }
      
      public function dispose() : void
      {
         if(var_806 != null)
         {
            var_806.dispose();
            var_806 = null;
         }
         if(var_808 != null)
         {
            var_808.dispose();
            var_808 = null;
         }
         if(var_809 != null)
         {
            var_809.dispose();
            var_809 = null;
         }
         if(var_810 != null)
         {
            var_810.dispose();
            var_810 = null;
         }
         if(var_807 != null)
         {
            var_807.dispose();
            var_807 = null;
         }
         var_397 = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_809;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_806;
      }
   }
}
