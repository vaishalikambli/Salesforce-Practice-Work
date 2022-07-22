import { LightningElement, api } from 'lwc';
import getAllAccounts from '@salesforce/apex/myCalculator.getAllAccounts';

export default class JuneDataFromApex extends LightningElement {
  @api content = [];
  @api field;
  @api fieldType;

  label;
  fieldName;
  type;
  @api tableColumns = [
                  { label: 'Name', fieldName: 'Name', type: 'String' },
                  { label: 'Phone', fieldName: 'Phone', type: 'String' },
                  { label: 'Industry', fieldName: 'Industry', type: 'String' },
                  { label: 'Annual Revenue', fieldName: 'AnnualRevenue', type: 'String' }                                    
                ];

  // connectedCallback(event){
  //   this.searchRelatedAccounts(event);
  //   console.log('Inside connected callback');
  // }

  searchRelatedAccounts(event){
    let like = event.target.value;
    
    getAllAccounts({likeValue : like}).then(res => {
      if(res){
        this.content = res;
        console.log('Response :: ' + this.content);
      }
    }).catch(error => {
      console.log('Error :: ' + JSON.stringify(error));
    })
  }

}