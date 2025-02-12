public with sharing class CAMPXEventTriggerHandler 
{
    public void setStatusToPlanning(List<CAMPX__Event__c> eventList) 
    {
        for (CAMPX__Event__c eventRecord : eventList) 
        {
            eventRecord.CAMPX__Status__c = 'Planning';
            eventRecord.CAMPX__StatusChangeDate__c = System.now();
        }
    }

    public void recordStatusChange(List<CAMPX__Event__c> newList, Map<Id, CAMPX__Event__c> oldMap) 
    {
        List<CAMPX__Event__c> eventsToUpdate = new List<CAMPX__Event__c>();

        for (CAMPX__Event__c eventRecord : newList) 
        {
            CAMPX__Event__c oldRecord = oldMap.get(eventRecord.Id);

            if (oldRecord != null && eventRecord.CAMPX__Status__c != oldRecord.CAMPX__Status__c)
            {
                // Create a new instance to update since Trigger.new is read-only
                CAMPX__Event__c updatedEvent = new CAMPX__Event__c(
                    Id = eventRecord.Id,
                    CAMPX__StatusChangeDate__c = System.now()
                );
                eventsToUpdate.add(updatedEvent);
            }
        }

        if (!eventsToUpdate.isEmpty()) 
        {
            update eventsToUpdate;  // Explicit DML update required in after update trigger
        }
    }
}