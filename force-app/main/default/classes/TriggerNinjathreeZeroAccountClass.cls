public class TriggerNinjathreeZeroAccountClass {
    public static void updateAccount(list<Account>acclist,map<id,Account>accoldmap){
        if(!acclist.isEmpty()){
            set<id>addset=new set<id>();
            for(Account accobj:acclist){
                if(accoldmap.get(accobj.id).Account_status__c==true && accobj.Account_status__c==false){
                   
                addset.add(accobj.id);
                    
                }  
                list<Contact>addlist=new list<Contact>();
                for(Contact objcon:[select id,AccountId,LastName,Do_not_Contact__c from Contact where Do_not_Contact__c=false and AccountId IN:addset  ]){
                    objcon.Do_not_Contact__c=true;
                    addlist.add(objcon);
                    
                }
                list<Opportunity>addlistopp=new list<Opportunity>();
                for(Opportunity onjopp:[select id,AccountId,StageName from Opportunity where StageName='Closed Won' And AccountId IN:addset]){
                    
                    addlistopp.add(onjopp);
                    
                }
                try{
                    if(!addlist.isEmpty()){
                        database.update(addlist,false);
                        
                        
                    }
                    if(!addlistopp.isEmpty()){
                        database.delete(addlistopp,false);
                        
                    }
                    
                }
                catch(exception e){
                    system.debug('Error get Update contact and Delete Opportunity'+e.getMessage());
                    
                }
            }
           
        }
        
        
    }

}