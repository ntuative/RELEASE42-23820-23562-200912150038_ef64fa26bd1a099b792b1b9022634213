package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1890:String;
      
      private var var_405:int;
      
      private var var_2118:String;
      
      private var var_2120:String;
      
      private var var_2119:int;
      
      private var var_2116:String;
      
      private var var_2117:int;
      
      private var var_583:Array;
      
      private var var_964:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         var_583 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_964 = false;
            return;
         }
         this.var_964 = true;
         var_2119 = int(_loc2_);
         var_2118 = param1.readString();
         var_405 = int(param1.readString());
         var_2117 = param1.readInteger();
         var_1890 = param1.readString();
         var_2120 = param1.readString();
         var_2116 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            var_583.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function get eventType() : int
      {
         return var_2117;
      }
      
      public function get eventName() : String
      {
         return var_1890;
      }
      
      public function get eventDescription() : String
      {
         return var_2120;
      }
      
      public function get ownerAvatarName() : String
      {
         return var_2118;
      }
      
      public function get tags() : Array
      {
         return var_583;
      }
      
      public function get creationTime() : String
      {
         return var_2116;
      }
      
      public function get exists() : Boolean
      {
         return var_964;
      }
      
      public function get ownerAvatarId() : int
      {
         return var_2119;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_583 = null;
      }
      
      public function get flatId() : int
      {
         return var_405;
      }
   }
}
