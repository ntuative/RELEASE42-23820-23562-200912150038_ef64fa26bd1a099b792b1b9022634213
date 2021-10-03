package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_314:String = "WE_CHILD_RESIZED";
      
      public static const const_1298:String = "WE_CLOSE";
      
      public static const const_1242:String = "WE_DESTROY";
      
      public static const const_186:String = "WE_CHANGE";
      
      public static const const_1199:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1515:String = "WE_PARENT_RESIZE";
      
      public static const const_82:String = "WE_UPDATE";
      
      public static const const_1342:String = "WE_MAXIMIZE";
      
      public static const const_374:String = "WE_DESTROYED";
      
      public static const const_971:String = "WE_UNSELECT";
      
      public static const const_1146:String = "WE_MAXIMIZED";
      
      public static const const_1468:String = "WE_UNLOCKED";
      
      public static const const_452:String = "WE_CHILD_REMOVED";
      
      public static const const_152:String = "WE_OK";
      
      public static const const_43:String = "WE_RESIZED";
      
      public static const const_1239:String = "WE_ACTIVATE";
      
      public static const const_239:String = "WE_ENABLED";
      
      public static const const_393:String = "WE_CHILD_RELOCATED";
      
      public static const const_1109:String = "WE_CREATE";
      
      public static const const_626:String = "WE_SELECT";
      
      public static const const_153:String = "";
      
      public static const const_1413:String = "WE_LOCKED";
      
      public static const const_1399:String = "WE_PARENT_RELOCATE";
      
      public static const const_1398:String = "WE_CHILD_REMOVE";
      
      public static const const_1494:String = "WE_CHILD_RELOCATE";
      
      public static const const_1552:String = "WE_LOCK";
      
      public static const const_328:String = "WE_FOCUSED";
      
      public static const const_500:String = "WE_UNSELECTED";
      
      public static const const_899:String = "WE_DEACTIVATED";
      
      public static const const_1131:String = "WE_MINIMIZED";
      
      public static const const_1451:String = "WE_ARRANGED";
      
      public static const const_1487:String = "WE_UNLOCK";
      
      public static const const_1440:String = "WE_ATTACH";
      
      public static const const_1226:String = "WE_OPEN";
      
      public static const const_1230:String = "WE_RESTORE";
      
      public static const const_1481:String = "WE_PARENT_RELOCATED";
      
      public static const const_1132:String = "WE_RELOCATE";
      
      public static const const_1453:String = "WE_CHILD_RESIZE";
      
      public static const const_1513:String = "WE_ARRANGE";
      
      public static const const_1133:String = "WE_OPENED";
      
      public static const const_1220:String = "WE_CLOSED";
      
      public static const const_1407:String = "WE_DETACHED";
      
      public static const const_1458:String = "WE_UPDATED";
      
      public static const const_1331:String = "WE_UNFOCUSED";
      
      public static const const_350:String = "WE_RELOCATED";
      
      public static const const_1284:String = "WE_DEACTIVATE";
      
      public static const const_213:String = "WE_DISABLED";
      
      public static const const_690:String = "WE_CANCEL";
      
      public static const const_648:String = "WE_ENABLE";
      
      public static const const_1164:String = "WE_ACTIVATED";
      
      public static const const_1149:String = "WE_FOCUS";
      
      public static const const_1426:String = "WE_DETACH";
      
      public static const const_1173:String = "WE_RESTORED";
      
      public static const const_1345:String = "WE_UNFOCUS";
      
      public static const const_52:String = "WE_SELECTED";
      
      public static const const_1253:String = "WE_PARENT_RESIZED";
      
      public static const const_1155:String = "WE_CREATED";
      
      public static const const_1412:String = "WE_ATTACHED";
      
      public static const const_1250:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1520:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1293:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1520 = param3;
         var_1293 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1293;
      }
      
      public function get related() : IWindow
      {
         return var_1520;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1293 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
