import { LightningElement,wire} from 'lwc';
// import coutomdata from '@salesforce/apex/ApexControllerCustomeMetaData.cityData'
import customeData from '@salesforce/apex/ApexControllerCustomeMetaData.cityMethod'
export default class LwcCustomeMdataPicklist extends LightningElement {
    metadataObject={"sObjectType":"DependantPicklistMdata__mdt"}
    countryData;
    a;
    metadataObjecta;
kishor='hellooooo'
    city;
    selectedCountry=[];
        // @wire(coutomdata)
        // dataCity({data,error}){
        //     if (data) {
              
        //         this.metadataObject=data;
        //         console.log('Enter the data  ===######'+JSON.stringify(this.metadataObject));
        //     } else if (error) {
        //         // Handle error
        //     }

        // }
        get cityOp(){
    return[
            { label: 'Mumbai', value: 'Mumbai' },
            { label: 'Lahor', value: 'Lahor' },
            { label: 'DC', value: 'DC' },
            { label: 'colombo', value: 'colombo' },
            { label: 'Shanghai', value: 'Shanghai' }
        ]

        }
        get country(){
            return[
                    { label: 'India', value: 'India' },
                    { label: 'United States', value: 'United States' },
                    { label: 'Pakistan', value: 'Pakistan' },
                    { label: 'Srilanka', value: 'Srilanka' },
                    { label: 'Bangladesh', value: 'Bangladesh' }
                ]
        
                }
                get state(){
                    return[
                            { label: 'maharastra', value: 'maharastra' },
                            { label: 'United States', value: 'United States' },
                            { label: 'sindhu', value: 'sindhu' },
                            { label: 'kotte', value: 'kotte' },
                            { label: 'NewYork', value: 'NewYork' }
                        ]
                
                        }
    handleCountryChange(event){
        this.countryData=event.detail.value;
console.log('Enter the data ==='+JSON.stringify(this.countryData));

customeData({countryName:this.countryData})
.then(result=>{
this.metadataObjecta=result.map(itema=>{
return {...itema}


})
console.log('Enter the data from apex===  '+JSON.stringify(this.metadataObjecta))
})

 }
 handleCityChange(event){

 }
 handleStateChange(event){


 }

}