trigger CAMPXSponsorTrigger on CAMPX__Sponsor__c (before insert) 
{
    CAMPXSponsorTriggerHandler handler = new CAMPXSponsorTriggerHandler();
    
    if (Trigger.isBefore && Trigger.isInsert) 
    {    
        if(Trigger.isInsert)
        {
            handler.setSponsorStatus(Trigger.new);
            handler.validateEmail(Trigger.new);
            handler.setTier(Trigger.new);
            handler.validateStatusAndEvent(Trigger.new, null);
        }
        if(Trigger.isUpdate)
        {
            handler.setTier(Trigger.new);
            handler.validateStatusAndEvent(Trigger.new, Trigger.oldMap);
        }
    }
}