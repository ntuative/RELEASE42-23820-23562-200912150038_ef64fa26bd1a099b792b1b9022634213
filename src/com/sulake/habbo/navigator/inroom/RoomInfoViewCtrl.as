package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_647:IWindowContainer;
      
      private var var_959:ITextWindow;
      
      private var var_198:RoomSettingsCtrl;
      
      private var var_1183:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var var_463:Timer;
      
      private var var_1180:ITextWindow;
      
      private var var_330:IWindowContainer;
      
      private var var_1892:IWindowContainer;
      
      private var var_1891:ITextWindow;
      
      private var var_800:IWindowContainer;
      
      private var var_1420:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_640:ITextWindow;
      
      private var var_1422:IWindowContainer;
      
      private var var_1181:IWindowContainer;
      
      private var var_798:ITextWindow;
      
      private var var_958:ITextFieldWindow;
      
      private var var_292:IWindowContainer;
      
      private var var_799:ITextWindow;
      
      private var var_1421:IButtonWindow;
      
      private var var_960:ITextWindow;
      
      private var var_2218:int;
      
      private var var_1179:IContainerButtonWindow;
      
      private var var_801:IWindowContainer;
      
      private var var_1184:ITextWindow;
      
      private var var_1178:IContainerButtonWindow;
      
      private var var_1419:ITextWindow;
      
      private var var_1418:IButtonWindow;
      
      private var var_938:TagRenderer;
      
      private var var_1890:ITextWindow;
      
      private var var_329:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_646:ITextWindow;
      
      private var var_258:RoomThumbnailCtrl;
      
      private var var_1182:IContainerButtonWindow;
      
      private var var_1889:IWindowContainer;
      
      private var var_257:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_329 = new RoomEventViewCtrl(_navigator);
         var_198 = new RoomSettingsCtrl(_navigator,this,true);
         var_258 = new RoomThumbnailCtrl(_navigator);
         var_938 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_198);
         var_463 = new Timer(6000,1);
         var_463.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_198.active = true;
         this.var_329.active = false;
         this.var_258.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1420.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1418.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1422.visible = Util.hasVisibleChildren(var_1422);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_640.text = param1.roomName;
         var_640.height = NaN;
         _ownerName.text = param1.ownerName;
         var_798.text = param1.description;
         var_938.refreshTags(var_330,param1.tags);
         var_798.visible = false;
         if(param1.description != "")
         {
            var_798.height = NaN;
            var_798.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_330,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_330,"thumb_down",_loc3_,onThumbDown,0);
         var_1891.visible = _loc3_;
         var_799.visible = !_loc3_;
         var_1419.visible = !_loc3_;
         var_1419.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_330,"home",param2,null,0);
         _navigator.refreshButton(var_330,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(var_330,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_640.y,0);
         var_330.visible = true;
         var_330.height = Util.getLowestPoint(var_330);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_453,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(0,_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false)
         {
            return;
         }
         var_1421.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1183.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1182.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1179.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1178.visible = _navigator.data.canEditRoomSettings && param1;
         var_1181.visible = Util.hasVisibleChildren(var_1181);
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_463.reset();
         this.var_329.active = false;
         this.var_198.active = false;
         this.var_258.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_48,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this.var_463.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_463.reset();
         this.var_329.active = false;
         this.var_198.active = false;
         this.var_258.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_48,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_453,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_292);
         var_292.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _navigator.data.settings != null && _loc1_ != null && _loc1_.flatId == _navigator.data.settings.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         refreshPublicSpaceDetails(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_198.refresh(var_292);
         this.var_258.refresh(var_292);
         Util.moveChildrenToColumn(var_292,["room_details","room_buttons"],0,2);
         var_292.height = Util.getLowestPoint(var_292);
         var_292.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_958.setSelection(0,var_958.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_257);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_329.refresh(var_257);
         if(Util.hasVisibleChildren(var_257) && !this.var_258.active)
         {
            Util.moveChildrenToColumn(var_257,["event_details","event_buttons"],0,2);
            var_257.height = Util.getLowestPoint(var_257);
            var_257.visible = true;
         }
         else
         {
            var_257.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this.var_463.reset();
         this.var_329.active = true;
         this.var_198.active = false;
         this.var_258.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(0,_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         var_463.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_959.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_959.height = NaN;
         var_1180.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1180.height = NaN;
         Util.moveChildrenToColumn(var_647,["public_space_name","public_space_desc"],var_959.y,0);
         var_647.visible = true;
         var_647.height = Math.max(86,Util.getLowestPoint(var_647));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","false") == "HabboAvatarRenderLib_fx15";
         if(_loc1_ && true && true && true)
         {
            var_801.visible = true;
            var_958.text = this.getEmbedData();
         }
         else
         {
            var_801.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_463.reset();
         this.var_198.load(param1);
         this.var_198.active = true;
         this.var_329.active = false;
         this.var_258.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_463.reset();
         this.var_198.active = false;
         this.var_329.active = false;
         this.var_258.active = true;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_64,false);
         _window.setParamFlag(HabboWindowParam.const_1200,true);
         var_292 = IWindowContainer(find("room_info"));
         var_330 = IWindowContainer(find("room_details"));
         var_647 = IWindowContainer(find("public_space_details"));
         var_1889 = IWindowContainer(find("owner_name_cont"));
         var_1892 = IWindowContainer(find("rating_cont"));
         var_1181 = IWindowContainer(find("room_buttons"));
         var_640 = ITextWindow(find("room_name"));
         var_959 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_798 = ITextWindow(find("room_desc"));
         var_1180 = ITextWindow(find("public_space_desc"));
         var_960 = ITextWindow(find("owner_caption"));
         var_799 = ITextWindow(find("rating_caption"));
         var_1891 = ITextWindow(find("rate_caption"));
         var_1419 = ITextWindow(find("rating_txt"));
         var_257 = IWindowContainer(find("event_info"));
         var_800 = IWindowContainer(find("event_details"));
         var_1422 = IWindowContainer(find("event_buttons"));
         var_1890 = ITextWindow(find("event_name"));
         var_646 = ITextWindow(find("event_desc"));
         var_1183 = IContainerButtonWindow(find("add_favourite_button"));
         var_1182 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1179 = IContainerButtonWindow(find("make_home_button"));
         var_1178 = IContainerButtonWindow(find("unmake_home_button"));
         var_1421 = IButtonWindow(find("room_settings_button"));
         var_1420 = IButtonWindow(find("create_event_button"));
         var_1418 = IButtonWindow(find("edit_event_button"));
         var_801 = IWindowContainer(find("embed_info"));
         var_1184 = ITextWindow(find("embed_info_txt"));
         var_958 = ITextFieldWindow(find("embed_src_txt"));
         Util.setProcDirectly(var_1183,onAddFavouriteClick);
         Util.setProcDirectly(var_1182,onRemoveFavouriteClick);
         Util.setProcDirectly(var_1421,onRoomSettingsClick);
         Util.setProcDirectly(var_1179,onMakeHomeClick);
         Util.setProcDirectly(var_1178,onUnmakeHomeClick);
         Util.setProcDirectly(var_1420,onEventSettingsClick);
         Util.setProcDirectly(var_1418,onEventSettingsClick);
         Util.setProcDirectly(var_958,onEmbedSrcClick);
         _navigator.refreshButton(var_1183,"favourite",true,null,0);
         _navigator.refreshButton(var_1182,"favourite",true,null,0);
         _navigator.refreshButton(var_1179,"home",true,null,0);
         _navigator.refreshButton(var_1178,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.setProcDirectly(var_292,onHover);
         Util.setProcDirectly(var_257,onHover);
         var_960.width = var_960.textWidth;
         Util.moveChildrenToRow(var_1889,["owner_caption","owner_name"],var_960.x,var_960.y,3);
         var_799.width = var_799.textWidth;
         Util.moveChildrenToRow(var_1892,["rating_caption","rating_txt"],var_799.x,var_799.y,3);
         var_1184.height = NaN;
         Util.moveChildrenToColumn(var_801,["embed_info_txt","embed_src_txt"],var_1184.y,2);
         var_801.height = Util.getLowestPoint(var_801) + 5;
         var_2218 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_1890.text = param1.eventName;
         var_646.text = param1.eventDescription;
         var_938.refreshTags(var_800,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_646.visible = false;
         if(param1.eventDescription != "")
         {
            var_646.height = NaN;
            var_646.y = Util.getLowestPoint(var_800) + 2;
            var_646.visible = true;
         }
         var_800.visible = true;
         var_800.height = Util.getLowestPoint(var_800);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.getLowestPoint(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_806,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
