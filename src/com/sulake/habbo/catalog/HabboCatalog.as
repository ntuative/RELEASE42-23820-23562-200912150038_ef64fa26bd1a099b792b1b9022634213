package com.sulake.habbo.catalog
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalization;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.catalog.enum.HabboCatalogTrackingEvent;
   import com.sulake.habbo.catalog.enum.ProductTypeEnum;
   import com.sulake.habbo.catalog.marketplace.IMarketPlace;
   import com.sulake.habbo.catalog.marketplace.MarketPlaceLogic;
   import com.sulake.habbo.catalog.navigation.CatalogNavigator;
   import com.sulake.habbo.catalog.navigation.ICatalogNavigator;
   import com.sulake.habbo.catalog.purchase.PurchaseConfirmationDialog;
   import com.sulake.habbo.catalog.purse.IPurse;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.recycler.IRecycler;
   import com.sulake.habbo.catalog.recycler.RecyclerLogic;
   import com.sulake.habbo.catalog.viewer.CatalogViewer;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.ICatalogViewer;
   import com.sulake.habbo.catalog.viewer.IPageLocalization;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.PageLocalization;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetApproveNameResultEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.RentableBotDefinitionWidgetEvent;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogIndexMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPublishedMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.NodeData;
   import com.sulake.habbo.communication.messages.incoming.catalog.NotEnoughBalanceMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.PurchaseErrorMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.PurchaseNotAllowedMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.PurchaseOKMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.RentableBotDefinitionsMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.VoucherRedeemErrorMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.VoucherRedeemOkMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.purse.CreditBalanceEvent;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketPlaceOffersEvent;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketPlaceOwnOffersEvent;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceBuyOfferResultEvent;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceCancelOfferResultEvent;
   import com.sulake.habbo.communication.messages.incoming.notifications.HabboActivityPointNotificationMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.recycler.RecyclerFinishedMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.recycler.RecyclerPrizesMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.recycler.RecyclerStatusMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.users.ApproveNameMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.users.ScrSendUserInfoEvent;
   import com.sulake.habbo.communication.messages.outgoing.catalog.GetCatalogIndexComposer;
   import com.sulake.habbo.communication.messages.outgoing.catalog.GetCatalogPageComposer;
   import com.sulake.habbo.communication.messages.outgoing.catalog.GetRentableBotDefinitionsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.catalog.PurchaseFromCatalogComposer;
   import com.sulake.habbo.communication.messages.outgoing.catalog.RedeemClubPromoMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.catalog.RedeemVoucherMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.marketplace.BuyOfferMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.marketplace.CancelOfferMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.marketplace.GetOffersMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.marketplace.GetOwnOffersMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.marketplace.RedeemOfferCreditsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.recycler.GetRecyclerPrizesMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.recycler.GetRecyclerStatusMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.recycler.RecycleItemsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.users.ApproveNameMessageComposer;
   import com.sulake.habbo.communication.messages.parser.catalog.CatalogPageMessageParser;
   import com.sulake.habbo.communication.messages.parser.catalog.CatalogPublishedMessageParser;
   import com.sulake.habbo.communication.messages.parser.catalog.NotEnoughBalanceMessageParser;
   import com.sulake.habbo.communication.messages.parser.catalog.PurchaseErrorMessageParser;
   import com.sulake.habbo.communication.messages.parser.catalog.PurchaseNotAllowedMessageParser;
   import com.sulake.habbo.communication.messages.parser.catalog.PurchaseOKMessageParser;
   import com.sulake.habbo.communication.messages.parser.catalog.RentableBotDefinitionsMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.purse.CreditBalanceParser;
   import com.sulake.habbo.communication.messages.parser.recycler.RecyclerFinishedMessageParser;
   import com.sulake.habbo.communication.messages.parser.recycler.RecyclerPrizesMessageParser;
   import com.sulake.habbo.communication.messages.parser.recycler.RecyclerStatusMessageParser;
   import com.sulake.habbo.communication.messages.parser.users.ApproveNameMessageParser;
   import com.sulake.habbo.communication.messages.parser.users.ScrSendUserInfoMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.friendlist.IHabboFriendList;
   import com.sulake.habbo.inventory.IHabboInventory;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.habbo.sound.HabboSoundTypesEnum;
   import com.sulake.habbo.sound.IHabboSoundManager;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.habbo.window.utils.IConfirmDialog;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDCoreLocalizationManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboFriendList;
   import com.sulake.iid.IIDHabboInventory;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboSoundManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDRoomEngine;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import iid.IIDHabboWindowManager;
   
   public class HabboCatalog extends Component implements IHabboCatalog
   {
       
      
      private var _friendList:IHabboFriendList;
      
      private var _initialized:Boolean = false;
      
      private var var_205:Purse;
      
      private var var_2150:Boolean = true;
      
      private var var_1281:Boolean = false;
      
      private var var_1027:String = "";
      
      private var var_189:IHabboToolbar;
      
      private var var_237:IMarketPlace;
      
      private var _localization:ICoreLocalizationManager;
      
      private var var_699:PurchaseConfirmationDialog;
      
      private var var_729:IHabboSoundManager;
      
      private var var_350:ICatalogViewer;
      
      private var var_2151:Boolean = true;
      
      private var _roomEngine:IRoomEngine;
      
      private var var_411:ICatalogNavigator;
      
      private var var_1115:IAvatarRenderManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_92:RecyclerLogic;
      
      private var _mainContainer:IWindowContainer;
      
      private var var_571:ISessionDataManager;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_25:IHabboInventory;
      
      private var var_170:IHabboConfigurationManager;
      
      public function HabboCatalog(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         var_205 = new Purse();
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationReady);
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationReady);
         queueInterface(new IIDRoomEngine(),onRoomEngineReady);
         queueInterface(new IIDCoreLocalizationManager(),onLocalizationReady);
         queueInterface(new IIDHabboInventory(),onInventoryReady);
         queueInterface(new IIDSessionDataManager(),sessionDataManagerReady);
         queueInterface(new IIDAvatarRenderManager(),onAvatarRenderManagerReady);
         queueInterface(new IIDHabboSoundManager(),onSoundManagerReady);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
         queueInterface(new IIDHabboFriendList(),onFriendListReady);
      }
      
      public function getProductData(param1:String) : IProductData
      {
         return var_571.getProductData(param1);
      }
      
      private function onCreditBalance(param1:IMessageEvent) : void
      {
         var _loc2_:CreditBalanceEvent = param1 as CreditBalanceEvent;
         var _loc3_:CreditBalanceParser = _loc2_.getParser();
         var_205.credits = _loc3_.balance;
         updatePurse();
         if(!var_2150 && var_729 != null)
         {
            var_729.playSound(HabboSoundTypesEnum.const_851);
         }
         var_2150 = false;
      }
      
      public function getFurnitureData(param1:int, param2:String) : IFurnitureData
      {
         var _loc3_:* = null;
         if(param2 == ProductTypeEnum.const_84)
         {
            _loc3_ = var_571.getFloorItemData(param1);
         }
         if(param2 == ProductTypeEnum.const_81)
         {
            _loc3_ = var_571.getWallItemData(param1);
         }
         return _loc3_;
      }
      
      public function getRecyclerStatus() : void
      {
         _communication.getHabboMainConnection(null).send(new GetRecyclerStatusMessageComposer());
      }
      
      public function redeemExpiredMarketPlaceOffer(param1:int) : void
      {
         _communication.getHabboMainConnection(null).send(new CancelOfferMessageComposer(param1));
      }
      
      private function alertDialogEventProcessor(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      private function init() : void
      {
         if(!_initialized)
         {
            createMainWindow();
            createCatalogNavigator();
            createCatalogViewer();
            refreshCatalogIndex();
            _initialized = true;
            updatePurse();
            createRecycler();
            createMarketPlace();
         }
      }
      
      public function getPublicMarketPlaceOffers(param1:String, param2:int) : void
      {
         _communication.getHabboMainConnection(null).send(new GetOffersMessageComposer(param1,param2));
      }
      
      private function onRecyclerFinished(param1:IMessageEvent) : void
      {
         var _loc2_:RecyclerFinishedMessageParser = (param1 as RecyclerFinishedMessageEvent).getParser();
         if(_loc2_ == null || var_92 == null)
         {
            return;
         }
         var_92.setFinished(_loc2_.recyclerFinishedStatus,_loc2_.prizeId);
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_86:
               var_1281 = param1.session.isPrivateRoom;
               if(var_92 != null)
               {
                  var_92.setRoomSessionActive(true);
               }
               break;
            case RoomSessionEvent.const_92:
               var_1281 = false;
               if(var_92 != null)
               {
                  var_92.setRoomSessionActive(false);
               }
         }
      }
      
      override public function dispose() : void
      {
         reset();
         if(_roomEngine != null)
         {
            _roomEngine.release(new IIDRoomEngine());
            _roomEngine = null;
         }
         if(_windowManager != null)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         if(_communication != null)
         {
            _communication.release(new IIDHabboCommunicationManager());
            _communication = null;
         }
         if(var_699 != null)
         {
            var_699.dispose();
            var_699 = null;
         }
         if(var_92 != null)
         {
            var_92.dispose();
            var_92 = null;
         }
         if(var_237 != null)
         {
            var_237 = null;
         }
         super.dispose();
      }
      
      public function getRentableBotDefinitions() : void
      {
         _communication.getHabboMainConnection(null).send(new GetRentableBotDefinitionsMessageComposer());
      }
      
      private function onMarketPlaceCancelResult(param1:IMessageEvent) : void
      {
         if(var_237 != null)
         {
            var_237.onCancelResult(param1);
         }
      }
      
      private function toggleCatalog(param1:Boolean = false) : void
      {
         var _loc2_:Boolean = false;
         if(!_initialized)
         {
            init();
            _loc2_ = true;
         }
         if(_mainContainer == null)
         {
            return;
         }
         _mainContainer.visible = !!param1 ? true : !false;
         if(false)
         {
            _mainContainer.activate();
         }
         if(var_189 != null && _loc2_)
         {
            var_189.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_48,HabboToolbarIconEnum.CATALOGUE,_mainContainer));
         }
         if(false)
         {
            _events.dispatchEvent(new Event(HabboCatalogTrackingEvent.HABBO_CATALOG_TRACKING_EVENT_OPEN));
            if(var_92 != null && getCurrentLayoutCode() == "recycler")
            {
               var_92.activate();
            }
         }
         else
         {
            _events.dispatchEvent(new Event(HabboCatalogTrackingEvent.HABBO_CATALOG_TRACKING_EVENT_CLOSE));
            if(var_92 != null && getCurrentLayoutCode() == "recycler")
            {
               var_92.cancel();
            }
         }
         setupInventoryForRecycler(false && false);
      }
      
      private function noCreditsConfirmDialogEventProcessor(param1:IConfirmDialog, param2:Event) : void
      {
         var _loc3_:* = null;
         param1.dispose();
         if(param2.type == WindowEvent.const_152)
         {
            if(false && "HabboAvatarRenderLib_fx15" == var_170.getKey("client.credits.embed.enabled"))
            {
               ExternalInterface.call("FlashExternalInterface.openHabblet","credits");
            }
            else
            {
               _loc3_ = var_170.getKey("link.format.credits");
               if(_loc3_ != "")
               {
                  _windowManager.alert("${catalog.alert.external.link.title}","${catalog.alert.external.link.desc}",0,onExternalLink);
                  HabboWebTools.navigateToURL(_loc3_,"habboMain");
               }
            }
         }
      }
      
      private function createMainWindow() : void
      {
         var _loc1_:XmlAsset = _assets.getAssetByName("catalog") as XmlAsset;
         _mainContainer = _windowManager.buildFromXML(_loc1_.content as XML) as IWindowContainer;
         _mainContainer.tags.push("habbo_catalog");
         _mainContainer.x = -500;
         _mainContainer.visible = false;
         var _loc2_:BitmapDataAsset = _assets.getAssetByName("layout_bg") as BitmapDataAsset;
         setElementImage("layoutBackground",_loc2_.content as BitmapData);
         var _loc3_:IWindowContainer = _mainContainer.findChildByName("navigatorMain") as IWindowContainer;
         _loc3_.setParamFlag(WindowParam.const_209,false);
         var _loc4_:IWindow = _mainContainer.findChildByName("titlebar_close_button");
         if(_loc4_ == null)
         {
            _loc4_ = _mainContainer.findChildByTag("close");
         }
         if(_loc4_ != null)
         {
            _loc4_.procedure = onWindowClose;
         }
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return var_571;
      }
      
      public function getOwnMarketPlaceOffers() : void
      {
         _communication.getHabboMainConnection(null).send(new GetOwnOffersMessageComposer());
      }
      
      private function onNotEnoughBalance(param1:IMessageEvent) : void
      {
         var _loc2_:NotEnoughBalanceMessageEvent = param1 as NotEnoughBalanceMessageEvent;
         var _loc3_:NotEnoughBalanceMessageParser = _loc2_.getParser();
         var _loc4_:int = _loc3_.notEnoughCredits;
         var _loc5_:int = _loc3_.notEnoughPixels;
         var _loc6_:String = "";
         if(_loc4_ > 0 && _loc5_ == 0)
         {
            _loc6_ = "${catalog.alert.notenough.credits.description}";
         }
         else if(_loc4_ > 0 && _loc5_ > 0)
         {
            _loc6_ = "${catalog.alert.notenough.creditsandpixels.description}";
         }
         else if(_loc4_ == 0 && _loc5_ > 0)
         {
            _loc6_ = "${catalog.alert.notenough.pixels.description}";
         }
         if(_loc4_ > 0)
         {
            _windowManager.confirm("${catalog.alert.notenough.title}",_loc6_,0,noCreditsConfirmDialogEventProcessor);
         }
         else
         {
            _windowManager.alert("${catalog.alert.notenough.title}",_loc6_,0,alertDialogEventProcessor);
         }
      }
      
      private function setElementImage(param1:String, param2:BitmapData) : void
      {
         var _loc3_:IBitmapWrapperWindow = _mainContainer.findChildByName(param1) as IBitmapWrapperWindow;
         if(_loc3_ != null)
         {
            _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true,0);
            _loc3_.bitmap.copyPixels(param2,param2.rect,new Point(0,0));
         }
         else
         {
            Logger.log("Could not find element: " + param1);
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _windowManager = param2 as IHabboWindowManager;
      }
      
      private function reset() : void
      {
         _initialized = false;
         if(var_350 != null)
         {
            var_350.dispose();
            var_350 = null;
         }
         if(var_411 != null)
         {
            var_411.dispose();
            var_411 = null;
         }
         if(_mainContainer != null)
         {
            _mainContainer.dispose();
            _mainContainer = null;
         }
      }
      
      public function openInventoryCategory(param1:String) : void
      {
         if(var_25 == null)
         {
            return;
         }
         var_25.toggleInventoryPage(param1);
      }
      
      private function onMarketPlaceOwnOffers(param1:IMessageEvent) : void
      {
         if(var_237 != null)
         {
            var_237.onOwnOffers(param1);
         }
      }
      
      public function setupInventoryForRecycler(param1:Boolean) : void
      {
         if(var_25 == null)
         {
            return;
         }
         var_25.setupRecycler(param1);
      }
      
      private function createCatalogNavigator() : void
      {
         var _loc1_:IWindowContainer = _mainContainer.findChildByName("navigatorMain") as IWindowContainer;
         var_411 = new CatalogNavigator(this,_loc1_) as ICatalogNavigator;
         var _loc2_:BitmapDataAsset = _assets.getAssetByName("purse_coins_small") as BitmapDataAsset;
         setElementImage("creditsIcon",_loc2_.content as BitmapData);
         var _loc3_:BitmapDataAsset = _assets.getAssetByName("purse_pixels_small") as BitmapDataAsset;
         setElementImage("pixelsIcon",_loc3_.content as BitmapData);
         var _loc4_:BitmapDataAsset = _assets.getAssetByName("purse_club_small") as BitmapDataAsset;
         setElementImage("clubIcon",_loc4_.content as BitmapData);
      }
      
      private function createRecycler() : void
      {
         var_92 = new RecyclerLogic(this,_windowManager);
         getRecyclerPrizes();
      }
      
      public function get avatarRenderManager() : IAvatarRenderManager
      {
         return var_1115;
      }
      
      private function onInventoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_25 = param2 as IHabboInventory;
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_189 = param2 as IHabboToolbar;
         var_189.events.addEventListener(HabboToolbarEvent.const_80,onHabboToolbarEvent);
         var_189.events.addEventListener(HabboToolbarEvent.const_62,onHabboToolbarEvent);
         setHabboToolbarIcon();
      }
      
      public function getPurse() : IPurse
      {
         return var_205;
      }
      
      private function onSubscriptionInfo(param1:IMessageEvent) : void
      {
         var _loc2_:ScrSendUserInfoMessageParser = (param1 as ScrSendUserInfoEvent).getParser();
         var_205.clubDays = Math.max(0,_loc2_.daysToPeriodEnd);
         var_205.clubPeriods = Math.max(0,_loc2_.periodsSubscribedAhead);
         updatePurse();
         if(_loc2_.responseType == 2)
         {
            reset();
            toggleCatalog(true);
         }
      }
      
      private function onLocalizationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _localization = param2 as ICoreLocalizationManager;
      }
      
      public function redeemVoucher(param1:String) : void
      {
         var _loc2_:* = new RedeemVoucherMessageComposer(param1);
         _communication.getHabboMainConnection(null).send(_loc2_);
         _loc2_.dispose();
         _loc2_ = null;
      }
      
      public function showPurchaseConfirmation(param1:Offer, param2:ICatalogPage, param3:String = "") : void
      {
         var _loc7_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:String = "";
         switch(param1.priceType)
         {
            case Offer.const_330:
               _loc6_ = "${catalog.alert.notenough.credits.description}";
               _loc4_ = 0 - param1.priceInCredits;
               break;
            case Offer.const_624:
            case Offer.const_434:
               _loc6_ = "${catalog.alert.notenough.creditsandpixels.description}";
               _loc4_ = 0 - param1.priceInCredits;
               _loc5_ = 0 - param1.priceInPixels;
               break;
            case Offer.const_465:
               _loc5_ = 0 - param1.priceInPixels;
               _loc6_ = "${catalog.alert.notenough.pixels.description}";
         }
         if(_loc4_ < 0)
         {
            _windowManager.confirm("${catalog.alert.notenough.title}",_loc6_,0,noCreditsConfirmDialogEventProcessor);
         }
         else if(_loc5_ < 0)
         {
            _windowManager.confirm("${catalog.alert.notenough.pixels.title}",_loc6_,0,noPixelsConfirmDialogEventProcessor);
         }
         else
         {
            if(var_699 == null)
            {
               var_699 = new PurchaseConfirmationDialog(_localization);
            }
            _loc7_ = [];
            if(_friendList != null)
            {
               _loc7_ = _friendList.getFriendNames();
            }
            var_699.showOffer(this,param1,param2,param3,_loc7_);
         }
      }
      
      public function getSubscriptionProductIcon(param1:int) : BitmapData
      {
         var _loc2_:BitmapDataAsset = assets.getAssetByName("ctlg_icon_deal_hc") as BitmapDataAsset;
         if(_loc2_ != null)
         {
            return (_loc2_.content as BitmapData).clone();
         }
         return new BitmapData(1,1,true,16777215);
      }
      
      private function sessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_571 = param2 as ISessionDataManager;
      }
      
      public function loadCatalogPage(param1:int) : void
      {
         _communication.getHabboMainConnection(null).send(new GetCatalogPageComposer(param1));
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_80)
         {
            setHabboToolbarIcon();
         }
         if(param1.iconId != HabboToolbarIconEnum.CATALOGUE)
         {
            return;
         }
         if(param1.type == HabboToolbarEvent.const_62)
         {
            toggleCatalog();
         }
      }
      
      private function onSoundManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_729 = param2 as IHabboSoundManager;
      }
      
      public function approveName(param1:String, param2:int) : void
      {
         _communication.getHabboMainConnection(null).send(new ApproveNameMessageComposer(param1,param2));
      }
      
      private function onMarketPlaceOffers(param1:IMessageEvent) : void
      {
         if(var_237 != null)
         {
            var_237.onOffers(param1);
         }
      }
      
      private function onPurchaseNotAllowed(param1:IMessageEvent) : void
      {
         var _loc2_:PurchaseNotAllowedMessageEvent = param1 as PurchaseNotAllowedMessageEvent;
         var _loc3_:PurchaseNotAllowedMessageParser = _loc2_.getParser();
         var _loc4_:int = _loc3_.errorCode;
         var _loc5_:String = "";
         switch(_loc4_)
         {
            case 1:
               _loc5_ = "${catalog.alert.purchasenotallowed.hc.description}";
               break;
            default:
               _loc5_ = "${catalog.alert.purchasenotallowed.unknown.description}";
         }
         _windowManager.alert("${catalog.alert.purchasenotallowed.title}",_loc5_,0,alertDialogEventProcessor);
      }
      
      public function get tradingActive() : Boolean
      {
         if(var_25 == null)
         {
            return false;
         }
         return var_25.tradingActive;
      }
      
      private function createMarketPlace() : void
      {
         if(var_237 == null)
         {
            var_237 = new MarketPlaceLogic(this,_windowManager);
         }
      }
      
      private function onConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_170 = param2 as IHabboConfigurationManager;
      }
      
      public function sendRecycleItems(param1:Array) : void
      {
         _communication.getHabboMainConnection(null).send(new RecycleItemsMessageComposer(param1));
      }
      
      public function buyMarketPlaceOffer(param1:int) : void
      {
         _communication.getHabboMainConnection(null).send(new BuyOfferMessageComposer(param1));
      }
      
      public function get localization() : ICoreLocalizationManager
      {
         return _localization;
      }
      
      public function getPixelEffectIcon(param1:int) : BitmapData
      {
         var _loc2_:BitmapDataAsset = (var_25 as Component).assets.getAssetByName("fx_icon_" + param1 + "_png") as BitmapDataAsset;
         if(_loc2_ != null)
         {
            return (_loc2_.content as BitmapData).clone();
         }
         return new BitmapData(1,1,true,16777215);
      }
      
      public function openCatalogPage(param1:String, param2:Boolean = false) : void
      {
         var _loc3_:* = null;
         if(param2)
         {
            _loc3_ = _localization.getLocalization(param1);
            if(_loc3_ != null)
            {
               param1 = _loc3_.value;
            }
         }
         if(!_initialized)
         {
            toggleCatalog();
            var_1027 = param1;
         }
         else
         {
            toggleCatalog(true);
            var_411.openPage(param1);
         }
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      private function setHabboToolbarIcon() : void
      {
         var_189.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_122,HabboToolbarIconEnum.CATALOGUE));
      }
      
      private function onVoucherRedeemOk(param1:VoucherRedeemOkMessageEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:String = "${catalog.alert.voucherredeem.ok.description}";
         if(param1.productName != "")
         {
            _loc2_ = "catalog.alert.voucherredeem.ok.description.furni";
            _localization.registerParameter(_loc2_,"productName",param1.productName);
            _localization.registerParameter(_loc2_,"productDescription",param1.productDescription);
         }
         _windowManager.alert("${catalog.alert.voucherredeem.ok.title}",_loc2_,0,alertDialogEventProcessor);
      }
      
      private function onVoucherRedeemError(param1:VoucherRedeemErrorMessageEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc3_:* = "${catalog.alert.voucherredeem.error.description." + param1.errorCode + "}";
         _windowManager.alert("${catalog.alert.voucherredeem.error.title}",_loc3_,0,alertDialogEventProcessor);
      }
      
      public function method_10() : int
      {
         if(var_25 == null)
         {
            return 0;
         }
         return var_25.requestSelectedFurniToRecycler();
      }
      
      private function onCommunicationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _communication = param2 as IHabboCommunicationManager;
         _communication.addHabboConnectionMessageEvent(new CatalogIndexMessageEvent(onCatalogIndex));
         _communication.addHabboConnectionMessageEvent(new CatalogPageMessageEvent(onCatalogPage));
         _communication.addHabboConnectionMessageEvent(new CatalogPublishedMessageEvent(onCatalogPublished));
         _communication.addHabboConnectionMessageEvent(new PurchaseErrorMessageEvent(onPurchaseError));
         _communication.addHabboConnectionMessageEvent(new PurchaseNotAllowedMessageEvent(onPurchaseNotAllowed));
         _communication.addHabboConnectionMessageEvent(new PurchaseOKMessageEvent(onPurchaseOK));
         _communication.addHabboConnectionMessageEvent(new NotEnoughBalanceMessageEvent(onNotEnoughBalance));
         _communication.addHabboConnectionMessageEvent(new CreditBalanceEvent(onCreditBalance));
         _communication.addHabboConnectionMessageEvent(new HabboActivityPointNotificationMessageEvent(onPixelsBalance));
         _communication.addHabboConnectionMessageEvent(new VoucherRedeemOkMessageEvent(onVoucherRedeemOk));
         _communication.addHabboConnectionMessageEvent(new VoucherRedeemErrorMessageEvent(onVoucherRedeemError));
         _communication.addHabboConnectionMessageEvent(new ApproveNameMessageEvent(onApproveNameResult));
         _communication.addHabboConnectionMessageEvent(new ScrSendUserInfoEvent(onSubscriptionInfo));
         _communication.addHabboConnectionMessageEvent(new RecyclerStatusMessageEvent(onRecyclerStatus));
         _communication.addHabboConnectionMessageEvent(new RecyclerFinishedMessageEvent(onRecyclerFinished));
         _communication.addHabboConnectionMessageEvent(new RecyclerPrizesMessageEvent(onRecyclerPrizes));
         _communication.addHabboConnectionMessageEvent(new RentableBotDefinitionsMessageEvent(onRentableBotDefinitions));
         _communication.addHabboConnectionMessageEvent(new MarketPlaceOffersEvent(onMarketPlaceOffers));
         _communication.addHabboConnectionMessageEvent(new MarketPlaceOwnOffersEvent(onMarketPlaceOwnOffers));
         _communication.addHabboConnectionMessageEvent(new MarketplaceBuyOfferResultEvent(onMarketPlaceBuyResult));
         _communication.addHabboConnectionMessageEvent(new MarketplaceCancelOfferResultEvent(onMarketPlaceCancelResult));
      }
      
      private function refreshCatalogIndex() : void
      {
         _communication.getHabboMainConnection(null).send(new GetCatalogIndexComposer());
      }
      
      public function purchaseProduct(param1:ICatalogPage, param2:Offer, param3:String = "", param4:Boolean = false, param5:String = "", param6:String = "") : void
      {
         _communication.getHabboMainConnection(null).send(new PurchaseFromCatalogComposer(param1.pageId,param2.offerId,param3,param4,param5,param6));
      }
      
      private function onCatalogIndex(param1:IMessageEvent) : void
      {
         if(param1 as CatalogIndexMessageEvent == null)
         {
            return;
         }
         if(var_411 == null)
         {
            return;
         }
         var _loc2_:NodeData = (param1 as CatalogIndexMessageEvent).root;
         var_411.buildCatalogIndex(_loc2_);
         if(var_1027 != "")
         {
            var_411.openPage(var_1027);
            var_1027 = "";
         }
         else
         {
            var_411.openFrontPage();
         }
      }
      
      private function noPixelsConfirmDialogEventProcessor(param1:IConfirmDialog, param2:Event) : void
      {
         var _loc3_:* = null;
         param1.dispose();
         if(param2.type == WindowEvent.const_152)
         {
            _loc3_ = var_170.getKey("link.format.pixels");
            if(_loc3_ != "")
            {
               _windowManager.alert("${catalog.alert.external.link.title}","${catalog.alert.external.link.desc}",0,onExternalLink);
               HabboWebTools.navigateToURL(_loc3_,"habboMain");
            }
         }
      }
      
      public function getRecycler() : IRecycler
      {
         return var_92;
      }
      
      public function getRecyclerPrizes() : void
      {
         _communication.getHabboMainConnection(null).send(new GetRecyclerPrizesMessageComposer());
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _mainContainer.visible = false;
         if(var_92 != null && getCurrentLayoutCode() == "recycler")
         {
            var_92.cancel();
            setupInventoryForRecycler(false);
         }
      }
      
      private function onApproveNameResult(param1:ApproveNameMessageEvent) : void
      {
         if(param1 == null || var_350 == null)
         {
            return;
         }
         var _loc2_:ApproveNameMessageParser = param1.getParser();
         var_350.dispatchWidgetEvent(new CatalogWidgetApproveNameResultEvent(_loc2_.result));
      }
      
      private function onRoomEngineReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _roomEngine = param2 as IRoomEngine;
      }
      
      private function onFriendListReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _friendList = param2 as IHabboFriendList;
      }
      
      private function onPixelsBalance(param1:IMessageEvent) : void
      {
         var _loc2_:HabboActivityPointNotificationMessageEvent = param1 as HabboActivityPointNotificationMessageEvent;
         var_205.pixels = _loc2_.amount;
         updatePurse();
         if(!var_2151 && var_729 != null)
         {
            var_729.playSound(HabboSoundTypesEnum.const_987);
         }
         var_2151 = false;
      }
      
      private function onRecyclerPrizes(param1:IMessageEvent) : void
      {
         var _loc2_:RecyclerPrizesMessageParser = (param1 as RecyclerPrizesMessageEvent).getParser();
         if(_loc2_ == null || var_92 == null)
         {
            return;
         }
         var_92.storePrizeTable(_loc2_.prizeLevels);
      }
      
      private function onCatalogPublished(param1:IMessageEvent) : void
      {
         var _loc2_:CatalogPublishedMessageEvent = param1 as CatalogPublishedMessageEvent;
         var _loc3_:CatalogPublishedMessageParser = _loc2_.getParser();
         var _loc4_:Boolean = false;
         if(_mainContainer != null)
         {
            _loc4_ = false;
         }
         reset();
         if(_loc4_)
         {
            _windowManager.alert("${catalog.alert.published.title}","${catalog.alert.published.description}",0,alertDialogEventProcessor);
         }
      }
      
      public function redeemClubPromo(param1:String, param2:Boolean) : void
      {
         var _loc3_:RedeemClubPromoMessageComposer = new RedeemClubPromoMessageComposer(param1,param2);
         _communication.getHabboMainConnection(null).send(_loc3_);
      }
      
      private function updatePurse() : void
      {
         var _loc2_:* = null;
         if(_mainContainer == null)
         {
            return;
         }
         _localization.registerParameter("catalog.purse.creditbalance","balance",String(var_205.credits));
         _localization.registerParameter("catalog.purse.pixelbalance","balance",String(var_205.pixels));
         _localization.registerParameter("catalog.purse.clubdays","days",String(var_205.clubDays));
         _localization.registerParameter("catalog.purse.clubdays","months",String(var_205.clubPeriods));
         if(false)
         {
            return;
         }
         var _loc1_:IWindowContainer = _mainContainer.findChildByName("clubContainer") as IWindowContainer;
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.findChildByName("clubText") as ITextWindow;
            if(_loc2_ != null)
            {
               _loc2_.caption = _localization.getKey("catalog.purse.club.join");
            }
         }
      }
      
      private function getCurrentLayoutCode() : String
      {
         if(var_350 == null)
         {
            return "";
         }
         return var_350.getCurrentLayoutCode();
      }
      
      private function onPurchaseOK(param1:IMessageEvent) : void
      {
         var _loc2_:PurchaseOKMessageEvent = param1 as PurchaseOKMessageEvent;
         var _loc3_:PurchaseOKMessageParser = _loc2_.getParser();
      }
      
      private function onRecyclerStatus(param1:IMessageEvent) : void
      {
         var _loc2_:RecyclerStatusMessageParser = (param1 as RecyclerStatusMessageEvent).getParser();
         if(_loc2_ == null || var_92 == null)
         {
            return;
         }
         var_92.setSystemStatus(_loc2_.recyclerStatus,_loc2_.recyclerTimeoutSeconds);
      }
      
      private function onAvatarRenderManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_1115 = param2 as IAvatarRenderManager;
      }
      
      public function get privateRoomSessionActive() : Boolean
      {
         return var_1281;
      }
      
      private function onMarketPlaceBuyResult(param1:IMessageEvent) : void
      {
         if(var_237 != null)
         {
            var_237.onBuyResult(param1);
         }
      }
      
      private function onPurchaseError(param1:IMessageEvent) : void
      {
         var _loc2_:PurchaseErrorMessageEvent = param1 as PurchaseErrorMessageEvent;
         var _loc3_:PurchaseErrorMessageParser = _loc2_.getParser();
         _windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.purchaseerror.description}",0,alertDialogEventProcessor);
      }
      
      private function onCatalogPage(param1:IMessageEvent) : void
      {
         var _loc2_:CatalogPageMessageEvent = param1 as CatalogPageMessageEvent;
         var _loc3_:CatalogPageMessageParser = _loc2_.getParser();
         var _loc4_:int = _loc3_.pageId;
         var _loc5_:String = _loc3_.layoutCode;
         var _loc6_:Array = _loc3_.localization.images.concat();
         var _loc7_:Array = _loc3_.localization.texts.concat();
         var _loc8_:IPageLocalization = new PageLocalization(_loc6_,_loc7_);
         var_350.showCatalogPage(_loc4_,_loc5_,_loc8_,_loc3_.offers);
      }
      
      private function onRentableBotDefinitions(param1:IMessageEvent) : void
      {
         var _loc2_:RentableBotDefinitionsMessageParser = (param1 as RentableBotDefinitionsMessageEvent).getParser();
         var_350.dispatchWidgetEvent(new RentableBotDefinitionWidgetEvent(_loc2_.rentableBots));
      }
      
      private function createCatalogViewer() : void
      {
         var _loc1_:IWindowContainer = _mainContainer.findChildByName("layoutContainer") as IWindowContainer;
         var_350 = new CatalogViewer(this,_loc1_,_roomEngine) as ICatalogViewer;
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_86,onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_92,onRoomSessionEvent);
      }
      
      private function onExternalLink(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      public function getMarketPlace() : IMarketPlace
      {
         return var_237;
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return var_170;
      }
      
      public function redeemSoldMarketPlaceOffers() : void
      {
         _communication.getHabboMainConnection(null).send(new RedeemOfferCreditsMessageComposer());
      }
      
      public function returnInventoryFurniFromRecycler(param1:int) : Boolean
      {
         if(var_25 == null)
         {
            return false;
         }
         return var_25.returnInventoryFurniFromRecycler(param1);
      }
   }
}