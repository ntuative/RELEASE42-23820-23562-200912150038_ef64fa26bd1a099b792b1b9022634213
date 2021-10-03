package com.sulake.habbo.avatar.animation
{
   public class AddDataContainer
   {
       
      
      private var var_1399:String;
      
      private var var_1409:String;
      
      private var var_936:String;
      
      private var var_372:Number = 1;
      
      private var _id:String;
      
      public function AddDataContainer(param1:XML)
      {
         super();
         _id = String(param1.@id);
         var_1399 = String(param1.@align);
         var_936 = String(param1.@base);
         var_1409 = String(param1.@ink);
         var _loc2_:String = String(param1.@blend);
         if(_loc2_.length > 0)
         {
            var_372 = Number(_loc2_);
            if(var_372 > 1)
            {
               var_372 /= 100;
            }
         }
      }
      
      public function get align() : String
      {
         return var_1399;
      }
      
      public function get ink() : String
      {
         return var_1409;
      }
      
      public function get base() : String
      {
         return var_936;
      }
      
      public function get isBlended() : Boolean
      {
         return var_372 != 1;
      }
      
      public function get blend() : Number
      {
         return var_372;
      }
      
      public function get id() : String
      {
         return _id;
      }
   }
}
