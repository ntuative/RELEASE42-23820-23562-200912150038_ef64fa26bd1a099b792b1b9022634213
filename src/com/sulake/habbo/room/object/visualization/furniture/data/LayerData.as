package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_462:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_722:int = 0;
      
      public static const const_797:int = 2;
      
      public static const const_910:int = 1;
      
      public static const const_639:Boolean = false;
      
      public static const const_710:String = "";
      
      public static const const_458:int = 0;
      
      public static const const_383:int = 0;
      
      public static const const_376:int = 0;
       
      
      private var var_1752:int = 0;
      
      private var var_1587:String = "";
      
      private var var_1409:int = 0;
      
      private var var_1754:int = 0;
      
      private var var_1753:Number = 0;
      
      private var var_1589:int = 255;
      
      private var var_1751:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return var_1752;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            tag = param1.tag;
            ink = param1.ink;
            alpha = param1.alpha;
            ignoreMouse = param1.ignoreMouse;
            xOffset = param1.xOffset;
            yOffset = param1.yOffset;
            zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         var_1409 = param1;
      }
      
      public function get zOffset() : Number
      {
         return var_1753;
      }
      
      public function set xOffset(param1:int) : void
      {
         var_1754 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         var_1752 = param1;
      }
      
      public function get tag() : String
      {
         return var_1587;
      }
      
      public function get alpha() : int
      {
         return var_1589;
      }
      
      public function get ink() : int
      {
         return var_1409;
      }
      
      public function set zOffset(param1:Number) : void
      {
         var_1753 = param1;
      }
      
      public function get xOffset() : int
      {
         return var_1754;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         var_1751 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return var_1751;
      }
      
      public function set tag(param1:String) : void
      {
         var_1587 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         var_1589 = param1;
      }
   }
}
