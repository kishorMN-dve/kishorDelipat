public with sharing class TaskTwoPassDataCreateQuoteProvider {
    @AuraEnabled
    public static void gettingOpportunityData(List<Opportunity> opportunitydata, List<OpportunityLineItem> opportunityLine) {
        try {  
            System.debug('Opportunity Data: ' + opportunitydata);
            System.debug('Opportunity Line Items: ' + opportunityLine);
            
            List<Quote> addlist = new List<Quote>();
          
            for(Opportunity objopp : opportunitydata) {
                Quote que = new Quote();
                que.Name = objopp.Name;
               // que.Pricebook2Id = objopp.Pricebook2Id; // Ensure to set Pricebook2Id
                que.OpportunityId = objopp.Id;
                que.Price_List__c = objopp.Price_list__c;
                que.Region__c = objopp.Region__c;
                addlist.add(que);
            }
            
            insert addlist;
            System.debug('Inserted Quotes: ' + addlist);
            
            List<QuoteLineItem> addlsitt = new List<QuoteLineItem>();
            
            for (Quote quoteRecord : addlist) {
                for(OpportunityLineItem oppLineItem : opportunityLine){
                    QuoteLineItem newQuoteLineItem = new QuoteLineItem();
                    newQuoteLineItem.QuoteId = quoteRecord.Id;
                    newQuoteLineItem.Product2Id = oppLineItem.Product2Id;
                    newQuoteLineItem.UnitPrice = oppLineItem.UnitPrice;
                    newQuoteLineItem.Quantity = oppLineItem.Quantity;
                    newQuoteLineItem.Discount_value__c = oppLineItem.Discount_value__c;
                    newQuoteLineItem.Discont_Type__c = oppLineItem.Discont__c;
                    addlsitt.add(newQuoteLineItem);
                    System.debug('Quote Line Item added: ' + newQuoteLineItem);
                }
            }
            
            insert addlsitt;
            System.debug('Inserted Quote Line Items: ' + addlsitt);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}