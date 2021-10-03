package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_116:String = "RWPUE_VOTE_RESULT";
      
      public static const const_128:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1159:int;
      
      private var var_985:String;
      
      private var var_622:Array;
      
      private var var_942:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_985 = param2;
         var_942 = param3;
         var_622 = param4;
         if(var_622 == null)
         {
            var_622 = [];
         }
         var_1159 = param5;
      }
      
      public function get votes() : Array
      {
         return var_622.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1159;
      }
      
      public function get question() : String
      {
         return var_985;
      }
      
      public function get choices() : Array
      {
         return var_942.slice();
      }
   }
}
