import { LightningElement, api } from 'lwc';

export default class LDSRecordForm extends LightningElement {
  @api recordId;
  @api objectApiName;
}