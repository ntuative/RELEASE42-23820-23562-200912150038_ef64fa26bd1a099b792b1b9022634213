package com.sulake.habbo.avatar.common
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class AvatarEditorGridView
   {
       
      
      private var _view:IWindowContainer;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _category:String;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_348:Object;
      
      private var var_834:IItemGridWindow;
      
      private var var_1462:IItemGridWindow;
      
      private var var_91:IAvatarEditorCategoryModel;
      
      private var var_740:Boolean = true;
      
      public function AvatarEditorGridView(param1:IAvatarEditorCategoryModel, param2:String, param3:IHabboWindowManager, param4:IAssetLibrary)
      {
         super();
         var_91 = param1;
         _category = param2;
         _assetLibrary = param4;
         _windowManager = param3;
         var _loc5_:XmlAsset = _assetLibrary.getAssetByName("AvatarEditorGrid") as XmlAsset;
         _view = IWindowContainer(_windowManager.buildFromXML(_loc5_.content as XML));
         if(_view != null)
         {
            var_834 = _view.findChildByName("thumbs") as IItemGridWindow;
            var_1462 = _view.findChildByName("colors") as IItemGridWindow;
         }
      }
      
      private function paletteEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:int = 0;
         if(param1.type == WindowMouseEvent.const_53)
         {
            _loc3_ = var_1462.getGridItemIndex(param1.window);
            var_91.toggleColourSelection(_category,_loc3_);
         }
      }
      
      public function initFromList() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:CategoryData = var_91.getCategoryContent(_category);
         for each(_loc2_ in _loc1_.data)
         {
            var_834.addGridItem(_loc2_.view);
            _loc2_.view.procedure = itemEventProc;
         }
         for each(_loc3_ in _loc1_.palette)
         {
            var_1462.addGridItem(_loc3_.view);
            _loc3_.view.procedure = paletteEventProc;
         }
         var_740 = false;
      }
      
      public function get window() : IWindowContainer
      {
         if(_view == null)
         {
            return null;
         }
         if(false)
         {
            return null;
         }
         return _view;
      }
      
      public function clearGrid() : void
      {
         if(var_834 != null)
         {
            var_834.removeGridItems();
         }
      }
      
      public function get firstView() : Boolean
      {
         return var_740;
      }
      
      public function updateItem(param1:int, param2:IWindowContainer) : void
      {
         var _loc3_:IWindow = var_834.getGridItemAt(param1);
         if(_loc3_)
         {
            _loc3_ = param2;
         }
      }
      
      private function itemEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:int = 0;
         if(param1.type == WindowMouseEvent.const_53)
         {
            _loc3_ = var_834.getGridItemIndex(param1.window);
            var_91.toggleItemSelection(_category,_loc3_);
         }
      }
   }
}
