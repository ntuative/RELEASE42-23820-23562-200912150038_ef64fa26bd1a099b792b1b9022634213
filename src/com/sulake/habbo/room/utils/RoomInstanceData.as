package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var var_841:LegacyWallGeometry = null;
      
      private var var_563:SelectedRoomObjectData = null;
      
      private var _roomCategory:int = 0;
      
      private var var_564:TileHeightMap = null;
      
      private var var_2086:String = null;
      
      private var _roomId:int = 0;
      
      private var var_842:RoomCamera = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         _roomId = param1;
         _roomCategory = param2;
         var_841 = new LegacyWallGeometry();
         var_842 = new RoomCamera();
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(var_564 != null)
         {
            var_564.dispose();
         }
         var_564 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function set worldType(param1:String) : void
      {
         var_2086 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return var_841;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return var_842;
      }
      
      public function dispose() : void
      {
         if(var_564 != null)
         {
            var_564.dispose();
            var_564 = null;
         }
         if(var_841 != null)
         {
            var_841.dispose();
            var_841 = null;
         }
         if(var_842 != null)
         {
            var_842.dispose();
            var_842 = null;
         }
         if(var_563 != null)
         {
            var_563.dispose();
            var_563 = null;
         }
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return var_564;
      }
      
      public function get worldType() : String
      {
         return var_2086;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_563 != null)
         {
            var_563.dispose();
         }
         var_563 = param1;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return var_563;
      }
   }
}
