public with sharing class TaskThreeLwcProCompoClass {
    @AuraEnabled
    public static list<PricebookEntry> getProductRecord(string picklist, List<PricebookEntry> selectedProduct,id recordIdOpp){
        try {
            system.debug('picklist :::' +  picklist  + '>>>>>>' + 'selectedProduct :::::'+ selectedProduct);
            Set<id> productsId = new Set<id>();
            Set<id> availOlids = new Set<id>();
            if(selectedProduct != Null){
                for(PricebookEntry p : selectedProduct){
                    productsId.add(p.id);
                }
            }
             for(OpportunityLineitem availOli : [SELECT id ,OpportunityId, product2Id FROM OpportunityLineitem WHERE opportunityId =: recordIdOpp] ){
                availOlids.add(availOli.product2Id);
            }
            system.debug('Enter the  Pisklist Name::'+picklist);
            
            if(picklist!=null && selectedProduct == Null){
                   system.debug(' data comes for 1' + picklist + '::::::::::::::'+selectedProduct );
                return [SELECT Id, Product2Id, Product2.Name,Product2.Categoury__c,Pricebook2Id, Pricebook2.Name, UnitPrice FROM PricebookEntry where (Product2.Categoury__c = :picklist OR Product2.Name LIKE :picklist +'%') AND Pricebook2.Name != 'Standard Price Book'AND product2Id Not In : availOlids];
            
            }else if(picklist!=null && selectedProduct != Null){
                    system.debug(' data comes for 2');
                return [SELECT Id, Product2Id, Product2.Name,Product2.Categoury__c,Pricebook2Id, Pricebook2.Name, UnitPrice FROM PricebookEntry where id NOT IN : productsId AND Pricebook2.Name!='Standard Price Book' ];
      
            }
            return null;
            	
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}