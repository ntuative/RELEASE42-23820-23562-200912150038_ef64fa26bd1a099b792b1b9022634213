package com.sulake.habbo.communication.demo
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.habbo.communication.IHabboWebLogin;
   import com.sulake.habbo.communication.enum.HabboWeb;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   
   public class SSOTicket extends EventDispatcher
   {
      
      public static const const_256:String = "failure";
      
      public static const const_300:String = "success";
       
      
      private var _assets:IAssetLibrary;
      
      private var var_1274:String;
      
      private var var_2136:String;
      
      private var var_1512:String;
      
      private var var_1275:IHabboWebLogin;
      
      private var var_1:URLLoader;
      
      private var var_2288:String;
      
      public function SSOTicket(param1:IAssetLibrary, param2:IHabboWebLogin, param3:String)
      {
         super();
         _assets = param1;
         var_1275 = param2;
         var_1274 = "http://" + param3 + "/client";
         var_1275.init();
         var_1275.addEventListener(HabboWeb.const_198,requestClientURL);
      }
      
      public function get shockwaveClientUrl() : String
      {
         return var_2136;
      }
      
      private function requestClientURL(param1:Event = null) : void
      {
         var _loc2_:String = var_1274;
         if(_assets.hasAsset(_loc2_))
         {
            Logger.log("[CoreLocalizationManager] reload localization for url: " + var_1274);
         }
         var _loc3_:URLRequest = new URLRequest(var_1274);
         if(_assets.hasAsset(_loc2_))
         {
            _assets.removeAsset(_assets.getAssetByName(_loc2_));
         }
         var _loc4_:AssetLoaderStruct = _assets.loadAssetFromFile(_loc2_,_loc3_,"text/plain");
         _loc4_.addEventListener(AssetLoaderEvent.const_30,clientURLComplete);
      }
      
      public function get ticket() : String
      {
         return var_1512;
      }
      
      private function clientURLComplete(param1:Event = null) : void
      {
         var event:Event = param1;
         var loaderStruct:AssetLoaderStruct = event.target as AssetLoaderStruct;
         if(loaderStruct == null)
         {
            return;
         }
         var data:String = loaderStruct.assetLoader.content as String;
         if(data.indexOf("account/reauthenticate\"") > -1)
         {
            var_1275.requestReAuthenticate();
         }
         else
         {
            try
            {
               var_1512 = /\"sso.ticket\" : \"(.*?)\"/.exec(data)[1];
               var_2136 = /\"flash.client.url\" : \"(.*?)\"/.exec(data)[1];
               if(false)
               {
                  dispatchEvent(new Event(const_300));
               }
               else
               {
                  dispatchEvent(new Event(const_256));
               }
            }
            catch(e:Error)
            {
               trace(e);
               dispatchEvent(new Event(const_256));
            }
         }
      }
   }
}
