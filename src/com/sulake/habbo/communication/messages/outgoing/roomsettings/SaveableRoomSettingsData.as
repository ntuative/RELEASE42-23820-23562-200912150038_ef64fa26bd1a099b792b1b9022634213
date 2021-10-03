package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var var_2029:Boolean;
      
      private var var_2027:Array;
      
      private var var_2028:Boolean;
      
      private var var_1070:String;
      
      private var var_1829:Boolean;
      
      private var var_2030:int;
      
      private var var_1826:int;
      
      private var var_1071:int;
      
      private var var_1827:Boolean;
      
      private var _roomId:int;
      
      private var var_1830:Boolean;
      
      private var _name:String;
      
      private var _password:String;
      
      private var var_583:Array;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_2029 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return var_2030;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_2030 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get tags() : Array
      {
         return var_583;
      }
      
      public function get password() : String
      {
         return _password;
      }
      
      public function get allowPets() : Boolean
      {
         return var_2028;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1830;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_2027 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_583 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_2029;
      }
      
      public function set password(param1:String) : void
      {
         _password = param1;
      }
      
      public function get categoryId() : int
      {
         return var_1071;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_2028 = param1;
      }
      
      public function set allowTrading(param1:Boolean) : void
      {
         var_1830 = param1;
      }
      
      public function set showOwnerName(param1:Boolean) : void
      {
         var_1827 = param1;
      }
      
      public function set allowFurniMoving(param1:Boolean) : void
      {
         var_1829 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_2027;
      }
      
      public function get showOwnerName() : Boolean
      {
         return var_1827;
      }
      
      public function get allowFurniMoving() : Boolean
      {
         return var_1829;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1826 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_1826;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1071 = param1;
      }
      
      public function set description(param1:String) : void
      {
         var_1070 = param1;
      }
      
      public function get description() : String
      {
         return var_1070;
      }
   }
}
