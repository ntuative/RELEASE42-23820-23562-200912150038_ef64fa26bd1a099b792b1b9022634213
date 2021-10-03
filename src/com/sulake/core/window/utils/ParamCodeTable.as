package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["FriendListUpdateEvent"] = const_97;
         param1["bound_to_parent_rect"] = const_77;
         param1["child_window"] = const_843;
         param1["embedded_controller"] = const_319;
         param1["resize_to_accommodate_children"] = const_57;
         param1["input_event_processor"] = const_44;
         param1["internal_event_handling"] = const_630;
         param1["mouse_dragging_target"] = const_209;
         param1["mouse_dragging_trigger"] = const_286;
         param1["mouse_scaling_target"] = const_230;
         param1["mouse_scaling_trigger"] = const_451;
         param1["horizontal_mouse_scaling_trigger"] = const_187;
         param1["vertical_mouse_scaling_trigger"] = const_207;
         param1["observe_parent_input_events"] = const_914;
         param1["optimize_region_to_layout_size"] = const_442;
         param1["parent_window"] = const_909;
         param1["relative_horizontal_scale_center"] = const_157;
         param1["relative_horizontal_scale_fixed"] = const_112;
         param1["relative_horizontal_scale_move"] = const_291;
         param1["relative_horizontal_scale_strech"] = const_235;
         param1["relative_scale_center"] = const_942;
         param1["relative_scale_fixed"] = const_559;
         param1["relative_scale_move"] = const_900;
         param1["relative_scale_strech"] = const_925;
         param1["relative_vertical_scale_center"] = const_151;
         param1["relative_vertical_scale_fixed"] = const_111;
         param1["relative_vertical_scale_move"] = const_283;
         param1["relative_vertical_scale_strech"] = const_246;
         param1["on_resize_align_left"] = const_593;
         param1["on_resize_align_right"] = const_384;
         param1["on_resize_align_center"] = const_467;
         param1["on_resize_align_top"] = const_518;
         param1["on_resize_align_bottom"] = const_401;
         param1["on_resize_align_middle"] = const_463;
         param1["on_accommodate_align_left"] = const_783;
         param1["on_accommodate_align_right"] = const_403;
         param1["on_accommodate_align_center"] = const_672;
         param1["on_accommodate_align_top"] = const_816;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_615;
         param1["route_input_events_to_parent"] = const_433;
         param1["use_parent_graphic_context"] = const_33;
         param1["draggable_with_mouse"] = const_944;
         param1["scalable_with_mouse"] = const_836;
         param1["reflect_horizontal_resize_to_parent"] = const_404;
         param1["reflect_vertical_resize_to_parent"] = const_469;
         param1["reflect_resize_to_parent"] = const_233;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
