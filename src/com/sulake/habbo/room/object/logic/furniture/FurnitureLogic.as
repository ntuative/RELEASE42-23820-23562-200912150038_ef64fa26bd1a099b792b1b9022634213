package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.events.RoomObjectRoomAdEvent;
   import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectItemDataUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.logic.MovingObjectLogic;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomObjectMouseEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import com.sulake.room.utils.XMLValidator;
   import flash.events.MouseEvent;
   
   public class FurnitureLogic extends MovingObjectLogic
   {
       
      
      private var var_894:Number = 0;
      
      private var var_609:Boolean = false;
      
      private var var_1654:Number = 0;
      
      private var var_1653:Number = 0;
      
      private var var_1089:Number = 0;
      
      private var var_893:Number = 0;
      
      private var var_895:Number = 0;
      
      private var var_223:Array;
      
      public function FurnitureLogic()
      {
         var_223 = [];
         super();
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc2_:IRoomObjectModelController = object.getModelController();
         var _loc3_:RoomObjectDataUpdateMessage = param1 as RoomObjectDataUpdateMessage;
         if(_loc3_ != null)
         {
            object.setState(_loc3_.state,0);
            if(_loc2_ != null)
            {
               _loc2_.setString(RoomObjectVariableEnum.const_141,_loc3_.data);
            }
            return;
         }
         var _loc4_:RoomObjectItemDataUpdateMessage = param1 as RoomObjectItemDataUpdateMessage;
         if(_loc4_ != null)
         {
            if(_loc2_ != null)
            {
               _loc2_.setString(RoomObjectVariableEnum.const_781,_loc4_.itemData);
            }
            return;
         }
         var_609 = false;
         super.processUpdateMessage(param1);
      }
      
      override public function initialize(param1:XML) : void
      {
         var _loc7_:* = null;
         var _loc8_:int = 0;
         if(param1 == null)
         {
            return;
         }
         var_893 = 0;
         var_895 = 0;
         var_894 = 0;
         var_223 = [];
         var _loc2_:XMLList = param1.model.dimensions;
         if(_loc2_.length() == 0)
         {
            return;
         }
         var _loc3_:XMLList = _loc2_.@x;
         if(_loc3_.length() == 1)
         {
            var_893 = Number(_loc3_);
         }
         _loc3_ = _loc2_.@y;
         if(_loc3_.length() == 1)
         {
            var_895 = Number(_loc3_);
         }
         _loc3_ = _loc2_.@z;
         if(_loc3_.length() == 1)
         {
            var_894 = Number(_loc3_);
         }
         var_1654 = var_893 / 2;
         var_1653 = var_895 / 2;
         _loc3_ = _loc2_.@centerZ;
         if(_loc3_.length() == 1)
         {
            var_1089 = Number(_loc3_);
         }
         else
         {
            var_1089 = var_894 / 2;
         }
         var _loc4_:XMLList = param1.model.directions.direction;
         var _loc5_:* = ["id"];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_.length())
         {
            _loc7_ = _loc4_[_loc6_];
            if(XMLValidator.checkRequiredAttributes(_loc7_,_loc5_))
            {
               _loc8_ = parseInt(_loc7_.@id);
               var_223.push(_loc8_);
            }
            _loc6_++;
         }
         var_223.sort(Array.NUMERIC);
         if(object == null || object.getModelController() == null)
         {
            return;
         }
         object.getModelController().setNumber(RoomObjectVariableEnum.const_280,var_893,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_402,var_895,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_514,var_894,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_1213,var_1654,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_1145,var_1653,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_879,var_1089,true);
         object.getModelController().setNumberArray(RoomObjectVariableEnum.const_655,var_223,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_156,1);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var_223 = null;
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(object == null)
         {
            return;
         }
         var _loc3_:IRoomObjectModelController = object.getModel() as IRoomObjectModelController;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc9_:String = _loc3_.getString(RoomObjectVariableEnum.const_327);
         switch(param1.type)
         {
            case MouseEvent.ROLL_OVER:
               if(!var_609)
               {
                  _loc6_ = object.getId();
                  _loc7_ = object.getType();
                  if(eventDispatcher != null && _loc9_ != null && _loc9_.indexOf("http") == 0)
                  {
                     eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_296,_loc6_,_loc7_));
                  }
                  var_609 = true;
               }
               break;
            case MouseEvent.ROLL_OUT:
               if(var_609)
               {
                  _loc6_ = object.getId();
                  _loc7_ = object.getType();
                  if(eventDispatcher != null && _loc9_ != null && _loc9_.indexOf("http") == 0)
                  {
                     eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_301,_loc6_,_loc7_));
                  }
                  var_609 = false;
               }
               break;
            case MouseEvent.DOUBLE_CLICK:
               _loc6_ = object.getId();
               _loc7_ = object.getType();
               if(eventDispatcher != null && _loc9_ != null && _loc9_.indexOf("http") == 0)
               {
                  eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_388,_loc6_,_loc7_));
               }
            case MouseEvent.CLICK:
               _loc6_ = object.getId();
               _loc7_ = object.getType();
               if(eventDispatcher != null)
               {
                  _loc8_ = new RoomObjectMouseEvent(RoomObjectMouseEvent.const_195,_loc6_,_loc7_,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown);
                  eventDispatcher.dispatchEvent(_loc8_);
               }
               if(eventDispatcher != null && _loc9_ != null && _loc9_.indexOf("http") == 0)
               {
                  eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_236,_loc6_,_loc7_));
               }
               break;
            case MouseEvent.MOUSE_DOWN:
               _loc6_ = object.getId();
               _loc7_ = object.getType();
               if(eventDispatcher != null)
               {
                  _loc8_ = new RoomObjectMouseEvent(RoomObjectMouseEvent.const_407,_loc6_,_loc7_,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown);
                  eventDispatcher.dispatchEvent(_loc8_);
               }
         }
      }
   }
}
