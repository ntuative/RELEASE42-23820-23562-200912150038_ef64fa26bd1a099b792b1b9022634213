package com.sulake.habbo.widget.infostand
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetBadgeImageUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetCommandsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserBadgesUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserFigureUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserTagsUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetUserActionMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class InfostandWidget extends RoomWidgetBase
   {
       
      
      private var var_1849:Array;
      
      private const const_1381:String = "infostand_user_view";
      
      private var var_291:InfoStandPetView;
      
      private var var_1080:InfoStandPetData;
      
      private var var_136:Timer;
      
      private var var_791:InfoStandFurniView;
      
      private var var_361:InfostandFurniData;
      
      private var var_327:InfoStandBotView;
      
      private var _mainContainer:IWindowContainer;
      
      private const const_1382:String = "infostand_bot_view";
      
      private var _config:IHabboConfigurationManager;
      
      private const const_1384:String = "infostand_pet_view";
      
      private const const_1383:String = "infostand_furni_view";
      
      private const const_1590:int = 3000;
      
      private var var_196:InfoStandUserView;
      
      private var var_396:InfostandUserData;
      
      public function InfostandWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         _config = param4;
         var_791 = new InfoStandFurniView(this,const_1383);
         var_196 = new InfoStandUserView(this,const_1381);
         var_291 = new InfoStandPetView(this,const_1384);
         var_327 = new InfoStandBotView(this,const_1382);
         var_396 = new InfostandUserData();
         var_361 = new InfostandFurniData();
         var_1080 = new InfoStandPetData();
         var_136 = new Timer(const_1590);
         var_136.addEventListener(TimerEvent.TIMER,onUpdateTimer);
         mainContainer.visible = false;
      }
      
      private function onUserTags(param1:RoomWidgetUserTagsUpdateEvent) : void
      {
         if(param1.isOwnUser)
         {
            var_1849 = param1.tags;
         }
         if(param1.userId != userData.userId)
         {
            return;
         }
         if(param1.isOwnUser)
         {
            var_196.setTags(param1.tags);
         }
         else
         {
            var_196.setTags(param1.tags,var_1849);
         }
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_312,onRoomObjectSelected);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_220,onClose);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_231,onRoomObjectRemoved);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_108,onRoomObjectRemoved);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_193,onUserInfo);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_217,onUserInfo);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.BOT,onBotInfo);
         param1.addEventListener(RoomWidgetFurniInfoUpdateEvent.const_603,onFurniInfo);
         param1.addEventListener(RoomWidgetUserTagsUpdateEvent.const_135,onUserTags);
         param1.addEventListener(RoomWidgetUserFigureUpdateEvent.const_134,onUserFigureUpdate);
         param1.addEventListener(RoomWidgetUserBadgesUpdateEvent.const_102,onUserBadges);
         param1.addEventListener(RoomWidgetBadgeImageUpdateEvent.const_553,onBadgeImage);
         param1.addEventListener(RoomWidgetPetInfoUpdateEvent.const_142,onPetInfo);
         param1.addEventListener(RoomWidgetPetCommandsUpdateEvent.const_131,onPetCommands);
         super.registerUpdateEvents(param1);
      }
      
      override public function get mainWindow() : IWindow
      {
         return mainContainer;
      }
      
      private function onPetInfo(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         petData.setData(param1);
         userData.petRespectLeft = param1.petRespectLeft;
         var_291.update(petData);
         selectView(const_1384);
         if(var_136)
         {
            var_136.start();
         }
      }
      
      public function get userData() : InfostandUserData
      {
         return var_396;
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         userData.setData(param1);
         var_196.update(param1);
         selectView(const_1381);
         if(var_136)
         {
            var_136.stop();
         }
      }
      
      private function onUpdateTimer(param1:TimerEvent) : void
      {
         if(var_291 == null)
         {
            return;
         }
         messageListener.processWidgetMessage(new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.const_358,var_291.getCurrentPetId()));
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_312,onRoomObjectSelected);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_220,onClose);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_231,onRoomObjectRemoved);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_108,onRoomObjectRemoved);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_193,onUserInfo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_217,onUserInfo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.BOT,onBotInfo);
         param1.removeEventListener(RoomWidgetFurniInfoUpdateEvent.const_603,onFurniInfo);
         param1.removeEventListener(RoomWidgetUserTagsUpdateEvent.const_135,onUserTags);
         param1.removeEventListener(RoomWidgetUserFigureUpdateEvent.const_134,onUserFigureUpdate);
         param1.removeEventListener(RoomWidgetUserBadgesUpdateEvent.const_102,onUserBadges);
         param1.removeEventListener(RoomWidgetBadgeImageUpdateEvent.const_553,onBadgeImage);
         param1.removeEventListener(RoomWidgetPetInfoUpdateEvent.const_142,onPetInfo);
         param1.removeEventListener(RoomWidgetPetCommandsUpdateEvent.const_131,onPetCommands);
      }
      
      override public function dispose() : void
      {
         if(var_136)
         {
            var_136.stop();
         }
         var_136 = null;
         if(var_196)
         {
            var_196.dispose();
         }
         var_196 = null;
         if(var_791)
         {
            var_791.dispose();
         }
         var_791 = null;
         if(var_327)
         {
            var_327.dispose();
         }
         var_327 = null;
         if(var_291)
         {
            var_291.dispose();
         }
         var_291 = null;
         super.dispose();
      }
      
      private function onUserBadges(param1:RoomWidgetUserBadgesUpdateEvent) : void
      {
         if(param1.userId != userData.userId)
         {
            return;
         }
         userData.badges = param1.badges;
         var_196.clearBadges();
      }
      
      private function onFurniInfo(param1:RoomWidgetFurniInfoUpdateEvent) : void
      {
         furniData.setData(param1);
         var_791.update(param1);
         selectView(const_1383);
         if(var_136)
         {
            var_136.stop();
         }
      }
      
      private function onBotInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         userData.setData(param1);
         var_327.update(param1);
         selectView(const_1382);
         if(var_136)
         {
            var_136.stop();
         }
      }
      
      private function onUserFigureUpdate(param1:RoomWidgetUserFigureUpdateEvent) : void
      {
         if(!param1.isOwnUser)
         {
         }
         if(param1.userId != userData.userId)
         {
            return;
         }
         if(userData.isBot())
         {
            var_327.image = param1.image;
         }
         else
         {
            var_196.image = param1.image;
         }
      }
      
      private function onBadgeImage(param1:RoomWidgetBadgeImageUpdateEvent) : void
      {
         var _loc2_:int = userData.badges.indexOf(param1.badgeID);
         if(_loc2_ >= 0)
         {
            if(userData.isBot())
            {
               var_327.setBadgeImage(_loc2_,param1.badgeImage);
            }
            else
            {
               var_196.setBadgeImage(_loc2_,param1.badgeImage);
            }
            return;
         }
         if(param1.badgeID == userData.groupBadgeId)
         {
            var_196.setGroupBadgeImage(param1.badgeImage);
         }
      }
      
      private function selectView(param1:String) : void
      {
         hideChildren();
         var _loc2_:IWindow = mainContainer.getChildByName(param1) as IWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.visible = true;
         mainContainer.visible = true;
         mainContainer.width = _loc2_.width;
         mainContainer.height = _loc2_.height;
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(_mainContainer == null)
         {
            _mainContainer = windowManager.createWindow("infostand_main_container","",HabboWindowType.const_55,HabboWindowStyle.const_40,HabboWindowParam.const_40,new Rectangle(0,0,50,100)) as IWindowContainer;
            _mainContainer.tags.push("room_widget_infostand");
            _mainContainer.background = true;
            _mainContainer.color = 0;
         }
         return _mainContainer;
      }
      
      public function get furniData() : InfostandFurniData
      {
         return var_361;
      }
      
      private function onClose(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         close();
         if(var_136)
         {
            var_136.stop();
         }
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return _config;
      }
      
      private function onRoomObjectRemoved(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         var _loc2_:* = false;
         switch(param1.type)
         {
            case RoomWidgetRoomObjectUpdateEvent.const_108:
               _loc2_ = param1.id == var_361.id;
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_231:
               if(var_196 != null && false && var_196.window.visible)
               {
                  _loc2_ = param1.id == var_396.userRoomId;
                  break;
               }
               if(var_291 != null && false && var_291.window.visible)
               {
                  _loc2_ = param1.id == var_1080.roomIndex;
                  break;
               }
               if(var_327 != null && false && var_327.window.visible)
               {
                  _loc2_ = param1.id == var_396.userRoomId;
                  break;
               }
         }
         if(_loc2_)
         {
            close();
         }
      }
      
      public function get petData() : InfoStandPetData
      {
         return var_1080;
      }
      
      public function refreshContainer() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < mainContainer.numChildren)
         {
            _loc1_ = mainContainer.getChildAt(_loc2_);
            if(_loc1_.visible)
            {
               mainContainer.width = _loc1_.width;
               mainContainer.height = _loc1_.height;
            }
            _loc2_++;
         }
      }
      
      private function hideChildren() : void
      {
         var _loc1_:int = 0;
         if(_mainContainer != null)
         {
            _loc1_ = 0;
            while(_loc1_ < _mainContainer.numChildren)
            {
               _mainContainer.getChildAt(_loc1_).visible = false;
               _loc1_++;
            }
         }
      }
      
      private function onPetCommands(param1:RoomWidgetPetCommandsUpdateEvent) : void
      {
         var_291.updateEnabledTrainingCommands(param1.id,param1.enabledCommands);
      }
      
      public function close() : void
      {
         hideChildren();
         if(var_136)
         {
            var_136.stop();
         }
      }
      
      private function onRoomObjectSelected(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         var _loc2_:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_318,param1.id,param1.category);
         messageListener.processWidgetMessage(_loc2_);
      }
   }
}
