package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1659:int;
      
      private var var_1017:int;
      
      private var var_1661:int;
      
      private var var_1658:int;
      
      private var var_1660:int;
      
      private var var_1498:int;
      
      private var var_1657:Boolean;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get offerMaxPrice() : int
      {
         return var_1659;
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_1017;
      }
      
      public function get offerMinPrice() : int
      {
         return var_1658;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get expirationHours() : int
      {
         return var_1660;
      }
      
      public function get tokenBatchSize() : int
      {
         return var_1498;
      }
      
      public function get commission() : int
      {
         return var_1661;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1657;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1657 = param1.readBoolean();
         var_1661 = param1.readInteger();
         var_1017 = param1.readInteger();
         var_1498 = param1.readInteger();
         var_1658 = param1.readInteger();
         var_1659 = param1.readInteger();
         var_1660 = param1.readInteger();
         return true;
      }
   }
}
