import { LightningElement, api, wire } from 'lwc';
import { CloseActionScreenEvent } from 'lightning/actions';
import { NavigationMixin } from 'lightning/navigation';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import QUOTE_OBJECT from '@salesforce/schema/Quote';
import QUOTE_ID_FIELD from '@salesforce/schema/Quote.Id';

export default class TaskFiveLwcPdfVf extends NavigationMixin(LightningElement) {
    @api recordId;
    quoteRecord;

    @wire(getRecord, { recordId: '$recordId', fields: [QUOTE_ID_FIELD] })
    wiredRecord({ error, data }) {
        if (data) {
            this.quoteRecord = data;
            console.log('Enter the Wire Data  ::  ',JSON.stringify(this.quoteRecord));
            this.eventhandler();
        } else if (error) {
            console.error('Error loading record', error);
        }
    }

    closeQuickActionDialog() {
        console.log('Inside Close Method');
        this.dispatchEvent(new CloseActionScreenEvent());
    }

    // RECORD ID NOT PASS THEN I USE WIRE
    // connectedCallback() {
    //     console.log('Record ID:', this.recordId);
    // }

    eventhandler() {
        const quoteId = getFieldValue(this.quoteRecord, QUOTE_ID_FIELD);
        console.log('Error loading CALL ETHOD ::', quoteId);

        if (quoteId) {
            this[NavigationMixin.Navigate]({
                type: 'standard__webPage',
                attributes: {
                    url: `/apex/lwdVfPage?paramName=${quoteId}`
                }
            });
        }
    }
}