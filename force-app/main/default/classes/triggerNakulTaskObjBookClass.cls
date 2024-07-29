public class triggerNakulTaskObjBookClass {
    public static void inserDataBook(list<Book__c>listBook){
        set<id>addSetIdCon=new set<id>();
        for(Book__c objbook:listBook){
            if(objbook.Contact__c!=null){
                addSetIdCon.add(objbook.Contact__c); 
            }
        }
        
        //    set<id>addsetnew=new set<id>([select id,AccountId from contact where id IN:addSetIdCon].AccountId);
        //     set<id>addsetnew=new set<id>();
        set<id>addsetnew=new set<id>();
        for(Contact objcon:[select id,AccountId from Contact where id IN:addSetIdCon]){
            addsetnew.add(objcon.AccountID);
        }
        map<id,Decimal>putmap=new map<id,decimal>();
        for(Contact objbook:[select id ,Name,AccountID,Book__r.Amount_data__c,(select id,Amount_data__c from Books__r) from Contact where AccountID IN:addsetnew]){   
            
            if(!putmap.Containskey(objbook.AccountID)){
                putmap.put(objbook.AccountID,objbook.Book__r.Amount_data__c);  
               // system.debug('Enter the amount  field  ='+objbook.Books__r.Amount_data__c);
            }
            else{
                if(putmap.get(objbook.AccountID)==objbook.Book__r.Amount_data__c){
                    putmap.put(objbook.AccountID,objbook.Book__r.Amount_data__c);
                }
                else{
                    putmap.put(objbook.AccountID,putmap.get(objbook.AccountID) +objbook.Book__r.Amount_data__c);
                }
            }   
        }
        list<Account>addlist=new list<Account>();
        for(Account objacc:[select id,Name,Count_of_Opportunity__c from Account where id IN:putmap.keySet()]){
            objacc.Count_of_Opportunity__c=putmap.get(objacc.id);    
            addlist.add(objacc);
        }
        
        if(!addlist.isempty()){
            
            database.update(addlist,false);
            
        }    
        
    }   
}