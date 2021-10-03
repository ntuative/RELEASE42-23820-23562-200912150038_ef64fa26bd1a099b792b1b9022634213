package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer
   {
      
      public static const const_916:String = "price_type_none";
      
      public static const const_464:String = "pricing_model_multi";
      
      public static const const_330:String = "price_type_credits";
      
      public static const const_434:String = "price_type_credits_and_pixels";
      
      public static const const_361:String = "pricing_model_bundle";
      
      public static const const_390:String = "pricing_model_single";
      
      public static const const_624:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1349:String = "pricing_model_unknown";
      
      public static const const_465:String = "price_type_pixels";
       
      
      private var var_764:int;
      
      private var _offerId:int;
      
      private var var_765:int;
      
      private var var_375:String;
      
      private var var_524:String;
      
      private var var_1726:int;
      
      private var var_672:ICatalogPage;
      
      private var var_1122:String;
      
      private var var_374:IProductContainer;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _offerId = param1.offerId;
         var_1122 = param1.localizationId;
         var_764 = param1.priceInCredits;
         var_765 = param1.priceInPixels;
         var_672 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(_loc4_.productType);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_375;
      }
      
      public function get page() : ICatalogPage
      {
         return var_672;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_1726 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_374;
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
      
      public function dispose() : void
      {
         _offerId = 0;
         var_1122 = "";
         var_764 = 0;
         var_765 = 0;
         var_672 = null;
         if(var_374 != null)
         {
            var_374.dispose();
            var_374 = null;
         }
      }
      
      public function get priceType() : String
      {
         return var_524;
      }
      
      public function get previewCallbackId() : int
      {
         return var_1726;
      }
      
      public function get priceInCredits() : int
      {
         return var_764;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_375 = const_390;
            }
            else
            {
               var_375 = const_464;
            }
         }
         else if(param1.length > 1)
         {
            var_375 = const_361;
         }
         else
         {
            var_375 = const_1349;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_375)
         {
            case const_390:
               var_374 = new SingleProductContainer(this,param1);
               break;
            case const_464:
               var_374 = new MultiProductContainer(this,param1);
               break;
            case const_361:
               var_374 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_375);
         }
      }
      
      private function analyzePriceType() : void
      {
         if(var_764 > 0 && var_765 > 0)
         {
            var_524 = const_434;
         }
         else if(var_764 > 0)
         {
            var_524 = const_330;
         }
         else if(var_765 > 0)
         {
            var_524 = const_465;
         }
         else
         {
            var_524 = const_916;
         }
      }
   }
}
