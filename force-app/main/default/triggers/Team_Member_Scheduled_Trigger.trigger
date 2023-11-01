trigger Team_Member_Scheduled_Trigger on Team_Member_Scheduled__c (before update) {
    if(Trigger.IsBefore && Trigger.IsUpdate){
        TeamMemberScheduledTriggerHandler.updateCheckOutTime(Trigger.new);
    }
}