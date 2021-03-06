package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_337:Number = 0.5;
      
      private static const const_745:int = 3;
      
      private static const const_1037:Number = 1;
       
      
      private var var_1818:Boolean = false;
      
      private var var_1816:Boolean = false;
      
      private var var_943:int = 0;
      
      private var var_255:Vector3d = null;
      
      private var var_1820:int = 0;
      
      private var var_1819:int = 0;
      
      private var var_1817:Boolean = false;
      
      private var var_1823:int = -2;
      
      private var var_1814:Boolean = false;
      
      private var var_1821:int = 0;
      
      private var var_1815:int = -1;
      
      private var var_382:Vector3d = null;
      
      private var var_1822:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get roomWd() : int
      {
         return var_1820;
      }
      
      public function get targetId() : int
      {
         return var_1815;
      }
      
      public function set roomHt(param1:int) : void
      {
         var_1821 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         var_1820 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_1818 = param1;
      }
      
      public function set targetId(param1:int) : void
      {
         var_1815 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_1816 = param1;
      }
      
      public function dispose() : void
      {
         var_382 = null;
         var_255 = null;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_382 == null)
         {
            var_382 = new Vector3d();
         }
         var_382.assign(param1);
         var_943 = 0;
      }
      
      public function get targetCategory() : int
      {
         return var_1823;
      }
      
      public function get screenHt() : int
      {
         return var_1822;
      }
      
      public function set screenWd(param1:int) : void
      {
         var_1819 = param1;
      }
      
      public function get location() : IVector3d
      {
         return var_255;
      }
      
      public function set screenHt(param1:int) : void
      {
         var_1822 = param1;
      }
      
      public function get roomHt() : int
      {
         return var_1821;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_1818;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_1816;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_382 != null && var_255 != null)
         {
            ++var_943;
            _loc2_ = Vector3d.dif(var_382,var_255);
            if(_loc2_.length <= const_337)
            {
               var_255 = var_382;
               var_382 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_337 * (const_745 + 1))
               {
                  _loc2_.mul(const_337);
               }
               else if(var_943 <= const_745)
               {
                  _loc2_.mul(const_337);
               }
               else
               {
                  _loc2_.mul(const_1037);
               }
               var_255 = Vector3d.sum(var_255,_loc2_);
            }
         }
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_1817 = param1;
      }
      
      public function get screenWd() : int
      {
         return var_1819;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_1814 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         var_1823 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_255 != null)
         {
            return;
         }
         var_255 = new Vector3d();
         var_255.assign(param1);
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_1817;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_1814;
      }
   }
}
