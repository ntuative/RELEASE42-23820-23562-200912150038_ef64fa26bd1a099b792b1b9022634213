package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CanCreateRoomMessageParser implements IMessageParser
   {
      
      public static const const_1540:int = 0;
      
      public static const const_1521:int = 1;
       
      
      private var var_2241:int;
      
      private var var_1191:int;
      
      public function CanCreateRoomMessageParser()
      {
         super();
      }
      
      public function get roomLimit() : int
      {
         return var_2241;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1191 = param1.readInteger();
         this.var_2241 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get resultCode() : int
      {
         return var_1191;
      }
   }
}
