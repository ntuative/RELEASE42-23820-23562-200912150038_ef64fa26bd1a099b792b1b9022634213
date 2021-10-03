package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectEffectMessage extends RoomWidgetMessage
   {
      
      public static const const_693:String = "RWCM_MESSAGE_SELECT_EFFECT";
      
      public static const const_644:String = "RWCM_MESSAGE_UNSELECT_EFFECT";
      
      public static const const_711:String = "RWCM_MESSAGE_UNSELECT_ALL_EFFECTS";
       
      
      private var var_1953:int;
      
      public function RoomWidgetSelectEffectMessage(param1:String, param2:int = -1)
      {
         super(param1);
         var_1953 = param2;
      }
      
      public function get effectType() : int
      {
         return var_1953;
      }
   }
}
