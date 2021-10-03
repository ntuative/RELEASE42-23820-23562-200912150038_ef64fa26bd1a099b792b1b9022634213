package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_929:PetData;
      
      private var var_1378:Boolean;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1378 = param1.readBoolean();
         var_929 = new PetData(param1);
         Logger.log("Got PetReceived: " + var_1378 + ", " + var_929.id + ", " + var_929.name + ", " + pet.figure + ", " + var_929.type);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return var_1378;
      }
      
      public function get pet() : PetData
      {
         return var_929;
      }
   }
}
