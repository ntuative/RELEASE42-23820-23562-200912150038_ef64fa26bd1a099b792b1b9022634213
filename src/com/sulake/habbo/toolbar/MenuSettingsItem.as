package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_1795:Array;
      
      private var var_1796:String;
      
      private var var_1794:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         var_1796 = param1;
         var_1795 = param2;
         var_1794 = param3;
      }
      
      public function get menuId() : String
      {
         return var_1796;
      }
      
      public function get yieldList() : Array
      {
         return var_1795;
      }
      
      public function get lockToIcon() : Boolean
      {
         return var_1794;
      }
   }
}
