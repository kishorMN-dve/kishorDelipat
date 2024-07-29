public with sharing class QuoteLineProvider {
    @AuraEnabled(cacheable=true)
 public static  List<QuoteLineItem> methodName(id quoteId){
    try {
        List<QuoteLineItem> quoteLineItems = [SELECT Id,LineNumber,Discont_Type__c ,Discount_value__c,QuoteId ,UnitPrice,Product2.Name,TotalPrice,Discount, GST__c FROM QuoteLineItem WHERE QuoteId = :quoteId];
        return quoteLineItems;
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
 }
}