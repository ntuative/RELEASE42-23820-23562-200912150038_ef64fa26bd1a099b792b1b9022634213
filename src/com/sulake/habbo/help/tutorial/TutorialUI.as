package com.sulake.habbo.help.tutorial
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.ChangeUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.CheckUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.avatar.ChangeUserNameMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.avatar.CheckUserNameMessageComposer;
   import com.sulake.habbo.communication.messages.parser.avatar.ChangeUserNameResultMessageParser;
   import com.sulake.habbo.communication.messages.parser.avatar.CheckUserNameResultMessageParser;
   import com.sulake.habbo.help.HabboHelp;
   import com.sulake.habbo.help.enum.HabboHelpTutorialEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class TutorialUI
   {
      
      public static const const_234:String = "TUI_NAME_VIEW";
      
      public static const const_76:String = "TUI_MAIN_VIEW";
      
      public static const const_305:String = "TUI_CLOTHES_VIEW";
      
      public static const const_345:String = "TUI_GUIDEBOT_VIEW";
       
      
      private var var_915:Boolean = false;
      
      private var var_916:Boolean = false;
      
      private var _window:IWindowContainer;
      
      private var var_1364:int = 0;
      
      private var var_55:HabboHelp;
      
      private var var_917:Boolean = false;
      
      private var var_1121:Boolean = false;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1363:int = 0;
      
      private var var_41:ITutorialUIView;
      
      public function TutorialUI(param1:HabboHelp)
      {
         super();
         var_55 = param1;
         var_55.events.addEventListener(HabboHelpTutorialEvent.const_556,onTaskDoneEvent);
         var_55.events.addEventListener(HabboHelpTutorialEvent.const_561,onTaskDoneEvent);
         var_55.events.addEventListener(HabboHelpTutorialEvent.const_646,onTaskDoneEvent);
      }
      
      public function prepareForTutorial() : void
      {
         if(var_55 == null || true)
         {
            return;
         }
         var_55.hideUI();
         var_55.events.dispatchEvent(new HabboHelpTutorialEvent(HabboHelpTutorialEvent.const_94));
      }
      
      public function get help() : HabboHelp
      {
         return var_55;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_915;
      }
      
      public function update(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         var_917 = param1;
         var_916 = param2;
         var_915 = param3;
         if(var_41 == null || var_41.id == const_76)
         {
            prepareForTutorial();
            showView(const_76);
         }
      }
      
      public function get assets() : IAssetLibrary
      {
         return var_55.assets;
      }
      
      public function setRoomSessionStatus(param1:Boolean) : void
      {
         if(param1 == false)
         {
            disposeWindow();
         }
      }
      
      public function onUserNameChanged(param1:String) : void
      {
         var name:String = param1;
         var_916 = true;
         if(var_41 != null && (var_41.id == const_234 || var_41.id == const_76))
         {
            showView(const_76);
         }
         var_55.localization.registerParameter("help.tutorial.name.changed","name",name);
         var_55.windowManager.alert("${generic.notice}","${help.tutorial.name.changed}",0,function(param1:IAlertDialog, param2:Event):void
         {
            param1.dispose();
         });
      }
      
      public function showView(param1:String) : void
      {
         var _loc2_:* = null;
         if(hasTasksDone)
         {
            dispose();
            return;
         }
         var _loc3_:Boolean = false;
         if(_window == null)
         {
            _window = buildXmlWindow("tutorial_frame") as IWindowContainer;
            if(_window == null)
            {
               return;
            }
            _window.procedure = windowProcedure;
            _loc2_ = _window.findChildByName("content_list") as IItemListWindow;
            if(_loc2_ == null)
            {
               return;
            }
            var_1363 = 0 - _loc2_.width;
            var_1364 = _window.height;
            _loc3_ = true;
         }
         _loc2_ = _window.findChildByName("content_list") as IItemListWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.destroyListItems();
         _loc2_.height = 0;
         if(var_41 != null)
         {
            var_41.dispose();
         }
         switch(param1)
         {
            case const_76:
               var_41 = new TutorialMainView(_loc2_,this);
               break;
            case const_234:
               var_41 = new TutorialNameChangeView(_loc2_,this);
               break;
            case const_305:
               var_41 = new TutorialClothesChangeView(_loc2_,this);
               break;
            case const_345:
               var_41 = new TutorialCallGuideBotView(_loc2_,this);
         }
         _window.height = _loc2_.height + var_1364;
         _window.width = _loc2_.width + var_1363;
         if(_loc3_)
         {
            if(_window == null)
            {
               return;
            }
            _window.x = _window.context.getDesktopWindow().width / 2 - 0;
            _window.y = 0;
         }
      }
      
      public function windowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(param2.name == "header_button_close")
               {
                  disposeWindow();
               }
         }
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return var_55.localization;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_917;
      }
      
      public function dispose() : void
      {
         disposeWindow();
         var_55 = null;
      }
      
      public function buildXmlWindow(param1:String, param2:uint = 1) : IWindow
      {
         if(var_55 == null || true)
         {
            return null;
         }
         var _loc3_:XmlAsset = XmlAsset(var_55.assets.getAssetByName(param1 + "_xml"));
         if(_loc3_ == null || true)
         {
            return null;
         }
         var _loc4_:ICoreWindowManager = ICoreWindowManager(var_55.windowManager);
         return _loc4_.buildFromXML(XML(_loc3_.content),param2);
      }
      
      public function changeName(param1:String) : void
      {
         disposeWindow();
         var_55.sendMessage(new ChangeUserNameMessageComposer(param1));
      }
      
      public function onTaskDoneEvent(param1:HabboHelpTutorialEvent) : void
      {
         switch(param1.type)
         {
            case HabboHelpTutorialEvent.const_556:
               var_915 = true;
               if(var_41 != null && var_41.id == const_345)
               {
                  showView(const_76);
               }
               break;
            case HabboHelpTutorialEvent.const_561:
               if(var_41 != null && var_41.id == const_305)
               {
                  var_1121 = true;
                  disposeWindow();
               }
               break;
            case HabboHelpTutorialEvent.const_646:
               if(var_1121)
               {
                  var_1121 = false;
                  showView(const_76);
               }
         }
      }
      
      public function onChangeUserNameResult(param1:ChangeUserNameResultMessageEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:ChangeUserNameResultMessageParser = param1.getParser();
         if(_loc2_.resultCode != ChangeUserNameResultMessageEvent.var_863)
         {
            showView(const_234);
            (var_41 as TutorialNameChangeView).setNameNotAvailableView(_loc2_.resultCode,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
      
      public function onCheckUserNameResult(param1:CheckUserNameResultMessageEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:CheckUserNameResultMessageParser = param1.getParser();
         showView(const_234);
         var _loc3_:TutorialNameChangeView = var_41 as TutorialNameChangeView;
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc2_.resultCode == ChangeUserNameResultMessageEvent.var_863)
         {
            _loc3_.checkedName = _loc2_.name;
         }
         else
         {
            _loc3_.setNameNotAvailableView(_loc2_.resultCode,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_916;
      }
      
      private function disposeWindow(param1:WindowEvent = null) : void
      {
         if(var_41 != null)
         {
            var_41.dispose();
            var_41 = null;
         }
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function onUserChanged() : void
      {
         var_917 = true;
         if(var_41 != null && (var_41.id == const_305 || var_41.id == const_76))
         {
            showView(const_76);
         }
      }
      
      public function checkName(param1:String) : void
      {
         disposeWindow();
         var_55.sendMessage(new CheckUserNameMessageComposer(param1));
      }
      
      public function get hasTasksDone() : Boolean
      {
         return var_917 && var_916 && var_915;
      }
   }
}
