public class ClassOpportunityLinePandA {
    
    public static void insertOpp(list<OpportunityLineItem>accOPPLineList){
        set<id>addset=new set<id>();
        set<id>actIdset=new set<id>();
        for(OpportunityLineItem objoppline:accOPPLineList){
          addset.add(objoppline.OpportunityId);    
        }
        for(Opportunity objopp:[Select AccountId from Opportunity where Id in: addset]){ 
          actIdset.add(objopp.AccountId);    
        }      
       map<id,integer>putmap=new map<id,integer>();
        if(!addset.isEmpty()){
            for(Opportunity objopp:[select id,AccountID,Name,(select id,Name from OpportunityLineItems) from Opportunity where AccountID IN:actIdset ]){
               // list<OpportunityLineItem>oppsize=objopp.OpportunityLineItems;
                if(putmap.containskey(objopp.AccountId)){
                    putmap.put(objopp.AccountId,putmap.get(objopp.AccountId)+objopp.OpportunityLineItems.size());                    
                }
                else{
                    putmap.put(objopp.AccountId,objopp.OpportunityLineItems.size());
                }              
            }
                       }
        list<Account>accountlist=new list<Account>();
        for(Account objacct:[select id,Name,count__c from Account where id IN:putmap.keySet()]){
        //   list<OpportunityLineItem>acclist=putmap.get(objacct.id).OpportunityLineItems;
           objacct.count__c=putmap.get(objacct.id);
            accountlist.add(objacct);
        }  
        database.update(accountlist,false);
    }
}