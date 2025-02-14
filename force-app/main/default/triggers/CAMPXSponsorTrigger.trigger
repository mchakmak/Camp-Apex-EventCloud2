trigger CAMPXSponsorTrigger on CAMPX__Sponsor__c (before insert) 
{
    CAMPXSponsorTriggerHandler handler = new CAMPXSponsorTriggerHandler();
    
    if (Trigger.isBefore) 
    {    
        if (Trigger.isInsert) 
        {
            handler.setSponsorStatus(Trigger.new);
        }
    }

}