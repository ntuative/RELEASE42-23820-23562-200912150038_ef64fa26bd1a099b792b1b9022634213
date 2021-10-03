package com.sulake.habbo.inventory.items
{
   public class WallItem implements IItem
   {
       
      
      protected var _id:int;
      
      protected var var_1296:String;
      
      protected var var_2173:Boolean;
      
      protected var var_2170:int;
      
      protected var _type:int;
      
      protected var _category:int;
      
      protected var var_2003:Boolean;
      
      protected var var_2171:Boolean;
      
      protected var var_2169:Boolean;
      
      protected var var_2172:Boolean;
      
      public function WallItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String)
      {
         super();
         _id = param1;
         _type = param2;
         var_2170 = param3;
         _category = param4;
         var_2003 = param5;
         var_2172 = param6;
         var_2173 = param7;
         var_2169 = param8;
         var_1296 = param9;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function set extras(param1:String) : void
      {
         var_1296 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get locked() : Boolean
      {
         return var_2171;
      }
      
      public function get tradeable() : Boolean
      {
         return var_2172;
      }
      
      public function get sellable() : Boolean
      {
         return var_2169;
      }
      
      public function get ref() : int
      {
         return var_2170;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get extras() : String
      {
         return var_1296;
      }
      
      public function get recyclable() : Boolean
      {
         return var_2173;
      }
      
      public function get groupable() : Boolean
      {
         return var_2003;
      }
      
      public function set locked(param1:Boolean) : void
      {
         var_2171 = param1;
      }
   }
}
