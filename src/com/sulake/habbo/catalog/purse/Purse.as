package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_1880:int = 0;
      
      private var var_1881:int = 0;
      
      private var var_1724:int = 0;
      
      private var var_1882:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get pixels() : int
      {
         return var_1881;
      }
      
      public function set pixels(param1:int) : void
      {
         var_1881 = param1;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1880 = param1;
      }
      
      public function get credits() : int
      {
         return var_1724;
      }
      
      public function get clubDays() : int
      {
         return var_1880;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1882 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_1724 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return var_1882;
      }
   }
}
