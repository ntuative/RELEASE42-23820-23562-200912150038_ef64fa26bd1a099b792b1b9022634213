package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_1525:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1439:String = "ROE_MOUSE_ENTER";
      
      public static const const_448:String = "ROE_MOUSE_MOVE";
      
      public static const const_1414:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_195:String = "ROE_MOUSE_CLICK";
      
      public static const const_407:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1973:Boolean;
      
      private var var_1972:Boolean;
      
      private var var_1974:Boolean;
      
      private var var_1971:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param2,param3,param8,param9);
         var_1974 = param4;
         var_1971 = param5;
         var_1973 = param6;
         var_1972 = param7;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1972;
      }
      
      public function get altKey() : Boolean
      {
         return var_1974;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1971;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1973;
      }
   }
}
