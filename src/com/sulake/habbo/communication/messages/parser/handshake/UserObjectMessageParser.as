package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_520:String;
      
      private var var_2194:String;
      
      private var var_2193:int;
      
      private var var_2192:int;
      
      private var var_1099:String;
      
      private var var_1128:String;
      
      private var _name:String;
      
      private var var_745:int;
      
      private var var_747:int;
      
      private var var_2196:int;
      
      private var var_2146:int;
      
      private var var_2195:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2192;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1128;
      }
      
      public function get customData() : String
      {
         return this.var_2194;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_745;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2193;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2195;
      }
      
      public function get figure() : String
      {
         return this.var_520;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2146;
      }
      
      public function get sex() : String
      {
         return this.var_1099;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_520 = param1.readString();
         this.var_1099 = param1.readString();
         this.var_2194 = param1.readString();
         this.var_1128 = param1.readString();
         this.var_2196 = param1.readInteger();
         this.var_2195 = param1.readString();
         this.var_2193 = param1.readInteger();
         this.var_2192 = param1.readInteger();
         this.var_2146 = param1.readInteger();
         this.var_747 = param1.readInteger();
         this.var_745 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2196;
      }
      
      public function get respectLeft() : int
      {
         return this.var_747;
      }
   }
}
