public class triggerNameonContactPhoneClass {
    
    public static void updatecontact(list<Contact>conlist,map<id,Contact>oldmap){
        
  map<id,string>putmap=new map<id,string>();
for(Contact objcon:conlist){
if(string.isNotBlank(objcon.Phone) && objcon.AccountID!=null){
if(objcon.Phone!=oldmap.get(objcon.id).Phone){
putmap.put(objcon.AccountID,objcon.Phone);
    system.debug('putmap.get(objAcc.id);');
}
}
}
   list<Account>addlist=new list<Account>();
if(!putmap.isEmpty()){
for(Account objAcc:[select id,Name,Phone from Account where id IN: putmap.keyset()]){

    system.debug('putmap.get(objAcc.id);'+putmap.get(objAcc.id));
   objAcc.Phone=putmap.get(objAcc.id);
addlist.add(objAcc);
}
    system.debug('Enter the data :;'+addlist);
database.update(addlist,false);
}


        
        
    }    

}