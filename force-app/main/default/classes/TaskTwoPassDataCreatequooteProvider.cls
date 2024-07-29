public with sharing class TaskTwoPassDataCreatequooteProvider {
        @AuraEnabled
    public static void  gettingOppportunityData(list<Opportunity> opportunitydata,list<OpportunityLineItem> opportunityLine ){
        try {  
            
            //system.debug('c '+opportunitydata);
          //  system.debug('enter the opportunity line ' +opportunityLine);
      //      List<QuoteLineItem> qliToInsert = new List<QuotelIneItem>();
     //    list<Quote>addlist=new list<Quote>();
          
         //   for(Opportunity objopp:opportunitydata){
           //     Quote que=new Quote();
             //   que.Name=objopp.Name;
             //   que.Pricebook2Id=objopp.Pricebook2Id;
              // que.AccountId =objopp.id;
            //    que.OpportunityId=objopp.id;
             // que.Price_List__c=objopp.Price_list__c;
               // que.Region__c=objopp.Region__c;
               // addlist.add(que);
                
            }
            // insert addlist;
               // system.debug('Name list opportunity'+addlist);
               // list<QuoteLineItem>addlsitt=new list<QuoteLineItem>();
//                for (Quote quoteRecord : addlist) {
//     for(OpportunityLineItem oppLineItem : opportunityLine){
//         QuoteLineItem newQuoteLineItem = new QuoteLineItem();
//         newQuoteLineItem.QuoteId = quoteRecord.Id;
//         newQuoteLineItem.Product2Id = oppLineItem.Product2Id;
//         newQuoteLineItem.UnitPrice = oppLineItem.UnitPrice;
//         newQuoteLineItem.Quantity = oppLineItem.Quantity;
//         newQuoteLineItem.Discount_value__c = oppLineItem.Discount_value__c;
//         newQuoteLineItem.Discont_Type__c = oppLineItem.Discont__c;
//         newQuoteLineItem.PricebookEntryId=oppLineItem.PricebookEntryId;
//         addlsitt.add(newQuoteLineItem);
//         System.debug('Quote Line Item added: ' + newQuoteLineItem);
//    }
// }
//                 insert addlsitt;
       // }
          
            //     if(oppLineItemList != Null){
            //         for(OpportunityLineItem oli : oppLineItemList){
            //             quoteLineItem qli = new QuoteLineItem();
            //             qli.name = oli.name;
            //         qli.accountId = oliaccounIdd;
            //         qli.quoteId = q.id;



            //         qliToInsert.add(qli);
                
                
                
            //     }
            //     }

            //     insert qliToInsert;


            




         catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    }