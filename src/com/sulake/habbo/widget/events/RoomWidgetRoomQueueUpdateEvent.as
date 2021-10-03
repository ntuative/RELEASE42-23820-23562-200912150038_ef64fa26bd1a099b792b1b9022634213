package com.sulake.habbo.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_472:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
      
      public static const const_329:String = "RWRQUE_VISITOR_QUEUE_STATUS";
       
      
      private var var_732:int;
      
      private var var_249:Boolean;
      
      private var var_1527:Boolean;
      
      private var var_1476:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_732 = param2;
         var_1527 = param3;
         var_249 = param4;
         var_1476 = param5;
      }
      
      public function get position() : int
      {
         return var_732;
      }
      
      public function get isActive() : Boolean
      {
         return var_249;
      }
      
      public function get isClubQueue() : Boolean
      {
         return var_1476;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return var_1527;
      }
   }
}
