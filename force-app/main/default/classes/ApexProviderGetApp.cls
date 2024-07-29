public with sharing class ApexProviderGetApp {
  @AuraEnabled(cacheable=true)
   public static list<Appointment_Slot__c> getRecord(){
    try {
        
        return   [select Appointment_Date__c,	Name,	End_Time__c,	isActive__c,	Start_Time__c  from Appointment_Slot__c where isActive__c=true];
     
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
   }
    
    @AuraEnabled
    public static string insertData(Appointment_Detail__c datainsert){
        System.debug('Entered record: ' + datainsert);
    
    // Query for existing appointments on the same date
    List<Appointment_Detail__c> acclist = [
        SELECT Name, Appointment_Date__c, Appointment_Time__c, Contact__c 
        FROM Appointment_Detail__c 
        WHERE Appointment_Date__c =: datainsert.Appointment_Date__c AND  Appointment_Time__c =: datainsert.Appointment_Time__c
    ];
    
    System.debug('Existing appointments on the same date: ' + acclist);
    
    for (Appointment_Detail__c objapp : acclist) {
        if (objapp.Contact__c != null && objapp.Contact__c == datainsert.Contact__c) {
           
            System.debug('Duplicate appointment found for the same contact on the same date');
            return null; 
        }
    }
    
   
    insert datainsert;
    return 'success';
   
        
      
        
        
    }
}