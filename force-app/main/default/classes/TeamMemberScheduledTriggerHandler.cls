public with sharing class TeamMemberScheduledTriggerHandler {
    
    public static void updateCheckOutTime(List<Team_Member_Scheduled__c> tmsRecs){

        for(Team_Member_Scheduled__c tms : tmsRecs){

            //if(tms.check_out_time__c == null && tms.Status__c == 'Completed' && !String.isEmpty(tms.end_time__c)){
                if(tms.Status__c == 'Completed' && !String.isEmpty(tms.end_time__c)){


                List<String> splitTimeString = tms.end_time__c.split(':');

                String minutesString = '';
                Boolean isPM = true;
                if(splitTimeString[1].contains('AM')){
                    minutesString = splitTimeString[1].replace(' AM','');
                    isPM = false;
                } else {
                    minutesString = splitTimeString[1].replace(' PM','');
                }

                Integer minutes = Integer.valueOf(minutesString);

                Integer hour = isPM ? Integer.valueOf(splitTimeString[0]) + 12 : Integer.valueOf(splitTimeString[0]);
                if(isPM && hour == 24){
                    hour = 12;
                }
                if(!isPM && hour == 12){
                    hour = 0;
                }
                Time timeChange = Time.newInstance( hour //hour
                                     ,minutes//min);
                                     ,0                                //sec
                                     ,0);                              //ms
                tms.check_out_time__c = timeChange;
                tms.Check_Out_Date_Time__c = DateTime.newInstance(tms.startDate__c,timeChange);
                system.debug(tms.startDate__c);
            }
        }
    }
}