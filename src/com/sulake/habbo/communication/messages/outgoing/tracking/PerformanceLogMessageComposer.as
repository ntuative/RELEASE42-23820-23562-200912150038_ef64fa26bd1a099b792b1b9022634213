package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_948:int = 0;
      
      private var var_1212:int = 0;
      
      private var var_1835:String = "";
      
      private var var_947:int = 0;
      
      private var var_1967:String = "";
      
      private var var_1966:int = 0;
      
      private var var_1404:String = "";
      
      private var var_1963:int = 0;
      
      private var var_1964:int = 0;
      
      private var var_1836:String = "";
      
      private var var_1965:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_1963 = param1;
         var_1836 = param2;
         var_1404 = param3;
         var_1835 = param4;
         var_1967 = param5;
         if(param6)
         {
            var_1212 = 1;
         }
         else
         {
            var_1212 = 0;
         }
         var_1966 = param7;
         var_1964 = param8;
         var_947 = param9;
         var_1965 = param10;
         var_948 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1963,var_1836,var_1404,var_1835,var_1967,var_1212,var_1966,var_1964,var_947,var_1965,var_948];
      }
      
      public function dispose() : void
      {
      }
   }
}
