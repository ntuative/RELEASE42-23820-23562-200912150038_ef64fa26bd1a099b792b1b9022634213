package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1000:int = -1;
      
      private static const const_730:int = 20;
      
      private static const const_479:int = 9;
       
      
      private var var_559:Boolean = false;
      
      private var var_208:Array;
      
      public function FurnitureBottleVisualization()
      {
         var_208 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            var_559 = true;
            var_208 = new Array();
            var_208.push(const_1000);
            return;
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(var_559)
            {
               var_559 = false;
               var_208 = new Array();
               var_208.push(const_730);
               var_208.push(const_479 + param1);
               var_208.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(0))
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
