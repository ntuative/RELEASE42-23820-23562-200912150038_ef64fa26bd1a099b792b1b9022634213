package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1920:Boolean = false;
      
      private var var_1919:int = 0;
      
      private var var_1880:int = 0;
      
      private var var_1918:int = 0;
      
      private var var_1365:int = 0;
      
      private var var_1882:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_1365 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_1919;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_1920;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_1920 = param1;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_1919 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1880 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_1365;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_1918 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_1880;
      }
      
      public function get pixelBalance() : int
      {
         return var_1918;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1882 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_1882;
      }
   }
}
