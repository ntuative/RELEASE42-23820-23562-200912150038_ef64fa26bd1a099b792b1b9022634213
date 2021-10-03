package com.sulake.habbo.friendlist
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class PopupCtrl
   {
       
      
      private var var_1717:int;
      
      private var var_790:Timer;
      
      private var var_1718:int;
      
      private var var_639:Timer;
      
      private var var_56:IWindowContainer;
      
      private var _friendList:HabboFriendList;
      
      private var var_1049:String;
      
      public function PopupCtrl(param1:HabboFriendList, param2:int, param3:int, param4:String)
      {
         var_790 = new Timer(500,1);
         var_639 = new Timer(100,1);
         super();
         _friendList = param1;
         var_1049 = param4;
         var_1718 = param2;
         var_1717 = param3;
         var_790.addEventListener(TimerEvent.TIMER,onDisplayTimer);
         var_639.addEventListener(TimerEvent.TIMER,onHideTimer);
      }
      
      public function refreshContent(param1:IWindowContainer) : void
      {
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         this.var_56.visible = true;
         this.var_56.activate();
      }
      
      private function refreshPopupArrows(param1:IWindowContainer, param2:Boolean) : void
      {
         refreshPopupArrow(param1,true,param2);
         refreshPopupArrow(param1,false,!param2);
      }
      
      public function showPopup(param1:IWindowContainer, param2:IWindow) : void
      {
         if(var_56 == null)
         {
            var_56 = IWindowContainer(_friendList.getXmlWindow(var_1049));
            var_56.visible = false;
            param1.addChild(var_56);
         }
         refreshContent(var_56);
         var_56.width = Util.getRightmostPoint(var_56) + 10;
         var_56.height = Util.getLowestPoint(var_56) + 10;
         var _loc3_:Point = new Point();
         var _loc4_:Point = new Point();
         param1.getGlobalPosition(_loc3_);
         param2.getGlobalPosition(_loc4_);
         var_56.x = _loc4_.x - _loc3_.x + var_1718 + param2.width;
         var_56.y = _loc4_.y - _loc3_.y - 0 + param2.height * 0.5;
         var _loc5_:Point = new Point();
         var_56.getGlobalPosition(_loc5_);
         if(_loc5_.x + var_56.width > var_56.desktop.width)
         {
            var_56.x = 0 + _loc4_.x - _loc3_.x + var_1717;
            refreshPopupArrows(var_56,false);
         }
         else
         {
            refreshPopupArrows(var_56,true);
         }
         if(true)
         {
            var_790.reset();
            var_790.start();
         }
         var_639.reset();
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         if(var_56 != null)
         {
            var_56.visible = false;
         }
      }
      
      public function closePopup() : void
      {
         var_639.reset();
         var_790.reset();
         var_639.start();
      }
      
      private function refreshPopupArrow(param1:IWindowContainer, param2:Boolean, param3:Boolean) : void
      {
         var _loc4_:String = "popup_arrow_" + (!!param2 ? "left" : "right");
         var _loc5_:IBitmapWrapperWindow = IBitmapWrapperWindow(param1.findChildByName(_loc4_));
         if(!param3)
         {
            if(_loc5_ != null)
            {
               _loc5_.visible = false;
            }
         }
         else
         {
            if(_loc5_ == null)
            {
               _loc5_ = _friendList.getButton(_loc4_,_loc4_,null);
               _loc5_.setParamFlag(HabboWindowParam.const_64,false);
               param1.addChild(_loc5_);
            }
            _loc5_.visible = true;
            _loc5_.y = param1.height * 0.5 - _loc5_.height * 0.5;
            _loc5_.x = !!param2 ? int(1 - _loc5_.width) : int(param1.width - 1);
         }
      }
      
      public function get friendList() : HabboFriendList
      {
         return _friendList;
      }
   }
}
