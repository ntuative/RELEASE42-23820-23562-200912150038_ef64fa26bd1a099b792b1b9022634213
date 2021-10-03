package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1516:int = 9;
      
      public static const const_1546:int = 4;
      
      public static const const_1457:int = 1;
      
      public static const const_1308:int = 10;
      
      public static const const_1529:int = 2;
      
      public static const const_1267:int = 7;
      
      public static const const_1280:int = 11;
      
      public static const const_1556:int = 3;
      
      public static const const_1186:int = 8;
      
      public static const const_1135:int = 5;
      
      public static const const_1467:int = 6;
      
      public static const const_1271:int = 12;
       
      
      private var var_1761:String;
      
      private var _roomId:int;
      
      private var var_1171:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_1761;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1171 = param1.readInteger();
         var_1761 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1171;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
