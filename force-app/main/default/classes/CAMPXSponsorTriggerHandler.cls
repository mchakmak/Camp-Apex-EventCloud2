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

    public void setTier(List<CAMPX__Sponsor__c> sponsorList)
    {
        for (CAMPX__Sponsor__c sponsorRecord : sponsorList) 
        {
            if (sponsorRecord.CAMPX__ContributionAmount__c == NULL
                || sponsorRecord.CAMPX__ContributionAmount__c <= 0)
            {
                sponsorRecord.CAMPX__Tier__c = '';
            }
            else if (sponsorRecord.CAMPX__ContributionAmount__c < 1000) 
            {
                sponsorRecord.CAMPX__Tier__c = 'Bronze';
            }
            else if (sponsorRecord.CAMPX__ContributionAmount__c >= 1000 
                     && sponsorRecord.CAMPX__ContributionAmount__c < 5000) 
            {
                sponsorRecord.CAMPX__Tier__c = 'Silver';
            }
            else if (sponsorRecord.CAMPX__ContributionAmount__c >= 5000) 
            {
                sponsorRecord.CAMPX__Tier__c = 'Gold';
            }
        }
    }

    public void validateStatusAndEvent(
        List<CAMPX__Sponsor__c> sponsorList, 
        Map<Id, CAMPX__Sponsor__c> oldSponsorMap) 
    {
        for (CAMPX__Sponsor__c sponsorRecord : sponsorList) 
        {
            // Skip if oldSponsorMap is null (insert context)
            if (oldSponsorMap == null) {
                continue;
            }
    
            // Get the old value of the Status field
            CAMPX__Sponsor__c oldSponsorRecord = oldSponsorMap.get(sponsorRecord.Id);
    
            // Ensure old record exists and check if status changed to "Accepted"
            Boolean statusChangedToAccepted = oldSponsorRecord != null &&
                                              oldSponsorRecord.CAMPX__Status__c != 'Accepted' &&
                                              sponsorRecord.CAMPX__Status__c == 'Accepted';
    
            if (statusChangedToAccepted && sponsorRecord.CAMPX__Event__c == null) 
            {
                sponsorRecord.addError('A Sponsor must be associated with an event before being Accepted.');
            }
        }
    }    
}