package com.sulake.habbo.widget.events
{
   public class RoomWidgetAvatarEditorUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_928:String = "RWAEUE_HIDE_CLUB_PROMO";
      
      public static const const_597:String = "RWUE_AVATAR_EDITOR_CLOSED";
      
      public static const const_1194:String = "RWAEUE_MODE_TRIAL";
      
      public static const const_949:String = "RWAEUE_MODE_FULL";
      
      public static const const_359:String = "RWAEUE_SHOW_CLUB_PROMO";
       
      
      private var var_1997:String;
      
      private var var_1998:String;
      
      public function RoomWidgetAvatarEditorUpdateEvent(param1:String, param2:String = "", param3:String = "RWAEUE_MODE_FULL", param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         var_1997 = param2;
         var_1998 = param3;
      }
      
      public function get promoMode() : String
      {
         return var_1998;
      }
      
      public function get promoImageUrl() : String
      {
         return var_1997;
      }
   }
}
