package com.sulake.room.renderer.cache
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObjectLocationCacheItem
   {
       
      
      private var var_2148:int = -1;
      
      private var var_1104:int = -1;
      
      private var var_698:Vector3d = null;
      
      public function RoomObjectLocationCacheItem()
      {
         super();
         var_698 = new Vector3d();
      }
      
      public function get objectUpdateId() : int
      {
         return var_2148;
      }
      
      public function set objectUpdateId(param1:int) : void
      {
         var_2148 = param1;
      }
      
      public function set screenLoc(param1:IVector3d) : void
      {
         var_698.assign(param1);
         var_698.x = Math.round(var_698.x);
         var_698.y = Math.round(var_698.y);
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         var_1104 = param1;
      }
      
      public function get screenLoc() : IVector3d
      {
         return var_698;
      }
      
      public function get geometryUpdateId() : int
      {
         return var_1104;
      }
   }
}
