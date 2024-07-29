import { LightningElement, api, wire, track } from 'lwc';
import getRecordOpportunity from '@salesforce/apex/TaskTwoApexProvider.methodName';
import getOliData from '@salesforce/apex/getOppOLIData.getOliData'
import getOppItemPickList from '@salesforce/apex/getOppItemPickListValues.getOppItemPickList';
//import createquoteLine from '@salesforce/apex/TaskTwoPassDataCreatequooteProvider.gettingOppportunityData'
import recordPass from '@salesforce/apex/TaskTwoCreateQuotedata.getRecordopp'
import { deleteRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';
import { NavigationMixin } from 'lightning/navigation';



export default class TaskTwoLwcQuoteLine extends NavigationMixin(LightningElement) {
    @api recordId;
    selectedRegion = '';
    opportunityObject = { sObjectType: 'Opportunity' };
    @track opportunitydata;
    @track QuoteData

    //get opportunity data record 
    @wire(getRecordOpportunity, { recordId: '$recordId' })
    wiredRecordData({ error, data }) {
        if (data) {
            this.opportunitydata = data;
            this.QuoteData = [...data]
            console.log('Record from id: ' + JSON.stringify(data));
            // Handle the data
        } else if (error) {
            console.error('Error:', error);
            // Handle the error
        }
    }


    regionOptions = [
        { label: 'North', value: 'North' },
        { label: 'South', value: 'South' }
    ];

    handleRegionChange(event) {
        this.selectedRegion = event.detail.value;
    }



    // for oli data to get opportunity line iteam
    srNo = 0
    @track oliData;
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

            console.log('oliData:', this.oliData );
        } else if (error) {
            console.log(error);
        }
    }

    // for quote line item chnages 

    discountValueChangeHandler(event) {

        // let disValChagedCapture = event.target.value
        // let disVal = event.target.value
        if (event.target.name === 'discountValChanged') {
            const discountValChangedId = event.currentTarget.dataset.id
            this.oliDataNewChangedValue = this.oliDataNewChangedValue.map(item => {
                if (item.Id === discountValChangedId) {
                    return { ...item, Discount_value__c: event.target.value }
                }
                return item
            })
            console.log('new dist Val changed in OLI :::', JSON.stringify(this.oliDataNewChangedValue))

        } else if (event.target.name === 'qunatityChnaged') {
            const qunatityValChangedId = event.currentTarget.dataset.id
            this.oliDataNewChangedValue = this.oliDataNewChangedValue.map(item => {
                if (item.Id === qunatityValChangedId) {
                    return { ...item, Quantity: event.target.value }
                }
                return item
            })
            console.log('new dist Val changed in OLI :::', JSON.stringify(this.oliDataNewChangedValue))

        } else if (event.target.name === 'unloadingChnaged') {

            const unloadingChngedId = event.currentTarget.dataset.id
            this.oliDataNewChangedValue = this.oliDataNewChangedValue.map(item => {
                if (item.Id === unloadingChngedId) {
                    return { ...item, unloading__c: event.target.value }
                }
                return item
            })
            console.log('new dist Val changed in OLI :::', JSON.stringify(this.oliDataNewChangedValue))

            console.log('unloading val change', event.target.value)
        }

    }


    connectedCallback() {
        this.retrievePicklistValues()
    }

    disTypeOptions

    retrievePicklistValues() {
        getOppItemPickList({ fieldApiName: 'Discont__c' })
            .then(result => {
                this.disTypeOptions = result;
            })
            .catch(error => {
                console.error('Error retrieving picklist values:', error);
            });
    }

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

        // console.log('discount change id' , disTyperecordId)
        // console.log('changed dis type ' , this.disType)
    }

    // for quote data changed capture
    handleQuoteChange(event) {
        console.log('region', event.detail.value)
        if (event.target.name === 'region') {

            const regionId = event.currentTarget.dataset.id
            console.log('id', regionId, 'quoteId', this.QuoteData.Id)
            this.QuoteData = this.QuoteData.map(item => {
                if (regionId === item.Id) {
                    return { ...item, Region__c: event.detail.value }
                }
                return item;
            })

            console.log('quote region change :: ', JSON.stringify(this.QuoteData))

        }
        else if (event.target.name === 'quatity') {
            const regionId = event.currentTarget.dataset.id
            console.log('id', regionId, 'quoteId', this.QuoteData.Id)
            this.QuoteData = this.QuoteData.map(item => {
                if (regionId === item.Id) {
                    return { ...item, TotalOpportunityQuantity: event.target.value }
                }
                return item;
            })

        }
        else if (event.target.name === 'deliveryDate') {
            const regionId = event.currentTarget.dataset.id
            console.log('id', regionId, 'quoteId', this.QuoteData.Id)
            this.QuoteData = this.QuoteData.map(item => {
                if (regionId === item.Id) {
                    return { ...item, Delivery_Date__c: event.target.value }
                }
                return item;
            })

        }

    }


  //  handleDeleteClick(event) {
        //console.log('selected delete row ::', event.currentTarget.dataset.id)
        // deleteRecord(event.currentTarget.dataset.id)
        //     .then(() => {
                // Show success message
            //    this.toastSuccess('Success', 'Record deleted successfully', 'success');
                // Optionally, navigate to another page or refresh the current page
        //    })
           // .catch(error => {
                // Show error message
             //   this.toastSuccess('Error', 'Error deleting record', 'error');
            //    console.error('Error deleting record:', error);
        //    });


        // refresh the the wire after deletion
        // refreshApex(this.oliData)
  //  }

   @track insertedQuoteId
    handleSaveClick(event) {
        const accountId = this.template.querySelector('lightning-input').dataset.id;
        console.log('recrpdId oppo' , this.recordId)
        console.log('Account ID to be Opportunity line iteam:', JSON.stringify(this.oliDataNewChangedValue));
        console.log('Account ID to be Opportunity:', JSON.stringify(this.QuoteData));

        recordPass({ opportunitydata: this.QuoteData, opportunityLine: this.oliDataNewChangedValue })
            .then(result => {
                this.insertedQuoteId = result
                console.log('Inserted quote id is ::::', this.insertedQuoteId)
                this[NavigationMixin.Navigate]({
                    type: 'standard__recordPage',
                    attributes: {
                        recordId: result, // Replace with the actual Id of the quote record
                        objectApiName: 'Quote',
                        actionName: 'view'
                    }   
                });

            })
            .catch(error => {

            })
           
    }
    onchaneAccoutn(event) {
        const AccountID = event.target.dataset.id;
        console.log('Enter the AccountID  ::  ' + JSON.stringify(event.target.dataset.id));
        console.log('selected delete row ::', event.currentTarget.dataset.id)

    }
}