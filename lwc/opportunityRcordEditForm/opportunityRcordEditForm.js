import { LightningElement, api } from 'lwc';

export default class OpportunityRcordEditForm extends LightningElement {
  @api recordId;
  @api objectApiName;

  isReadOnly = false;

  handleStatusChange(event){
    if(event.detail.value === 'Closed Won'){
      this.isReadOnly = true;
    } else {
      this.isReadOnly = false;
    }
  }
}