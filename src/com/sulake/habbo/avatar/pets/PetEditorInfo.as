package com.sulake.habbo.avatar.pets
{
   public class PetEditorInfo
   {
       
      
      private var var_1841:Boolean;
      
      private var var_1840:Boolean;
      
      public function PetEditorInfo(param1:XML)
      {
         super();
         var_1841 = Boolean(parseInt(param1.@club));
         var_1840 = Boolean(parseInt(param1.@selectable));
      }
      
      public function get isClub() : Boolean
      {
         return var_1841;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1840;
      }
   }
}
