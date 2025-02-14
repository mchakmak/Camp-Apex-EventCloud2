trigger CAMPXSponsorTrigger on CAMPX__Sponsor__c (before insert) 
{
    CAMPXSponsorTriggerHandler handler = new CAMPXSponsorTriggerHandler();
    
    if (Trigger.isBefore && Trigger.isInsert) 
    {    
        handler.setSponsorStatus(Trigger.new);
        handler.validateEmail(Trigger.new);
    }
}