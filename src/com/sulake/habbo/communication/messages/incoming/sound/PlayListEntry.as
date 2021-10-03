package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1980:int;
      
      private var var_2154:int = 0;
      
      private var var_2152:String;
      
      private var var_2155:int;
      
      private var var_2153:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_1980 = param1;
         var_2155 = param2;
         var_2153 = param3;
         var_2152 = param4;
      }
      
      public function get length() : int
      {
         return var_2155;
      }
      
      public function get name() : String
      {
         return var_2153;
      }
      
      public function get creator() : String
      {
         return var_2152;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_2154;
      }
      
      public function get id() : int
      {
         return var_1980;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_2154 = param1;
      }
   }
}
