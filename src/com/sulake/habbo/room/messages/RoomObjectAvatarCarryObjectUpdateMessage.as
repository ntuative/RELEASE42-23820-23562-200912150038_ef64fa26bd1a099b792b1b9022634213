package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_901:int;
      
      private var var_1095:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_901 = param1;
         var_1095 = param2;
      }
      
      public function get itemType() : int
      {
         return var_901;
      }
      
      public function get itemName() : String
      {
         return var_1095;
      }
   }
}
