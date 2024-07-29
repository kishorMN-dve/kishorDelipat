public class TriggerNewCasetoAccNinjaThreeOneClass {
    public static void insertData(list<Case>listcase){
        if(!listcase.isEmpty()){
            set<id>addset=new set<id>();
            for(Case objcase:listcase){
                if(objcase.AccountId!=null){
                  addset.add(objcase.AccountId);  
                }
                
                
            }
              map<id,Account>putaccmap=new map<id,Account>();
            if(!addset.isEmpty()){
              
                for(Account objacc:[select id,Name,case_status__c,(select id from Cases) from Account where id IN:addset]){
                    putaccmap.put(objacc.id,objacc);
                    list<case>acclis=objacc.Cases;
                    system.debug('Count all case one '+acclis.Size());
                    
                }
            }
                if(!putaccmap.isempty()){
                    for(case objcc:listcase){
                        if(putaccmap.Containskey(objcc.AccountId)){
                            list<case>acclist=putaccmap.get(objcc.AccountId).Cases;
                             system.debug('Count all case TWO '+acclist.Size());
                            if(acclist.Size()>5){
                                putaccmap.get(objcc.AccountId).case_status__c='Hot';
                                
                                
                            }
                            else{
                                if(acclist.Size()>2){
                                     putaccmap.get(objcc.AccountId).case_status__c='Warm';
                                    
                                }
                                else{
                                    
                                           putaccmap.get(objcc.AccountId).case_status__c='Cold';
                                        
                                    
                                    
                                }
                                
                            }
                            
                        }
                        
                        
                    }
                    database.update(putaccmap.values(),false);
                    
                }
                
         
        }
            
            
        }
        
        
    }