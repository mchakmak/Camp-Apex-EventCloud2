trigger CAMPXEventTrigger on  CAMPX__Event__c (before insert) 
{
    if (Trigger.isBefore && Trigger.isInsert) 
    {
        EventTriggerHandler handler = new EventTriggerHandler();
        handler.setStatusToPlanning(Trigger.new);
    }
}