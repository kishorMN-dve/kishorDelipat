public with sharing class ApexClassLwcShowDataUser {
@AuraEnabled(cacheable=true)
public static list<Buyer_Info__c> methodName(string ids){
    try {
        return [select id,Name,candidate_Email__c,Interest__c,Expected_Price__c from Buyer_Info__c limit 10];
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
}

}