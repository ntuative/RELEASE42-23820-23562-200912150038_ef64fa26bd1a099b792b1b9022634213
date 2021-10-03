package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_1534:XML;
      
      private var var_1316:ITextWindow;
      
      private var var_1315:ITextWindow;
      
      private var var_1531:XML;
      
      private var var_712:IWindowContainer;
      
      private var var_2191:ITextWindow;
      
      private var var_1532:String = "";
      
      private var var_2261:IButtonWindow;
      
      private var var_1530:XML;
      
      private var var_1314:ITextWindow;
      
      private var var_1533:XML;
      
      private var var_713:IButtonWindow;
      
      private var var_178:Offer;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_330:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1531) as IWindowContainer;
               break;
            case Offer.const_465:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1533) as IWindowContainer;
               break;
            case Offer.const_434:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1534) as IWindowContainer;
               break;
            case Offer.const_624:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1530) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach...undefined");
         }
         if(_loc2_ != null)
         {
            if(var_712 != null)
            {
               _window.removeChild(var_712);
               var_712.dispose();
            }
            var_712 = _loc2_;
            _window.addChild(_loc2_);
            var_712.x = 0;
            var_712.y = 0;
         }
         var_1314 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         var_1315 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         var_1316 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         var_2191 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         var_713 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(var_713 != null)
         {
            var_713.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onPurchase);
            var_713.disable();
         }
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(var_178 != null)
         {
            Logger.log("Init Purchase: undefined undefined");
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(var_178,page,var_1532);
         }
      }
      
      override public function init() : void
      {
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            var_1531 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            var_1533 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            var_1534 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         if(_loc4_ != null)
         {
            var_1530 = _loc4_.content as XML;
         }
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,onSelectProduct);
         events.addEventListener(WidgetEvent.const_931,onSetParameter);
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         var_1532 = param1.parameter;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var_178 = param1.offer;
         attachStub(var_178.priceType);
         if(var_1314 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(var_178.priceInCredits));
            var_1314.caption = "${catalog.purchase.price.credits}";
         }
         if(var_1315 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.pixels","pixels",String(var_178.priceInPixels));
            var_1315.caption = "${catalog.purchase.price.pixels}";
         }
         if(var_1316 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","credits",String(var_178.priceInCredits));
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","pixels",String(var_178.priceInPixels));
            var_1316.caption = "${catalog.purchase.price.credits+pixels}";
         }
         if(var_713 != null)
         {
            var_713.enable();
         }
      }
   }
}
