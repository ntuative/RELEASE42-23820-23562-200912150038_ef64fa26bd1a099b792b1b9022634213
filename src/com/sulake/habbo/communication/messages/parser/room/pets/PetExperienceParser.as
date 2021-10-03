package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetExperienceParser implements IMessageParser
   {
       
      
      private var var_1607:int = 0;
      
      private var _roomId:int = 0;
      
      private var _petRoomIndex:int = -1;
      
      private var var_1131:int = -1;
      
      private var _roomCategory:int = 0;
      
      public function PetExperienceParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1131 = param1.readInteger();
         _petRoomIndex = param1.readInteger();
         var_1607 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get gainedExperience() : int
      {
         return var_1607;
      }
      
      public function get petRoomIndex() : int
      {
         return _petRoomIndex;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get petId() : int
      {
         return var_1131;
      }
   }
}