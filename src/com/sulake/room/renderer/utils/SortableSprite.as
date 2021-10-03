package com.sulake.room.renderer.utils
{
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class SortableSprite
   {
       
      
      private var var_1591:Boolean = true;
      
      private var var_1590:Boolean = false;
      
      private var var_1588:Boolean = false;
      
      private var var_1118:String = "normal";
      
      private var _bitmapData:BitmapData = null;
      
      private var var_1587:String = "";
      
      private var var_1589:uint = 255;
      
      private var _color:uint = 16777215;
      
      private var _name:String = "";
      
      private var var_90:int = 0;
      
      private var _y:int = 0;
      
      private var var_89:Number = 0;
      
      public function SortableSprite()
      {
         super();
      }
      
      public function set z(param1:Number) : void
      {
         var_89 = param1;
      }
      
      public function set color(param1:uint) : void
      {
         _color = param1;
      }
      
      public function get capturesMouse() : Boolean
      {
         return var_1591;
      }
      
      public function get z() : Number
      {
         return var_89;
      }
      
      public function set y(param1:int) : void
      {
         _y = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set tag(param1:String) : void
      {
         var_1587 = param1;
      }
      
      public function get clickHandling() : Boolean
      {
         return var_1590;
      }
      
      public function get y() : int
      {
         return _y;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get tag() : String
      {
         return var_1587;
      }
      
      public function set capturesMouse(param1:Boolean) : void
      {
         var_1591 = param1;
      }
      
      public function get alpha() : uint
      {
         return var_1589;
      }
      
      public function set clickHandling(param1:Boolean) : void
      {
         var_1590 = param1;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function set bitmapData(param1:BitmapData) : void
      {
         _bitmapData = param1;
      }
      
      public function set varyingDepth(param1:Boolean) : void
      {
         var_1588 = param1;
      }
      
      public function set blendMode(param1:String) : void
      {
         if(param1 != null)
         {
            var_1118 = param1;
         }
         else
         {
            var_1118 = BlendMode.NORMAL;
         }
      }
      
      public function get blendMode() : String
      {
         return var_1118;
      }
      
      public function get varyingDepth() : Boolean
      {
         return var_1588;
      }
      
      public function set x(param1:int) : void
      {
         var_90 = param1;
      }
      
      public function get x() : int
      {
         return var_90;
      }
      
      public function set alpha(param1:uint) : void
      {
         var_1589 = param1;
      }
      
      public function get bitmapData() : BitmapData
      {
         return _bitmapData;
      }
   }
}
