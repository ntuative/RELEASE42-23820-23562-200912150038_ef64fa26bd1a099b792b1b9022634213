package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.moderation.ModeratorUserInfoData;
   import com.sulake.habbo.communication.messages.outgoing.moderator.GetModeratorUserInfoMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.moderator.GetUserChatlogMessageComposer;
   
   public class UserInfoCtrl implements IDisposable
   {
      
      private static const const_765:int = 31536000;
      
      private static const const_763:int = 86400;
      
      private static const const_764:int = 3600;
      
      private static const const_766:int = 60;
       
      
      private var _disposed:Boolean;
      
      private var _data:ModeratorUserInfoData;
      
      private var _callerFrame:IFrameWindow;
      
      private var _userId:int;
      
      private var var_55:ModerationManager;
      
      private var var_1013:Boolean;
      
      private var var_850:IWindowContainer;
      
      private var var_1145:String;
      
      public function UserInfoCtrl(param1:IFrameWindow, param2:ModerationManager, param3:String, param4:Boolean = false)
      {
         super();
         _callerFrame = param1;
         var_55 = param2;
         var_1145 = param3;
         var_1013 = param4;
      }
      
      public static function formatTime(param1:int) : String
      {
         if(param1 < 2 * const_766)
         {
            return param1 + " secs ago";
         }
         if(param1 < 2 * const_764)
         {
            return Math.round(param1 / const_766) + " mins ago";
         }
         if(param1 < 2 * const_763)
         {
            return Math.round(param1 / const_764) + " hours ago";
         }
         if(param1 < 2 * const_765)
         {
            return Math.round(param1 / const_763) + " days ago";
         }
         return Math.round(param1 / const_765) + " years ago";
      }
      
      private function onChatlogButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_55.windowTracker.show(new ChatlogCtrl(new GetUserChatlogMessageComposer(_data.userId),var_55,WindowTracker.const_952,_data.userId),_callerFrame,var_1013,false,true);
      }
      
      private function prepare() : IWindowContainer
      {
         var _loc1_:IWindowContainer = IWindowContainer(var_850.findChildByName("user_info"));
         if(_loc1_ == null)
         {
            _loc1_ = IWindowContainer(var_55.getXmlWindow("user_info"));
            var_850.addChild(_loc1_);
            var_55.disableButton(var_55.initMsg.chatlogsPermission,_loc1_,"chatlog_but");
            var_55.disableButton(var_55.initMsg.alertPermission,_loc1_,"message_but");
            var_55.disableButton(var_55.initMsg.alertPermission || var_55.initMsg.kickPermission || var_55.initMsg.banPermission,_loc1_,"modaction_but");
         }
         _loc1_.findChildByName("chatlog_but").procedure = onChatlogButton;
         _loc1_.findChildByName("roomvisits_but").procedure = onRoomVisitsButton;
         _loc1_.findChildByName("habboinfotool_but").procedure = onHabboInfoToolButton;
         _loc1_.findChildByName("message_but").procedure = onMessageButton;
         _loc1_.findChildByName("modaction_but").procedure = onModActionButton;
         _loc1_.findChildByName("view_caution_count_txt").procedure = onViewCautions;
         _loc1_.findChildByName("view_ban_count_txt").procedure = onViewBans;
         return _loc1_;
      }
      
      private function onModActionButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_55.windowTracker.show(new ModActionCtrl(var_55,_data.userId,_data.userName,var_1145),_callerFrame,var_1013,false,true);
      }
      
      private function onViewCautions(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         showModeratorLog();
      }
      
      private function onHabboInfoToolButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_55.openHkPage("habboinfotool.url",_data.userName);
      }
      
      private function onRoomVisitsButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_55.windowTracker.show(new RoomVisitsCtrl(var_55,_data.userId),_callerFrame,var_1013,false,true);
      }
      
      private function onViewBans(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         showModeratorLog();
      }
      
      public function onUserInfo(param1:ModeratorUserInfoData) : void
      {
         if(param1.userId != _userId)
         {
            return;
         }
         _data = param1;
         refresh();
      }
      
      public function refresh() : void
      {
         if(false)
         {
            return;
         }
         var _loc1_:IWindowContainer = prepare();
         if(_data == null)
         {
            _loc1_.findChildByName("fields").visible = false;
            _loc1_.findChildByName("loading_txt").visible = true;
            return;
         }
         _loc1_.findChildByName("fields").visible = true;
         _loc1_.findChildByName("loading_txt").visible = false;
         setTxt(_loc1_,"name_txt",_data.userName);
         setTxt(_loc1_,"cfh_count_txt","undefined");
         setAlertTxt(_loc1_,"abusive_cfh_count_txt",_data.abusiveCfhCount,false);
         setAlertTxt(_loc1_,"caution_count_txt",_data.cautionCount,true);
         setAlertTxt(_loc1_,"ban_count_txt",_data.banCount,true);
         setTxt(_loc1_,"registered_txt",formatTime(0));
         setTxt(_loc1_,"last_login_txt",formatTime(0));
         setTxt(_loc1_,"online_txt",!true ? "Yes" : "No");
         Logger.log("USER: undefined, undefined, undefined");
      }
      
      private function showModeratorLog() : void
      {
         var_55.openHkPage("moderatoractionlog.url",_data.userName);
      }
      
      public function load(param1:IWindowContainer, param2:int) : void
      {
         var_850 = param1;
         _userId = param2;
         _data = null;
         refresh();
         var_55.messageHandler.addUserInfoListener(this);
         var_55.connection.send(new GetModeratorUserInfoMessageComposer(param2));
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      private function setTxt(param1:IWindowContainer, param2:String, param3:String) : void
      {
         var _loc4_:ITextWindow = ITextWindow(param1.findChildByName(param2));
         _loc4_.text = param3;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         var_55.messageHandler.removeUserInfoListener(this);
         _callerFrame = null;
         var_55 = null;
         _data = null;
         var_850 = null;
      }
      
      private function onMessageButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_55.windowTracker.show(new SendMsgsCtrl(var_55,_data.userId,_data.userName,var_1145),_callerFrame,var_1013,false,true);
      }
      
      private function setAlertTxt(param1:IWindowContainer, param2:String, param3:int, param4:Boolean) : void
      {
         var _loc5_:ITextWindow = ITextWindow(param1.findChildByName(param2));
         var _loc6_:ITextWindow = ITextWindow(param1.findChildByName("view_" + param2));
         if(_loc6_ != null)
         {
            _loc6_.visible = param3 > 0;
         }
         _loc5_.visible = param3 > 0;
         _loc5_.text = "" + param3;
      }
   }
}
