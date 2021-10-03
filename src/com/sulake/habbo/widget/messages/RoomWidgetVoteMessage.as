package com.sulake.habbo.widget.messages
{
   public class RoomWidgetVoteMessage extends RoomWidgetMessage
   {
      
      public static const const_118:String = "RWVM_VOTE_MESSAGE";
       
      
      private var var_1102:int;
      
      public function RoomWidgetVoteMessage(param1:int)
      {
         super(const_118);
         var_1102 = param1;
      }
      
      public function get vote() : int
      {
         return var_1102;
      }
   }
}
