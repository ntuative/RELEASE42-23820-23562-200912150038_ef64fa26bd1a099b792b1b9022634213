package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_2076:String;
      
      private var var_771:String;
      
      public function RoomObjectAvatarPostureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_2076 = param1;
         var_771 = param2;
      }
      
      public function get postureType() : String
      {
         return var_2076;
      }
      
      public function get parameter() : String
      {
         return var_771;
      }
   }
}
