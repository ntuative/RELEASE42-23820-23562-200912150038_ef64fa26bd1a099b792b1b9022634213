package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_819:String = "select_outfit";
       
      
      private var var_2088:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_819);
         var_2088 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_2088;
      }
   }
}
