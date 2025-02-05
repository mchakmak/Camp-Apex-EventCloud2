public with sharing class CAMPXEventTriggerHandler 
{
    public void setStatusToPlanning(List<CAMPX__Event__c> eventList) 
    {
        for (CAMPX__Event__c eventRecord : eventList) 
        {
            eventRecord.CAMPX__Status__c = 'Planning';
        }
    }
}