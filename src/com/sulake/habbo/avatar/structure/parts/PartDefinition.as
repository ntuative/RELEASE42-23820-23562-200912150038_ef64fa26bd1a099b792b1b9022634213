package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var _removeSetType:String;
      
      private var var_1333:int = -1;
      
      private var var_1060:Boolean;
      
      private var var_1059:String;
      
      private var var_1578:String;
      
      public function PartDefinition(param1:XML)
      {
         super();
         var_1578 = String(param1["set-type"]);
         var_1059 = String(param1["flipped-set-type"]);
         _removeSetType = String(param1["remove-set-type"]);
         var_1060 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return var_1333 >= 0;
      }
      
      public function get flippedSetType() : String
      {
         return var_1059;
      }
      
      public function get staticId() : int
      {
         return var_1333;
      }
      
      public function set staticId(param1:int) : void
      {
         var_1333 = param1;
      }
      
      public function get appendToFigure() : Boolean
      {
         return var_1060;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         var_1060 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         var_1059 = param1;
      }
      
      public function get setType() : String
      {
         return var_1578;
      }
      
      public function get removeSetType() : String
      {
         return _removeSetType;
      }
   }
}
