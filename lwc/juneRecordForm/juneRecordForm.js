import { api, LightningElement } from 'lwc';
import  NAME_FIELD  from '@salesforce/schema/Contact.Name';

export default class JuneRecordForm extends LightningElement {
 // fields = [NAME_FIELD];
  
  @api recordId;
  @api objectApiName;
  
}