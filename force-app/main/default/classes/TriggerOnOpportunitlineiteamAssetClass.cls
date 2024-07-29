public class TriggerOnOpportunitlineiteamAssetClass {
    public static void insertLinedata(list<OpportunityLineItem>listOppLine){
        if(!listOppLine.isEmpty()){
            set<id>addsetOpp=new set<id>();
        for(OpportunityLineItem objoppes:listOppLine){
            if(objoppes.OpportunityId!=null){
           addsetOpp.add(objoppes.OpportunityId);
            } 
        }
            system.debug('addsetOpp ====> '+addsetOpp);
            set<id>addsetacc=new  set<id>();
            for(Opportunity objex:[select id,AccountId from Opportunity where id IN:addsetOpp]){
                addsetacc.add(objex.AccountId);
            }
            system.debug('addsetacc ====> '+addsetacc);
            map<id,Account>putmap=new map<id,Account>();
            if(!addsetacc.isEmpty()){
                for(Account objacc:[select id,Name from Account where id IN:addsetacc]){
                  putmap.put(objacc.id,objacc);
                    
                    
                }
                
            }
            system.debug('putmap ====> '+putmap.values());
            list<Asset>addlist=new list<Asset>();
            if(!putmap.isempty()){
                for(Opportunity objopp:[select id,Name,AccountID,Account.Name from Opportunity where AccountID IN:putmap.keySet()]){
                  system.debug('Enter opp data ===='+objopp);
                  
                    Asset objass=new Asset();
                    objass.Name='kk';
                    objass.AccountId=objopp.AccountId;
                   
                  
                    addlist.add(objass);
                    
                }
                
                
            }
            database.insert(addlist,false);
        }
        
        
    }
}