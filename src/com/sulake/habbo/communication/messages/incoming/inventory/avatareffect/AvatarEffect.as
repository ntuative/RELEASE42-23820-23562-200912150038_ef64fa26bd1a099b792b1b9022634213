package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect
{
   public class AvatarEffect
   {
       
      
      private var var_2052:int;
      
      private var var_1097:int;
      
      private var _type:int;
      
      private var var_2051:int;
      
      public function AvatarEffect()
      {
         super();
      }
      
      public function get inactiveEffectsInInventory() : int
      {
         return var_2051;
      }
      
      public function set secondsLeftIfActive(param1:int) : void
      {
         var_2052 = param1;
      }
      
      public function get duration() : int
      {
         return var_1097;
      }
      
      public function set inactiveEffectsInInventory(param1:int) : void
      {
         var_2051 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1097 = param1;
      }
      
      public function get secondsLeftIfActive() : int
      {
         return var_2052;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
   }
}
