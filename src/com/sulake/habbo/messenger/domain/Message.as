package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_659:int = 2;
      
      public static const const_784:int = 6;
      
      public static const const_719:int = 1;
      
      public static const const_576:int = 3;
      
      public static const const_919:int = 4;
      
      public static const const_698:int = 5;
       
      
      private var var_1899:String;
      
      private var var_972:int;
      
      private var var_1900:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_972 = param2;
         var_1900 = param3;
         var_1899 = param4;
      }
      
      public function get time() : String
      {
         return var_1899;
      }
      
      public function get senderId() : int
      {
         return var_972;
      }
      
      public function get messageText() : String
      {
         return var_1900;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
