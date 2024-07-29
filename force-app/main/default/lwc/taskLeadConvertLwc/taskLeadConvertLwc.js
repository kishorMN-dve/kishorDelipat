import { LightningElement, track } from 'lwc';
import classAllRecord from '@salesforce/apex/ClassLeadconvertProvider.allRecord'
import { NavigationMixin } from 'lightning/navigation';
export default class TaskLeadConvertLwc extends NavigationMixin(LightningElement) {
    @track selectedStage
    @track selectedrating
    @track productInterest;

    @track leadObject = { 'SobjectType': 'Lead' };
    // @track accountObject = { 'SobjectType': 'Account' };
    // @track contactRecord = { 'SobjectType': 'Contact' };
    productInterestOption = [
        { label: 'GC1000 series', value: 'GC1000 series' },
        { label: 'GC5000 series', value: 'GC5000 series' },
        { label: 'GC3000 series', value: 'GC3000 series' },
    ];
    ratingOption = [
        { label: 'Hot', value: 'Hot' },
        { label: 'Warm', value: 'Warm' },

    ];
    //    lead data
    hanglerLeadFirstName(event) {
        console.log('event.target.label;  :', event.target.label);
        const fieldName = event.target.label;
        if (fieldName == 'First Name') {
            this.leadObject.FirstName = event.target.value;
            console.log('Enter the Name 1 ::' + JSON.stringify(this.leadObject.FirstName))
        } else if (fieldName == 'last Name') {
            this.leadObject.LastName = event.target.value;
            console.log('Enter the Name 2 ::' + JSON.stringify(this.leadObject.LastName))

        }
        else if (fieldName == 'Email address') {
            this.leadObject.Email = event.target.value;
            console.log('Enter the Name 2 ::' + JSON.stringify(this.leadObject.Email))

        }
        else if (fieldName == 'Company') {
            this.leadObject.Company = event.target.value;
            console.log('Enter the Name 2 ::' + JSON.stringify(this.leadObject.Company))

        }
        else if (fieldName == 'Rating') {
            this.leadObject.Rating = event.target.value;
            this.selectedrating = event.target.value;
            console.log('Enter the Name 2 ::' + JSON.stringify(this.leadObject.Rating))

        }
        else if (fieldName == 'Employee Number') {
            this.leadObject.NumberOfEmployees = event.target.value;
            console.log('Enter the Name 2 ::' + JSON.stringify(this.leadObject.NumberOfEmployees))

        }
        else if (fieldName == 'Phone') {
            this.leadObject.Phone = event.target.value;
            console.log('Enter the Name 2 ::' + JSON.stringify(this.leadObject.Phone))

        }
        else if (fieldName == 'Mobile') {
            this.leadObject.MobilePhone = event.target.value;
            console.log('Enter the Name 2 ::' + JSON.stringify(this.leadObject.MobilePhone))

        }
        else if (fieldName == 'Product Interest') {
            this.leadObject.ProductInterest__c = event.target.value;
            this.productInterest = event.target.value;
            console.log('Enter the Name 2 ::' + JSON.stringify(this.leadObject.ProductInterest__c))

        }


    }
    handlestageChange(event) {

        this.selectedStage = event.detail.value;
        console.log(`Enter the value ${this.selectedStage}`)
    }



    //  account data


    // handleAccountChange(event) {
    //     console.log('event.target.label;  :', event.target.label);
    //     const fieldName = event.target.label;
    //     if (fieldName == 'Account Name') {
    //         this.accountObject.Name = event.target.value;
    //         console.log('Enter the Name 1 ::' + JSON.stringify(this.accountObject.Name))
    //     } else if (fieldName == 'Rating') {
    //         this.accountObject.Rating = event.target.value;
    //         console.log('Enter the Name 2 ::' + JSON.stringify(this.accountObject.Rating))

    //     }
    //     else if (fieldName == 'Phone') {
    //         this.accountObject.Phone = event.target.value;
    //         console.log('Enter the Name 2 ::' + JSON.stringify(this.accountObject.Phone))

    //     }
    //     else if (fieldName == 'Account Number') {
    //         this.accountObject.AccountNumber = event.target.value;
    //         console.log('Enter the Name 2 ::' + JSON.stringify(this.accountObject.AccountNumber))

    //     }

    // }
    // handleContactDetailChange(event){
    //     console.log('event.target.label;  :', event.target.label);
    //     const fieldName = event.target.label;
    //     if (fieldName == 'First Name') {
    //         this.contactRecord.FirstName = event.target.value;
    //         console.log('Enter the Name 1 ::' + JSON.stringify(this.contactRecord.FirstName))
    //     } else if (fieldName == 'Last Name') {
    //         this.contactRecord.Rating = event.target.value;
    //         console.log('Enter the Name 2 ::' + JSON.stringify(this.contactRecord.Rating))

    //     }
    //     else if (fieldName == 'Birthdate Date') {
    //         this.contactRecord.Birthdate = event.target.value;
    //         console.log('Enter the Name 2 ::' + JSON.stringify(this.contactRecord.Birthdate))

    //     }
    //     else if (fieldName == 'Department') {
    //         this.contactRecord.Department = event.target.value;
    //         console.log('Enter the Name 2 ::' + JSON.stringify(this.contactRecord.Department))

    //     }

    // }


    // handleOpportunityChange(event){
    //     this.productInterest = event.detail.value;
    //     console.log('event.target.label;  :', event.target.label);
    //     const fieldName = event.target.label;

    // }
    handleSaveClick() {
        classAllRecord({ leadRecord: this.leadObject })
            .then(result => {
                console.log('enter  result  ::', result);
                this[NavigationMixin.Navigate]({
                    type: 'standard__recordPage',
                    attributes: {
                        recordId: result,
                        objectApiName: 'Account',
                        actionName: 'view'
                    }
                });


            })

            .catch(error => {


            })




    }

}