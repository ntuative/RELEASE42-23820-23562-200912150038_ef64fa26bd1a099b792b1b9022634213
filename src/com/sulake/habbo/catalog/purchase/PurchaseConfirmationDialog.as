package com.sulake.habbo.catalog.purchase
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalization;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ICheckBoxWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class PurchaseConfirmationDialog
   {
       
      
      private var var_143:IItemListWindow;
      
      private var var_2232:int = 0;
      
      private var _window:IFrameWindow;
      
      private var var_226:Array;
      
      private var var_992:String;
      
      private var var_70:IHabboCatalog;
      
      private var var_178:Offer;
      
      private var var_557:ITextWindow;
      
      private var var_558:Boolean = false;
      
      private var var_672:ICatalogPage;
      
      private var _itemList:IItemListWindow;
      
      private var _localization:ICoreLocalizationManager;
      
      public function PurchaseConfirmationDialog(param1:ICoreLocalizationManager)
      {
         super();
         _localization = param1;
      }
      
      public function showOffer(param1:IHabboCatalog, param2:Offer, param3:ICatalogPage, param4:String = "", param5:Array = null) : void
      {
         reset();
         var_178 = param2;
         var_672 = param3;
         var_70 = param1;
         var_992 = param4;
         var_226 = param5;
         showDialog();
      }
      
      private function eventProcessor(param1:WindowMouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:String = (param1.target as IWindow).name;
         switch(_loc2_)
         {
            case "button_ok":
               if(var_558)
               {
                  _loc3_ = _window.findChildByName("receiver") as ITextFieldWindow;
                  _loc4_ = _window.findChildByName("message") as ITextFieldWindow;
                  _loc5_ = _loc3_ == null ? "" : _loc3_.text;
                  _loc6_ = _loc4_ == null ? "" : _loc4_.text;
                  HabboCatalog(var_70).purchaseProduct(var_672,var_178,var_992,true,_loc5_,_loc6_);
               }
               else
               {
                  HabboCatalog(var_70).purchaseProduct(var_672,var_178,var_992);
               }
               dispose();
               break;
            case "button_cancel":
            case "header_button_close":
               dispose();
         }
      }
      
      private function onActivateGift(param1:WindowEvent = null) : void
      {
         var_558 = true;
         showDialog();
      }
      
      private function suggestionsEventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:ITextWindow = param2 as ITextWindow;
         if(_loc3_ == null)
         {
            return;
         }
         setReceiverName(_loc3_.text);
         if(var_143 != null)
         {
            var_143.dispose();
            var_143 = null;
         }
      }
      
      public function dispose() : void
      {
         reset();
      }
      
      private function onDeActivateGift(param1:WindowEvent = null) : void
      {
         var_558 = false;
         showDialog();
      }
      
      private function showDialog() : void
      {
         var _loc1_:* = null;
         var _loc6_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         _loc1_ = var_70.assets.getAssetByName("habbo_orderinfo_dialog") as XmlAsset;
         var _loc2_:XML = _loc1_.content as XML;
         if(_window == null)
         {
            _window = var_70.windowManager.createWindow("OrderInfo","${catalog.purchase.confirmation.dialog.title}",HabboWindowType.const_324,HabboWindowStyle.const_40,0 | 0 | 0,new Rectangle(10,10,300,180),null) as IFrameWindow;
         }
         else
         {
            _window.removeChildAt(-1);
         }
         var _loc3_:IWindowContainer = var_70.windowManager.buildFromXML(_loc2_) as IWindowContainer;
         _window.addChild(_loc3_);
         _window.width = _loc3_.width + 20;
         _window.height = _loc3_.height + 40;
         _loc3_.x = 10;
         _loc3_.y = 30;
         _itemList = _window.findChildByName("orderItemList") as IItemListWindow;
         var _loc4_:Boolean = true;
         if(false)
         {
            _loc4_ = false;
         }
         var _loc5_:int = var_70.getPurse().credits - 0;
         if(_loc5_ < 0)
         {
            _loc4_ = false;
         }
         if(var_558)
         {
            _loc6_ = var_70.assets.getAssetByName("habbo_orderinfo_gift_checked") as XmlAsset;
         }
         else
         {
            _loc6_ = var_70.assets.getAssetByName("habbo_orderinfo_gift_unchecked") as XmlAsset;
         }
         _loc2_ = _loc6_.content as XML;
         var _loc7_:IWindow = var_70.windowManager.buildFromXML(_loc2_) as IWindow;
         if(_loc4_)
         {
            _itemList.addListItemAt(_loc7_,1);
            _window.height = NaN;
            _loc17_ = _window.findChildByName("buyAsGift") as ICheckBoxWindow;
            if(_loc17_ == null)
            {
               return;
            }
            if(var_558)
            {
               _loc17_.select();
            }
            _loc17_.addEventListener(WindowEvent.const_500,onDeActivateGift);
            _loc17_.addEventListener(WindowEvent.const_626,onActivateGift);
            _loc18_ = _window.findChildByName("receiver") as ITextFieldWindow;
            if(_loc18_ != null)
            {
            }
         }
         _window.center();
         var _loc8_:IButtonWindow = _window.findChildByName("button_ok") as IButtonWindow;
         var _loc9_:IButtonWindow = _window.findChildByName("button_cancel") as IButtonWindow;
         var _loc10_:IWindow = _window.findChildByTag("close");
         _loc8_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,eventProcessor);
         _loc9_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,eventProcessor);
         _loc10_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,eventProcessor);
         var _loc11_:IProductData = var_70.getProductData(var_178.localizationId);
         var _loc12_:String = _loc11_ == null ? "catalog.unknown.productname" : _loc11_.name;
         var_70.windowManager.registerLocalizationParameter("catalog.purchase.confirmation.dialog.costs","offer_name",_loc12_);
         var _loc13_:String = "";
         var _loc14_:String = "";
         var _loc15_:String = "";
         switch(var_178.priceType)
         {
            case Offer.const_330:
               _loc16_ = _localization.getLocalization("catalog.purchase.confirmation.dialog.price.credits");
               _localization.registerParameter("catalog.purchase.confirmation.dialog.price.credits","credits",var_178.priceInCredits.toString());
               _loc13_ = _loc16_.value;
               _localization.registerParameter("catalog.purchase.confirmation.dialog.price.credits","credits",var_70.getPurse().credits.toString());
               _loc14_ = _loc16_.value;
               if(_loc5_ < 0)
               {
                  _loc5_ = 0;
               }
               _localization.registerParameter("catalog.purchase.confirmation.dialog.price.credits","credits",_loc5_.toString());
               _loc15_ = _loc16_.value;
               break;
            case Offer.const_624:
            case Offer.const_434:
               _loc16_ = _localization.getLocalization("catalog.purchase.confirmation.dialog.price.credits+pixels");
               _localization.registerParameter("catalog.purchase.confirmation.dialog.price.credits+pixels","credits",var_178.priceInCredits.toString());
               _localization.registerParameter("catalog.purchase.confirmation.dialog.price.credits+pixels","pixels",var_178.priceInPixels.toString());
               _loc13_ = _loc16_.value;
               _localization.registerParameter("catalog.purchase.confirmation.dialog.price.credits+pixels","credits",var_70.getPurse().credits.toString());
               _localization.registerParameter("catalog.purchase.confirmation.dialog.price.credits+pixels","pixels",var_70.getPurse().pixels.toString());
               _loc14_ = _loc16_.value;
               _loc19_ = var_70.getPurse().pixels - 0;
               _loc20_ = var_70.getPurse().credits - 0;
               _localization.registerParameter("catalog.purchase.confirmation.dialog.price.credits+pixels","credits",_loc20_.toString());
               _localization.registerParameter("catalog.purchase.confirmation.dialog.price.credits+pixels","pixels",_loc19_.toString());
               _loc15_ = _loc16_.value;
               break;
            case Offer.const_465:
               _loc16_ = _localization.getLocalization("catalog.purchase.confirmation.dialog.price.pixels");
               _localization.registerParameter("catalog.purchase.confirmation.dialog.price.pixels","pixels",var_178.priceInPixels.toString());
               _loc13_ = _loc16_.value;
               _localization.registerParameter("catalog.purchase.confirmation.dialog.price.pixels","pixels",var_70.getPurse().pixels.toString());
               _loc14_ = _loc16_.value;
               _loc21_ = var_70.getPurse().pixels - 0;
               _localization.registerParameter("catalog.purchase.confirmation.dialog.price.pixels","pixels",_loc21_.toString());
               _loc15_ = _loc16_.value;
               break;
            case Offer.const_916:
               _loc16_ = _localization.getLocalization("catalog.purchase.confirmation.dialog.price.nothing");
               _loc13_ = _loc16_.value;
               _localization.registerParameter("catalog.purchase.confirmation.dialog.price.credits","credits",var_70.getPurse().credits.toString());
               _loc14_ = _loc16_.value;
               _localization.registerParameter("catalog.purchase.confirmation.dialog.price.credits","credits",var_70.getPurse().credits.toString());
               _loc15_ = _loc16_.value;
         }
         var_70.windowManager.registerLocalizationParameter("catalog.purchase.confirmation.dialog.costs","price",_loc13_);
         var_70.windowManager.registerLocalizationParameter("catalog.purchase.confirmation.dialog.amount","amount",_loc14_);
         var_70.windowManager.registerLocalizationParameter("catalog.purchase.confirmation.dialog.remaining","remaining",_loc15_);
         _window.resizeToFitContent();
      }
      
      private function reset() : void
      {
         var_178 = null;
         var_672 = null;
         var_992 = "";
         var_2232 = 0;
         var_558 = false;
         var_226 = null;
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(var_143 != null)
         {
            var_143.dispose();
            var_143 = null;
         }
         if(var_557 != null)
         {
            var_557.dispose();
            var_557 = null;
         }
      }
      
      private function setReceiverName(param1:String) : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc2_:ITextFieldWindow = _window.findChildByName("receiver") as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.text = param1;
      }
      
      private function onReceiverChanged(param1:WindowEvent) : void
      {
         var _loc5_:* = null;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:ITextFieldWindow = param1.window as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:String = _loc2_.text;
         var _loc4_:* = [];
         for each(_loc5_ in var_226)
         {
            if(_loc5_.search(_loc3_) != -1)
            {
               _loc4_.push(_loc5_);
            }
         }
         updateSuggestions(_loc4_,_loc2_);
      }
      
      private function updateSuggestions(param1:Array, param2:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(var_143 == null)
         {
            _loc5_ = var_70.assets.getAssetByName("habbo_orderinfo_receiver_suggestion") as XmlAsset;
            if(_loc5_ == null || _loc5_.content == null)
            {
               return;
            }
            var_143 = var_70.windowManager.buildFromXML(_loc5_.content as XML) as IItemListWindow;
            if(var_143 != null)
            {
               var_557 = var_143.getListItemAt(0) as ITextWindow;
               var_557.procedure = suggestionsEventHandler;
            }
         }
         if(var_143 == null || var_557 == null)
         {
            return;
         }
         var_143.removeListItems();
         if(param1.length == 0 || param1.length > 10)
         {
            var_143.visible = false;
            return;
         }
         var_143.visible = true;
         for each(_loc3_ in param1)
         {
            _loc6_ = var_557.clone() as ITextWindow;
            if(_loc6_ != null)
            {
               _loc6_.text = _loc3_;
               var_143.addListItem(_loc6_);
            }
         }
         _loc4_ = new Rectangle();
         param2.getGlobalRectangle(_loc4_);
         var_143.setGlobalPosition(new Point(_loc4_.left,_loc4_.bottom + 10));
      }
   }
}
