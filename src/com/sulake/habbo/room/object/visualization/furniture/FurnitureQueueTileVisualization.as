package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1056:int = 1;
      
      private static const const_1000:int = 3;
      
      private static const const_1057:int = 2;
      
      private static const const_1055:int = 15;
       
      
      private var var_812:int;
      
      private var var_208:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_208 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1057)
         {
            var_208 = new Array();
            var_208.push(const_1056);
            var_812 = const_1055;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_812 > 0)
         {
            --var_812;
         }
         if(var_812 == 0)
         {
            if(false)
            {
               super.setAnimation(var_208.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
