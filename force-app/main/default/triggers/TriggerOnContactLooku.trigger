trigger TriggerOnContactLooku on Account (after insert) {
    
    TriggerOnContactLookupClass.insertContact(trigger.new);

}