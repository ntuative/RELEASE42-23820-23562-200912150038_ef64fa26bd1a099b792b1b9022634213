package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.navigator.NavigatorSettingsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1363:int = 10;
       
      
      private var var_1328:NavigatorSettingsMessageParser;
      
      private var var_1056:int;
      
      private var var_1561:Boolean;
      
      private var var_1563:int;
      
      private var var_720:Dictionary;
      
      private var var_2197:int;
      
      private var var_1564:int;
      
      private var var_1559:int;
      
      private var var_333:Array;
      
      private var var_1560:int;
      
      private var var_1148:Array;
      
      private var var_501:PublicRoomShortData;
      
      private var var_362:RoomEventData;
      
      private var var_125:MsgWithRequestId;
      
      private var var_1558:Boolean;
      
      private var _navigator:HabboNavigator;
      
      private var var_1562:Boolean;
      
      private var var_187:GuestRoomData;
      
      private var var_595:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_333 = new Array();
         var_720 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get createdFlatId() : int
      {
         return var_1563;
      }
      
      public function get eventMod() : Boolean
      {
         return var_1562;
      }
      
      public function startLoading() : void
      {
         this.var_595 = true;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_1562 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_362 != null)
         {
            var_362.dispose();
         }
         var_362 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_125 != null && var_125 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_125 != null && var_125 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_125 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_187;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_501 = null;
         var_187 = null;
         _currentRoomOwner = false;
         if(param1.guestRoom)
         {
            _currentRoomOwner = param1.owner;
         }
         else
         {
            var_501 = param1.publicSpace;
            var_362 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(var_362 != null)
         {
            var_362.dispose();
            var_362 = null;
         }
         if(var_501 != null)
         {
            var_501.dispose();
            var_501 = null;
         }
         if(var_187 != null)
         {
            var_187.dispose();
            var_187 = null;
         }
         _currentRoomOwner = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_125 = param1;
         var_595 = false;
         if(var_1148 == null)
         {
            var_1148 = param1.topLevelNodes;
         }
      }
      
      public function get settings() : NavigatorSettingsMessageParser
      {
         return var_1328;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_125 = param1;
         var_595 = false;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return _currentRoomOwner;
      }
      
      public function getCategoryByIndex(param1:int) : FlatCategory
      {
         if(var_333.length > param1)
         {
            return var_333[param1] as FlatCategory;
         }
         return null;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2197 = param1.limit;
         this.var_1056 = param1.favouriteRoomIds.length;
         this.var_720 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_720[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_125 as PopularRoomTagsData;
      }
      
      public function get categories() : Array
      {
         return var_333;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_501;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_1559 = param1;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_1561;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_125 = param1;
         var_595 = false;
      }
      
      public function getCategoryIndexById(param1:int) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < var_333.length)
         {
            if((var_333[_loc2_] as FlatCategory).nodeId == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_187 != null && _currentRoomOwner;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_595;
      }
      
      public function set categories(param1:Array) : void
      {
         var_333 = param1;
      }
      
      public function get currentRoomRating() : int
      {
         return var_1564;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_1560;
      }
      
      public function set settings(param1:NavigatorSettingsMessageParser) : void
      {
         var_1328 = param1;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_125 == null)
         {
            return;
         }
         var_125.dispose();
         var_125 = null;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_362;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_720[param1] = !!param2 ? "yes" : null;
         var_1056 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_125 as OfficialRoomsData;
      }
      
      public function get topLevelNodes() : Array
      {
         return var_1148;
      }
      
      public function get avatarId() : int
      {
         return var_1559;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_125 != null && var_125 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_1561 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_1564 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_1558 = param1;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_187 != null)
         {
            var_187.dispose();
         }
         var_187 = param1;
      }
      
      public function getCategoryById(param1:int) : FlatCategory
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_333)
         {
            if(_loc2_.nodeId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_187 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1328.homeRoomId == _loc1_;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1056 >= var_2197;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_1560 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_1558;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_187 != null && !_currentRoomOwner;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_1563 = param1;
      }
   }
}
