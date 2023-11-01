/**
 * Auto Generated and Deployed by the Declarative Lookup Rollup Summaries Tool package (dlrs)
 **/
@IsTest
private class dlrs_Team_Member_ScheduledTest
{
    @IsTest
    private static void testTrigger()
    {
        // Force the dlrs_Team_Member_ScheduledTrigger to be invoked, fails the test if org config or other Apex code prevents this.
        dlrs.RollupService.testHandler(new Team_Member_Scheduled__c());
    }
}