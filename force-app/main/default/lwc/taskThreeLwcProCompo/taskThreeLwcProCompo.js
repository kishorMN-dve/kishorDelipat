import { LightningElement, wire, track, api } from 'lwc';
import getProductRecord from '@salesforce/apex/TaskThreeLwcProCompoClass.getProductRecord'
import { CloseActionScreenEvent } from "lightning/actions";
import getProducts from '@salesforce/apex/getProductDataTaskThree.getProducts'
import insertQuoteLineItem from '@salesforce/apex/getProductDataTaskThree.insertQuoteLineItem'
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getAlloppLine  from '@salesforce/apex/GetRecordAllOppLine.getRecordId'

import getProductDisPickList from '@salesforce/apex/getOppItemPickListValues.getProductDisPickList';
//import { refreshApex } from '@salesforce/apex';

export default class TaskThreeLwcProCompo extends LightningElement {
    //columns=COLUMNS;
    @api recordId
    @track value;
    showHtmlTabl = true;
    showdataTable = false;
    @track recordpdroduct;
    @track selectedRecords = [];

    categoryOptions = [
        { label: ' Electronics', value: 'Electronics' },
        { label: 'Home and Garden', value: 'Home and Garden' },
        { label: 'Health and Beauty', value: 'Health and Beauty' },
        { label: 'Books and Media', value: 'Books and Media' }
    ];
    //@wire(getProductRecord)
    // getRecordwire({data,error}){

    //     if(data){
    // this.recordpdroduct=data;
    // console.log('Enter the Record form apex',data);
    //     }

    //     else if(error){
    //         console.log('Enter the Record form apex',error);

    //     }


    //}
   @track oliData;

@wire(getAlloppLine,{oppid:'$recordId'})
wireMethid({data,error}){
if(data){
    this.oliData = data.map(item => {
       
        return {
            ...item
           
        }
    })
    console.log('  data ::',JSON.stringify() );

}

else if(error){

console.error('  Error ',error)

}




}

    // handle search input field 
    inputPrdName
    handleSearch(event) {
        // this.inputPrdName = event.target.value 
        // console.log('this.inputPrdName ::' , this.inputPrdName)

    }

    //serching name
    handleSearching(event) {
        this.inputPrdName = event.target.value
        this.getProductData(this.inputPrdName, null);
        console.log('Enter serch function', this.inputPrdName);

    }


    //  this is search button icon
    handleButtonClick(event) {
        this.picklistval = this.value;
        console.log('Enter value serchin button ',this.picklistval);
        if (this.picklistval) {
            console.log('enter the picklist record Record   IF', this.picklistval);
            this.getProductData(this.picklistval, null)
        }
        else if (this.addSelectedProduct != null && this.picklistval != null) {
            console.log('enter the picklist and selected rec record Record   ELSE', this.picklistval, this.addSelectedProduct);
            this.getProductData(this.picklistval, this.addSelectedProduct)
        }
        // console.log('select id this.selectedRecord ::  ' + JSON.stringify(this.selectedRecord));
        // console.log('select id this.recordpdroduct::  ' + JSON.stringify(this.recordpdroduct));
        // //  let filteredRecords = this.recordpdroduct.filter(record => this.selectedRecords.includes(record.Id));
        // console.log('enter the picklist record Record', this.picklistval);


    }

    getProductData(pickVal, selectedProuct) {
        console.log('for piclKist only ::', pickVal, 'selected row ::', selectedProuct)
        if (pickVal && selectedProuct == null) {
            getProductRecord({ picklist: pickVal, selectedProduct: selectedProuct ,  recordIdOpp:this.recordId })
                .then(result => {
                    console.log('get record when you searching name  ::',result);
                    this.recordpdroduct = result.map(iteam => ({
                        ...iteam,
                        ProductName: iteam.Product2.Name,
                        Category: iteam.Product2.Categoury__c

                    }))
                    //this.recordpdroduct = [...this.recordpdroduct, ...filteredRecords];

                    console.log('data for apex itrate ' + JSON.stringify(this.recordpdroduct));
                    console.log('Enter the data from apex' + JSON.stringify(result));
                })
                .catch(error => {


                })
        }
        else if (pickVal && selectedProuct) {
            console.log('for piclKist nd selected prdtsswheggehc only  ::', pickVal, 'selected row  ;;', selectedProuct)
            getProductRecord({ picklist: pickVal, selectedProduct: selectedProuct,recordIdOpp:this.recordId })
                .then(result => {
                    this.recordpdroduct = result.map(iteam => ({
                        ...iteam,
                        ProductName: iteam.Product2.Name,
                        Category: iteam.Product2.Categoury__c
                    }))
                    //this.recordpdroduct = [...this.recordpdroduct, ...filteredRecords];

                    console.log('data for apex itrate ' + JSON.stringify(this.recordpdroduct));
                    console.log('Enter the data from apex' + JSON.stringify(result));
                })
                .catch(error => {


                })

        }
    }

