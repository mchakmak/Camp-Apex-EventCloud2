trigger CAMPXEventTrigger on  CAMPX__Event__c (before insert, after update) 
{
    if (Trigger.isBefore && Trigger.isInsert) 
    {
        CAMPXEventTriggerHandler handler = new CAMPXEventTriggerHandler();
        handler.setStatusToPlanning(Trigger.new);
    }
    else if (Trigger.isAfter && Trigger.isUpdate) 
    {
        CAMPXEventTriggerHandler handler = new CAMPXEventTriggerHandler();
        handler.recordStatusChange(Trigger.new, Trigger.oldMap);
    }
}