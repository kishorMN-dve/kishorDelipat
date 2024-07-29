trigger triggercountOpppLineIteam on OpportunityLineItem (after insert,before update) {
    
    if(trigger.isInsert && trigger.isAfter){
        triggercountOpppLineIteamClass.insertData(trigger.new);
    }

}