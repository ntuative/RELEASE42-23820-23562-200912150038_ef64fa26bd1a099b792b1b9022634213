package com.sulake.habbo.moderation
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.messages.parser.moderation.IssueMessageData;
   
   public class IssueBundle
   {
       
      
      private var _id:int;
      
      private var _state:int;
      
      private var var_1771:int = 0;
      
      private var var_161:Map;
      
      private var var_2132:String = "";
      
      private var var_979:int;
      
      public function IssueBundle(param1:int, param2:IssueMessageData)
      {
         super();
         _id = param1;
         var_161 = new Map();
         var_161.add(param2.issueId,param2);
         _state = param2.state;
         var_1771 = param2.pickerUserId;
         var_2132 = param2.pickerUserName;
         var_979 = param2.reportedUserId;
      }
      
      public function get reportedUserId() : int
      {
         return var_979;
      }
      
      public function getHighestPriorityIssue() : IssueMessageData
      {
         var _loc2_:* = null;
         if(var_161 == null || true)
         {
            return null;
         }
         var _loc1_:IssueMessageData = var_161.getWithIndex(0);
         var _loc3_:int = 1;
         while(_loc3_ < var_161.length)
         {
            _loc2_ = var_161.getWithIndex(_loc3_);
            if(_loc2_ != null && _loc2_.priority > _loc1_.priority)
            {
               _loc1_ = _loc2_;
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function updateIssue(param1:IssueMessageData) : void
      {
         var_161.remove(param1.issueId);
         var_161.add(param1.issueId,param1);
      }
      
      public function getPrioritySum() : int
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         for each(_loc2_ in issues)
         {
            _loc1_ += _loc2_.priority;
         }
         return _loc1_;
      }
      
      public function getIssueIds() : Array
      {
         if(var_161 == null)
         {
            return [];
         }
         return var_161.getKeys();
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function getIssueCount() : int
      {
         if(var_161 == null)
         {
            return 0;
         }
         return var_161.length;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc2_ in var_161)
         {
            if(_loc1_ == null || _loc2_.timeStamp < _loc1_.timeStamp)
            {
               _loc1_ = _loc2_;
            }
         }
         if(_loc1_ != null)
         {
            return _loc1_.getOpenTime();
         }
         return "";
      }
      
      public function get pickerUserId() : int
      {
         return var_1771;
      }
      
      public function removeIssue(param1:int) : IssueMessageData
      {
         return var_161.remove(param1) as IssueMessageData;
      }
      
      public function get pickerName() : String
      {
         return var_2132;
      }
      
      public function get issues() : Array
      {
         return var_161.getValues();
      }
      
      public function getMessageCount() : int
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         for each(_loc2_ in var_161)
         {
            if(_loc2_.message != "")
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
   }
}
