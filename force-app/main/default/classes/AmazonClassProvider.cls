public with sharing class AmazonClassProvider {
    
    @AuraEnabled(cacheable=true)
    public static list<Amazon__c> methodName(string recordParent){
        try {
            if(string.isNotEmpty(recordParent)){
return [select id,Image__c,image_url__c,Total_price__c,Product_Name__c,Price__c,Product_detail__c,Product_Type__c from Amazon__c where Product_Type__c =: recordParent];
            }
            else{
                return [select id,Image__c,image_url__c,Total_price__c,Product_Name__c,Price__c,Product_detail__c,Product_Type__c from Amazon__c];  
            }
                  
                     
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}