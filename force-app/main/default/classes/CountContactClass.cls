public class CountContactClass {
    
    public static void insertClass(list<Contact>acclist){
        set<id>addset=new set<id>();
        for(Contact obj:acclist){
            addset.add(obj.AccountId);
            
            
            
        }
        list<Account>addlists=new list<Account>();
        for(Account objex:[select id,Name,count__c,(select id  from Contacts) from Account where id IN:addset]){
            list<Contact>acclists=objex.Contacts;
            objex.count__c=acclists.Size();
            addlists.add(objex);
            
        }
        database.update(addlists,false);
    }
    
    

}