public with sharing class OpportunityLineItemController {
    @AuraEnabled(cacheable=true)
    public static List<OpportunityLineItem> getOpportunityLineItems(Id opportunityId) {
        try {
            // Query Opportunity Line Items related to the Opportunity
            List<OpportunityLineItem> opportunityLineItems = [SELECT Id, Name,Product2.Name, Quantity,GST__c,UnitPrice,	Discont__c,Discount_value__c, TotalPrice
                                                              FROM OpportunityLineItem
                                                              WHERE OpportunityId = :opportunityId];
            return opportunityLineItems;
        } catch (Exception e) {
            // Handle any errors
            throw new AuraHandledException('Error fetching Opportunity Line Items: ' + e.getMessage());
        }
        
    }
  
}