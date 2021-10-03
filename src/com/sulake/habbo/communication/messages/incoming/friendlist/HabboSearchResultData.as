package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2206:Boolean;
      
      private var var_2205:int;
      
      private var var_2203:Boolean;
      
      private var var_1489:String;
      
      private var var_1128:String;
      
      private var var_1559:int;
      
      private var var_2096:String;
      
      private var var_2204:String;
      
      private var var_2095:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1559 = param1.readInteger();
         this.var_1489 = param1.readString();
         this.var_2096 = param1.readString();
         this.var_2206 = param1.readBoolean();
         this.var_2203 = param1.readBoolean();
         param1.readString();
         this.var_2205 = param1.readInteger();
         this.var_2095 = param1.readString();
         this.var_2204 = param1.readString();
         this.var_1128 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1128;
      }
      
      public function get avatarName() : String
      {
         return this.var_1489;
      }
      
      public function get avatarId() : int
      {
         return this.var_1559;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2206;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2204;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2095;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2203;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2096;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2205;
      }
   }
}
