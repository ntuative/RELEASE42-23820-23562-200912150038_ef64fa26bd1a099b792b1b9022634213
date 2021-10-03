package com.sulake.habbo.widget.messages
{
   public class RoomWidgetFurniActionMessage extends RoomWidgetMessage
   {
      
      public static const const_247:String = "RWFAM_MOVE";
      
      public static const const_525:String = "RWFUAM_ROTATE";
      
      public static const const_652:String = "RWFAM_PICKUP";
       
      
      private var var_1635:int = 0;
      
      private var var_1991:int = 0;
      
      public function RoomWidgetFurniActionMessage(param1:String, param2:int, param3:int)
      {
         super(param1);
         var_1635 = param2;
         var_1991 = param3;
      }
      
      public function get furniId() : int
      {
         return var_1635;
      }
      
      public function get furniCategory() : int
      {
         return var_1991;
      }
   }
}
