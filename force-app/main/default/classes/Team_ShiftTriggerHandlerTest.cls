@IsTest
private class Team_ShiftTriggerHandlerTest {
	
	@IsTest(seeAllData=true)
	static void testUpdateScheduledTime() {

        Team_Shift__c shift = [SELECT ID FROM Team_Shift__c LIMIT 1];

        shift.Start_Date__c = date.today();
        shift.Start_Time__c = '12:00 PM';
        shift.End_Date__c = date.today();
        shift.End_Time__c = '12:30 PM';

        update shift;

        shift.Start_Date__c = date.today();
        shift.Start_Time__c = '12:00 AM';
        shift.End_Date__c = date.today();
        shift.End_Time__c = '12:30 AM';

        update shift;
		
		Team_Shift__c updatedRec = [SELECT Id, Scheduled_Start_Date_Time__c  FROM Team_Shift__c WHERE Id = :shift.Id];
		System.assertNotEquals(null, updatedRec.Scheduled_Start_Date_Time__c);
	
	}
}