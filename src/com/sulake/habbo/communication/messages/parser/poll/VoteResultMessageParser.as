package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1159:int;
      
      private var var_985:String;
      
      private var var_622:Array;
      
      private var var_942:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return var_622.slice();
      }
      
      public function flush() : Boolean
      {
         var_985 = "";
         var_942 = [];
         var_622 = [];
         var_1159 = 0;
         return true;
      }
      
      public function get totalVotes() : int
      {
         return var_1159;
      }
      
      public function get question() : String
      {
         return var_985;
      }
      
      public function get choices() : Array
      {
         return var_942.slice();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_985 = param1.readString();
         var_942 = [];
         var_622 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_942.push(param1.readString());
            var_622.push(param1.readInteger());
            _loc3_++;
         }
         var_1159 = param1.readInteger();
         return true;
      }
   }
}
