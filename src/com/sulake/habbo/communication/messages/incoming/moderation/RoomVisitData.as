package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_640:String;
      
      private var var_1988:int;
      
      private var var_1309:Boolean;
      
      private var _roomId:int;
      
      private var var_1989:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1309 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_640 = param1.readString();
         var_1989 = param1.readInteger();
         var_1988 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1309;
      }
      
      public function get roomName() : String
      {
         return var_640;
      }
      
      public function get enterMinute() : int
      {
         return var_1988;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_1989;
      }
   }
}
