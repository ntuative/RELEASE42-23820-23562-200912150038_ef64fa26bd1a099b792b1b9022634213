package com.sulake.habbo.inventory.items
{
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.habbo.inventory.enum.FurniCategory;
   import com.sulake.habbo.inventory.furni.FurniModel;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.ImageResult;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class GroupItem implements IGetImageListener
   {
       
      
      private const const_1583:int = 13421772;
      
      protected var var_1296:String;
      
      protected var _window:IWindowContainer;
      
      protected var _type:int;
      
      protected var _roomEngine:IRoomEngine;
      
      protected var var_2176:BitmapData;
      
      protected var var_871:Boolean;
      
      protected var var_2171:Boolean;
      
      protected var var_1726:int;
      
      protected var var_2175:String;
      
      protected var var_417:int = 0;
      
      private const const_1584:int = 8947848;
      
      protected var _items:Map;
      
      protected var _category:int;
      
      protected var var_355:BitmapData;
      
      private const const_1378:Number = 0.2;
      
      protected var var_1295:Boolean;
      
      private const const_1377:Number = 1;
      
      protected var _selected:Boolean;
      
      public function GroupItem(param1:int, param2:String, param3:int, param4:IWindowContainer, param5:IRoomEngine, param6:BitmapData, param7:Boolean, param8:String = null, param9:BitmapData = null, param10:Boolean = false)
      {
         super();
         _type = param1;
         _window = param4;
         _roomEngine = param5;
         var_2176 = param6;
         var_1295 = param7;
         _items = new Map();
         var_2175 = param2;
         _category = param3;
         var_1296 = param8;
         if(param9 != null)
         {
            setFinalImage(param9);
         }
         else if(!param10)
         {
            initImage();
         }
      }
      
      private function setLoadingImage(param1:BitmapData) : void
      {
         var_355 = param1;
         var_871 = true;
         updateThumbData();
      }
      
      private function setFinalImage(param1:BitmapData) : void
      {
         var_355 = param1;
         var_871 = true;
         var_417 = -1;
         updateThumbData();
      }
      
      public function remove(param1:int) : IItem
      {
         var _loc2_:IItem = _items.getValue(param1);
         if(_loc2_)
         {
            _items.remove(param1);
            updateThumbData();
            return _loc2_;
         }
         return null;
      }
      
      public function addLockTo(param1:int) : Boolean
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < _items.length)
         {
            _loc3_ = _items.getWithIndex(_loc2_);
            if(_loc3_.id == param1)
            {
               _loc3_.locked = true;
               updateThumbData();
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function unshift(param1:IItem) : void
      {
         var _loc2_:IItem = _items.getValue(param1.id);
         if(_loc2_ == null)
         {
            _items.unshift(param1.id,param1);
         }
         else
         {
            _loc2_.locked = false;
         }
         updateThumbData();
      }
      
      public function set showRecyclable(param1:Boolean) : void
      {
         var_1295 = param1;
         updateThumbData();
      }
      
      public function getOneForSelling() : IItem
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         while(_loc1_ < _items.length)
         {
            _loc2_ = _items.getWithIndex(_loc1_);
            if(!_loc2_.locked && _loc2_.sellable)
            {
               return _loc2_;
            }
            _loc1_++;
         }
         return null;
      }
      
      public function getItem(param1:int) : IItem
      {
         return _items.getValue(param1);
      }
      
      public function push(param1:IItem) : void
      {
         var _loc2_:IItem = _items.getValue(param1.id);
         if(_loc2_ == null)
         {
            _items.add(param1.id,param1);
         }
         else
         {
            _loc2_.locked = false;
         }
         updateThumbData();
      }
      
      public function addLocksFromData(param1:Array) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = -1;
         while(_loc2_ >= 0)
         {
            _loc3_ = _items.getWithIndex(_loc2_);
            if(param1.indexOf(_loc3_.ref) >= 0)
            {
               _loc3_.locked = true;
            }
            else
            {
               _loc3_.locked = false;
            }
            _loc2_--;
         }
         updateThumbData();
      }
      
      public function get iconCallbackId() : int
      {
         return var_417;
      }
      
      public function getTotalCount() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(category == FurniCategory.const_581)
         {
            _loc1_ = 0;
            _loc2_ = 0;
            while(_loc2_ < _items.length)
            {
               _loc3_ = _items.getWithIndex(_loc2_) as IItem;
               _loc1_ += int(_loc3_.extras);
               _loc2_++;
            }
            return _loc1_;
         }
         return _items.length;
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         if(var_417 != param1)
         {
            return;
         }
         var_355 = param2;
         updateThumbData();
      }
      
      public function initImage() : void
      {
         var _loc1_:* = null;
         if(var_355 != null)
         {
            return;
         }
         if(var_2175 == FurniModel.const_41)
         {
            _loc1_ = _roomEngine.getFurnitureIcon(_type,this);
         }
         else
         {
            _loc1_ = _roomEngine.getWallItemIcon(_type,this,var_1296);
         }
         if(_loc1_.id > 0)
         {
            setLoadingImage(_loc1_.data);
            var_417 = _loc1_.id;
         }
         else
         {
            setFinalImage(_loc1_.data);
            var_417 = -1;
         }
         var_871 = true;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_2171 = param1;
      }
      
      public function removeLockFrom(param1:int) : Boolean
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < _items.length)
         {
            _loc3_ = _items.getWithIndex(_loc2_);
            if(_loc3_.id == param1)
            {
               _loc3_.locked = false;
               updateThumbData();
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function get previewCallbackId() : int
      {
         return var_1726;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_417 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function getUnlockedCount() : int
      {
         var _loc1_:* = null;
         if(category == FurniCategory.const_581)
         {
            return getTotalCount();
         }
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _items.length)
         {
            _loc1_ = _items.getWithIndex(_loc3_);
            if(!_loc1_.locked)
            {
               _loc2_++;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function removeAllLocks() : void
      {
         var _loc2_:* = null;
         var _loc1_:int = -1;
         while(_loc1_ >= 0)
         {
            _loc2_ = _items.getWithIndex(_loc1_);
            _loc2_.locked = false;
            _loc1_--;
         }
         updateThumbData();
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_355 = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         if(_selected != param1)
         {
            _selected = param1;
            updateThumbData();
         }
      }
      
      public function getAt(param1:int) : IItem
      {
         return _items.getWithIndex(param1);
      }
      
      public function getRecyclableCount() : int
      {
         var _loc3_:* = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < _items.length)
         {
            _loc3_ = _items.getWithIndex(_loc2_) as IItem;
            if(_loc3_.recyclable && !_loc3_.locked)
            {
               _loc1_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function pop() : IItem
      {
         var _loc1_:* = null;
         if(false)
         {
            _loc1_ = _items.getWithIndex(-1) as IItem;
            _items.remove(_loc1_.id);
         }
         updateThumbData();
         return _loc1_;
      }
      
      public function get isLocked() : Boolean
      {
         return var_2171;
      }
      
      public function getOneForRecycle() : IItem
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         while(_loc1_ < _items.length)
         {
            _loc2_ = _items.getWithIndex(_loc1_);
            if(!_loc2_.locked && _loc2_.recyclable)
            {
               addLockTo(_loc2_.id);
               return _loc2_;
            }
            _loc1_++;
         }
         return null;
      }
      
      public function peek() : IItem
      {
         var _loc1_:* = null;
         if(false)
         {
            _loc1_ = _items.getWithIndex(-1) as IItem;
         }
         return _loc1_;
      }
      
      private function updateThumbData() : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(_window == null)
         {
            return;
         }
         if(false)
         {
            return;
         }
         var _loc1_:IBitmapWrapperWindow = _window.findChildByName("bitmap") as IBitmapWrapperWindow;
         var _loc2_:int = getUnlockedCount();
         if(_loc1_)
         {
            if(var_355 != null)
            {
               _loc6_ = var_355;
               _loc7_ = !!_loc1_.bitmap ? _loc1_.bitmap : new BitmapData(_loc1_.width,_loc1_.height);
               _loc7_.fillRect(_loc7_.rect,0);
               _loc7_.copyPixels(_loc6_,_loc6_.rect,new Point(_loc7_.width / 2 - _loc6_.width / 2,_loc7_.height / 2 - _loc6_.height / 2));
               _loc1_.bitmap = _loc7_;
            }
            if(_loc2_ <= 0)
            {
               _window.blend = const_1378;
               _loc1_.blend = const_1378;
            }
            else
            {
               _window.blend = const_1377;
               _loc1_.blend = const_1377;
            }
         }
         if(isSelected)
         {
            _window.color = const_1584;
         }
         else
         {
            _window.color = const_1583;
         }
         var _loc3_:IWindow = _window.findChildByName("number_container");
         var _loc4_:ITextWindow = _window.findChildByName("number") as ITextWindow;
         if(_loc3_)
         {
            _loc3_.visible = _loc2_ > 1;
         }
         if(_loc4_)
         {
            _loc4_.text = String(_loc2_);
         }
         var _loc5_:IBitmapWrapperWindow = _window.findChildByName("recyclable_container") as IBitmapWrapperWindow;
         if(_loc5_)
         {
            if(var_1295 && getRecyclableCount() > 0)
            {
               _loc5_.bitmap = var_2176;
               _loc5_.visible = true;
            }
            else
            {
               _loc5_.visible = false;
            }
         }
         _window.invalidate();
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_1726 = param1;
      }
      
      public function get isImageInited() : Boolean
      {
         return var_871;
      }
      
      public function get iconImage() : BitmapData
      {
         return var_355;
      }
      
      public function get isSelected() : Boolean
      {
         return _selected;
      }
      
      public function get isImageFinished() : Boolean
      {
         return var_417 == -1;
      }
      
      public function getOneForTrade() : IItem
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         while(_loc1_ < _items.length)
         {
            _loc2_ = _items.getWithIndex(_loc1_);
            if(!_loc2_.locked && _loc2_.tradeable)
            {
               return _loc2_;
            }
            _loc1_++;
         }
         return null;
      }
      
      public function getTradeableCount() : int
      {
         var _loc3_:* = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < _items.length)
         {
            _loc3_ = _items.getWithIndex(_loc2_) as IItem;
            if(_loc3_.tradeable && !_loc3_.locked)
            {
               _loc1_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function get window() : IWindowContainer
      {
         if(_window == null)
         {
            return null;
         }
         if(false)
         {
            return null;
         }
         return _window;
      }
      
      public function get extras() : String
      {
         return var_1296;
      }
      
      public function replaceItem(param1:int, param2:IItem) : void
      {
         _items.add(param1,param2);
         updateThumbData();
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
