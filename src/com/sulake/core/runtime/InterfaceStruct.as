package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct
   {
       
      
      private var var_908:IID;
      
      private var var_371:uint;
      
      private var var_1107:IUnknown;
      
      private var var_1108:String;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_908 = param1;
         var_1108 = getQualifiedClassName(var_908);
         var_1107 = param2;
         var_371 = 0;
      }
      
      public function get iid() : IID
      {
         return var_908;
      }
      
      public function get references() : uint
      {
         return var_371;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_371) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_1107;
      }
      
      public function get iis() : String
      {
         return var_1108;
      }
      
      public function reserve() : uint
      {
         return ++var_371;
      }
      
      public function dispose() : void
      {
         var_908 = null;
         var_1108 = null;
         var_1107 = null;
         var_371 = 0;
      }
   }
}
