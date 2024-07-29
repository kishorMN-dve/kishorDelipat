import { LightningElement ,api} from 'lwc';
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { getRecord, getFieldValue } from "lightning/uiRecordApi";
import dataTableRowSlect from '@salesforce/apex/BookProvider.dataTableRowSlect'
import dataFeach from '@salesforce/apex/BookProvider.dataFeach';
import REVENUE_FIELD from "@salesforce/schema/Account.AnnualRevenue";
import CREATED_FIELD from "@salesforce/schema/Account.CreatedDate";
import EXP_FIELD from "@salesforce/schema/Account.SLAExpirationDate__c";

// import PAYMENT_OBJECT from "@salesforce/schema/Payment__c";
// import BOOKLR from "@salesforce/schema/Payment__c.Book__c";
// import BUYER_LOOKUP from "@salesforce/schema/Payment__c.Buyer_Info__c";
// import dataTableRowSlect from '@salesforce/apex/BookProvider.dataTableRowSlect';



const COLUMNS = [
    { label: 'Name', fieldName: 'Name', editable: true },
    { label: ' Price', fieldName: 'Price__c', editable: true },
    { label: 'Booke Type', fieldName: 'Book_Type__c', editable: true }
  ];

export default class LwcPaymentFlowTaskOne extends LightningElement {
  @api recordId;
 
  
    name;
    // selectedRecordsList
    // selectedRecordCount;
buyerObject={'sObjectType':'Buyer_Info__c'};
bookObject={'sObjectType':'Book__c'};
paymentObject={'sObjectType':'Payment__c'};
// paymnetObject = PAYMENT_OBJECT;
//   myFields = [ BUYER_LOOKUP];
  checkPatmnetcheckboc=false;
// aa;
  //  @track rows;
columns=COLUMNS;
areDetailsVisible=false;
bookData;
shoWbuyerDate=true;
selectedRows;
dataShowCheckBox=false;

saveHandlerButton(){

this.buyerObject.Name=this.template.querySelector('lightning-input[data-formfield="bccName"]').value;
console.log('Enter the value  '+this.buyerObject.Name);
console.log('enter the Record id'+this.recordId);
dataFeach({dataType:this.buyerObject,})
 
            .then(result=>{
                    console.log('Enter the data apex to JS Save button'+JSON.stringify(result));
                       this.bookData=result;
                    // || result.length !=null || result.length=='undefined'
                          console.log('Lenght data '+JSON.stringify(result.length))
                    if(result.length !=null ) {
                        this.dataShowCheckBox=true;
                        this.areDetailsVisible = true;
                        this.shoWbuyerDate=false;
                        this.showNotification();
                    }
                    else{
                        this.areDetailsVisible = false;
                        this.dataShowCheckBox=true;
                        this.shoWbuyerDate=false;
                         this.showToasts();
                    }


            })
            .catch(error=>{

                  console.error('data error from apex');

                
        })





}

    get accTypeOptions() {
        return [
            { label: 'Drama', value: 'Drama' },
            { label: 'Mediation', value: 'Mediation'},
            { label: 'Business', value: 'Business' }            
        ];
    }



    handleChangeOption(event) {
        this.buyerObject.Interest__c  = event.detail.value;
        console.log('Enter the data   ' + this.buyerObject.Interest__c);

    //     dataFeach({dataType:this.buyerObject})
 
    //         .then(result=>{
    //         console.log('Enter the data apex to JS'+JSON.stringify(result));
    //         this.bookData=result;
    //         // || result.length !=null || result.length=='undefined'
    //         console.log('Lenght data '+JSON.stringify(result.length))
    // if(result.length > 0 ) {
    //     this.areDetailsVisible = true;
    // }
    // else{
    //     this.areDetailsVisible = false;
    // }


    //         })
    //         .catch(error=>{

    //         console.error('data error from apex');

                
    //     })
 
    }


    selectedRecordsHandler(event){
        // this.bookObjectbookObject  = event.detail.selectedRows;
        // console.log("Selected Rows = "+JSON.stringify(this.bookObjectbookObject));
        this.dataShowCheckBox=false;
        this.checkPatmnetcheckboc=true;
        var table = this.template.querySelector('lightning-datatable');
        var rows =event.detail.selectedRows;
         this.name =rows.map(item=>{
                    return{
                    ...item

                    }


                    })
        console.log('Enter data DATA TABLE Name##  '+JSON.stringify(this.name))


        
      
        // this.selectedRecordCount = event.detail.rows.length;
        // console.log('Enter Book Name ====='+this.selectedRecordCount);
//         let recordsSets = new Set();
  
//         // getting selected record id
//         for (let index = 0; index < rows.length; index++) {
//             recordsSets.add(rows[index].Id);
//         }
  
//         // coverting to array
//         this.selectedRecordsList = Array.from(recordsSets);
// console.log('Enter the data '+JSON.stringify(this.selectedRecordsList))

        
    //   rows.forEach(function(element){
    //         console.log('Enter Book Name on ##3333  '+JSON.stringify(element.Name));

    //         this.bookObject.Name=element.Name;
    //     //    this.name =element.Name;
    //         // console.log("Name is"+JSON.stringify(this.name));
    //         // this.abc = element[0].Name;
    //         console.log('Enter Book Name ====='+this.bookObject.Name);
    //     });
       
      
       
        // dataTableRowSlect({dataRow:this.bookObject.id})

// .then(result=>{

// console.log('Enter the data '+JSON.stringify(result))
// })
// .catch(error=>{

// console.error('Enter the Row Error');
// })
        

  
}



showNotification() {
    const evt = new ShowToastEvent({
      title: 'Record is Save',
      message: 'Record Succesfully Save',
      variant: 'success',
    });
    this.dispatchEvent(evt);
  }

  showNotificationPayment() {
    const evt = new ShowToastEvent({
      title: 'Record is Save',
      message: 'Succesfully Payment............',
      variant: 'success',
    });
    this.dispatchEvent(evt);
  }


  selectedAccount;

  handleAccountSelection(event){
      this.selectedAccount = event.target.value;
      alert("The selected Accout id is"+this.selectedAccount);
  }

  paymentBookButton(){
// this.paymentObject.Buyer_Info__c=this.template.querySelector('lightning-input[data-formfield="accBuy" ]').value;
// this.paymentObject.Book__c=this.template.querySelector('lightning-input[data-formfield="accBook"]').value;
// this.paymentObject.Price_of_Book__c=this.template.querySelector('lightning-input[data-formfield="accPrice"]').value;
this.paymentObject=this.template.querySelector('lightning-input').value;

console.log('Entert the data Book from Payment button  '+JSON.stringify(this.paymentObject));

    dataTableRowSlect({dataRow:this.paymentObject})

    .then(result=>{
    this.showNotificationPayment();
    console.log('Enter the data  Patemt rerun data server'+JSON.stringify(result))
    })
    .catch(error=>{
    
    console.error('Enter the Row Error');
    });

 }

 showToasts() {
  const event = new ShowToastEvent({
    title: "Notice",
    message: "Profile Not Match",
    variant: "warning",
    mode: "pester"
});
this.dispatchEvent(event);
}


}