package com.sulake.habbo.widget.messages
{
   public class RoomWidgetPresentOpenedMessage extends RoomWidgetMessage
   {
      
      public static const const_1307:String = "RWPOMD_PRESENT_OPENED";
       
      
      private var var_1207:int;
      
      private var var_901:String;
      
      public function RoomWidgetPresentOpenedMessage(param1:String, param2:String, param3:int)
      {
         super(param1);
         var_901 = param2;
         var_1207 = param3;
      }
      
      public function get classId() : int
      {
         return var_1207;
      }
      
      public function get itemType() : String
      {
         return var_901;
      }
   }
}
