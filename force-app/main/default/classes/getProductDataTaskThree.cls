public with sharing class getProductDataTaskThree {
    @AuraEnabled
    public static List<product2> getProducts(List<String> getProductListsIds , id oppoId){
        try {
            
            system.debug('getProductListsIds :::' + getProductListsIds  + ':::::' +  'oppoId :::' + oppoId );
            
            if(getProductListsIds != Null){
                return [SELECT id , Name , Categoury__c  , Family ,Quantity__c, Discount_Type__c , Discount_Value__c  FROM Product2 WHERE id IN : getProductListsIds];
            }
            
            return null;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
    
    // to save the selected product in quote
    
    @AuraEnabled
    public static String insertQuoteLineItem(List<Product2> productList, Id oppoId) {
        try {
           opportunity objoppjs=[select id ,Name ,AccountId,contactId,Price_list__c,Pricebook2Id,Delivery_Date__c,Region__c,TotalOpportunityQuantity  from opportunity where id =:oppoId];
         
            System.debug('Entered the opportunity data: ' +objoppjs);
            list<Product2>addlist=new list<Product2>();
            system.debug('enter the record ::  product '+productList);
            List<OpportunityLineItem> lineItemsToInsert = new List<OpportunityLineItem>();
            for(Product2 objopp:productList){
                
                Product2 abc=new Product2();
                abc.id=objopp.id;
              
                abc.Quantity__c=objopp.Quantity__c;
                addlist.add(abc);
                
            }
            update addlist;
          //  map<id,PricebookEntry>putmap=new map<id,PricebookEntry>();
            for(PricebookEntry obj:[SELECT Id, Product2Id, Product2.Name,Product2.Categoury__c,Product2.Quantity__c,Pricebook2Id, Pricebook2.Name, UnitPrice FROM PricebookEntry where Product2Id IN:addlist]){
                if(obj.Pricebook2.Name!='Standard Price Book'){
                    system.debug('Record Price book entry :: '+obj);
                    OpportunityLineItem lineItem = new OpportunityLineItem();
                    lineItem.OpportunityId = oppoId;
                    lineItem.Product2Id=obj.Product2Id;
                    lineItem.UnitPrice=obj.UnitPrice;
                    //lineItem.PricebookEntryId=obj.Pricebook2Id;
                    lineItem.Quantity = obj.Product2.Quantity__c;
                    lineItemsToInsert.add(lineItem);
                 //   putmap.put(obj.id,obj);
                }
                system.debug('Enter the product record :; '+obj);
            }
          insert lineItemsToInsert;
            return 'Success';
        } catch (Exception e) {
            throw new AuraHandledException('Error: ' + e.getMessage() +'Line Number :::' + e.getLineNumber());
        }
    }
    
    
    
}