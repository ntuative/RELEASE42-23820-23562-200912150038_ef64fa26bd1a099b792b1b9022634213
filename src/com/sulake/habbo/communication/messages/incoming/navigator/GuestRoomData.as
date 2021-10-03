package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1669:int;
      
      private var var_2045:String;
      
      private var var_2046:int;
      
      private var var_2047:int;
      
      private var var_615:Boolean;
      
      private var var_2028:Boolean;
      
      private var var_405:int;
      
      private var var_1070:String;
      
      private var var_1826:int;
      
      private var var_1071:int;
      
      private var _ownerName:String;
      
      private var var_640:String;
      
      private var var_2044:int;
      
      private var var_2048:RoomThumbnailData;
      
      private var var_1830:Boolean;
      
      private var var_583:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_583 = new Array();
         super();
         var_405 = param1.readInteger();
         var_615 = param1.readBoolean();
         var_640 = param1.readString();
         _ownerName = param1.readString();
         var_1826 = param1.readInteger();
         var_1669 = param1.readInteger();
         var_2044 = param1.readInteger();
         var_1070 = param1.readString();
         var_2046 = param1.readInteger();
         var_1830 = param1.readBoolean();
         var_2047 = param1.readInteger();
         var_1071 = param1.readInteger();
         var_2045 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_583.push(_loc4_);
            _loc3_++;
         }
         var_2048 = new RoomThumbnailData(param1);
         var_2028 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_2044;
      }
      
      public function get roomName() : String
      {
         return var_640;
      }
      
      public function get userCount() : int
      {
         return var_1669;
      }
      
      public function get score() : int
      {
         return var_2047;
      }
      
      public function get eventCreationTime() : String
      {
         return var_2045;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1830;
      }
      
      public function get tags() : Array
      {
         return var_583;
      }
      
      public function get allowPets() : Boolean
      {
         return var_2028;
      }
      
      public function get event() : Boolean
      {
         return var_615;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_583 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1071;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_2046;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_2048;
      }
      
      public function get doorMode() : int
      {
         return var_1826;
      }
      
      public function get flatId() : int
      {
         return var_405;
      }
      
      public function get description() : String
      {
         return var_1070;
      }
   }
}
