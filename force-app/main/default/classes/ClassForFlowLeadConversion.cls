public class ClassForFlowLeadConversion {
      @InvocableMethod

    public static void assignLeads(list<id> LeadIds){

        LeadStatus cLeadStatus=[Select Id,MasterLabel from LeadStatus where isConverted=true limit 1];
        system.debug('Enter the LeadStatus=='+cLeadStatus);

        List<Database.LeadConvert> massLeadConvert=new List<Database.LeadConvert>();

        for(Id currentLead:LeadIds){

            Database.LeadConvert LeadConvert=new Database.LeadConvert();
            LeadConvert.setLeadId(currentLead);
            LeadConvert.setConvertedStatus(cLeadStatus.MasterLabel);
            LeadConvert.setDoNotCreateOpportunity(true);
            massLeadConvert.add(LeadConvert);

        }

        if(!massLeadConvert.isEmpty()){

            List<Database.LeadConvertResult> lcr=Database.convertLead(massLeadConvert);

            system.debug('lcr:: '+lcr);

        }

    }

}