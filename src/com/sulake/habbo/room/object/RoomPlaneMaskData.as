package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_2013:Number = 0;
      
      private var var_1847:Number = 0;
      
      private var var_1846:Number = 0;
      
      private var var_2014:Number = 0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_1847 = param1;
         var_1846 = param2;
         var_2013 = param3;
         var_2014 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1847;
      }
      
      public function get leftSideLength() : Number
      {
         return var_2013;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_1846;
      }
      
      public function get rightSideLength() : Number
      {
         return var_2014;
      }
   }
}
