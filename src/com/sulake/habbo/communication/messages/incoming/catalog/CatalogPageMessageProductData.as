package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_261:String = "e";
      
      public static const const_81:String = "i";
      
      public static const const_84:String = "s";
       
      
      private var var_1025:String;
      
      private var var_1272:String;
      
      private var var_1270:int;
      
      private var var_1962:int;
      
      private var var_1024:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1272 = param1.readString();
         var_1962 = param1.readInteger();
         var_1025 = param1.readString();
         var_1024 = param1.readInteger();
         var_1270 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_1024;
      }
      
      public function get productType() : String
      {
         return var_1272;
      }
      
      public function get expiration() : int
      {
         return var_1270;
      }
      
      public function get furniClassId() : int
      {
         return var_1962;
      }
      
      public function get extraParam() : String
      {
         return var_1025;
      }
   }
}
