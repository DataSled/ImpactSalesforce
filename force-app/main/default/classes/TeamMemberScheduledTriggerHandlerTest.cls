@IsTest
private class TeamMemberScheduledTriggerHandlerTest {
	
	@IsTest(seeAllData=true)
	static void testUpdateCheckOutTime() {

        // Team__c team = new Team__c();
        // insert team;

        // Team_Jobs__c job = new Team_Jobs__c();
        // job.Team__c = team.id;
        // insert job;

        // Team_Shift__c shift = new Team_Shift__c();
        // shift.Team_Job__c = job.id;
        // insert shift;

        Team_Shift__c shift = [SELECT ID FROM Team_Shift__c LIMIT 1];


        Account testAccount = new Account();
		testAccount.Name='Test Account' ;
		insert testAccount;
		
		Contact cont = new Contact();
		cont.FirstName='Test';
		cont.LastName='Test';
		cont.Accountid= testAccount.id;
		insert cont;

        Team_Member_Scheduled__c tmsRec = new Team_Member_Scheduled__c();
        tmsRec.contact__c = cont.id;
        tmsRec.Team_Shift__c = shift.id;
        tmsRec.startDate__c = date.today();
        insert tmsRec;

        tmsRec.end_time__c = '8:30 AM';
        tmsRec.Status__c = 'Completed';
        update tmsRec;
		
		Team_Member_Scheduled__c updatedRec = [SELECT Id, check_out_time__c  FROM Team_Member_Scheduled__c WHERE Id = :tmsRec.Id];
		System.assertNotEquals(null, updatedRec.check_out_time__c);
	
	}
}