package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1351:int;
      
      private var var_1352:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function get pos() : int
      {
         return var_1351;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1351 = param1;
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1351 = this.var_1351;
         _loc1_.var_1352 = this.var_1352;
         return _loc1_;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1352 = param1;
      }
      
      public function get imgId() : int
      {
         return var_1352;
      }
   }
}
