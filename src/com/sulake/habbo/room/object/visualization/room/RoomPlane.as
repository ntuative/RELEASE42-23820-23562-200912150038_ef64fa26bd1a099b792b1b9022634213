package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
   import com.sulake.habbo.room.object.visualization.room.utils.PlaneBitmapData;
   import com.sulake.habbo.room.object.visualization.room.utils.Randomizer;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.display.BitmapDataChannel;
   import flash.display.BlendMode;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomPlane
   {
      
      public static const const_175:int = 2;
      
      public static const const_1448:int = 0;
      
      public static const const_173:int = 3;
      
      public static const const_249:int = 1;
       
      
      private var var_403:Vector3d = null;
      
      private var var_678:Array;
      
      private var var_251:Vector3d = null;
      
      private var var_166:Map = null;
      
      private var _bitmapData:BitmapData = null;
      
      private var _type:int = 0;
      
      private var var_679:IPlaneRasterizer = null;
      
      private var var_680:Vector3d = null;
      
      private var _height:Number = 0;
      
      private var var_129:Vector3d = null;
      
      private var var_107:Vector3d = null;
      
      private var var_82:Vector3d = null;
      
      private var var_106:Vector3d = null;
      
      private var var_1699:Number = 0;
      
      private var var_203:Array;
      
      private var var_250:Vector3d = null;
      
      private var var_528:PlaneMaskManager = null;
      
      private var _isVisible:Boolean = true;
      
      private var _color:uint = 0;
      
      private var var_2081:Number = 0;
      
      private var var_2078:Number = 0;
      
      private var var_2079:int = 0;
      
      private var var_159:Boolean = false;
      
      private var var_80:Vector3d = null;
      
      private var var_63:BitmapData = null;
      
      private var var_2080:Number = 0;
      
      private var var_2077:Number = 0;
      
      private var _offset:Point = null;
      
      private var var_1208:Array;
      
      private var var_1104:int = -1;
      
      private var var_1005:Array;
      
      private var var_1479:Boolean = true;
      
      private var _id:String = null;
      
      private var _width:Number = 0;
      
      private var var_179:BitmapData = null;
      
      private var var_838:Boolean = false;
      
      private var var_905:Number = 0;
      
      private var var_1698:Number = 0;
      
      private var var_1696:Number = 0;
      
      private var var_268:Array;
      
      private var var_1697:Number = 0;
      
      public function RoomPlane(param1:IVector3d, param2:IVector3d, param3:IVector3d, param4:IVector3d, param5:int, param6:Boolean, param7:Array, param8:int, param9:Number = 0, param10:Number = 0, param11:Number = 0, param12:Number = 0)
      {
         var _loc13_:int = 0;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var_1208 = [];
         var_203 = [];
         var_268 = [];
         var_678 = [];
         var_1005 = [];
         super();
         var_2079 = param8;
         var_680 = new Vector3d();
         var_680.assign(param1);
         var_80 = new Vector3d();
         var_80.assign(param2);
         var_250 = new Vector3d();
         var_250.assign(param3);
         var_251 = new Vector3d();
         var_251.assign(param4);
         var_403 = Vector3d.crossProduct(var_250,var_251);
         if(false)
         {
            var_403.mul(Infinity);
         }
         if(param7 != null)
         {
            _loc13_ = 0;
            while(_loc13_ < param7.length)
            {
               _loc14_ = param7[_loc13_] as IVector3d;
               if(_loc14_ != null)
               {
                  _loc15_ = new Vector3d();
                  _loc15_.assign(_loc14_);
                  var_1208.push(_loc14_);
               }
               _loc13_++;
            }
         }
         _offset = new Point();
         _type = param5;
         var_166 = new Map();
         var_129 = new Vector3d();
         var_107 = new Vector3d();
         var_82 = new Vector3d();
         var_106 = new Vector3d();
         var_2080 = param9;
         var_2077 = param10;
         var_2081 = param11;
         var_2078 = param12;
         var_838 = param6;
      }
      
      public function resetRectangleMasks() : void
      {
         if(var_838)
         {
            if(false)
            {
               return;
            }
            var_159 = true;
            var_268 = [];
         }
      }
      
      private function resetTextureCache(param1:BitmapData = null) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(var_166 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < var_166.length)
            {
               _loc3_ = var_166.getWithIndex(_loc2_) as PlaneBitmapData;
               if(_loc3_ != null)
               {
                  if(_loc3_.bitmap != null && _loc3_.bitmap != param1)
                  {
                     _loc3_.bitmap.dispose();
                  }
                  _loc3_.dispose();
               }
               _loc2_++;
            }
            var_166.reset();
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(_bitmapData != null)
         {
            _bitmapData.dispose();
            _bitmapData = null;
         }
         if(var_166 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_166.length)
            {
               _loc2_ = var_166.getWithIndex(_loc1_) as PlaneBitmapData;
               if(_loc2_ != null)
               {
                  if(_loc2_.bitmap != null)
                  {
                     _loc2_.bitmap.dispose();
                  }
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            var_166.dispose();
            var_166 = null;
         }
         var_80 = null;
         var_680 = null;
         var_250 = null;
         var_251 = null;
         var_403 = null;
         var_679 = null;
         var_129 = null;
         var_107 = null;
         var_82 = null;
         var_106 = null;
         var_203 = null;
         var_268 = null;
         if(var_63 != null)
         {
            var_63.dispose();
            var_63 = null;
         }
         if(var_179 != null)
         {
            var_179.dispose();
            var_179 = null;
         }
      }
      
      public function get hasTexture() : Boolean
      {
         return var_1479;
      }
      
      public function set rasterizer(param1:IPlaneRasterizer) : void
      {
         var_679 = param1;
      }
      
      private function cacheTexture(param1:String, param2:PlaneBitmapData) : Boolean
      {
         var _loc3_:PlaneBitmapData = var_166.remove(param1) as PlaneBitmapData;
         if(_loc3_ != null)
         {
            if(param2 != null && param2.bitmap != _loc3_.bitmap)
            {
               _loc3_.bitmap.dispose();
            }
            _loc3_.dispose();
         }
         var_166.add(param1,param2);
         return true;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function addBitmapMask(param1:String, param2:Number, param3:Number) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         if(var_838)
         {
            _loc4_ = null;
            _loc5_ = 0;
            while(_loc5_ < var_203.length)
            {
               _loc4_ = var_203[_loc5_] as RoomPlaneBitmapMask;
               if(_loc4_ != null)
               {
                  if(_loc4_.type == param1 && _loc4_.leftSideLoc == param2 && _loc4_.rightSideLoc == param3)
                  {
                     return false;
                  }
               }
               _loc5_++;
            }
            _loc4_ = new RoomPlaneBitmapMask(param1,param2,param3);
            var_203.push(_loc4_);
            var_159 = true;
            return true;
         }
         return false;
      }
      
      public function set id(param1:String) : void
      {
         if(param1 != _id)
         {
            resetTextureCache();
            _id = param1;
         }
      }
      
      public function set hasTexture(param1:Boolean) : void
      {
         var_1479 = param1;
      }
      
      private function draw(param1:BitmapData, param2:Matrix) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = NaN;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(_bitmapData != null)
         {
            if(param2.a == 1 && param2.d == 1 && param2.c == 0 && param2.b != 0 && Math.abs(param2.b) <= 1 && (_type == const_249 || _type == const_173))
            {
               _loc3_ = 0;
               _loc4_ = 0;
               _loc5_ = 0;
               _loc6_ = 0;
               if(param2.b > 0)
               {
                  ++param2.ty;
               }
               _loc7_ = 0;
               while(_loc3_ < param1.width)
               {
                  _loc3_++;
                  _loc5_ += Math.abs(param2.b);
                  if(_loc5_ >= 1)
                  {
                     _bitmapData.copyPixels(param1,new Rectangle(_loc4_ + _loc6_,0,_loc3_ - _loc4_,param1.height),new Point(param2.tx + _loc4_,param2.ty + _loc7_),null,null,true);
                     _loc4_ = _loc3_;
                     if(param2.b > 0)
                     {
                        _loc7_++;
                     }
                     else
                     {
                        _loc7_--;
                     }
                     _loc5_ = 0;
                  }
               }
               if(_loc5_ > 0)
               {
                  _bitmapData.copyPixels(param1,new Rectangle(_loc4_,0,_loc3_ - _loc4_,param1.height),new Point(param2.tx + _loc4_,param2.ty + _loc7_),null,null,true);
               }
               return;
            }
            _bitmapData.draw(param1,param2,null,null,null,false);
         }
      }
      
      public function set maskManager(param1:PlaneMaskManager) : void
      {
         var_528 = param1;
      }
      
      private function updateMask(param1:BitmapData, param2:IRoomGeometry) : void
      {
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:* = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         if(!var_838 || false && false && !var_159 || var_528 == null)
         {
            return;
         }
         if(param1 == null || param2 == null)
         {
            return;
         }
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         updateMaskChangeStatus();
         var _loc7_:Number = param1.width;
         var _loc8_:Number = param1.height;
         if(var_63 == null || var_63.width != _loc7_ || var_63.height != _loc8_)
         {
            if(var_63 != null)
            {
               var_63.dispose();
               var_63 = null;
            }
            var_63 = new BitmapData(_loc7_,_loc8_,true,16777215);
            var_159 = true;
         }
         if(var_159)
         {
            var_678 = [];
            var_1005 = [];
            if(var_63 != null)
            {
               var_63.fillRect(var_63.rect,16777215);
            }
            resetTextureCache(param1);
            _loc9_ = param2.getCoordinatePosition(var_403);
            _loc10_ = 0;
            _loc11_ = 0;
            _loc5_ = 0;
            while(_loc5_ < var_203.length)
            {
               _loc3_ = var_203[_loc5_] as RoomPlaneBitmapMask;
               if(_loc3_ != null)
               {
                  _loc10_ = 0 - 0 * _loc3_.leftSideLoc / 0;
                  _loc11_ = 0 - 0 * _loc3_.rightSideLoc / 0;
                  _loc12_ = _loc3_.type;
                  var_528.updateMask(var_63,_loc12_,param2.scale,_loc9_,_loc10_,_loc11_);
                  var_678.push(new RoomPlaneBitmapMask(_loc12_,_loc3_.leftSideLoc,_loc3_.rightSideLoc));
               }
               _loc5_++;
            }
            _loc6_ = 0;
            while(_loc6_ < var_268.length)
            {
               _loc4_ = var_268[_loc6_] as RoomPlaneRectangleMask;
               if(_loc4_ != null)
               {
                  _loc10_ = 0 - 0 * _loc4_.leftSideLoc / 0;
                  _loc11_ = 0 - 0 * _loc4_.rightSideLoc / 0;
                  _loc13_ = 0 * _loc4_.leftSideLength / 0;
                  _loc14_ = 0 * _loc4_.rightSideLength / 0;
                  var_63.fillRect(new Rectangle(_loc10_ - _loc13_,_loc11_ - _loc14_,_loc13_,_loc14_),4278190080);
                  var_1005.push(new RoomPlaneRectangleMask(_loc4_.leftSideLength,_loc4_.rightSideLoc,_loc4_.leftSideLength,_loc4_.rightSideLength));
               }
               _loc6_++;
            }
            var_159 = false;
         }
         combineTextureMask(param1,var_63);
      }
      
      public function get relativeDepth() : Number
      {
         return var_1699;
      }
      
      public function resetBitmapMasks() : void
      {
         if(var_838)
         {
            if(false)
            {
               return;
            }
            var_159 = true;
            var_203 = [];
         }
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get visible() : Boolean
      {
         return _isVisible;
      }
      
      private function getTextureIdentifier(param1:IRoomGeometry) : String
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:String = String(param1.scale);
         if(var_679 != null)
         {
            _loc2_ = var_679.getTextureIdentifier(param1.scale,normal);
         }
         return _loc2_;
      }
      
      public function get bitmapData() : BitmapData
      {
         if(_isVisible)
         {
            if(_bitmapData != null)
            {
               return _bitmapData.clone();
            }
         }
         return null;
      }
      
      public function get offset() : Point
      {
         return _offset;
      }
      
      public function get rightSide() : IVector3d
      {
         return var_251;
      }
      
      private function renderTexture(param1:IRoomGeometry, param2:BitmapData) : void
      {
         if(var_129 == null || var_107 == null || var_82 == null || var_106 == null || param2 == null || _bitmapData == null)
         {
            return;
         }
         var _loc3_:Number = 0 - 0;
         var _loc4_:Number = 0 - 0;
         var _loc5_:Number = 0 - 0;
         var _loc6_:Number = 0 - 0;
         if(_type == const_249 || _type == const_173)
         {
            if(Math.abs(_loc5_ - param2.width) <= 1)
            {
               _loc5_ = param2.width;
            }
            if(Math.abs(_loc6_ - param2.width) <= 1)
            {
               _loc6_ = param2.width;
            }
            if(Math.abs(_loc3_ - param2.height) <= 1)
            {
               _loc3_ = param2.height;
            }
            if(Math.abs(_loc4_ - param2.height) <= 1)
            {
               _loc4_ = param2.height;
            }
         }
         var _loc7_:Number = _loc5_ / param2.width;
         var _loc8_:Number = _loc6_ / param2.width;
         var _loc9_:Number = _loc3_ / param2.height;
         var _loc10_:Number = _loc4_ / param2.height;
         var _loc11_:Matrix = new Matrix();
         _loc11_.a = _loc7_;
         _loc11_.b = _loc8_;
         _loc11_.c = _loc9_;
         _loc11_.d = _loc10_;
         _loc11_.translate(var_82.x,var_82.y);
         draw(param2,_loc11_);
      }
      
      public function get location() : IVector3d
      {
         return var_80;
      }
      
      private function updateMaskChangeStatus() : void
      {
         var _loc6_:Boolean = false;
         var _loc7_:* = null;
         if(!var_159)
         {
            return;
         }
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Boolean = true;
         var _loc4_:* = null;
         if(true)
         {
            while(_loc1_ < var_203.length)
            {
               _loc4_ = var_203[_loc1_] as RoomPlaneBitmapMask;
               if(_loc4_ != null)
               {
                  _loc6_ = false;
                  while(_loc2_ < var_678.length)
                  {
                     _loc7_ = var_678[_loc2_] as RoomPlaneBitmapMask;
                     if(_loc7_ != null)
                     {
                        if(_loc7_.type == _loc4_.type && _loc7_.leftSideLoc == _loc4_.leftSideLoc && _loc7_.rightSideLoc == _loc4_.rightSideLoc)
                        {
                           _loc6_ = true;
                           break;
                        }
                     }
                     _loc2_++;
                  }
                  if(!_loc6_)
                  {
                     _loc3_ = false;
                     break;
                  }
               }
               _loc1_++;
            }
         }
         else
         {
            _loc3_ = false;
         }
         if(false)
         {
            _loc3_ = false;
         }
         if(_loc3_)
         {
            var_159 = false;
         }
      }
      
      public function set color(param1:uint) : void
      {
         _color = param1;
      }
      
      private function updateCorners(param1:IRoomGeometry) : void
      {
         var_129.assign(param1.getScreenPosition(var_80));
         var_107.assign(param1.getScreenPosition(Vector3d.sum(var_80,var_251)));
         var_82.assign(param1.getScreenPosition(Vector3d.sum(Vector3d.sum(var_80,var_250),var_251)));
         var_106.assign(param1.getScreenPosition(Vector3d.sum(var_80,var_250)));
         _offset = param1.getScreenPoint(var_680);
         var_129.x = Math.round(var_129.x);
         var_129.y = Math.round(var_129.y);
         var_107.x = Math.round(var_107.x);
         var_107.y = Math.round(var_107.y);
         var_82.x = Math.round(var_82.x);
         var_82.y = Math.round(var_82.y);
         var_106.x = Math.round(var_106.x);
         var_106.y = Math.round(var_106.y);
         _offset.x = Math.round(_offset.x);
         _offset.y = Math.round(_offset.y);
         var _loc2_:Number = Math.min(var_129.x,var_107.x,var_82.x,var_106.x);
         var _loc3_:Number = Math.max(var_129.x,var_107.x,var_82.x,var_106.x);
         var _loc4_:Number = Math.min(var_129.y,var_107.y,var_82.y,var_106.y);
         var _loc5_:Number = Math.max(var_129.y,var_107.y,var_82.y,var_106.y);
         _loc3_ -= _loc2_;
         _offset.x = 0 - _loc2_;
         var_129.x = 0 - _loc2_;
         var_107.x = 0 - _loc2_;
         var_82.x = 0 - _loc2_;
         var_106.x = 0 - _loc2_;
         _loc5_ -= _loc4_;
         _offset.y = 0 - _loc4_;
         var_129.y = 0 - _loc4_;
         var_107.y = 0 - _loc4_;
         var_82.y = 0 - _loc4_;
         var_106.y = 0 - _loc4_;
         _width = _loc3_;
         _height = _loc5_;
      }
      
      public function update(param1:IRoomGeometry, param2:int) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:* = NaN;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:* = null;
         if(param1 == null || var_680 == null || var_80 == null || var_250 == null || var_251 == null || var_403 == null)
         {
            return false;
         }
         var _loc3_:Boolean = false;
         if(param1.updateId != var_1104)
         {
            var_1104 = param1.updateId;
            _loc4_ = param1.direction;
            if(_loc4_ != null && (_loc4_.x != var_905 || _loc4_.y != var_1698 || _loc4_.z != var_1696 || param1.scale != var_1697))
            {
               var_905 = _loc4_.x;
               var_1698 = _loc4_.y;
               var_1696 = _loc4_.z;
               var_1697 = param1.scale;
               _loc3_ = true;
               _loc5_ = 0;
               _loc5_ = Number(Vector3d.cosAngle(param1.directionAxis,normal));
               if(_loc5_ > -0.001)
               {
                  if(_isVisible)
                  {
                     _isVisible = false;
                     return true;
                  }
                  return false;
               }
               _loc6_ = 0;
               while(_loc6_ < var_1208.length)
               {
                  _loc5_ = Number(Vector3d.cosAngle(param1.directionAxis,var_1208[_loc6_]));
                  if(_loc5_ > -0.001)
                  {
                     if(_isVisible)
                     {
                        _isVisible = false;
                        return true;
                     }
                     return false;
                  }
                  _loc6_++;
               }
               updateCorners(param1);
               _loc7_ = param1.getScreenPosition(var_680);
               _loc8_ = _loc7_.z;
               _loc9_ = Math.max(0 - _loc8_,0 - _loc8_,0 - _loc8_,0 - _loc8_);
               if(_type == const_173)
               {
                  _loc9_ += 0.02;
               }
               var_1699 = _loc9_;
               _isVisible = true;
            }
         }
         if(needsNewTexture(param1,param2) || _loc3_)
         {
            if(_bitmapData == null || _width != _bitmapData.width || _height != _bitmapData.height)
            {
               if(_bitmapData != null)
               {
                  _bitmapData.dispose();
                  _bitmapData = null;
                  if(_width < 1 || _height < 1)
                  {
                     return true;
                  }
               }
               else if(_width < 1 || _height < 1)
               {
                  return false;
               }
               _bitmapData = new BitmapData(_width,_height,true,16777215);
               _bitmapData.lock();
            }
            else
            {
               _bitmapData.lock();
               _bitmapData.fillRect(_bitmapData.rect,16777215);
            }
            Randomizer.setSeed(var_2079);
            _loc10_ = getTexture(param1,param2);
            if(_loc10_ != null)
            {
               renderTexture(param1,_loc10_);
            }
            _bitmapData.unlock();
            return true;
         }
         return false;
      }
      
      private function needsNewTexture(param1:IRoomGeometry, param2:int) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var _loc3_:String = getTextureIdentifier(param1);
         var _loc4_:PlaneBitmapData = var_166.getValue(_loc3_) as PlaneBitmapData;
         if(_width > 0 && _height > 0)
         {
            updateMaskChangeStatus();
            if(_loc4_ == null || _loc4_.timeStamp >= 0 && param2 > _loc4_.timeStamp || var_159)
            {
               return true;
            }
         }
         return false;
      }
      
      public function addRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number) : Boolean
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         if(var_838)
         {
            _loc5_ = null;
            _loc6_ = 0;
            while(_loc6_ < var_268.length)
            {
               _loc5_ = var_268[_loc6_] as RoomPlaneRectangleMask;
               if(_loc5_ != null)
               {
                  if(_loc5_.leftSideLoc == param1 && _loc5_.rightSideLoc == param2 && _loc5_.leftSideLength == param3 && _loc5_.rightSideLength == param4)
                  {
                     return false;
                  }
               }
               _loc6_++;
            }
            _loc5_ = new RoomPlaneRectangleMask(param1,param2,param3,param4);
            var_268.push(_loc5_);
            var_159 = true;
            return true;
         }
         return false;
      }
      
      private function getTexture(param1:IRoomGeometry, param2:int) : BitmapData
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:String = getTextureIdentifier(param1);
         var _loc4_:* = null;
         if(needsNewTexture(param1,param2))
         {
            _loc5_ = 0 * param1.scale;
            _loc6_ = 0 * param1.scale;
            _loc7_ = param1.getCoordinatePosition(var_403);
            _loc4_ = var_166.getValue(_loc3_) as PlaneBitmapData;
            _loc8_ = null;
            if(_loc4_ != null)
            {
               _loc8_ = _loc4_.bitmap;
            }
            if(var_679 != null)
            {
               _loc4_ = var_679.render(_loc8_,_id,_loc5_,_loc6_,param1.scale,_loc7_,var_1479,var_2080,var_2077,var_2081,var_2078,param2);
               if(_loc4_ != null)
               {
                  if(_loc8_ != null && _loc4_.bitmap != _loc8_)
                  {
                     _loc8_.dispose();
                  }
               }
            }
            else
            {
               _loc9_ = new BitmapData(_loc5_,_loc6_,true,4278190080 | _color);
               _loc4_ = new PlaneBitmapData(_loc9_,-1);
            }
            updateMask(_loc4_.bitmap,param1);
            if(_loc4_ != null)
            {
               cacheTexture(_loc3_,_loc4_);
            }
         }
         else
         {
            _loc4_ = var_166.getValue(_loc3_) as PlaneBitmapData;
         }
         if(_loc4_ != null)
         {
            return _loc4_.bitmap;
         }
         return null;
      }
      
      public function get normal() : IVector3d
      {
         return var_403;
      }
      
      private function combineTextureMask(param1:BitmapData, param2:BitmapData) : void
      {
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(var_179 != null && (var_179.width != param1.width || var_179.height != param1.height))
         {
            var_179.dispose();
            var_179 = null;
         }
         if(var_179 == null)
         {
            var_179 = new BitmapData(param1.width,param1.height,true,4294967295);
         }
         var_179.copyChannel(param1,param1.rect,new Point(0,0),BitmapDataChannel.ALPHA,BitmapDataChannel.RED);
         var_179.draw(param2,null,null,BlendMode.DARKEN);
         param1.copyChannel(var_179,var_179.rect,new Point(0,0),BitmapDataChannel.RED,BitmapDataChannel.ALPHA);
      }
      
      public function get leftSide() : IVector3d
      {
         return var_250;
      }
   }
}
