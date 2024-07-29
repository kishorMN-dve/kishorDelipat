public class TriggerPracticeOnlyClass {
    public static void insertRecord(list<Opportunity>acclist,map<id,Opportunity>oldmap,string Opration){
        set<id>addset=new set<id>();
        for(Opportunity objopp:acclist){
            if(Opration=='AFTER_INSERT' || Opration=='AFTER_UNDELETE'){
             if(objopp.AccountId!=null){
                 system.debug('enter the Insert REcord');
             addset.add(objopp.AccountId);
               // objopp.Amount
            }   
            }
            if(Opration=='AFTER_UPDATE'){
                if(objopp.Opp_Amount__c!=oldmap.get(objopp.id).Opp_Amount__c && objopp.AccountId!=null){
                    system.debug('enter the update REcord');
                     addset.add(objopp.AccountId);
                }
            }  
        map<id,Account>putmap=new map<id,Account>();
        if(!addset.isempty()){
            for(Opportunity objoppex:[select id,Name,AccountId,Opp_Amount__c from Opportunity where AccountId IN:addset order by Opp_Amount__c desc limit 1]){
                if(objoppex.Opp_Amount__c!=null){
                    putmap.put(objoppex.AccountId,new Account(id=objoppex.AccountId,Total_Amount__c=objoppex.Opp_Amount__c));
                    
                }
    
            }
             system.debug('enter the pumap REcord'+putmap.values());
            database.update(putmap.values(),false);
        }
    }    

    }
}