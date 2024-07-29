public class ApexClassProvider {
    @AuraEnabled(cacheable=true)
    public static list<Cricket__c> insertData(string Name){
        system.debug('enter the name ='+Name);
        if(Name == ''){
   return  [select id,Name,cricket_Name__c,Age__c,Nationality__c,Image_Url__c,image__c,Run__c from Cricket__c]; 
        }
        else{

       return [select id,Name,cricket_Name__c,Age__c,Nationality__c,Image_Url__c,image__c,Run__c from Cricket__c  where Nationality__c=:Name];
        } 
    }

}