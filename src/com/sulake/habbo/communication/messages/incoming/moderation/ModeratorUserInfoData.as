package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_2074:int;
      
      private var var_2070:int;
      
      private var var_2073:int;
      
      private var _userName:String;
      
      private var var_2071:int;
      
      private var var_2075:int;
      
      private var var_2072:int;
      
      private var _userId:int;
      
      private var var_690:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_2075 = param1.readInteger();
         var_2071 = param1.readInteger();
         var_690 = param1.readBoolean();
         var_2073 = param1.readInteger();
         var_2070 = param1.readInteger();
         var_2074 = param1.readInteger();
         var_2072 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_2072;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_690;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_2071;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_2070;
      }
      
      public function get cautionCount() : int
      {
         return var_2074;
      }
      
      public function get cfhCount() : int
      {
         return var_2073;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_2075;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
