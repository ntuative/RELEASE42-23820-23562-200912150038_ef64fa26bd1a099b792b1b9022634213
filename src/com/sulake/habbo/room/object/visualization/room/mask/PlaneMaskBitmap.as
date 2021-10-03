package com.sulake.habbo.room.object.visualization.room.mask
{
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   
   public class PlaneMaskBitmap
   {
      
      public static const const_49:Number = -1;
      
      public static const MAX_NORMAL_COORDINATE_VALUE:Number = 1;
       
      
      private var _normalMaxX:Number = 1;
      
      private var var_1666:Number = -1;
      
      private var var_727:IGraphicAsset = null;
      
      private var var_1664:Number = 1;
      
      private var var_1665:Number = -1;
      
      public function PlaneMaskBitmap(param1:IGraphicAsset, param2:Number = -1, param3:Number = 1, param4:Number = -1, param5:Number = 1)
      {
         super();
         var_1666 = param2;
         _normalMaxX = param3;
         var_1665 = param4;
         var_1664 = param5;
         var_727 = param1;
      }
      
      public function get normalMaxY() : Number
      {
         return var_1664;
      }
      
      public function get normalMaxX() : Number
      {
         return _normalMaxX;
      }
      
      public function get normalMinX() : Number
      {
         return var_1666;
      }
      
      public function get normalMinY() : Number
      {
         return var_1665;
      }
      
      public function get asset() : IGraphicAsset
      {
         return var_727;
      }
      
      public function dispose() : void
      {
         var_727 = null;
      }
   }
}
