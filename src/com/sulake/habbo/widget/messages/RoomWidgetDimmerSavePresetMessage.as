package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_614:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_1681:int;
      
      private var var_1682:int;
      
      private var var_1680:Boolean;
      
      private var var_956:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_614);
         var_1682 = param1;
         var_1681 = param2;
         _color = param3;
         var_956 = param4;
         var_1680 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_1681;
      }
      
      public function get presetNumber() : int
      {
         return var_1682;
      }
      
      public function get brightness() : int
      {
         return var_956;
      }
      
      public function get apply() : Boolean
      {
         return var_1680;
      }
   }
}
