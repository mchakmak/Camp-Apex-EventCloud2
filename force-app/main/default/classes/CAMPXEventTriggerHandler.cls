public with sharing class CAMPXEventTriggerHandler 
{
    public void setStatusToPlanning(List<CAMPX__Event__c> eventList) 
    {
        for (CAMPX__Event__c eventRecord : eventList) 
        {
            eventRecord.CAMPX__Status__c = 'Planning';
        }
    }

    public void recordStatusChange(List<CAMPX__Event__c> newList, List<CAMPX__Event__c> oldList) 
    {
        for (CAMPX__Event__c eventRecord : newList) 
        {
            if(eventRecord.CAMPX__Status__c != oldList[0].CAMPX__Status__c)
            {
                eventRecord. CAMPX__StatusChangeDate__c = System.now();
            }
        }
    }
}