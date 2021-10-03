package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1219:String = "WN_CREATED";
      
      public static const const_798:String = "WN_DISABLE";
      
      public static const const_812:String = "WN_DEACTIVATED";
      
      public static const const_997:String = "WN_OPENED";
      
      public static const const_973:String = "WN_CLOSED";
      
      public static const const_983:String = "WN_DESTROY";
      
      public static const const_1466:String = "WN_ARRANGED";
      
      public static const const_430:String = "WN_PARENT_RESIZED";
      
      public static const const_902:String = "WN_ENABLE";
      
      public static const const_865:String = "WN_RELOCATE";
      
      public static const const_957:String = "WN_FOCUS";
      
      public static const const_779:String = "WN_PARENT_RELOCATED";
      
      public static const const_386:String = "WN_PARAM_UPDATED";
      
      public static const const_717:String = "WN_PARENT_ACTIVATED";
      
      public static const const_254:String = "WN_RESIZED";
      
      public static const const_838:String = "WN_CLOSE";
      
      public static const const_996:String = "WN_PARENT_REMOVED";
      
      public static const const_229:String = "WN_CHILD_RELOCATED";
      
      public static const const_497:String = "WN_ENABLED";
      
      public static const const_241:String = "WN_CHILD_RESIZED";
      
      public static const const_934:String = "WN_MINIMIZED";
      
      public static const const_531:String = "WN_DISABLED";
      
      public static const const_203:String = "WN_CHILD_ACTIVATED";
      
      public static const const_391:String = "WN_STATE_UPDATED";
      
      public static const const_678:String = "WN_UNSELECTED";
      
      public static const const_379:String = "WN_STYLE_UPDATED";
      
      public static const const_1495:String = "WN_UPDATE";
      
      public static const const_457:String = "WN_PARENT_ADDED";
      
      public static const const_528:String = "WN_RESIZE";
      
      public static const const_625:String = "WN_CHILD_REMOVED";
      
      public static const const_1437:String = "";
      
      public static const const_969:String = "WN_RESTORED";
      
      public static const const_304:String = "WN_SELECTED";
      
      public static const const_905:String = "WN_MINIMIZE";
      
      public static const const_965:String = "WN_FOCUSED";
      
      public static const const_1162:String = "WN_LOCK";
      
      public static const const_310:String = "WN_CHILD_ADDED";
      
      public static const const_908:String = "WN_UNFOCUSED";
      
      public static const const_385:String = "WN_RELOCATED";
      
      public static const const_860:String = "WN_DEACTIVATE";
      
      public static const const_1125:String = "WN_CRETAE";
      
      public static const const_821:String = "WN_RESTORE";
      
      public static const const_315:String = "WN_ACTVATED";
      
      public static const const_1159:String = "WN_LOCKED";
      
      public static const const_414:String = "WN_SELECT";
      
      public static const const_959:String = "WN_MAXIMIZE";
      
      public static const const_872:String = "WN_OPEN";
      
      public static const const_539:String = "WN_UNSELECT";
      
      public static const const_1406:String = "WN_ARRANGE";
      
      public static const const_1300:String = "WN_UNLOCKED";
      
      public static const const_1539:String = "WN_UPDATED";
      
      public static const const_869:String = "WN_ACTIVATE";
      
      public static const const_1288:String = "WN_UNLOCK";
      
      public static const const_794:String = "WN_MAXIMIZED";
      
      public static const const_866:String = "WN_DESTROYED";
      
      public static const const_774:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1520,cancelable);
      }
   }
}
