package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatMessage extends RoomWidgetMessage
   {
      
      public static const const_119:int = 0;
      
      public static const const_121:int = 1;
      
      public static const const_98:int = 2;
      
      public static const const_660:String = "RWCM_MESSAGE_CHAT";
       
      
      private var var_1198:int = 0;
      
      private var var_1690:String = "";
      
      private var var_190:String = "";
      
      public function RoomWidgetChatMessage(param1:String, param2:String, param3:int = 0, param4:String = "")
      {
         super(param1);
         var_190 = param2;
         var_1198 = param3;
         var_1690 = param4;
      }
      
      public function get recipientName() : String
      {
         return var_1690;
      }
      
      public function get chatType() : int
      {
         return var_1198;
      }
      
      public function get text() : String
      {
         return var_190;
      }
   }
}
