public class AkTaskTriggerClass {
    
 public static void insertData(List<Account> accList) {
        try {
            map<id,integer>putMapAcc=new map<id,integer>();
            for(Account objacc:accList){
                if(objacc.NumberOfEmployees!=null){
                    putMapAcc.put(objacc.id,objacc.NumberOfEmployees);
                }
            }
            list<Contact>addlist=new list<Contact>();
            if(!putMapAcc.isEmpty()){
                for(id accid:putMapAcc.keyset()){
                    system.debug('Enter the account map ::'+accid);
                   system.debug('Enter the account map full data ::'+putMapAcc.get(accid));
                    for(integer i=0;i<putMapAcc.get(accid);i++){
                        Contact objcon=new Contact();
                        objcon.AccountId=accid;
                        objcon.LastName='Contac'+i;
                        addlist.add(objcon);
                    }

                    
                    
                    
                }
                if(!addlist.isEmpty()){
                    database.insert(addlist,false);
                    
                }
               
                
                
                
            }
            
            
            
            
           
        } catch (Exception e) {
            
             System.debug('Error: ' + e.getMessage());
        }
    }

}