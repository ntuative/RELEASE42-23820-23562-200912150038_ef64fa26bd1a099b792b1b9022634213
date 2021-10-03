package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_661:String = "RWOCM_CLUB_MAIN";
      
      public static const const_640:String = "RWGOI_MESSAGE_OPEN_CATALOG";
       
      
      private var var_1592:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_640);
         var_1592 = param1;
      }
      
      public function get pageKey() : String
      {
         return var_1592;
      }
   }
}
