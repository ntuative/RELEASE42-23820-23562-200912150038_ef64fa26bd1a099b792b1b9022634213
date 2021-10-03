package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2145:int;
      
      private var var_404:Boolean;
      
      private var var_2144:Boolean;
      
      private var var_859:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2144 = param1.readBoolean();
         if(var_2144)
         {
            var_2145 = param1.readInteger();
            var_404 = param1.readBoolean();
         }
         else
         {
            var_859 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_859 != null)
         {
            var_859.dispose();
            var_859 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_2145;
      }
      
      public function get owner() : Boolean
      {
         return var_404;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_2144;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_859;
      }
   }
}
