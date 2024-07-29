import { LightningElement, wire, api, track } from 'lwc';
import getOliData from '@salesforce/apex/getOppOLIData.getOliData'
import OLI_OBJ from '@salesforce/schema/OpportunityLineItem'
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import DIS_TYPE_FIELD from '@salesforce/schema/OpportunityLineItem.Discont__c'
import getOppItemPickList from '@salesforce/apex/getOppItemPickListValues.getOppItemPickList';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import updateOLI from '@salesforce/apex/updateOLIDataTaskOne.updateOLI'
import { NavigationMixin } from 'lightning/navigation';
import { deleteRecord } from 'lightning/uiRecordApi';
import { CloseActionScreenEvent } from "lightning/actions";

export default class TaskOneModelPopUpOLI extends NavigationMixin(LightningElement) {


    @api recordId
    @track isShowModal = false;
    @track oliData;

    connectedCallback() {
        this.retrievePicklistValues()
        setTimeout(() => {
            this.isShowModal = true
        }, 500)
        console.log('rec id connected', this.recordId);
    }

    hideModalBox() {
        this.isShowModal = false;
        console.log('rec id oppo cancel', this.recordId);
    }

    srNo = 0
    @track oliDataNewChangedValue
    @wire(getOliData, { recordId: '$recordId' })
    oliWireData({ data, error }) {
        if (data) {
            this.oliDataNewChangedValue = [...data]
            console.log('this.oliDataNewChangedValue ::', JSON.stringify(this.oliDataNewChangedValue))
            this.oliData = data.map(item => {
                this.srNo++
                return {
                    ...item,
                    srNo: this.srNo
                }
            })
//  console.log('oliData     ;:', this.oliData);
           
        } else if (error) {
            console.log(error);
        }
    }

    @wire(getObjectInfo, { objectApiName: OLI_OBJ })
    wireOppLineItemInfo;

    disTypeOptions

    retrievePicklistValues() {
        getOppItemPickList({ fieldApiName: 'Discont__c' })
            .then(result => {
                this.disTypeOptions = result;
                console.log('Enter the  record ::  ',this.disTypeOptions);
            })
            .catch(error => {
                console.error('Error retrieving picklist values:', error);
            });
    }

    // oli dont have record type below approch is not working

    // @wire(getPicklistValues, { fieldApiName: DIS_TYPE_FIELD })
    // typePickVals({ data, error }) {
    //     if (data) {
    //         console.log('Discount Picklist values :', data.values); 
    //         this.disTypeOptions = data.values.map(item => ({ label: item.label, value: item.value }));
    //     } else if (error) {
    //         console.error('Error fetching picklist values:', error);
    //     }
    // }

    // for discount type chnage
    disType
    handleDistypeChange(event) {
        this.disType = event.detail.value
        const disTyperecordId = event.currentTarget.dataset.id

        this.oliDataNewChangedValue = this.oliDataNewChangedValue.map(item => {
            if (item.Id === disTyperecordId) {
                return { ...item, Discont__c: this.disType }
            }
            return item;
        })

        console.log('updsated oliData if dis changed :::', JSON.stringify(this.oliDataNewChangedValue))

        console.log('discount change id', disTyperecordId)
        console.log('changed dis type ', this.disType)
    }

    // for dis val changed
    discountValueChangeHandler(event) {
        if (event.target.name === 'discountChanged') {
            const disrecordId = event.currentTarget.dataset.id
            this.oliDataNewChangedValue = this.oliDataNewChangedValue.map(item => {
                if (item.Id === disrecordId) {
                    return { ...item, Discount_value__c: event.target.value }
                }
                return item;
            })

            console.log('updsated oliData if dis changed :::', JSON.stringify(this.oliDataNewChangedValue))
        } else if (event.target.name === 'qunatityChnaged') {
            const quantityChangedrecordId = event.currentTarget.dataset.id
            this.oliDataNewChangedValue = this.oliDataNewChangedValue.map(item => {
                if (item.Id === quantityChangedrecordId) {
                    return { ...item, Quantity: event.target.value }
                }
                return item;
            })
            console.log('quantity val change', this.oliDataNewChangedValue)
        }
    }

    handleSaveClick(event) {

        console.log('rec id oppo save', this.recordId);
        updateOLI({ updatedOLIData: this.oliDataNewChangedValue })
            .then(res => {
                this.toastSuccess(`Successfully Updated`, 'success', 'Record Successfully Updated !!!')
            })
            .catch(err => {
                console.log('error updating record in handleSaveClick ')
            })
        // let url = `https://pletra7-dev-ed.develop.lightning.force.com/lightning/r/Opportunity/${this.recordId}/view`
        this.isShowModal = false;
        // this.dispatchEvent(new CloseActionScreenEvent());
        window.location.reload()

    }
    toastSuccess(tittle, variant, message) {
        this.dispatchEvent(new ShowToastEvent({
            title: tittle,
            variant: variant,
            message: message
        }))
    }
    @track saveDeletrecord = [];

    // Method to handle delete click
    handleDeleteClick(event) {
        const clickedRecordId = event.currentTarget.dataset.id;
        console.log('Selected delete row:', clickedRecordId);
        
        // Perform the delete operation for the clicked record
        deleteRecord(clickedRecordId)
            .then(() => {
                this.oliData = this.oliData.filter(record => record.Id !== clickedRecordId);
                // Remove the deleted record from the UI
               
                
                // Show success message (optional)
                this.toastSuccess('Remove', 'Record deleted successfully', 'remove');
            })
            .catch(error => {
                // Show error message
                this.toastSuccess('Error', 'Error deleting record', 'error');
                console.error('Error deleting record:', error);
            });
    }
    

}