    handleChange(event) {
        this.value = event.detail.value;
        console.log('enter the Psklist category  ::', this.value);

    }
    handleCheckboxChange(event) {
        console.log(' handleCheckboxChange(');

    }

    @track selectedRow
    handleRowEdit(event) {


        if (event.target.checked == true) {
            console.log('inside checkboox if true');
            // this.selectedRow = event.currentTarget.dataset.id
            // console.log(' selectedRow', JSON.stringify(this.selectedRow));
            this.selectedRecords.push(event.currentTarget.dataset.id);
            // console.log(' handleCheckboxChange(', selectedId);

            console.log('Enter the  this.selectedRecords true::' + JSON.stringify(this.selectedRecords));
        } else {
            // this.selectedRecords = this.selectedRecords.filter(id => id !== selectedId);
            console.log('Enter the  this.selectedRecords   false::' + JSON.stringify(this.selectedRecords));
        }
    }
    //add more button
    @track addSelectedProduct = []
    handleAddMoreClick() {
        this.addSelectedProduct = [...this.selectedRecords]
        console.log('addmore selected prdts', JSON.stringify(this.addSelectedProduct))
       this.recordpdroduct = null
       return refreshApex(this.recordpdroduct)

        
    }

    // handleAddMoreClick(event) {
    //     console.log('Enter click Add More');
    //     console.log('Enter the  this.selectedRecords true::' + JSON.stringify(this.selectedRecords));
    //     console.log('Enter the   this.recordpdroduct  false::' + JSON.stringify(this.recordpdroduct));
    //     this.recordpdroduct = this.recordpdroduct.filter(record => !this.selectedRecords.includes(record.Id));

    //     console.log('Enter click Add More   this.recordpdroduct  :: ' + JSON.stringify(this.recordpdroduct));
    //     //this.selectedRecords = [];
    //     this.recordpdroduct = [...this.recordpdroduct];
    //     console.log('Enter click Add More this.selectedRecords' + JSON.stringify(this.selectedRecords));
    // }

    connectedCallback() {
        this.retrievePicklistValues()
    }

    // for product input field changes 


    disTypeOptions

    retrievePicklistValues() {
        getProductDisPickList({ fieldApiName: 'Discount_Type__c' })
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

        this.productListToMap = this.productListToMap.map(item => {
            if (item.Id === disTyperecordId) {
                return { ...item, Discount_Type__c: this.disType }
            }
            return item;
        })

        console.log('updsated oliData if dis changed :::', JSON.stringify(this.productListToMap))

        // console.log('discount change id' , disTyperecordId)
        // console.log('changed dis type ' , this.disType)
    }
    prdctDisVal
    discountValueChangeHandler(event) {
        if (event.target.name === 'quantity') {

            this.quantity = event.target.value
            const quantityValId = event.currentTarget.dataset.id

            this.productListToMap = this.productListToMap.map(item => {
                if (item.Id === quantityValId) {
                    return { ...item, Quantity__c: this.quantity }
                }
                return item;
            })

        }
        else {
            this.prdctDisVal = event.target.value
            const disValrecordId = event.currentTarget.dataset.id

            this.productListToMap = this.productListToMap.map(item => {
                if (item.Id === disValrecordId) {
                    return { ...item, Discount_Value__c: this.prdctDisVal }
                }
                return item;
            })

            console.log('updsated oliData if dis val :::', JSON.stringify(this.productListToMap))
        }
    }



    showEditProductCompo = false
    srNo = 0
    @track productList
    @track productListToMap

    //next button
    handleSaveClick(event) {
        this.showHtmlTabl = false
        this.showEditProductCompo = true
        console.log('Enter Save click click');

        getProducts({ getProductListsIds: this.addSelectedProduct, oppoId: this.recordId })
            .then(res => {
                this.productListToMap = [...res]
                this.productList = res.map(item => {
                    this.srNo++
                    return {
                        ...item,
                        srNo: this.srNo
                    }
                })
                console.log('product list:', JSON.stringify(this.productList));
            })
            .catch(err => {
                console.log('err while getting the product', err)
            })
    }

    hideModalBox(event) {
        this.dispatchEvent(new CloseActionScreenEvent());
    }
    //for product list to save
    handleSaveDMlClick(event) {
        console.log('Product DML in Save')

      //  console.log('Enter the product list map  ::',json.stringify(this.productListToMap));
        console.log('Enter the this.recordId  ::',this.recordId );

        insertQuoteLineItem({productList : this.productListToMap , oppoId : this.recordId})
        .then(res =>{
            this.toastSuccess(`Successfully Updated` , 'success' , 'Record Successfully Updated !!!')
            console.log('res from save qli' , res)
        })
        .catch(err=>{
            console.log('err while saving qlis' ,err)
        })
        this.dispatchEvent(new CloseActionScreenEvent());
    }

    toastSuccess(tittle , variant , message){
        this.dispatchEvent(new ShowToastEvent({
            title:tittle,
            variant : variant,
            message : message
        }))
    }

}