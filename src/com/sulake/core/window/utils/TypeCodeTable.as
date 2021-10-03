package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_612;
         param1["bitmap"] = const_610;
         param1["border"] = const_700;
         param1["border_notify"] = const_1296;
         param1["button"] = const_408;
         param1["button_thick"] = const_641;
         param1["button_icon"] = const_1161;
         param1["button_group_left"] = const_505;
         param1["button_group_center"] = const_545;
         param1["button_group_right"] = const_570;
         param1["canvas"] = const_536;
         param1["checkbox"] = const_579;
         param1["closebutton"] = const_888;
         param1["container"] = const_306;
         param1["container_button"] = const_728;
         param1["display_object_wrapper"] = const_601;
         param1["dropmenu"] = const_416;
         param1["dropmenu_item"] = const_396;
         param1["frame"] = const_289;
         param1["frame_notify"] = const_1351;
         param1["header"] = const_724;
         param1["icon"] = const_950;
         param1["itemgrid"] = const_846;
         param1["itemgrid_horizontal"] = const_421;
         param1["itemgrid_vertical"] = const_714;
         param1["itemlist"] = const_841;
         param1["itemlist_horizontal"] = const_288;
         param1["itemlist_vertical"] = const_274;
         param1["maximizebox"] = const_1198;
         param1["menu"] = const_1123;
         param1["menu_item"] = WINDOW_TYPE_MENU_ITEM;
         param1["submenu"] = const_885;
         param1["minimizebox"] = const_1182;
         param1["notify"] = const_1176;
         param1["FriendListUpdateEvent"] = const_371;
         param1["password"] = const_583;
         param1["radiobutton"] = const_503;
         param1["region"] = const_343;
         param1["restorebox"] = const_1310;
         param1["scaler"] = const_859;
         param1["scaler_horizontal"] = const_1341;
         param1["scaler_vertical"] = const_1167;
         param1["scrollbar_horizontal"] = const_466;
         param1["scrollbar_vertical"] = const_541;
         param1["scrollbar_slider_button_up"] = const_918;
         param1["scrollbar_slider_button_down"] = const_895;
         param1["scrollbar_slider_button_left"] = const_887;
         param1["scrollbar_slider_button_right"] = const_970;
         param1["scrollbar_slider_bar_horizontal"] = const_795;
         param1["scrollbar_slider_bar_vertical"] = const_955;
         param1["scrollbar_slider_track_horizontal"] = const_907;
         param1["scrollbar_slider_track_vertical"] = const_876;
         param1["scrollable_itemlist"] = const_1292;
         param1["scrollable_itemlist_vertical"] = const_406;
         param1["scrollable_itemlist_horizontal"] = const_886;
         param1["selector"] = const_562;
         param1["selector_list"] = const_580;
         param1["submenu"] = const_885;
         param1["tab_button"] = const_554;
         param1["tab_container_button"] = const_960;
         param1["tab_context"] = const_455;
         param1["tab_content"] = const_962;
         param1["tab_selector"] = WINDOW_TYPE_TAB_SELECTOR;
         param1["text"] = const_707;
         param1["input"] = const_699;
         param1["toolbar"] = const_1333;
         param1["tooltip"] = WINDOW_TYPE_TOOLTIP;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
