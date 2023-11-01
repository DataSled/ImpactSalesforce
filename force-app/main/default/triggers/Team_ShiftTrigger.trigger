trigger Team_ShiftTrigger on Team_Shift__c (before insert, before update) {
    if(Trigger.IsBefore && (Trigger.IsUpdate || Trigger.isInsert)){
        Team_ShiftTriggerHandler.updateTime(Trigger.new);
    }
}