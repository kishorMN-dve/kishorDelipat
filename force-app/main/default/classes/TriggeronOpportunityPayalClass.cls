public class TriggeronOpportunityPayalClass {
    public static void datainsert(list<Opportunity>listOpp){
        if(!listOpp.isEmpty()){
            set<id>addSetAccId=new set<id>();
            for(Opportunity objopp:listOpp){
                if((objopp.AccountId!=null)){
                    addSetAccId.add(objopp.AccountId);
                    
                }
                map<id,string>putmap=new map<id,string>();
                map<id,Integer>wonMap=new map<id,Integer>();
                map<id,Integer>wonLost=new map<id,Integer>();
                if(!addSetAccId.isEmpty()){
                    for(Opportunity obj:[select id,Name,AccountId,StageName from Opportunity  where AccountId IN:addSetAccId]){
                        if(obj.StageName == 'Closed Won'){
                        	if(wonMap.containskey(obj.AccountId)){
                        	wonMap.put(obj.AccountId, wonMap.get(obj.AccountId) + 1);
                            
                        }
                        else{
                          wonMap.put(obj.AccountId,1);  
                            
                        }    
                        }
                        else {
                            if(obj.StageName == 'Closed Lost'){
                            	if(wonLost.containskey(obj.AccountId)){
                        	wonLost.put(obj.AccountId, wonLost.get(obj.AccountId) + 1);
                            
                        }
                        else{
                          wonLost.put(obj.AccountId,1);  
                            
                        }    
                            }
                            
                        }
                        
                } 
                
            } 
                
                for(Account objacc:[select id,Name from account where id IN :putmap.keyset() ]){
                    if(putmap.containskey(objacc.id)){
                       
                        
                    }
                }
            
        }
        } 
        
    }

}