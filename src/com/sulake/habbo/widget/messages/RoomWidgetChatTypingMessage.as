package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_537:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_431:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_537);
         var_431 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return var_431;
      }
   }
}
