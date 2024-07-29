trigger triggerOpportunitItem on OpportunityLineItem (before insert) {
    
    set<id>addsetopp=new set<id>();
    set<id>addsetpor=new set<id>();
    
    for(OpportunityLineItem objopp:trigger.new){
        addsetopp.add(objopp.OpportunityId);
        
         addsetpor.add(objopp.Product2Id);
        
        
    }
    

        map<id,Opportunity> addmap=new map<id,Opportunity>([select id,product_family__c from  Opportunity where id IN:addsetopp]);
        map<id,Product2> addpromap=new map<id,Product2>([select id,Family from Product2 where id IN:addsetpor]);
    
    
    for(OpportunityLineItem objpro:trigger.new){
        if((addmap.containskey(objpro.OpportunityId)) && (addpromap.containskey(objpro.Product2Id))){
            if(addmap.get(objpro.OpportunityId).product_family__c != addpromap.get(objpro.Product2Id).Family){
                objpro.adderror('Both the family is not matching......');
                
                
                
            }
         
            
            
        }
        
    
        
        
    }

}