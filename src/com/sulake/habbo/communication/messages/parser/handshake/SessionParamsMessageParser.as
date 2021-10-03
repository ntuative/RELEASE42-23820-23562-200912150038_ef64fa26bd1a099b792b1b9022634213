package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class SessionParamsMessageParser implements IMessageParser
   {
       
      
      protected var var_1303:Boolean;
      
      protected var var_2186:Boolean;
      
      protected var var_1306:Boolean;
      
      protected var var_692:String;
      
      protected var _confPartnerIntegration:Boolean;
      
      protected var var_2187:String;
      
      protected var var_2188:Boolean;
      
      protected var var_1302:Boolean;
      
      protected var var_1305:Boolean;
      
      protected var var_1304:Boolean;
      
      public function SessionParamsMessageParser()
      {
         super();
      }
      
      public function get tutorialEnabled() : Boolean
      {
         return var_2186;
      }
      
      public function get parentEmailRequired() : Boolean
      {
         return var_1302;
      }
      
      public function flush() : Boolean
      {
         var_1304 = false;
         var_1305 = false;
         var_692 = "";
         var_1302 = false;
         var_1303 = false;
         var_1306 = false;
         _confPartnerIntegration = false;
         var_2188 = false;
         var_2187 = "";
         var_2186 = false;
         return true;
      }
      
      public function get tracking_header() : String
      {
         return var_2187;
      }
      
      public function get parentEmailRequiredInReRegistration() : Boolean
      {
         return var_1303;
      }
      
      public function get allowProfileEditing() : Boolean
      {
         return var_2188;
      }
      
      public function get allowDirectEmail() : Boolean
      {
         return var_1306;
      }
      
      public function get voucher() : Boolean
      {
         return var_1305;
      }
      
      public function get confPartnerIntegration() : Boolean
      {
         return _confPartnerIntegration;
      }
      
      public function get coppa() : Boolean
      {
         return var_1304;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc2_:int = param1.readInteger();
         Logger.log("[Parser.SessionParams] Got " + _loc2_ + " pairs");
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readInteger();
            Logger.log("[Parser.SessionParams] Got id: " + _loc4_);
            switch(_loc4_)
            {
               case 0:
                  _loc5_ = param1.readInteger();
                  var_1304 = _loc5_ > 0;
                  break;
               case 1:
                  _loc5_ = param1.readInteger();
                  var_1305 = _loc5_ > 0;
                  break;
               case 2:
                  _loc5_ = param1.readInteger();
                  var_1302 = _loc5_ > 0;
                  break;
               case 3:
                  _loc5_ = param1.readInteger();
                  var_1303 = _loc5_ > 0;
                  break;
               case 4:
                  _loc5_ = param1.readInteger();
                  var_1306 = _loc5_ > 0;
                  break;
               case 5:
                  _loc6_ = param1.readString();
                  break;
               case 6:
                  _loc5_ = param1.readInteger();
                  break;
               case 7:
                  _loc5_ = param1.readInteger();
                  break;
               case 8:
                  _loc7_ = param1.readString();
                  break;
               case 9:
                  _loc5_ = param1.readInteger();
                  break;
               default:
                  Logger.log("Unknown id: " + _loc4_);
                  break;
            }
            _loc3_++;
         }
         return true;
      }
      
      public function get date() : String
      {
         return var_692;
      }
   }
}
