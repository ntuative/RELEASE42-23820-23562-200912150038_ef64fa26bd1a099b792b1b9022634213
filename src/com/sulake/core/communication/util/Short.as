package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_675:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_675 = new ByteArray();
         var_675.writeShort(param1);
         var_675.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_675.position = 0;
         if(false)
         {
            _loc1_ = var_675.readShort();
            var_675.position = 0;
         }
         return _loc1_;
      }
   }
}
