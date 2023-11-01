public with sharing class Team_ShiftTriggerHandler {
    
    public static void updateTime(List<Team_Shift__c> tsRecs){

        for(Team_Shift__c ts : tsRecs){

            //if(ts.check_out_time__c == null && ts.Status__c == 'Completed' && !String.isEmpty(ts.end_time__c)){
            if(ts.Start_Date__c != null && !String.isEmpty(ts.Start_Time__c)){

                List<String> splitTimeString = ts.Start_Time__c.split(':');

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
                //ts.check_out_time__c = timeChange;
                ts.Scheduled_Start_Date_Time__c = DateTime.newInstance(ts.Start_Date__c,timeChange);

            }

            if(ts.End_Date__c != null && !String.isEmpty(ts.End_Time__c)){

                List<String> splitTimeString = ts.End_Time__c.split(':');

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
                //ts.check_out_time__c = timeChange;
                ts.Scheduled_End_Date_Time__c = DateTime.newInstance(ts.End_Date__c,timeChange);

            }
        }
    }
}