package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarActionUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetCreditBalanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFrameUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetWaveUpdateEvent;
   import com.sulake.habbo.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class MeMenuWidget extends RoomWidgetBase
   {
      
      public static const const_502:String = "me_menu_settings_view";
      
      private static const const_739:int = 10;
      
      public static const const_519:String = "me_menu_effects_view";
      
      public static const const_109:String = "me_menu_top_view";
      
      public static const const_1115:String = "me_menu_rooms_view";
      
      public static const const_963:String = "me_menu_dance_moves_view";
      
      public static const const_265:String = "me_menu_my_clothes_view";
       
      
      private var var_1687:Boolean = false;
      
      private var _isAnimating:Boolean = false;
      
      private var _eventDispatcher:IEventDispatcher;
      
      private var var_1365:int = 0;
      
      private var var_1686:int = 0;
      
      private var var_1688:Boolean = false;
      
      private var var_249:Boolean = false;
      
      private var var_1684:int = 0;
      
      private var var_1683:Number = 0;
      
      private var _mainContainer:IWindowContainer;
      
      private var var_514:Boolean = false;
      
      private var var_95:ClubPromoView;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_1098:int = 0;
      
      private var var_1685:Boolean = false;
      
      private var var_902:Point;
      
      private var var_41:IMeMenuView;
      
      public function MeMenuWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IEventDispatcher, param5:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         _config = param5;
         var_902 = new Point(0,0);
         _eventDispatcher = param4;
         if(param5 != null && false)
         {
            var_1685 = param5.getKey("client.news.embed.enabled","false") == "HabboAvatarRenderLib_fx15";
         }
         changeView(const_109);
         hide();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetWaveUpdateEvent.const_702,onWaveEvent);
         param1.addEventListener(RoomWidgetDanceUpdateEvent.const_591,onDanceEvent);
         param1.addEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_509,onUpdateEffects);
         param1.addEventListener(RoomWidgetToolbarClickedUpdateEvent.const_620,onToolbarClicked);
         param1.addEventListener(RoomWidgetFrameUpdateEvent.const_285,onUpdate);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_597,onAvatarEditorClosed);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_359,onShowAvatarEditorClubPromo);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_928,onHideAvatarEditorClubPromo);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_220,onAvatarDeselected);
         param1.addEventListener(RoomWidgetHabboClubUpdateEvent.const_206,onHabboClubEvent);
         param1.addEventListener(RoomWidgetAvatarActionUpdateEvent.const_533,onAvatarActionEvent);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_193,onUserInfo);
         param1.addEventListener(RoomWidgetSettingsUpdateEvent.const_297,onSettingsUpdate);
         param1.addEventListener(RoomWidgetTutorialEvent.const_94,onTutorialEvent);
         param1.addEventListener(RoomWidgetTutorialEvent.const_459,onTutorialEvent);
         param1.addEventListener(RoomWidgetCreditBalanceUpdateEvent.const_172,onCreditBalance);
         super.registerUpdateEvents(param1);
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         if(!_isAnimating)
         {
            return;
         }
      }
      
      override public function get mainWindow() : IWindow
      {
         return _mainContainer;
      }
      
      public function get hasEffectOn() : Boolean
      {
         return var_514;
      }
      
      private function onSettingsUpdate(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         if(!var_249)
         {
            return;
         }
         if(var_41.window.name == const_502)
         {
            (var_41 as MeMenuSettingsView).updateSettings(param1);
         }
      }
      
      public function get isHabboClubActive() : Boolean
      {
         return var_1098 > 0;
      }
      
      private function onWaveEvent(param1:RoomWidgetWaveUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Wave Event received");
      }
      
      private function onCreditBalance(param1:RoomWidgetCreditBalanceUpdateEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var_1365 = param1.balance;
         localizations.registerParameter("widget.memenu.credits","credits",var_1365.toString());
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(!(var_249 && var_41.window.name == const_265))
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_511);
            if(messageListener != null)
            {
               messageListener.processWidgetMessage(_loc2_);
            }
         }
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetWaveUpdateEvent.const_702,onWaveEvent);
         param1.removeEventListener(RoomWidgetDanceUpdateEvent.const_591,onDanceEvent);
         param1.removeEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_509,onUpdateEffects);
         param1.removeEventListener(RoomWidgetToolbarClickedUpdateEvent.const_620,onToolbarClicked);
         param1.removeEventListener(RoomWidgetFrameUpdateEvent.const_285,onUpdate);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_220,onAvatarDeselected);
         param1.removeEventListener(RoomWidgetHabboClubUpdateEvent.const_206,onHabboClubEvent);
         param1.removeEventListener(RoomWidgetAvatarActionUpdateEvent.const_533,onAvatarActionEvent);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_597,onAvatarEditorClosed);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_359,onShowAvatarEditorClubPromo);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_928,onHideAvatarEditorClubPromo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_193,onUserInfo);
         param1.removeEventListener(RoomWidgetSettingsUpdateEvent.const_297,onSettingsUpdate);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_459,onTutorialEvent);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_94,onTutorialEvent);
         param1.removeEventListener(RoomWidgetCreditBalanceUpdateEvent.const_172,onCreditBalance);
      }
      
      override public function dispose() : void
      {
         hide();
         _eventDispatcher = null;
         if(var_41 != null)
         {
            var_41.dispose();
            var_41 = null;
         }
         super.dispose();
      }
      
      public function get allowHabboClubDances() : Boolean
      {
         return var_1687;
      }
      
      public function changeToOutfit(param1:int) : void
      {
         var_1683 = new Date().valueOf();
         this.messageListener.processWidgetMessage(new RoomWidgetSelectOutfitMessage(param1));
      }
      
      private function onHideAvatarEditorClubPromo(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_95 != null)
         {
            var_95.dispose();
            var_95 = null;
         }
         updateSize();
      }
      
      public function get isDancing() : Boolean
      {
         return var_1688;
      }
      
      public function get creditBalance() : int
      {
         return var_1365;
      }
      
      private function onTutorialEvent(param1:RoomWidgetTutorialEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetTutorialEvent.const_459:
               Logger.log("* MeMenuWidget: onHighlightClothesIcon " + var_249 + " view: " + var_41.window.name);
               if(var_249 != true || var_41.window.name != const_109)
               {
                  return;
               }
               (var_41 as MeMenuMainView).setIconAssets("clothes_icon",const_109,"clothes_highlighter_blue");
               break;
            case RoomWidgetTutorialEvent.const_94:
               hide();
         }
      }
      
      public function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = new Date().valueOf();
         return _loc1_ - var_1683 > 5000;
      }
      
      public function get habboClubPeriods() : int
      {
         return var_1686;
      }
      
      private function onAvatarActionEvent(param1:RoomWidgetAvatarActionUpdateEvent) : void
      {
         switch(param1.actionType)
         {
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_ACTIVE:
               var_514 = true;
               break;
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_INACTIVE:
               var_514 = false;
               break;
            default:
               trace("MeMenuWidget: unknown avatar action event: " + param1.actionType);
         }
      }
      
      private function onHabboClubEvent(param1:RoomWidgetHabboClubUpdateEvent) : void
      {
         var _loc2_:* = var_1098 > 0;
         var_1098 = param1.daysLeft;
         var_1686 = param1.periodsLeft;
         var_1684 = param1.pastPeriods;
         var_1687 = param1.allowClubDances;
         if(_loc2_ != param1.daysLeft > 0)
         {
            if(var_41 != null)
            {
               changeView(var_41.window.name);
            }
         }
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         var_1688 = param1;
      }
      
      private function onAvatarDeselected(param1:Event) : void
      {
         if(var_41 != null && var_41.window.name != const_265)
         {
            hide();
         }
      }
      
      private function onShowAvatarEditorClubPromo(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(var_41 != null && var_41.window.name == const_265)
         {
            if(param1.promoMode == RoomWidgetAvatarEditorUpdateEvent.const_949)
            {
               var_95 = new ClubPromoView(this,param1.promoImageUrl,ClubPromoView.const_1151);
            }
            else
            {
               var_95 = new ClubPromoView(this,param1.promoImageUrl,ClubPromoView.const_444);
            }
            _loc2_ = _mainContainer.getChildByName(var_41.window.name);
            if(_loc2_ != null)
            {
               var_95.window.x = _loc2_.width + const_739;
               _mainContainer.addChild(var_95.window);
               _mainContainer.width = var_95.window.x + var_95.window.width;
            }
         }
      }
      
      private function onUpdateEffects(param1:RoomWidgetUpdateEffectsUpdateEvent) : void
      {
         var _loc2_:* = null;
         var_514 = false;
         for each(_loc2_ in param1.effects)
         {
            if(_loc2_.isInUse)
            {
               var_514 = true;
            }
         }
         if(var_41 != null && var_41.window.name == const_519)
         {
            (var_41 as MeMenuEffectsView).updateEffects(param1.effects);
         }
      }
      
      public function get habboClubPastPeriods() : int
      {
         return var_1684;
      }
      
      public function get habboClubDays() : int
      {
         return var_1098;
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(_mainContainer == null)
         {
            _mainContainer = windowManager.createWindow("me_menu_main_container","",HabboWindowType.const_1191,HabboWindowStyle.const_904,HabboWindowParam.const_40,new Rectangle(0,0,170,260)) as IWindowContainer;
            _mainContainer.tags.push("room_widget_me_menu");
         }
         return _mainContainer;
      }
      
      private function onToolbarClicked(param1:RoomWidgetToolbarClickedUpdateEvent) : void
      {
         switch(param1.iconType)
         {
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU:
               var_249 = !var_249;
               break;
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO:
               var_249 = false;
               break;
            default:
               return;
         }
         if(var_249)
         {
            show();
         }
         else
         {
            hide();
         }
      }
      
      private function onDanceEvent(param1:RoomWidgetDanceUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Dance Event received, style: " + param1.style);
      }
      
      public function hide(param1:RoomWidgetRoomObjectUpdateEvent = null) : void
      {
         var _loc2_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_508);
         _loc2_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc2_);
         }
         if(var_41 != null)
         {
            _mainContainer.removeChild(var_41.window);
            var_41.dispose();
            var_41 = null;
         }
         var_249 = false;
         _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE));
      }
      
      private function onAvatarEditorClosed(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_41 != null && var_41.window.name == const_265)
         {
            if(var_95 != null)
            {
               var_95.dispose();
               var_95 = null;
            }
            changeView(const_109);
         }
      }
      
      public function get isNewsEnabled() : Boolean
      {
         return var_1685;
      }
      
      public function changeView(param1:String) : void
      {
         var _loc2_:* = null;
         if(var_95 != null)
         {
            var_95.dispose();
            var_95 = null;
         }
         switch(param1)
         {
            case const_109:
               _loc2_ = new MeMenuMainView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT));
               break;
            case const_519:
               _loc2_ = new MeMenuEffectsView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS));
               break;
            case const_963:
               _loc2_ = new MeMenuDanceView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE));
               break;
            case const_265:
               _loc2_ = new MeMenuClothesView();
               break;
            case const_1115:
               _loc2_ = new MeMenuRoomsView();
               break;
            case const_502:
               _loc2_ = new MeMenuSettingsView();
               break;
            default:
               Logger.log("Me Menu Change view: unknown view: " + param1);
         }
         if(_loc2_ != null)
         {
            if(var_41 != null)
            {
               _mainContainer.removeChild(var_41.window);
               var_41.dispose();
               var_41 = null;
            }
            var_41 = _loc2_;
            var_41.init(this,param1);
         }
         updateSize();
      }
      
      public function updateSize() : void
      {
         if(var_41 != null)
         {
            var_902.x = var_41.window.width + 10;
            var_902.y = var_41.window.height;
            var_41.window.x = 5;
            var_41.window.y = 0;
            _mainContainer.width = var_902.x;
            _mainContainer.height = var_902.y;
            if(var_95 != null)
            {
               _mainContainer.width = var_95.window.x + var_95.window.width + const_739;
            }
         }
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return _config;
      }
      
      private function show() : void
      {
         changeView(const_109);
         var _loc1_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_577);
         _loc1_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
         var_249 = true;
      }
   }
}
