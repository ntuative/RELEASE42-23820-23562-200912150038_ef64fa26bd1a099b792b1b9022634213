package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1618:String;
      
      private var var_520:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_520 = param1;
         var_1618 = param2;
      }
      
      public function get race() : String
      {
         return var_1618;
      }
      
      public function get figure() : String
      {
         return var_520;
      }
   }
}
