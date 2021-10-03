package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1001:int = 31;
      
      private static const const_1000:int = 32;
      
      private static const const_478:int = 30;
      
      private static const const_730:int = 20;
      
      private static const const_479:int = 10;
       
      
      private var var_559:Boolean = false;
      
      private var var_208:Array;
      
      public function FurnitureValRandomizerVisualization()
      {
         var_208 = new Array();
         super();
         super.setAnimation(const_478);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            var_559 = true;
            var_208 = new Array();
            var_208.push(const_1001);
            var_208.push(const_1000);
            return;
         }
         if(param1 > 0 && param1 <= const_479)
         {
            if(var_559)
            {
               var_559 = false;
               var_208 = new Array();
               if(_direction == 2)
               {
                  var_208.push(const_730 + 5 - param1);
                  var_208.push(const_479 + 5 - param1);
               }
               else
               {
                  var_208.push(const_730 + param1);
                  var_208.push(const_479 + param1);
               }
               var_208.push(const_478);
               return;
            }
            super.setAnimation(const_478);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(11))
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
