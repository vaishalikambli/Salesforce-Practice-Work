import { LightningElement, api, track } from 'lwc';

export default class PublicMethodChild extends LightningElement {
  @track value = ['red'];

  options = [
        { label: 'Red Marker', value: 'red' },
        { label: 'Green Marker', value: 'green' },
        { label: 'Blue Marker', value: 'blue' },
        { label: 'Yellow Marker', value: 'yellow' }
      ];

  @api 
  selectedCheckbox(checkboxValue){
    const selectedCheckbox = this.options.find(checkbox => {
      return checkboxValue === checkbox.value;
    })

    if(selectedCheckbox){
      this.value = selectedCheckbox;
      return "Successfully checked";
    }
    return "No checkbox found";
  }

}