package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityTimeMessageParser implements IMessageParser
   {
       
      
      private var var_954:Boolean;
      
      private var var_1138:int;
      
      public function AvailabilityTimeMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_954 = param1.readInteger() > 0;
         var_1138 = param1.readInteger();
         return true;
      }
      
      public function get isOpen() : Boolean
      {
         return var_954;
      }
      
      public function flush() : Boolean
      {
         var_954 = false;
         var_1138 = 0;
         return true;
      }
      
      public function get minutesUntilChange() : int
      {
         return var_1138;
      }
   }
}
