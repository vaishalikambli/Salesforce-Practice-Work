import { api, LightningElement } from 'lwc';

export default class ChildCheckBox extends LightningElement {
  @api updateCheckBoxes(names){
    this.value = names.split(',');
  }

  constructor(){
    super();
    console.log('Child Constructor loaded');
  }

  connectedCallback(){
    console.log('Child connectedCallback loaded');
  }

  renderedCallback(){
    console.log('Child renderedCallback loaded');    
  }

  disconnectedCallback(){
    console.log('Child disconnectedCallback loaded');     
  }

  value = [];
  get options(){
    return [
      {label : 'Jenny', value: 'Jenny'},
      {label : 'Alex', value: 'Alex'},
      {label : 'Anushka', value: 'Anushka'},
      {label : 'Aarya', value: 'Aarya'},
      {label : 'Bob', value: 'Bob'}
    ]
  }

  //Collect all selected values
  handleChange(event){//Fire event
    this.selectedValues = event.detail.value.join(',');
    const checkboxSelected = new CustomEvent('checkboxselect', {target: this.selectedValues});//CustomEventCreateWithSelectedValues
    this.dispatchEvent(checkboxSelected);//FireTheCustomEvent
  }
}