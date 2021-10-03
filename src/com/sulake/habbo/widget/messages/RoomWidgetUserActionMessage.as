package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_629:String = "RWUAM_RESPECT_USER";
      
      public static const const_587:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_682:String = "RWUAM_START_TRADING";
      
      public static const const_666:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_498:String = "RWUAM_WHISPER_USER";
      
      public static const const_605:String = "RWUAM_IGNORE_USER";
      
      public static const const_358:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_567:String = "RWUAM_BAN_USER";
      
      public static const const_574:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_368:String = "RWUAM_KICK_USER";
      
      public static const const_726:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_532:String = " RWUAM_RESPECT_PET";
      
      public static const const_449:String = "RWUAM_KICK_BOT";
      
      public static const const_1258:String = "RWUAM_TRAIN_PET";
      
      public static const const_594:String = "RWUAM_PICKUP_PET";
      
      public static const const_667:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_607:String = "RWUAM_REPORT";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         _userId = param2;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
