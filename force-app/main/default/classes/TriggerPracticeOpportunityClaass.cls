public class TriggerPracticeOpportunityClaass {
        public static void insertRecord(list<Opportunity>opplist,map<id,Opportunity>oldmap){
            set<id>addset=new set<id>();
            for(Opportunity objopp:opplist){
      if((oldmap.get(objopp.id).StageName!='Closed Won' && objopp.StageName=='Closed Won') && objopp.AccountId!=null){
          addset.add(objopp.AccountId);     
                }
               
            }
            list<Contact>addlist=New list<Contact>();
            if(!addset.isEmpty()){
                for(Contact objcon:[select id,AccountId from Contact where AccountId IN : addset ]){
                   objcon.Do_not_Contact__c=true;
                    addlist.add(objcon);
                    
                    
                    
                }
                database.update(addlist,false);
            }
            
            
        }
    
    }