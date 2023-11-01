global class ShiftUpdateSchedule implements Schedulable {

    global void execute(SchedulableContext ctx){
      String soql = '';
      If(test.isRunningTest()){
        soql = 'SELECT Id, Active__c, Volunteers_Needed__c, End_Date__c FROM Team_Shift__c where Active__c = true LIMIT 1';
      } else {
        soql = 'SELECT Id, Active__c, Volunteers_Needed__c, End_Date__c FROM Team_Shift__c where Active__c = true and (Volunteers_Needed__c = 0 OR End_date__c < today)';  
      } 
      ShiftBatchUpdate batch = new ShiftBatchUpdate(soql);
      Database.executebatch(batch, 200);
    }
}