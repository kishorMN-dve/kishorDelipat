public class triggercountOpppLineIteamClass {
    public static void insertData(list<OpportunityLineItem>listOpp){
      set<id>addset=new set<id>();
        for(OpportunityLineItem objpp:listOpp){
            if(objpp.ListPrice>500){
            addset.add(objpp.OpportunityId);
            }
            
        }
       set<id>addAccid=new set<id>();
        if(!addset.isEmpty()){
            for(Opportunity objopp:[select id,AccountID from Opportunity where id IN:addset]){
                addAccid.add(objopp.AccountId);
                
            }
            
        map<id,decimal>putmap=new map<id,decimal>();
        if(!addAccid.isEmpty()){
            for(Opportunity objoppex:[select id,Name,AccountID,(select id,Name from OpportunityLineItems) from Opportunity where AccountID IN:addAccid]){
                if(putmap.containskey(objoppex.AccountId)){
                  putmap.put(objoppex.AccountId,putmap.get(objoppex.AccountId)+objoppex.OpportunityLineItems.size());   
                }
                else{
                    
                    putmap.put(objoppex.AccountId,objoppex.OpportunityLineItems.size()); 
                    
                }
                
                
        }
            
        }
            list<Account>addlist=new list<Account>();
            for(Account ob:[select id,Name,count__c from Account where id IN:putmap.keySet()]){
                if(putmap.containskey(ob.id)){
                    system.debug('Enter the data line==== '+putmap.get(ob.id));
                    ob.count__c=putmap.get(ob.id);
                    addlist.add(ob);
                    
                }
                    
                
                
            }
            database.update(addlist,false);
    }

}
}