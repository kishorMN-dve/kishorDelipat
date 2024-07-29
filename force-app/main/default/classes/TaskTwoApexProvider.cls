public with sharing class TaskTwoApexProvider {
    @AuraEnabled(cacheable=true)
    public static list<Opportunity> methodName(id recordId){

        try {


            List<Opportunity> opportunity = [ SELECT Id, Name,Account.Name,AccountId,Contact__r.Name,Pricebook2Id,Contact__r.Id,Region__c,TotalOpportunityQuantity,
                                                        Price_list__r.Name,Delivery_Date__c, Amount 
                                                        FROM Opportunity    
                                                        WHERE id =: recordId];
                                                    
     return opportunity;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}