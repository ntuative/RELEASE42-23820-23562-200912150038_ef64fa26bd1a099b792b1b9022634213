package com.sulake.habbo.inventory.marketplace
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.outgoing.marketplace.BuyMarketplaceTokensMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.marketplace.GetMarketplaceCanMakeOfferComposer;
   import com.sulake.habbo.communication.messages.outgoing.marketplace.GetMarketplaceConfigurationMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.marketplace.MakeOfferMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.inventory.HabboInventory;
   import com.sulake.habbo.inventory.IInventoryModel;
   import com.sulake.habbo.inventory.items.FloorItem;
   import com.sulake.habbo.inventory.items.IItem;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class MarketplaceModel implements IInventoryModel
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_1661:int;
      
      private var var_1658:int;
      
      private var _roomEngine:IRoomEngine;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _assets:IAssetLibrary;
      
      private var var_1498:int;
      
      private var _view:MarketplaceView;
      
      private var _controller:HabboInventory;
      
      private var var_1657:Boolean;
      
      private var var_1659:int;
      
      private var var_1017:int;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_1660:int;
      
      private var var_228:IItem;
      
      public function MarketplaceModel(param1:HabboInventory, param2:IHabboWindowManager, param3:IHabboCommunicationManager, param4:IAssetLibrary, param5:IRoomEngine, param6:IHabboLocalizationManager, param7:IHabboConfigurationManager)
      {
         super();
         _controller = param1;
         _communication = param3;
         _windowManager = param2;
         _assets = param4;
         _roomEngine = param5;
         _view = new MarketplaceView(this,_windowManager,_assets,param5,param6,param7);
      }
      
      public function set offerMaxPrice(param1:int) : void
      {
         var_1659 = param1;
      }
      
      public function makeOffer(param1:int) : void
      {
         if(var_228 == null)
         {
            return;
         }
         var _loc2_:IConnection = _communication.getHabboMainConnection(null);
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:int = var_228 is FloorItem ? 1 : 2;
         _loc2_.send(new MakeOfferMessageComposer(param1,_loc3_,var_228.ref));
         releaseItem();
      }
      
      public function set tokenBatchPrice(param1:int) : void
      {
         var_1017 = param1;
      }
      
      public function get offerMinPrice() : int
      {
         return var_1658;
      }
      
      public function requestInitialization(param1:int = 0) : void
      {
         var _loc2_:IConnection = _communication.getHabboMainConnection(null);
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.send(new GetMarketplaceConfigurationMessageComposer());
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_1017;
      }
      
      public function proceedOfferMaking(param1:int, param2:int) : void
      {
         switch(param1)
         {
            case 1:
               _view.showMakeOffer(var_228);
               break;
            case 2:
               _view.showAlert("${inventory.marketplace.no_trading_privilege.title","${inventory.marketplace.no_trading_privilege.info}");
               break;
            case 3:
               _view.showAlert("${inventory.marketplace.no_trading_pass.title","${inventory.marketplace.no_trading_pass.info}");
               break;
            case 4:
               _view.showBuyTokens(var_1017,var_1498);
         }
      }
      
      public function get expirationHours() : int
      {
         return var_1660;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         _controller = null;
         _communication = null;
         _windowManager = null;
         _assets = null;
         _roomEngine = null;
      }
      
      public function set offerMinPrice(param1:int) : void
      {
         var_1658 = param1;
      }
      
      public function subCategorySwitch(param1:String) : void
      {
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1657;
      }
      
      public function releaseItem() : void
      {
         if(_controller != null && false && var_228 != null)
         {
            _controller.furniModel.removeLockFrom(var_228.id);
            var_228 = null;
         }
      }
      
      public function set expirationHours(param1:int) : void
      {
         var_1660 = param1;
      }
      
      public function get offerMaxPrice() : int
      {
         return var_1659;
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         return null;
      }
      
      public function endOfferMaking(param1:int) : void
      {
         _view.showResult(param1);
      }
      
      public function categorySwitch(param1:String) : void
      {
      }
      
      public function set tokenBatchSize(param1:int) : void
      {
         var_1498 = param1;
      }
      
      public function set commission(param1:int) : void
      {
         var_1661 = param1;
      }
      
      public function buyMarketplaceTokens() : void
      {
         var _loc1_:IConnection = _communication.getHabboMainConnection(null);
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.send(new BuyMarketplaceTokensMessageComposer());
      }
      
      public function get tokenBatchSize() : int
      {
         return var_1498;
      }
      
      public function startOfferMaking(param1:IItem) : void
      {
         if(var_228 != null)
         {
            return;
         }
         if(_controller == null)
         {
            return;
         }
         var_228 = param1;
         if(false)
         {
            _controller.furniModel.addLockTo(param1.id);
         }
         if(_controller.creditBalance < var_1017)
         {
            _view.showNoCredits(var_1017);
            return;
         }
         var _loc2_:IConnection = _communication.getHabboMainConnection(null);
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.send(new GetMarketplaceCanMakeOfferComposer());
      }
      
      public function get commission() : int
      {
         return var_1661;
      }
      
      public function closingInventoryView() : void
      {
      }
      
      public function set isEnabled(param1:Boolean) : void
      {
         var_1657 = param1;
      }
   }
}
