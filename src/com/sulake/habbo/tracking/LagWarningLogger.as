package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LagWarningReportMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LagWarningLogger
   {
      
      public static const const_938:int = 0;
      
      public static const WARNING_TYPE_CHAT_DELAY:int = 1;
       
      
      private var var_1205:Boolean = true;
      
      private var var_1168:int = 0;
      
      private var var_849:int = 0;
      
      private var var_1167:int = 0;
      
      private var var_848:int = 0;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_1169:int = 15;
      
      private var var_170:IHabboConfigurationManager;
      
      private var _connection:IConnection;
      
      private var var_1170:int = 60;
      
      public function LagWarningLogger()
      {
         super();
         var_1167 = getTimer();
      }
      
      public function logWarnings() : void
      {
         if(!var_1205)
         {
            return;
         }
         if(nothingToReport)
         {
            return;
         }
         var _loc1_:LagWarningReportMessageComposer = new LagWarningReportMessageComposer(var_849,var_848);
         if(_connection != null)
         {
            _connection.send(_loc1_);
         }
         resetLog();
         ++var_1168;
      }
      
      private function get nothingToReport() : Boolean
      {
         return var_849 == 0 && var_848 == 0;
      }
      
      private function resetLog() : void
      {
         var_849 = 0;
         var_848 = 0;
      }
      
      public function update(param1:uint) : void
      {
         if(!var_1205)
         {
            return;
         }
         if(getTimer() - var_1167 > var_1170 * 1000 && var_1168 < var_1169)
         {
            var_1167 = getTimer();
            logWarnings();
         }
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_170 = param1;
         var_1170 = int(var_170.getKey("lagwarninglog.interval","60"));
         var_1169 = int(var_170.getKey("lagwarninglog.reportlimit","15"));
         var_1205 = Boolean(int(var_170.getKey("lagwarninglog.enabled","1")));
      }
      
      public function registerWarning(param1:int) : void
      {
         switch(param1)
         {
            case WARNING_TYPE_CHAT_DELAY:
               var_848 += 1;
            case const_938:
               var_849 += 1;
         }
      }
      
      public function set communication(param1:IHabboCommunicationManager) : void
      {
         _communication = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
