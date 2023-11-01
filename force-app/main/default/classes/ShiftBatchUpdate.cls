global class ShiftBatchUpdate implements Database.Batchable<sObject> {

    private String query;
    
    global ShiftBatchUpdate (String soql){
      query = soql;
    }
    
    // The batch job starts
    global Database.Querylocator start(Database.BatchableContext bc){
      return Database.getQuerylocator(query);
    } 
    
    // The batch job executes and operates on one batch of records
    global void execute(Database.BatchableContext bc, List<Team_Shift__c> shifts){
      System.debug('>>>> execute ' + shifts.size());
      for(Team_Shift__c s: shifts){
          s.Active__c = false;
      }
      update shifts;
  
    }
    
    // The batch job finishes
    global void finish(Database.BatchableContext bc){
      //AsyncApexJob job = [SELECT Id, Status FROM AsyncApexJob WHERE Id = :bc.getJobId()]; 
      //System.debug('>>>> finish ' + job.Status);
    }
  }