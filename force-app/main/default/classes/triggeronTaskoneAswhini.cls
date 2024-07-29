public class triggeronTaskoneAswhini {
    public static void createrecord(list<Installed_Product__c>acclist){
        try{
            list<Caseline__c>addlist=new list<Caseline__c>();
            for(Installed_Product__c objistal:acclist){
                
                if(objistal.Sales_item_number__c!=null && objistal.SalesOrder_number__c!=null ){
                    Caseline__c objccse=new Caseline__c();
                    objccse.Installed_Product__c=objistal.id;
                    objccse.Sales_item_number__c=objistal.Sales_item_number__c;
                    objccse.SalesOrder_number__c=objistal.SalesOrder_number__c;
                    addlist.add(objccse);
                    
                    
                }
                
    
            }    
            
            if(!addlist.isEmpty()){
                Database.insert(addlist,false);
                
                
            }  
            
  }
       catch (Exception e) {
    // Handle the exception
    System.debug('An exception occurred: ' + e.getMessage());
}
        
    }

}