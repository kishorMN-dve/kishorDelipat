import { LightningElement } from 'lwc';
import getAccounts from '@salesforce/apex/LazyLoadingController.getAccounts';

const columns = [
    { label: 'Id', fieldName: 'Id', type: 'text' },
    { label: 'Name', fieldName: 'Name', type: 'text'},
    { label: 'Rating', fieldName: 'Rating', type: 'text'}
  
];

export default class LwcLazyLoading extends LightningElement {
    accounts=[];
    error;
    columns = columns;
    rowLimit =10;
    rowOffSet=0;



    connectedCallback() {
        this.loadData();
    }
    loadData(){
        return  getAccounts({ limitSize: this.rowLimit , offset : this.rowOffSet })
        .then(result => {
            let updatedRecords = [...this.accounts, ...result];
            this.accounts = updatedRecords;
            console.log('enter the record  ::' +JSON.stringify(this.accounts));
            this.error = undefined;
        })
        .catch(error => {
            this.error = error;
            this.accounts = undefined;
        });
    }
    loadMoreData(event) {
        // this.loadData();
        
        const currentRecord = this.accounts;
        const { target } = event;
        target.isLoading = true;

        this.rowOffSet = this.rowOffSet + this.rowLimit;
        this.loadData()
            .then(()=> {
                target.isLoading = false;
            });   
    }
}