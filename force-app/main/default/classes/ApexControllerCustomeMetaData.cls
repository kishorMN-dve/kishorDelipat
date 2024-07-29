public with sharing class ApexControllerCustomeMetaData {
    @AuraEnabled(cacheable=true)
    public static list<DependantPicklistMdata__mdt> cityData(){
        try {
            return [select id,City__c,Country__c,State__c from DependantPicklistMdata__mdt];

          
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static string cityMethod(string countryName){
        try {
            return [select id,City__c,Country__c,State__c from DependantPicklistMdata__mdt where Country__c=:countryName].City__c;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}