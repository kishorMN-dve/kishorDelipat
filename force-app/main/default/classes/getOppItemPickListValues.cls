public with sharing class getOppItemPickListValues {
    
    public class SelectOptionWrapper {
        @AuraEnabled
        public String label { get; set; }
        @AuraEnabled
        public String value { get; set; }

        public SelectOptionWrapper(String label, String value) {
            this.label = label;
            this.value = value;
        }
    }
    
    @AuraEnabled(cacheable=true)
    public static List<SelectOptionWrapper> getOppItemPickList(String fieldApiName){
        List<SelectOptionWrapper> pickListValuesList= new List<SelectOptionWrapper>();
        if(String.isNotBlank(fieldApiName)){
            Map<String, Schema.SObjectField> fieldsMap= OpportunityLineItem.getSobjectType().getDescribe().fields.getMap();
            List<Schema.PicklistEntry> ple = fieldsMap.get(fieldApiName).getDescribe().getPicklistValues();
            for(Schema.PicklistEntry pickListVal : ple){
                pickListValuesList.add(new SelectOptionWrapper(pickListVal.getValue(),pickListVal.getLabel()));
            }
        }
        return pickListValuesList;
    }


    @AuraEnabled(cacheable=true)
    public static List<SelectOptionWrapper> getProductDisPickList(String fieldApiName){
        List<SelectOptionWrapper> pickListValuesList= new List<SelectOptionWrapper>();
        if(String.isNotBlank(fieldApiName)){
            Map<String, Schema.SObjectField> fieldsMap= product2.getSobjectType().getDescribe().fields.getMap();
            List<Schema.PicklistEntry> ple = fieldsMap.get(fieldApiName).getDescribe().getPicklistValues();
            for(Schema.PicklistEntry pickListVal : ple){
                pickListValuesList.add(new SelectOptionWrapper(pickListVal.getValue(),pickListVal.getLabel()));
            }
        }
        return pickListValuesList;
    }
}