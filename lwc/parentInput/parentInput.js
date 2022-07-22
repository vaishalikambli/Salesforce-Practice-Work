import { LightningElement } from 'lwc';

export default class ParentInput extends LightningElement {
  showOutput;

  constructor(){
    super();
    console.log(' Constructor loaded');
  }

  connectedCallback(){
    console.log(' connectedCallback loaded');
  }

  renderedCallback(){
    console.log(' renderedCallback loaded');    
  }

  disconnectedCallback(){
    console.log(' disconnectedCallback loaded');     
  }
  selectStudentName(event){
    const childCheckBox = this.template.querySelector('c-child-check-box');
    childCheckBox.updateCheckBoxes(event.target.value);
  }

  updateInputValues(event){ //ReadAllTheValuesSendAlongWithEvent
    this.showOutput = event.detail; // ReadAllTheValuesSendAlongWithEvent
    console.log(JSON.stringify(event));
  }
}