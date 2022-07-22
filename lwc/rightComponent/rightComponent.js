import { LightningElement, api, wire } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import { registerListener, unregisterAllListeners } from 'c/pubsub';

export default class RightComponent extends LightningElement {
  @wire(CurrentPageReference)
  pageRef;

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

  connectedCallback(){
    registerListener('pubSubHit', this.updateCheckBoxes, this);
  }

  disconnectedCallback(){
    unregisterAllListeners(this);
  }

  updateCheckBoxes(names){
    this.value = names.split(',');
  }

}