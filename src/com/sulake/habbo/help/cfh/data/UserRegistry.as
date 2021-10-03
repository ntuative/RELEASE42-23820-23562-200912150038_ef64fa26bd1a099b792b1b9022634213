package com.sulake.habbo.help.cfh.data
{
   import com.sulake.core.utils.Map;
   
   public class UserRegistry
   {
      
      private static const const_1043:int = 80;
       
      
      private var var_460:Map;
      
      private var var_640:String = "";
      
      private var var_1172:Array;
      
      public function UserRegistry()
      {
         var_460 = new Map();
         var_1172 = new Array();
         super();
      }
      
      private function addRoomNameForMissing() : void
      {
         var _loc1_:* = null;
         while(false)
         {
            _loc1_ = var_460.getValue(var_1172.shift());
            if(_loc1_ != null)
            {
               _loc1_.roomName = var_640;
            }
         }
      }
      
      public function registerUser(param1:int, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:* = null;
         if(var_460.getValue(param1) != null)
         {
            var_460.remove(param1);
         }
         if(param3)
         {
            _loc4_ = new UserRegistryItem(param1,param2,var_640);
         }
         else
         {
            _loc4_ = new UserRegistryItem(param1,param2);
         }
         if(param3 && var_640 == "")
         {
            var_1172.push(param1);
         }
         var_460.add(param1,_loc4_);
         purgeUserIndex();
      }
      
      public function getRegistry() : Map
      {
         return var_460;
      }
      
      public function unregisterRoom() : void
      {
         var_640 = "";
      }
      
      private function purgeUserIndex() : void
      {
         var _loc1_:int = 0;
         while(var_460.length > const_1043)
         {
            _loc1_ = var_460.getKey(0);
            var_460.remove(_loc1_);
         }
      }
      
      public function registerRoom(param1:String) : void
      {
         var_640 = param1;
         if(var_640 != "")
         {
            addRoomNameForMissing();
         }
      }
   }
}
