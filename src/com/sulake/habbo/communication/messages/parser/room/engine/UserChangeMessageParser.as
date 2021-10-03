package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserChangeMessageParser implements IMessageParser
   {
       
      
      private var var_520:String;
      
      private var var_1099:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var _id:int;
      
      private var var_1100:String;
      
      public function UserChangeMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _id = param1.readInteger();
         var_520 = param1.readString();
         var_1099 = param1.readString();
         var_1100 = param1.readString();
         return true;
      }
      
      public function get figure() : String
      {
         return var_520;
      }
      
      public function flush() : Boolean
      {
         _id = 0;
         var_520 = "";
         var_1099 = "";
         var_1100 = "";
         return true;
      }
      
      public function get sex() : String
      {
         return var_1099;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get customInfo() : String
      {
         return var_1100;
      }
   }
}
