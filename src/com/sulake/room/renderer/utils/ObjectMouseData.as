package com.sulake.room.renderer.utils
{
   public class ObjectMouseData
   {
       
      
      private var var_2065:String = "";
      
      private var var_150:String = "";
      
      public function ObjectMouseData()
      {
         super();
      }
      
      public function set spriteTag(param1:String) : void
      {
         var_2065 = param1;
      }
      
      public function set objectId(param1:String) : void
      {
         var_150 = param1;
      }
      
      public function get spriteTag() : String
      {
         return var_2065;
      }
      
      public function get objectId() : String
      {
         return var_150;
      }
   }
}
