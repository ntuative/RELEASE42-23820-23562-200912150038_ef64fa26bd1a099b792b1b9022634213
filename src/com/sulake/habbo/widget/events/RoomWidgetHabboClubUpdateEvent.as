package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_206:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2159:Boolean = false;
      
      private var var_2161:int = 0;
      
      private var var_2162:int = 0;
      
      private var var_2160:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_206,param5,param6);
         var_2160 = param1;
         var_2162 = param2;
         var_2161 = param3;
         var_2159 = param4;
      }
      
      public function get pastPeriods() : int
      {
         return var_2161;
      }
      
      public function get periodsLeft() : int
      {
         return var_2162;
      }
      
      public function get daysLeft() : int
      {
         return var_2160;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_2159;
      }
   }
}
