package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1405:GarbageMonitor = null;
      
      private var var_1167:int = 0;
      
      private var var_1212:Boolean = false;
      
      private var var_1835:String = "";
      
      private var var_1404:String = "";
      
      private var var_324:Number = 0;
      
      private var var_1169:int = 10;
      
      private var var_2212:Array;
      
      private var var_584:int = 0;
      
      private var var_1170:int = 60;
      
      private var var_948:int = 0;
      
      private var var_947:int = 0;
      
      private var var_1967:String = "";
      
      private var var_1838:Number = 0;
      
      private var var_1166:int = 1000;
      
      private var var_1837:Boolean = true;
      
      private var var_1839:Number = 0.15;
      
      private var var_170:IHabboConfigurationManager = null;
      
      private var var_1836:String = "";
      
      private var var_1168:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         var_2212 = [];
         super();
         var_1404 = Capabilities.version;
         var_1835 = Capabilities.os;
         var_1212 = Capabilities.isDebugger;
         var_1836 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         var_1405 = new GarbageMonitor();
         updateGarbageMonitor();
         var_1167 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1405.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_1405.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return var_324;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         var_1170 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return var_1404;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++var_947;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > var_1166)
         {
            ++var_948;
            _loc3_ = true;
         }
         else
         {
            ++var_584;
            if(var_584 <= 1)
            {
               var_324 = param1;
            }
            else
            {
               _loc4_ = Number(var_584);
               var_324 = var_324 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - var_1167 > var_1170 * 1000 && var_1168 < var_1169)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / var_324);
            _loc5_ = true;
            if(var_1837 && var_1168 > 0)
            {
               _loc6_ = differenceInPercents(var_1838,var_324);
               if(_loc6_ < var_1839)
               {
                  _loc5_ = false;
               }
            }
            var_1167 = getTimer();
            if(_loc5_ || _loc3_)
            {
               var_1838 = var_324;
               if(sendReport())
               {
                  ++var_1168;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         var_1169 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         var_1166 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,var_1836,var_1404,var_1835,var_1967,var_1212,_loc4_,_loc3_,var_947,var_324,var_948);
            _connection.send(_loc1_);
            var_947 = 0;
            var_324 = 0;
            var_584 = 0;
            var_948 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_170 = param1;
         var_1170 = int(var_170.getKey("performancetest.interval","60"));
         var_1166 = int(var_170.getKey("performancetest.slowupdatelimit","1000"));
         var_1169 = int(var_170.getKey("performancetest.reportlimit","10"));
         var_1839 = Number(var_170.getKey("performancetest.distribution.deviancelimit.percent","10"));
         var_1837 = Boolean(int(var_170.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
