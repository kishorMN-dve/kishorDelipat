public class triggerNakulClass {
    public static void contactdata(list<Contact>acclist , map<id,contact> oldMap , string operation){
        try{
            system.debug('operation ::' + operation);
            map<id,Contact>putmap=new map<id,Contact>();
            
            for(Contact objcon:acclist){
                if(objcon.AccountID!=null && operation.equals('AFTER_INSERT') ){
                    putmap.put(objcon.AccountId,objcon);   
                }
               else if(!acclist.isEmpty() && operation.equals('AFTER_DELETE') ){
                    system.debug('if delete');
                    contact oldRec = oldMap.get(objcon.id);
                    putmap.put(objcon.AccountId,oldRec);	                    
                }     
            }
            list<Account>addlist=new list<Account>();
            if(!putmap.isEmpty()){
                for(Account objAcc:[select id,Name,Description from Account where id IN:putmap.keyset()]){
                    
                    if(operation.equals('AFTER_INSERT')){
                        system.debug('inside after insert cond');
                        if(string.isBlank(objAcc.Description)){
                            objAcc.Description=putmap.get(objAcc.id).LastName;
                        }
                        else{
                            objAcc.Description=objAcc.Description+','+putmap.get(objAcc.id).LastName;
                        }
                        addlist.add(objAcc);   
                    }else if(operation.equals('AFTER_DELETE')){
                        system.debug('inside after delete cond');
                        if(objAcc.Description.contains(putmap.get(objAcc.Id).lastName) 	&& objAcc.Description != null	){
                            if(objAcc.Description.contains(putmap.get(objAcc.Id).lastName + ',')){
                          system.debug('objAcc.Description.contains(putmap.get(objAcc.Id).lastName)'+objAcc.Description.contains(putmap.get(objAcc.Id).lastName));
                            objAcc.Description = objAcc.Description.remove(putmap.get(objAcc.Id).lastName + ',');
                            addlist.add(objAcc);
                            system.debug('objAcc.Description ::' +  objAcc.Description);
                            system.debug('putmap in delete ::' +  putmap);
                            }
                            string abc= ','+putmap.get(objAcc.Id).lastName;
                            if(objAcc.Description.contains(abc) ){
 system.debug('objAcc.Description.contains(putmap.get(objAcc.Id).lastName)'+objAcc.Description.contains(putmap.get(objAcc.Id).lastName));
                            objAcc.Description =  objAcc.Description.remove(abc);
                            addlist.add(objAcc);
                            system.debug('objAcc.Description ::' +  objAcc.Description);
                            system.debug('putmap in delete ::' +  putmap);                                
                                
                            }
                            
                        }
                    } 
                }
                database.update(addlist,false); 
            }else if(!putmap.isEmpty() && operation.equals('AFTER_DELETE')){
                
            }
        }
        catch(Exception e) {
            System.debug('Error: '+e.getMessage());
        }
        
    }
    
}