import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';

export default class LDSCreateAccount extends LightningElement {
  accName;
  accPhone;
  accNumber;

  updateAccountFields(event){
    if(event.target.name === 'accName'){
      this.accName = event.target.value;
      console.log(this.accName);
    }else if(event.target.name === 'accPhone'){
      this.accPhone = event.target.value;
      console.log(this.accPhone);
    }else if(event.target.name === 'accNumber'){
      this.accEmail = event.target.value;
      console.log(this.accNumber);
    }
  }

  CreateNewAccount(event){
    const fieldList = {'Name' : this.accName, 'Phone' : this.accPhone, 'AccountNumber' : this.accNumber};
    const recordDetails = {apiName : 'Account', fields : fieldList};
    
    createRecord(recordDetails).then(response => {
      console.log('Response :: ' + response);
    }).catch(Error => {
      console.log('Error :: ' + error);
    })
  }
}