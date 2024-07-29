trigger TriggerNewCasetoAccNinjaThreeOne on Case (After insert) {
    if(trigger.isInsert && trigger.isAfter){
   TriggerNewCasetoAccNinjaThreeOneClass.insertData(trigger.new);     
    }

}