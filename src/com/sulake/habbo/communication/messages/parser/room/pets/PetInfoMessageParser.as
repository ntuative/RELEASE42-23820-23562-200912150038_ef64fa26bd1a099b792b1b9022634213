package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1627:int;
      
      private var var_520:String;
      
      private var var_1617:int;
      
      private var var_1748:int;
      
      private var var_1621:int;
      
      private var var_1750:int;
      
      private var _nutrition:int;
      
      private var var_1131:int;
      
      private var var_1749:int;
      
      private var var_1746:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_1625:int;
      
      private var var_1747:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1617;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get maxEnergy() : int
      {
         return var_1750;
      }
      
      public function flush() : Boolean
      {
         var_1131 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return var_1749;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_1746;
      }
      
      public function get maxNutrition() : int
      {
         return var_1747;
      }
      
      public function get figure() : String
      {
         return var_520;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_1748;
      }
      
      public function get petId() : int
      {
         return var_1131;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1131 = param1.readInteger();
         _name = param1.readString();
         var_1617 = param1.readInteger();
         var_1749 = param1.readInteger();
         var_1621 = param1.readInteger();
         var_1746 = param1.readInteger();
         _energy = param1.readInteger();
         var_1750 = param1.readInteger();
         _nutrition = param1.readInteger();
         var_1747 = param1.readInteger();
         var_520 = param1.readString();
         var_1748 = param1.readInteger();
         var_1625 = param1.readInteger();
         var_1627 = param1.readInteger();
         _ownerName = param1.readString();
         return true;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get experience() : int
      {
         return var_1621;
      }
      
      public function get ownerId() : int
      {
         return var_1625;
      }
      
      public function get age() : int
      {
         return var_1627;
      }
   }
}
