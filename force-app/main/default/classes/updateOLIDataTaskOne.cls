public with sharing class updateOLIDataTaskOne {
    
    @AuraEnabled
    public static void updateOLI(List<OpportunityLineItem> updatedOLIData){
        try {
            update updatedOLIData;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}