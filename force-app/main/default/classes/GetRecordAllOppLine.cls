public with sharing class GetRecordAllOppLine {
    @AuraEnabled(cacheable=true)
   public static List<OpportunityLineItem> getRecordId(id oppid){
    try {
         List<OpportunityLineItem> opportunityLineItems = [SELECT Id, Name,Product2.Name, Quantity,GST__c,UnitPrice,	Discont__c,Discount_value__c, TotalPrice
                                                              FROM OpportunityLineItem
                                                              WHERE OpportunityId = :oppid];
            return opportunityLineItems;
      
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
   }
}