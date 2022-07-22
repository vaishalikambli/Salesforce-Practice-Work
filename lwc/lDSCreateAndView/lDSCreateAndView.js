import { LightningElement, wire } from 'lwc';
import { createRecord, getRecord } from 'lightning/uiRecordApi';

const fieldArray = ['Account.Name', 'Account.Phone', 'Account.AccountNumber'];

export default class LDSCreateAndView extends LightningElement {
  accName;
  accPhone;
  accNumber;
  recordId;

  @wire(getRecord, {recordId: '$recordId', fields : fieldArray})
  accountRecord;

  get retrieveAccName(){
    if(this.accountRecord.data){
      return this.accountRecord.data.fields.Name.value;
    }
    return undefined;
  }

  get retrieveAccNumber(){
    if(this.accountRecord.data){
      return this.accountRecord.data.fields.AccountNumber.value;
    }
    return undefined;
  }

  get retrievePhone(){
    if(this.accountRecord.data){
      return this.accountRecord.data.fields.Phone.value;
    }
    return undefined;
  }  

  updateAccountFields(event){
    if(event.target.name === 'accName'){
      this.accName = event.target.value;
      console.log(this.accName);
    }else if(event.target.name === 'accPhone'){
      this.accPhone = event.target.value;
      console.log(this.accPhone);
    }else if(event.target.name === 'accNumber'){
      this.accNumber = event.target.value;
      console.log(this.accNumber);
    }
  }

  CreateNewAccount(event){
    const fieldList = {'Name' : this.accName, 'Phone' : this.accPhone, 'AccountNumber' : this.accNumber};
    const recordDetails = {apiName : 'Account', fields : fieldList};
    
    createRecord(recordDetails).then(response => {
      this.recordId = response.id;
      console.log('Response :: ' + JSON.stringify(response));
    }).catch(error => {
      console.log('Error :: ' + JSON.stringify(error));
    })
  }
}