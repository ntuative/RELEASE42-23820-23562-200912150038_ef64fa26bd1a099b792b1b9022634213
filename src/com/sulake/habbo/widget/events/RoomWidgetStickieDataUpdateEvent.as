package com.sulake.habbo.widget.events
{
   public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_547:String = "RWSDUE_STICKIE_DATA";
       
      
      private var var_190:String;
      
      private var var_665:String;
      
      private var var_1455:String;
      
      private var var_150:int = -1;
      
      private var _controller:Boolean;
      
      public function RoomWidgetStickieDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         var_150 = param2;
         var_1455 = param3;
         var_190 = param4;
         var_665 = param5;
         _controller = param6;
      }
      
      public function get objectType() : String
      {
         return var_1455;
      }
      
      public function get colorHex() : String
      {
         return var_665;
      }
      
      public function get text() : String
      {
         return var_190;
      }
      
      public function get objectId() : int
      {
         return var_150;
      }
      
      public function get controller() : Boolean
      {
         return _controller;
      }
   }
}
