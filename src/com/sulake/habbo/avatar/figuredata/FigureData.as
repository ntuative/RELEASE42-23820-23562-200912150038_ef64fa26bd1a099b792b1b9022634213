package com.sulake.habbo.avatar.figuredata
{
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import flash.display.BitmapData;
   import flash.utils.Dictionary;
   
   public class FigureData
   {
      
      public static const const_1130:String = "U";
      
      public static const const_976:String = "4";
      
      public static const const_74:String = "F";
      
      public static const const_78:String = "M";
      
      public static const const_139:String = "ch";
      
      public static const const_162:String = "sh";
      
      public static const const_136:String = "ea";
      
      public static const const_263:String = "0";
      
      public static const const_54:String = "hd";
      
      public static const const_817:String = "2";
      
      public static const const_110:String = "hr";
      
      public static const const_824:String = "h";
      
      public static const const_138:String = "wa";
      
      public static const const_147:String = "fa";
      
      public static const const_133:String = "he";
      
      public static const CHEST_ACCESSORIES:String = "ca";
      
      public static const const_129:String = "lg";
      
      public static const const_130:String = "ha";
      
      public static const const_891:String = "std";
       
      
      private var var_1381:IAvatarImage;
      
      private var _view:FigureDataView;
      
      private var _data:Dictionary;
      
      private var _colors:Dictionary;
      
      private var _gender:String = "M";
      
      private var _controller:HabboAvatarEditor;
      
      public function FigureData(param1:HabboAvatarEditor)
      {
         super();
         _controller = param1;
         _view = new FigureDataView(param1.windowManager,param1.assets);
      }
      
      public function get gender() : String
      {
         return _gender;
      }
      
      public function getFigureString() : String
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc1_:* = "";
         var _loc2_:* = [];
         for(_loc3_ in _data)
         {
            if(false)
            {
               _loc5_ = "null";
               _loc6_ = "null";
               if(_loc6_ == null)
               {
                  _loc6_ = "";
               }
               if(_loc5_ != "")
               {
                  _loc2_.push(_loc3_ + "-" + _loc5_ + "-" + _loc6_);
               }
            }
         }
         _loc4_ = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc1_ += _loc2_[_loc4_];
            if(_loc4_ < _loc2_.length - 1)
            {
               _loc1_ += ".";
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      private function updateView() : void
      {
         var_1381 = _controller.avatarRenderManager.createAvatarImage(getFigureString(),AvatarScaleType.const_50);
         var_1381.setDirection(AvatarSetType.const_38,int(const_976));
         var _loc1_:BitmapData = var_1381.getImage(AvatarSetType.const_38);
         _view.udpate(_loc1_);
      }
      
      public function savePartSetColourId(param1:String, param2:int, param3:Boolean = true) : void
      {
         switch(param1)
         {
            case const_54:
            case const_110:
            case const_130:
            case const_133:
            case const_136:
            case const_147:
            case const_139:
            case CHEST_ACCESSORIES:
            case const_129:
            case const_162:
            case const_138:
               _colors[param1] = param2;
               break;
            default:
               Logger.log("[FigureData] Unknown partset: " + param1 + ", can not store colour-id: " + param2);
         }
         if(param3)
         {
            updateView();
         }
      }
      
      public function savePartData(param1:String, param2:int, param3:int, param4:Boolean = false) : void
      {
         savePartSetId(param1,param2,param4);
         savePartSetColourId(param1,param3,param4);
      }
      
      public function get view() : FigureDataView
      {
         return _view;
      }
      
      private function parseFigureString(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         for each(_loc2_ in param1.split("."))
         {
            _loc3_ = _loc2_.split("-");
            if(_loc3_.length > 0)
            {
               _loc4_ = String(_loc3_[0]);
               _loc5_ = parseInt(_loc3_[1]);
               _loc6_ = parseInt(_loc3_[2]);
               savePartSetId(_loc4_,_loc5_,false);
               if(_loc3_[2] != "")
               {
                  savePartSetColourId(_loc4_,_loc6_,false);
               }
            }
         }
      }
      
      public function loadAvatarData(param1:String, param2:String) : void
      {
         _data = new Dictionary();
         _colors = new Dictionary();
         _gender = param2;
         parseFigureString(param1);
         updateView();
      }
      
      private function savePartSetId(param1:String, param2:int, param3:Boolean = true) : void
      {
         switch(param1)
         {
            case const_54:
            case const_110:
            case const_130:
            case const_133:
            case const_136:
            case const_147:
            case const_139:
            case CHEST_ACCESSORIES:
            case const_129:
            case const_162:
            case const_138:
               if(param2 >= 0)
               {
                  _data[param1] = param2;
               }
               else
               {
                  delete _data[param1];
               }
               break;
            default:
               Logger.log("[FigureData] Unknown partset: " + param1 + ", can not store id: " + param2);
         }
         if(param3)
         {
            updateView();
         }
      }
      
      public function getFigureStringWithFace(param1:int) : String
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc2_:* = [];
         _loc2_.push(const_54);
         var _loc3_:* = "";
         var _loc4_:* = [];
         for each(_loc5_ in _loc2_)
         {
            if(false)
            {
               _loc7_ = 0;
               _loc8_ = 0;
               if(_loc5_ == const_54)
               {
                  _loc7_ = param1;
               }
               if(_loc7_ >= 0)
               {
                  _loc4_.push(_loc5_ + "-" + _loc7_ + "-" + _loc8_);
               }
            }
         }
         _loc6_ = 0;
         while(_loc6_ < _loc4_.length)
         {
            _loc3_ += _loc4_[_loc6_];
            if(_loc6_ < _loc4_.length - 1)
            {
               _loc3_ += ".";
            }
            _loc6_++;
         }
         return _loc3_;
      }
      
      public function getPartSetId(param1:String) : int
      {
         if(false)
         {
            return _data[param1];
         }
         return -1;
      }
      
      public function getColourId(param1:String) : int
      {
         if(false)
         {
            return _colors[param1];
         }
         return _controller.getDefaultColour(param1);
      }
   }
}