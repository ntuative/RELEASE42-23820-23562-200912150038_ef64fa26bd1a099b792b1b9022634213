package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_145:int = 1;
      
      public static const const_1252:int = 3;
      
      public static const const_411:int = 2;
       
      
      private var var_1774:int;
      
      private var var_1770:int;
      
      private var var_1779:int;
      
      private var var_1768:int;
      
      private var _state:int;
      
      private var var_405:int;
      
      private var var_1279:int;
      
      private var var_1528:int;
      
      private var var_979:int;
      
      private var _roomResources:String;
      
      private var var_1776:int;
      
      private var var_1769:int;
      
      private var var_1772:String;
      
      private var var_1773:String;
      
      private var var_1775:int = 0;
      
      private var var_1211:String;
      
      private var _message:String;
      
      private var var_1771:int;
      
      private var var_1778:String;
      
      private var var_1071:int;
      
      private var var_640:String;
      
      private var var_1777:String;
      
      private var var_1388:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_979 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         var_1775 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return var_1769;
      }
      
      public function set roomName(param1:String) : void
      {
         var_640 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         var_1776 = param1;
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      public function get roomResources() : String
      {
         return _roomResources;
      }
      
      public function set roomResources(param1:String) : void
      {
         _roomResources = param1;
      }
      
      public function get roomName() : String
      {
         return var_640;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function set worldId(param1:int) : void
      {
         var_1768 = param1;
      }
      
      public function set state(param1:int) : void
      {
         _state = param1;
      }
      
      public function get unitPort() : int
      {
         return var_1770;
      }
      
      public function get priority() : int
      {
         return var_1774 + var_1775;
      }
      
      public function set issueId(param1:int) : void
      {
         var_1528 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return var_1773;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - var_1388) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return var_1071;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         var_1769 = param1;
      }
      
      public function get roomType() : int
      {
         return var_1279;
      }
      
      public function set flatType(param1:String) : void
      {
         var_1772 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return var_1776;
      }
      
      public function set message(param1:String) : void
      {
         _message = param1;
      }
      
      public function get worldId() : int
      {
         return var_1768;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         var_1777 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1211 = param1;
      }
      
      public function get issueId() : int
      {
         return var_1528;
      }
      
      public function set priority(param1:int) : void
      {
         var_1774 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         var_1770 = param1;
      }
      
      public function get flatType() : String
      {
         return var_1772;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         var_1779 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         var_1773 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         var_1771 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1211;
      }
      
      public function set roomType(param1:int) : void
      {
         var_1279 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return var_1779;
      }
      
      public function set flatId(param1:int) : void
      {
         var_405 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1071 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_1388 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return var_1771;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         var_1778 = param1;
      }
      
      public function get timeStamp() : int
      {
         return var_1388;
      }
      
      public function get reportedUserId() : int
      {
         return var_979;
      }
      
      public function get flatId() : int
      {
         return var_405;
      }
      
      public function get flatOwnerName() : String
      {
         return var_1777;
      }
      
      public function get reporterUserName() : String
      {
         return var_1778;
      }
   }
}
