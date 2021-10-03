package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2008:int;
      
      private var var_2005:int;
      
      private var var_901:String;
      
      private var var_1535:int;
      
      private var var_2006:String;
      
      private var var_2009:int;
      
      private var var_2004:int;
      
      private var _category:int;
      
      private var var_2007:int;
      
      private var var_2011:int;
      
      private var var_2010:int;
      
      private var var_2003:Boolean;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:Boolean, param12:int)
      {
         super();
         var_1535 = param1;
         var_901 = param2;
         var_2005 = param3;
         var_2010 = param4;
         _category = param5;
         var_2006 = param6;
         var_2009 = param7;
         var_2008 = param8;
         var_2011 = param9;
         var_2004 = param10;
         var_2003 = param11;
         var_2007 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_2010;
      }
      
      public function get groupable() : Boolean
      {
         return var_2003;
      }
      
      public function get creationMonth() : int
      {
         return var_2011;
      }
      
      public function get roomItemID() : int
      {
         return var_2005;
      }
      
      public function get itemType() : String
      {
         return var_901;
      }
      
      public function get itemID() : int
      {
         return var_1535;
      }
      
      public function get itemSpecificData() : String
      {
         return var_2006;
      }
      
      public function get songID() : int
      {
         return var_2007;
      }
      
      public function get timeToExpiration() : int
      {
         return var_2009;
      }
      
      public function get creationYear() : int
      {
         return var_2004;
      }
      
      public function get creationDay() : int
      {
         return var_2008;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
