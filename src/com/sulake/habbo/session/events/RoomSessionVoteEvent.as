package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_116:String = "RSPE_VOTE_RESULT";
      
      public static const const_128:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1159:int = 0;
      
      private var var_985:String = "";
      
      private var var_622:Array;
      
      private var var_942:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         var_942 = [];
         var_622 = [];
         super(param1,param2,param7,param8);
         var_985 = param3;
         var_942 = param4;
         var_622 = param5;
         if(var_622 == null)
         {
            var_622 = [];
         }
         var_1159 = param6;
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
