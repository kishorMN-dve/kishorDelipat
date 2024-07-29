import { LightningElement,api,track ,wire} from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { encodeDefaultFieldValues } from 'lightning/pageReferenceUtils';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
export default class LwcFourTaskNewStanderd extends NavigationMixin(LightningElement) {

    @api recordId;

    @track quoteName ;
    @track contactName;
   @api fieldName='Id';
    @wire(getRecord, { recordId: '$recordId', fields: ['Quote.Name','Quote.Account.email__c']})
    wiredRecord({ error, data }) {
        if (data) {
            this.quoteName = getFieldValue(data, 'Quote.Name');
           this.contactName = getFieldValue(data, 'Quote.Account.email__c');
            console.log('entert he data ::',JSON.stringify(this.quoteName ));
           console.log('entert he email ::',JSON.stringify( this.contactName ));
     // Extract email address from the record data
         //   this.toAddress = data.fields.Email.value;
        } else if (error) {
            console.error('Error fetching record data:', error);
            // Handle error if record data cannot be fetched
        }
    }
    @api invoke() {
        var pageRef = {
            type: "standard__quickAction",
            attributes: {
                apiName:"Global.SendEmail"
            },
            state: {
                recordId: this.recordId,
                defaultFieldValues:
                    encodeDefaultFieldValues({
                        HtmlBody: "Default values from Quick Action.",
                        Subject:"Hello from Salesforce Bolt",
                        ToAddress: this.contactName,
                        FromAddress: this.contactName
                    })
            }
        };
        this[NavigationMixin.Navigate](pageRef);
    }





}