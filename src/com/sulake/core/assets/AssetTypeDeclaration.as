package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_1707:Class;
      
      private var var_1706:Class;
      
      private var var_1708:String;
      
      private var var_1106:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_1708 = param1;
         var_1706 = param2;
         var_1707 = param3;
         if(rest == null)
         {
            var_1106 = new Array();
         }
         else
         {
            var_1106 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_1707;
      }
      
      public function get assetClass() : Class
      {
         return var_1706;
      }
      
      public function get mimeType() : String
      {
         return var_1708;
      }
      
      public function get fileTypes() : Array
      {
         return var_1106;
      }
   }
}
