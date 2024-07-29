public with sharing class getOppOLIData {
    
    
    @AuraEnabled(cacheable=true)
    public static List<OpportunityLineItem> getOliData(id recordId){
        try {
            system.debug('recordId;:::' + recordId);
            if(recordId != Null){
                return [SELECT id,opportunityId,Name,Product2.Name,Discont__c,Discount_value__c,PricebookEntryId,Product2Id,Quantity,UnitPrice FROM OpportunityLineItem WHERE opportunityId =: recordId];
            }
            return null;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}