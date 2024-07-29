public class HandlerClass {
    
    public static void insertBefore(list<OpportunityLineItem>accopp){
        set<id>addidOpp=new set<id>();
               set<id>addidPor=new set<id>();
        for(OpportunityLineItem objopp:accopp){
           addidOpp.add(objopp.OpportunityId);
            addidPor.add(objopp.Product2Id);   
        }
        
            map<id,Opportunity>mapOppp=new map<id,Opportunity>([select id,product_family__c from  Opportunity where id IN:addidOpp]);
            map<id,Product2>mapPro=new map<id,Product2>([select id,Family from Product2 where id IN:addidPor]);
            
        
        
        for(OpportunityLineItem objex:accopp){
            if(mapOppp.Containskey(objex.OpportunityId) && mapPro.Containskey(objex.Product2Id)){
                if(mapOppp.get(objex.OpportunityId).product_family__c != mapPro.get(objex.Product2Id).Family){
                    
                    objex.addError('Not match the group');
                    
                }   
            }
            
            
        }
        
        
    }

}