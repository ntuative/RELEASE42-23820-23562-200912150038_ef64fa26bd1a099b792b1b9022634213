package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2104:int;
      
      private var var_1246:String;
      
      private var var_2102:int;
      
      private var var_2105:int;
      
      private var var_2101:int;
      
      private var var_2103:Boolean;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function get productName() : String
      {
         return var_1246;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_2103;
      }
      
      public function get responseType() : int
      {
         return var_2105;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_2102;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1246 = param1.readString();
         var_2102 = param1.readInteger();
         var_2104 = param1.readInteger();
         var_2101 = param1.readInteger();
         var_2105 = param1.readInteger();
         var_2103 = param1.readBoolean();
         return true;
      }
      
      public function get memberPeriods() : int
      {
         return var_2104;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_2101;
      }
   }
}
