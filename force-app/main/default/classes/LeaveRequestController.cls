public with sharing class LeaveRequestController {
    @AuraEnabled(cacheable=true)
    public static list<Leave_Managment__c> leaveMethodS(){
        try {
          return [select id,Name_Of_Employee__c,From_Date__c,Leave_Type__c,satus__c,To_Date__c,Leave_Description__c from Leave_Managment__c];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
   
}