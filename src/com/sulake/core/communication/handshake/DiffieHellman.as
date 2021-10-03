package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1370:BigInteger;
      
      private var var_931:BigInteger;
      
      private var var_1716:BigInteger;
      
      private var var_1371:BigInteger;
      
      private var var_1714:BigInteger;
      
      private var var_1715:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1370 = param1;
         var_1716 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_1714.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1371 = new BigInteger();
         var_1371.fromRadix(param1,param2);
         var_1714 = var_1371.modPow(var_931,var_1370);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_1715.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         var_931 = new BigInteger();
         var_931.fromRadix(param1,param2);
         var_1715 = var_1716.modPow(var_931,var_1370);
         return true;
      }
   }
}
