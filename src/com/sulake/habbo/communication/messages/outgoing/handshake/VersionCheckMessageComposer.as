package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_1710:String;
      
      private var var_1274:String;
      
      private var var_1709:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_1709 = param1;
         var_1274 = param2;
         var_1710 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1709,var_1274,var_1710];
      }
      
      public function dispose() : void
      {
      }
   }
}
