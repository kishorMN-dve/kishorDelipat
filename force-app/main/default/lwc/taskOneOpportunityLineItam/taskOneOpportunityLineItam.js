import { LightningElement,api,track,wire} from 'lwc';
import getOpportunityLineItems from '@salesforce/apex/OpportunityLineItemController.getOpportunityLineItems';
import { NavigationMixin } from 'lightning/navigation';
const columns = [
    { label: 'Opportunity Line Item Name', type: 'button', initialWidth: 300, typeAttributes: { name:'oliName',label: { fieldName: 'Name' }, variant: 'base' } ,editable:true},
    { label: 'Product Name', fieldName: 'ProductName', type: 'text' },
    { label: 'Quantity', fieldName: 'Quantity', type: 'number',editable: false},
    { label: 'Discount Value', fieldName: 'Discount_value__c', type: 'text',editable: true},
    { label: 'Discount', fieldName: 'Discont__c', type: 'text',editable: true},
    { label: 'Unit Price', fieldName: 'UnitPrice', type: 'currency',editable: false},
    { label: 'Total Price', fieldName: 'TotalPrice', type: 'currency',editable: false},
    { label: 'Actions', type:'action',typeAttributes: {rowActions: [
        { label: 'Edit', name: 'editRecord' },
        { label: 'Delete', name: 'deleteRecord' }],
        menuAlignment: 'auto' 
        },
    }
];
export default class TaskOneOpportunityLineItam extends NavigationMixin (LightningElement) {
    @track draftValues = [];
    recordForm=true;
columns=columns;
    @api recordId;
    @track opportunityLineItems=[];
    @wire(getOpportunityLineItems,{opportunityId:'$recordId'})
    wiredOpportunityLineItems({ error, data }) {
        if (data) {
            this.opportunityLineItems = data.map(item => ({
                ...item,
                Name: item.Name,
                ProductName: item.Product2.Name // Accessing Product name from Product2
            }));
            console.log('sdsdsds'+JSON.stringify(this.opportunityLineItems));
        } else if (error) {
            console.error('Error fetching Opportunity Line Items:', error);
        }
    }

    handleRowAction(event) {
        const recordId = event.detail.row.Id;
        const row = event.detail.row;
        const action = event.detail.action;
        console.log('action:::',action.name)
        switch (action.name) {
            case 'editRecord':
                // for naviagtion
                this.naviagateMethod(recordId,'edit')

                break;
            case 'oliName':
                // for record detail page navigation
                this.naviagateMethod(recordId,'view')
                break;
            default:
                break;
        }
        console.log('dhfsfhjshjgf :;'+JSON.stringify(event.detail.row));
        
    }

    naviagateMethod(recId , actionName){
        console.log('recId:::',recId)
        console.log('actionName:::',actionName)

        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: recId,
                objectApiName: 'OpportunityLineItem', // API name of the object
                actionName: actionName
            }
        });
    }

    connectedCallback() {
        console.log('after edit call')
    }

}