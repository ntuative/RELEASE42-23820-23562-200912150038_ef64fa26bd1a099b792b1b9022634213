package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_1972:Boolean = false;
      
      private var var_1974:Boolean = false;
      
      private var var_2065:String = "";
      
      private var _type:String = "";
      
      private var var_1973:Boolean = false;
      
      private var var_1569:Number = 0;
      
      private var var_2131:Number = 0;
      
      private var var_2130:Number = 0;
      
      private var var_2129:String = "";
      
      private var var_1568:Number = 0;
      
      private var var_1971:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_2129 = param2;
         var_2065 = param3;
         var_2131 = param4;
         var_2130 = param5;
         var_1569 = param6;
         var_1568 = param7;
         var_1971 = param8;
         var_1974 = param9;
         var_1973 = param10;
         var_1972 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1971;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1972;
      }
      
      public function get localX() : Number
      {
         return var_1569;
      }
      
      public function get localY() : Number
      {
         return var_1568;
      }
      
      public function get canvasId() : String
      {
         return var_2129;
      }
      
      public function get altKey() : Boolean
      {
         return var_1974;
      }
      
      public function get spriteTag() : String
      {
         return var_2065;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_2131;
      }
      
      public function get screenY() : Number
      {
         return var_2130;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1973;
      }
   }
}
