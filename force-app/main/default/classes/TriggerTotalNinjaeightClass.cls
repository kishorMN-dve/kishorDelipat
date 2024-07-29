public class TriggerTotalNinjaeightClass {
    
    public static void insertHandler(list<Contact>acclist){
        system.debug('insertHandler ======= insertHandler');
        if(!acclist.isEmpty()){
           // map<id,id>putmap=new map<id,id>();
            set<id>addset=new set<id>();
            for(Contact conobj:acclist){
                if(conobj.AccountId!=null){
                    addset.add(conobj.AccountId);
                 
                }
                
            }
            map<id,decimal>putmap=new map<id,decimal>();
            if(!addset.isEmpty()){
                for(Account objacc:[select id,Name,(select id from Contacts) from Account where id IN:addset]){
                   putmap.put(objacc.id,objacc.Contacts.Size());  
                    
                }
                    
                }
            if(!putmap.isEmpty()){
                for(Contact objcc:acclist){
                    if(putmap.Containskey(objcc.AccountId)){
                      
                        
                        if(putmap.get(objcc.AccountId)>2){
                            objcc.AddError('Duplicate rule');
                            
                        }
                    }
                    
                    
                }
                
            } 
            } 
            
        }
        
        
    }