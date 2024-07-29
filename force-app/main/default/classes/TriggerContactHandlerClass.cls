public class TriggerContactHandlerClass {
    
    public static void insertContact(list<Contact>conlist,map<id,Contact>putmapc){
        set<id>addsetAccid=new set<id>();
        for(Contact objcon:conlist){
            if(trigger.isInsert && trigger.isBefore){
                 addsetAccid.add(objcon.AccountId);
             }
           if(trigger.isUpdate && trigger.isBefore){
                if(objcon.Contact_picklist__c != putmapc.get(objcon.id).Contact_picklist__c || objcon.AccountId!= putmapc.get(objcon.id).AccountId){
                    
                     addsetAccid.add(objcon.AccountId);
                }
                
            }
           
        }
        map<id,Account>putmap=new map<id,Account>();
        for(Account objAcc:[select id,Name,RecordType.Name,(select id from Contacts) from Account where id IN:addsetAccid]){
            
            putmap.put(objAcc.id,objAcc);
            
        }
        
        for(Contact objconEx:conlist){
            if(putmap.containskey(objconEx.AccountId)){
                if(trigger.isInsert && trigger.isBefore){
                list<Contact>objconll=putmap.get(objconEx.AccountId).Contacts;
                    if(objconll.size()<4  ){
                objconEX.Contact_picklist__c=putmap.get(objconEx.AccountId).RecordType.Name;
                   
                
                }
                    else{
                        objconEx.addError('More than 3 record found on insert');
                        
                    }
                    
                }
                    
                    
                if(trigger.isBefore && trigger.isUpdate){
                          list<Contact>objconl=putmap.get(objconEx.AccountId).Contacts;
                    if(putmap.get(objconEx.AccountId).RecordType.Name!= objconEx.Contact_picklist__c ||objconl.size()>4 ){
                        
                         objconEx.addError('More than 3 record found and not Match Pikclist and RecordType');
                        
                    }
                    
                    
                }
                }
                
                
            }
            
            
        }
        
    }