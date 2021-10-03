package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_919:SoundChannel = null;
      
      private var var_767:Boolean;
      
      private var var_920:Sound = null;
      
      private var var_674:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         var_920 = param1;
         var_920.addEventListener(Event.COMPLETE,onComplete);
         var_674 = 1;
         var_767 = false;
      }
      
      public function get finished() : Boolean
      {
         return !var_767;
      }
      
      public function stop() : Boolean
      {
         var_919.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         var_767 = false;
         var_919 = var_920.play(0);
         this.volume = var_674;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return var_674;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get position() : Number
      {
         return var_919.position;
      }
      
      public function get length() : Number
      {
         return var_920.length;
      }
      
      public function set volume(param1:Number) : void
      {
         var_674 = param1;
         if(var_919 != null)
         {
            var_919.soundTransform = new SoundTransform(var_674);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var_767 = true;
      }
   }
}
