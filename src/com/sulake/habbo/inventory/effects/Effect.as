package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1596:Date;
      
      private var var_1069:Boolean = false;
      
      private var _type:int;
      
      private var var_355:BitmapData;
      
      private var var_249:Boolean = false;
      
      private var var_1097:int;
      
      private var var_504:int = 1;
      
      private var var_885:int;
      
      public function Effect()
      {
         super();
      }
      
      public function get icon() : BitmapData
      {
         return var_355;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --var_504;
         if(var_504 < 0)
         {
            var_504 = 0;
         }
         var_885 = var_1097;
         var_249 = false;
         var_1069 = false;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         var_885 = param1;
      }
      
      public function get isActive() : Boolean
      {
         return var_249;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_355 = param1;
      }
      
      public function get duration() : int
      {
         return var_1097;
      }
      
      public function get isInUse() : Boolean
      {
         return var_1069;
      }
      
      public function get effectsInInventory() : int
      {
         return var_504;
      }
      
      public function get iconImage() : BitmapData
      {
         return var_355;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         if(param1 && !var_249)
         {
            var_1596 = new Date();
         }
         var_249 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         var_504 = param1;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(var_249)
         {
            _loc1_ = var_885 - (new Date().valueOf() - var_1596.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return var_885;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         var_1069 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1097 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
