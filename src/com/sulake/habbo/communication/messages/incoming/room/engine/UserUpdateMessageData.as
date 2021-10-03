package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_89:Number = 0;
      
      private var var_238:int = 0;
      
      private var var_1755:int = 0;
      
      private var var_1760:Number = 0;
      
      private var var_1756:Number = 0;
      
      private var var_1757:Number = 0;
      
      private var var_1758:Number = 0;
      
      private var var_1759:Boolean = false;
      
      private var var_90:Number = 0;
      
      private var _id:int = 0;
      
      private var var_193:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_193 = [];
         super();
         _id = param1;
         var_90 = param2;
         _y = param3;
         var_89 = param4;
         var_1758 = param5;
         var_238 = param6;
         var_1755 = param7;
         var_1760 = param8;
         var_1756 = param9;
         var_1757 = param10;
         var_1759 = param11;
         var_193 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_89;
      }
      
      public function get dir() : int
      {
         return var_238;
      }
      
      public function get localZ() : Number
      {
         return var_1758;
      }
      
      public function get isMoving() : Boolean
      {
         return var_1759;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_1755;
      }
      
      public function get targetX() : Number
      {
         return var_1760;
      }
      
      public function get targetY() : Number
      {
         return var_1756;
      }
      
      public function get targetZ() : Number
      {
         return var_1757;
      }
      
      public function get x() : Number
      {
         return var_90;
      }
      
      public function get actions() : Array
      {
         return var_193.slice();
      }
   }
}
