import { LightningElement } from 'lwc';

export default class ChildMuitipledataPass extends LightningElement {

firstName;
lastName;
// fieldName;
    chaneInputHandler(event){
 const fieldName=event.target.label;
console.log(`Enter name ${JSON.stringify(fieldName)}`);
if(fieldName == 'FirstName'){
    this.firstName = event.target.value;
    console.log(`Enter the First Name ${JSON.stringify(this.firstName)}`);
}
else if(fieldName == 'LastName'){
    this.lastName = event.target.value;
    console.log(`Enter the Last Name ${JSON.stringify(this.lastName)}`);
}
  }

    saveHandler(){
console.log('Enter the Button');
console.log(`Enter the Nme of First Value Button  ${this.firstName}`);
console.log(`Enter the Nme of Last Value button ${this.lastName}`);
 const evnt=new CustomEvent('eventname',
 {detail:{
FirstName:this.firstName,
LastName:this.lastName

}

 });
 this.dispatchEvent(evnt);

    }
}