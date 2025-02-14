public with sharing class CAMPXSponsorTriggerHandler 
{
    public void setSponsorStatus(List<CAMPX__Sponsor__c> sponsorList) 
    {
        for (CAMPX__Sponsor__c sponsorRecord : sponsorList) 
        {
            sponsorRecord.CAMPX__Status__c = sponsorRecord.CAMPX__Status__c ?? 'Pending';
        }
    }

    public void validateEmail(List<CAMPX__Sponsor__c> sponsorList) 
    {
        for (CAMPX__Sponsor__c sponsorRecord : sponsorList) 
        {
            if (sponsorRecord.CAMPX__Email__c == null || String.isBlank(sponsorRecord.CAMPX__Email__c)) 
            {
                sponsorRecord.addError('A sponsor can not be created without an email address');
            }
        }
    }
}