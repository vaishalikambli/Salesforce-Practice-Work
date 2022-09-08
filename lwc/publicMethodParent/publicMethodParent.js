import { LightningElement, track } from 'lwc';

export default class PublicMethodParent extends LightningElement {
  @track value;

  CheckboxSelectHandler(){
    const childComponentVal = this.template.querySelector('c-public-method-child');
    const returnedMessage = childComponentVal.selectedCheckbox(this.value);

    console.log('Returned Message :: ' + returnedMessage);
  }

  onInputChangeHandler(event){
    this.value = event.target.value;
  }
}