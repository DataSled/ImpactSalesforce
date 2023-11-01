@isTest(seeAllData=true)
global class ShiftUpdateScheduleTest {
    @IsTest
    global static void test1() {
        
        Team_Shift__c shift = [SELECT ID FROM Team_Shift__c LIMIT 1];
        shift.Desired_of_Volunteers__c  = 0;
        update shift;

        test.starttest();
        ShiftUpdateSchedule myClass = new ShiftUpdateSchedule ();   
            String chron = '0 0 23 * * ?';        
            system.schedule('Test Sched', chron, myClass);
        test.stopTest();

    }
}