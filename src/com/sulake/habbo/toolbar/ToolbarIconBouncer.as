package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_1834:Number;
      
      private var var_535:Number = 0;
      
      private var var_1833:Number;
      
      private var var_534:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_1834 = param1;
         var_1833 = param2;
      }
      
      public function update() : void
      {
         var_534 += var_1833;
         var_535 += var_534;
         if(var_535 > 0)
         {
            var_535 = 0;
            var_534 = var_1834 * -1 * var_534;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_534 = param1;
         var_535 = 0;
      }
      
      public function get location() : Number
      {
         return var_535;
      }
   }
}
