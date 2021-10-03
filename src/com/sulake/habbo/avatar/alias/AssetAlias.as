package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var var_965:Boolean;
      
      private var _name:String;
      
      private var var_1546:String;
      
      private var var_966:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         _name = String(param1.@name);
         var_1546 = String(param1.@link);
         var_966 = Boolean(parseInt(param1.@fliph));
         var_965 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get flipH() : Boolean
      {
         return var_966;
      }
      
      public function get flipV() : Boolean
      {
         return var_965;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get link() : String
      {
         return var_1546;
      }
   }
}
