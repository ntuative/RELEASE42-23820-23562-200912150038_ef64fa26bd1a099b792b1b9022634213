package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1217:int;
      
      private var var_1171:int;
      
      private var var_1216:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function get messageId() : int
      {
         return var_1217;
      }
      
      public function flush() : Boolean
      {
         var_1171 = 0;
         var_1217 = 0;
         var_1216 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1171;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1217 = param1.readInteger();
         var_1171 = param1.readInteger();
         var_1216 = param1.readString();
         return true;
      }
      
      public function get timestamp() : String
      {
         return var_1216;
      }
   }
}
