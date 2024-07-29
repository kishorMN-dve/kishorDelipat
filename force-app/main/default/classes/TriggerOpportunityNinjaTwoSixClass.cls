public class TriggerOpportunityNinjaTwoSixClass {
    public static void insertOppdata(list<Opportunity>accopp){
        
           map<id,Opportunity>putmap=new map<id,Opportunity>();
            for(Opportunity objopp:accopp){
                if((objopp.StageName=='Closed Won' || objopp.StageName=='Closed Lost') && objopp.AccountId!=null){
                    putmap.put(objopp.AccountId,objopp);
                    system.debug('Enter the Account Id ==  '+objopp);
                    
                }
                
                
            }
            map<id,Account>putmapacc=new map<id,Account>();
            for(Account objacc:[select id,Account_Opp_Status__c from Account where id IN:putmap.Keyset()]){
                 // system.debug('Enter the Account Data ==  '+objacc);
                putmapacc.put(objacc.id,objacc);
            }
        {
            for(Opportunity objoopp:accopp){
                if(putmapacc.containskey(objoopp.AccountId)){
                    if(trigger.isInsert && trigger.isAfter){
                    // system.debug('Enter the Account Data one ==  '+objoopp);
                    if(objoopp.StageName=='Closed Won'){
                  
                       putmapacc.get(objoopp.AccountId).Account_Opp_Status__c='Open'; 
                       system.debug('Enter the putmap status  three trigger.isInsert && trigger.isAfter ==  '+ putmapacc.get(objoopp.AccountId).Account_Opp_Status__c);  
                    }
                    if(objoopp.StageName=='Closed Lost'){
                       
                        putmapacc.get(objoopp.AccountId).Account_Opp_Status__c='Close'; 
                         system.debug('Enter the putmap status  three==  '+putmapacc.get(objoopp.AccountId).Account_Opp_Status__c);
                    }
                    }
                    if(trigger.isDelete && trigger.isAfter){
                         putmapacc.get(objoopp.AccountId).Account_Opp_Status__c='Close';
                        system.debug('Enter the putmap status  four trigger.isDelete && trigger.isAfter ==  '+ putmapacc.get(objoopp.AccountId).Account_Opp_Status__c);
                    }
                }
             
                
            }
            }
           database.update(putmapacc.values(),false);
        
        
    }

}