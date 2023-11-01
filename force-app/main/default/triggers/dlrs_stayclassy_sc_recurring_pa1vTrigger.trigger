/**
 * Auto Generated and Deployed by the Declarative Lookup Rollup Summaries Tool package (dlrs)
 **/
trigger dlrs_stayclassy_sc_recurring_pa1vTrigger on stayclassy__sc_recurring_profile__c
    (before delete, before insert, before update, after delete, after insert, after undelete, after update)
{
    dlrs.RollupService.triggerHandler(stayclassy__sc_recurring_profile__c.SObjectType);
}