package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_890:String = "inventory_badges";
      
      public static const const_1138:String = "inventory_clothes";
      
      public static const const_1330:String = "inventory_furniture";
      
      public static const const_617:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_875:String = "inventory_effects";
       
      
      private var var_1673:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_617);
         var_1673 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_1673;
      }
   }
}
