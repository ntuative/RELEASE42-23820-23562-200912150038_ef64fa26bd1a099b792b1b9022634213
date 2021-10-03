package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityStatusMessageParser implements IMessageParser
   {
       
      
      private var var_954:Boolean;
      
      private var var_1252:Boolean;
      
      public function AvailabilityStatusMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_954 = param1.readInteger() > 0;
         var_1252 = param1.readInteger() > 0;
         return true;
      }
      
      public function get isOpen() : Boolean
      {
         return var_954;
      }
      
      public function get onShutDown() : Boolean
      {
         return var_1252;
      }
      
      public function flush() : Boolean
      {
         var_954 = false;
         var_1252 = false;
         return true;
      }
   }
}
