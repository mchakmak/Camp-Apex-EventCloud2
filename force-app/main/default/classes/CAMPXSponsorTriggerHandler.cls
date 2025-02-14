public with sharing class CAMPXSponsorTriggerHandler 
{
    public void setSponsorStatus(List<CAMPX__Sponsor__c> sponsorList) 
    {
        for (CAMPX__Sponsor__c sponsorRecord : sponsorList) 
        {
            sponsorRecord.CAMPX__Status__c ? Null : sponsorRecord.CAMPX__Status__c = 'Pending';
        }

    }
}