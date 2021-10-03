package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const const_874:String = "AssetLoaderEventUnload";
      
      public static const const_47:String = "AssetLoaderEventError";
      
      public static const const_839:String = "AssetLoaderEventOpen";
      
      public static const const_856:String = "AssetLoaderEventProgress";
      
      public static const const_932:String = "AssetLoaderEventStatus";
      
      public static const const_30:String = "AssetLoaderEventComplete";
       
      
      private var var_356:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         var_356 = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return var_356;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,var_356);
      }
   }
}
