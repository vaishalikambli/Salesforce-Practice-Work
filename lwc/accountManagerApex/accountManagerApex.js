import { LightningElement, track } from 'lwc';
import  getAllAccounts  from '@salesforce/apex/AccountManager.getAccount';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class AccountManagerApex extends LightningElement {

  @track numberOfRecords;
  @track accounts;
  
  get responseReceived(){
    console.log('Inside responseReceived ');
    if(this.accounts){
      console.log('If accounts data available');
      return true;
    }
    console.log('If accounts data not available');
    return false;
  }

  numberOfAccountChangeHandler(event){
    this.numberOfRecords = event.target.value;
  }

  getAccounts(){
    console.log('Inside get accounts method');
    getAllAccounts({numberOfRecords : this.numberOfRecords}).then(response =>{
      this.accounts = response;
      //console.log('Accounts :: ' + JSON.stringify(response));
      const toastEvent = new ShowToastEvent({
        title : 'Account Loaded',
        message: this.numberOfRecords + ' Accounts Fetched FROm Server',
        variant: 'Success',
      });
      this.dispatchEvent(toastEvent);
    }).catch(error => {
      console.error('Error in getting the accounts', error.body.message);
      const toastEvent = new ShowToastEvent({
        title : 'ERROR',
        message: error.body.message,
        variant: 'Error',
      });
      this.dispatchEvent(toastEvent);      
    })
  }
}