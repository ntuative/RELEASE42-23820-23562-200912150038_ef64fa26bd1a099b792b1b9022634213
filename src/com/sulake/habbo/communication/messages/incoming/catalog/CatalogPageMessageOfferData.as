package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_748:Array;
      
      private var var_764:int;
      
      private var var_1122:String;
      
      private var _offerId:int;
      
      private var var_765:int;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1122 = param1.readString();
         var_764 = param1.readInteger();
         var_765 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_748 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_748.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get products() : Array
      {
         return var_748;
      }
      
      public function get priceInCredits() : int
      {
         return var_764;
      }
      
      public function get localizationId() : String
      {
         return var_1122;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_765;
      }
   }
}
