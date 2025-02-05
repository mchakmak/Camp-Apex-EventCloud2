trigger CAMPXEventTrigger on  CAMPX__Event__c (before insert) 
{
    if (Trigger.isBefore && Trigger.isInsert) 
    {
        CAMPXEventTriggerHandler handler = new CAMPXEventTriggerHandler();
        handler.setStatusToPlanning(Trigger.new);
    }
}