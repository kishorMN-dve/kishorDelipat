trigger TriggerContactonAccountRecordType on Contact (before insert,before update) {
   
    set<id>addsetacc=new set<id>();
    set<String>addset=new set<string>();
   
    for(Contact objnew:trigger.new){
        if(trigger.isInsert && trigger.isBefore){
            if(objnew.AccountId!=null){
                addsetacc.add(objnew.AccountId);
               
            }
        }
        if(trigger.isUpdate && trigger.isBefore){
            if((objnew.Contact_picklist__c!=trigger.oldMap.get(objnew.id).Contact_picklist__c ) || (objnew.AccountId != trigger.oldMap.get(objnew.id).AccountID)){
                if(objnew.AccountId!=null){
                    addsetacc.add(objnew.AccountId);
              
                } 
            }
        }
    }
    
  
    map<id,Account>putmap=new map<id,Account>();
    if(!addset.isEmpty()){
        for(Account objEX:[select id,Name,RecordType.Name ,RecordTypeId ,(select id from contacts) from Account  where   id IN:addsetacc]){
            System.debug('Accoutn objeX########'+objEX);
            putmap.put(objEX.id,objEX);
        }   
    } 
    
    for(Contact objEXs:trigger.new){
        if(putmap.Containskey(objEXs.AccountId)){
            if(trigger.isInsert && trigger.isBefore){
                list<Contact>objEXcon=putmap.get(objEXs.AccountId).Contacts;
                if(objEXcon.size()<3){
                    objExs.Contact_picklist__c=putmap.get(objEXs.AccountId).RecordType.Name;
                }
                else{
                
                    objEXs.AddError('Error insert  found');    
                }
            }   
            if(trigger.isUpdate && trigger.isBefore){
                list<Contact>objEXcon=putmap.get(objEXs.AccountId).Contacts;
                if(objEXcon.size()>3 || putmap.get(objEXs.AccountId).RecordType.Name!=objEXs.Contact_picklist__c){
                     objEXs.AddError('Error  update found');  
                }   
            }    
        }   
    }
    
}