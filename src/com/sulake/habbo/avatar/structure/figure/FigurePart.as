package com.sulake.habbo.avatar.structure.figure
{
   public class FigurePart implements IFigurePart
   {
       
      
      private var _id:int;
      
      private var _index:int;
      
      private var var_1639:Boolean;
      
      private var _type:String;
      
      private var var_1113:int = -1;
      
      private var var_1640:int = -1;
      
      public function FigurePart(param1:XML)
      {
         super();
         _id = parseInt(param1.@id);
         _type = String(param1.@type);
         _index = parseInt(param1.@index);
         var_1639 = Boolean(parseInt(param1.@colorable));
         var _loc2_:String = param1.@palettemapid;
         if(_loc2_ != "")
         {
            var_1640 = int(_loc2_);
         }
         var _loc3_:String = param1.@breed;
         if(_loc3_ != "")
         {
            var_1113 = int(_loc3_);
         }
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get paletteMap() : int
      {
         return var_1640;
      }
      
      public function get isColorable() : Boolean
      {
         return var_1639;
      }
      
      public function get breed() : int
      {
         return var_1113;
      }
      
      public function get index() : int
      {
         return _index;
      }
   }
}
