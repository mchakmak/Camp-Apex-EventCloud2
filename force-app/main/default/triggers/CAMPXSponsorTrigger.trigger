trigger CAMPXSponsorTrigger on CAMPX__Sponsor__c (before insert, before update, after update) 
{
    CAMPXSponsorTriggerHandler handler = new CAMPXSponsorTriggerHandler();
    
    if (Trigger.isBefore && Trigger.isInsert) 
    {    
        if(Trigger.isInsert)
        {
            handler.setSponsorStatus(Trigger.new);
            handler.validateEmail(Trigger.new);
            handler.setTier(Trigger.new);
            //handler.validateStatusAndEvent(Trigger.new, null);
            handler.validateStatusAndEvent(Trigger.new);
        }
        if(Trigger.isUpdate)
        {
            handler.setTier(Trigger.new);
        }
    }
    if(Trigger.isAfter && Trigger.isUpdate)
    {
        //handler.validateStatusAndEvent(Trigger.new, Trigger.oldMap);
        handler.validateStatusAndEvent(Trigger.new);
    }
}