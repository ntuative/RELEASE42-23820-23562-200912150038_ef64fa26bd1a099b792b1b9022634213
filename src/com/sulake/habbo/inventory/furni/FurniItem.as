package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1711:int;
      
      private var var_1983:Boolean;
      
      private var var_1980:int;
      
      private var var_1982:String;
      
      private var var_2064:Boolean = false;
      
      private var var_1986:int;
      
      private var var_417:int;
      
      private var var_901:String;
      
      private var var_1792:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1207:int;
      
      private var var_1984:Boolean;
      
      private var var_2063:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_1711 = param1;
         var_901 = param2;
         _objId = param3;
         var_1207 = param4;
         var_1982 = param5;
         var_1983 = param6;
         var_1984 = param7;
         var_1986 = param8;
         var_1792 = param9;
         var_1980 = param10;
         var_417 = -1;
      }
      
      public function get songId() : int
      {
         return var_1980;
      }
      
      public function get iconCallbackId() : int
      {
         return var_417;
      }
      
      public function get expiryTime() : int
      {
         return var_1986;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_2063 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_2064 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_417 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1984;
      }
      
      public function get slotId() : String
      {
         return var_1792;
      }
      
      public function get classId() : int
      {
         return var_1207;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1983;
      }
      
      public function get stuffData() : String
      {
         return var_1982;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_1711;
      }
      
      public function get isLocked() : Boolean
      {
         return var_2064;
      }
      
      public function get prevCallbackId() : int
      {
         return var_2063;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_901;
      }
   }
}
