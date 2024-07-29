trigger TriggerOnOpportunitlineiteamAsset on OpportunityLineItem (after insert) {
    
    if(trigger.isInsert && trigger.isAfter){
        TriggerOnOpportunitlineiteamAssetClass.insertLinedata(trigger.new);
        
    }

}