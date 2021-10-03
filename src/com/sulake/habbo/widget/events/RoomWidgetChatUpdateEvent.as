package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetChatUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_121:int = 1;
      
      public static const const_257:int = 4;
      
      public static const const_221:int = 3;
      
      public static const const_119:int = 0;
      
      public static const const_701:String = "RWCUE_EVENT_CHAT";
      
      public static const const_98:int = 2;
       
      
      private var var_1907:int;
      
      private var var_190:String = "";
      
      private var var_1908:BitmapData;
      
      private var _userName:String;
      
      private var var_1198:int = 0;
      
      private var var_1909:uint;
      
      private var _userId:int = 0;
      
      private var _roomCategory:int;
      
      private var var_1906:Number;
      
      private var var_1910:Number;
      
      private var _roomId:int;
      
      public function RoomWidgetChatUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:int, param6:Number, param7:Number, param8:BitmapData, param9:uint, param10:int, param11:int, param12:int = 0, param13:Boolean = false, param14:Boolean = false)
      {
         super(param1,param13,param14);
         _userId = param2;
         var_190 = param3;
         var_1198 = param12;
         _userName = param4;
         var_1907 = param5;
         var_1906 = param6;
         var_1910 = param7;
         var_1908 = param8;
         var_1909 = param9;
         _roomId = param10;
         _roomCategory = param11;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get userImage() : BitmapData
      {
         return var_1908;
      }
      
      public function get text() : String
      {
         return var_190;
      }
      
      public function get userX() : Number
      {
         return var_1906;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
      
      public function get userCategory() : int
      {
         return var_1907;
      }
      
      public function get chatType() : int
      {
         return var_1198;
      }
      
      public function get userColor() : uint
      {
         return var_1909;
      }
      
      public function get userY() : Number
      {
         return var_1910;
      }
   }
}
