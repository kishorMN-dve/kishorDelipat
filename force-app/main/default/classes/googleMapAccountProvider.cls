public with sharing class googleMapAccountProvider {
   @AuraEnabled(cacheable=true)
   public static list<Account> methodName(string accName){
    try {
        String str=accName +'%';
      
        return  [select Id,Name,BillingCity ,BillingStreet ,BillingCountry,BillingPostalCode from Account where Name like:str];

    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
   }
}