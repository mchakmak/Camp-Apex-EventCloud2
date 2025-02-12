trigger CAMPXEventTrigger on CAMPX__Event__c (before insert, after update) 
{
    CAMPXEventTriggerHandler handler = new CAMPXEventTriggerHandler();

    if (Trigger.isBefore) 
    {    
        if (Trigger.isInsert) 
        {
            handler.setStatusToPlanning(Trigger.new);
        }
    } 
    else if (Trigger.isAfter) 
    {
        if (Trigger.isUpdate) 
        {
            handler.recordStatusChange(Trigger.new, Trigger.oldMap);
        }
    }
}
