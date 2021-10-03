package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_550:int = 6;
      
      public static const const_199:int = 5;
      
      public static const const_517:int = 2;
      
      public static const const_321:int = 9;
      
      public static const const_227:int = 4;
      
      public static const const_268:int = 2;
      
      public static const const_691:int = 4;
      
      public static const const_219:int = 8;
      
      public static const const_495:int = 7;
      
      public static const const_259:int = 3;
      
      public static const const_290:int = 1;
      
      public static const const_196:int = 5;
      
      public static const const_473:int = 12;
      
      public static const const_308:int = 1;
      
      public static const const_447:int = 11;
      
      public static const const_590:int = 3;
      
      public static const const_1526:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_402:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_402 = new Array();
         var_402.push(new Tab(_navigator,const_290,const_473,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_409));
         var_402.push(new Tab(_navigator,const_268,const_308,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_409));
         var_402.push(new Tab(_navigator,const_227,const_447,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_623));
         var_402.push(new Tab(_navigator,const_259,const_199,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_409));
         var_402.push(new Tab(_navigator,const_196,const_219,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_653));
         setSelectedTab(const_290);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_402)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_402)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_402)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_227;
      }
      
      public function get tabs() : Array
      {
         return var_402;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
