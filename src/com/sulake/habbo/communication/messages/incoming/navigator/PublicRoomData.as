package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_1770:int;
      
      private var var_1805:String;
      
      private var var_1768:int;
      
      private var _disposed:Boolean;
      
      private var var_1804:int;
      
      private var var_1803:String;
      
      private var var_1082:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         var_1803 = param1.readString();
         var_1770 = param1.readInteger();
         var_1768 = param1.readInteger();
         var_1805 = param1.readString();
         var_1804 = param1.readInteger();
         var_1082 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return var_1804;
      }
      
      public function get worldId() : int
      {
         return var_1768;
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
      }
      
      public function get unitPropertySet() : String
      {
         return var_1803;
      }
      
      public function get unitPort() : int
      {
         return var_1770;
      }
      
      public function get castLibs() : String
      {
         return var_1805;
      }
      
      public function get nodeId() : int
      {
         return var_1082;
      }
   }
}
