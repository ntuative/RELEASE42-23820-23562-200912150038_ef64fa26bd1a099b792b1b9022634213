package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_217:String = "RWUIUE_PEER";
      
      public static const const_193:String = "RWUIUE_OWN_USER";
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_1316:String = "BOT";
      
      public static const const_884:int = 2;
      
      public static const const_1177:int = 0;
      
      public static const const_833:int = 3;
       
      
      private var var_1126:String = "";
      
      private var var_1924:Boolean = false;
      
      private var var_1738:int = 0;
      
      private var var_1903:int = 0;
      
      private var var_1926:Boolean = false;
      
      private var var_1128:String = "";
      
      private var var_1925:Boolean = false;
      
      private var var_747:int = 0;
      
      private var var_1928:Boolean = true;
      
      private var var_953:int = 0;
      
      private var var_1922:Boolean = false;
      
      private var var_1193:Boolean = false;
      
      private var var_1929:Boolean = false;
      
      private var var_1905:int = 0;
      
      private var var_1930:Boolean = false;
      
      private var _image:BitmapData = null;
      
      private var var_245:Array;
      
      private var var_1195:Boolean = false;
      
      private var _name:String = "";
      
      private var var_1736:int = 0;
      
      private var var_1923:Boolean = false;
      
      private var var_1927:int = 0;
      
      private var var_1904:String = "";
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         var_245 = [];
         super(param1,param2,param3);
      }
      
      public function get userRoomId() : int
      {
         return var_1903;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_1903 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return var_1924;
      }
      
      public function get canBeKicked() : Boolean
      {
         return var_1928;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         var_1928 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_1925 = param1;
      }
      
      public function get motto() : String
      {
         return var_1126;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_1922 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_1193;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set motto(param1:String) : void
      {
         var_1126 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_1923;
      }
      
      public function get groupBadgeId() : String
      {
         return var_1904;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_1193 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return var_1930;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_1905 = param1;
      }
      
      public function get badges() : Array
      {
         return var_245;
      }
      
      public function get amIController() : Boolean
      {
         return var_1926;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         var_1926 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_1923 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         var_1927 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_1904 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         var_1128 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_1925;
      }
      
      public function get isIgnored() : Boolean
      {
         return var_1922;
      }
      
      public function get carryItem() : int
      {
         return var_1905;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_1195;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_1195 = param1;
      }
      
      public function set respectLeft(param1:int) : void
      {
         var_747 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get canTradeReason() : int
      {
         return var_1927;
      }
      
      public function get realName() : String
      {
         return var_1128;
      }
      
      public function set webID(param1:int) : void
      {
         var_1736 = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         var_245 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         var_1929 = param1;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         var_1930 = param1;
      }
      
      public function get respectLeft() : int
      {
         return var_747;
      }
      
      public function get webID() : int
      {
         return var_1736;
      }
      
      public function set groupId(param1:int) : void
      {
         var_953 = param1;
      }
      
      public function get xp() : int
      {
         return var_1738;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         var_1924 = param1;
      }
      
      public function get groupId() : int
      {
         return var_953;
      }
      
      public function get canTrade() : Boolean
      {
         return var_1929;
      }
      
      public function set xp(param1:int) : void
      {
         var_1738 = param1;
      }
   }
}
