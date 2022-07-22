import { LightningElement, wire } from 'lwc';
import { fireEvent } from 'c/pubsub';
import { CurrentPageReference } from 'lightning/navigation';

export default class LeftComponent extends LightningElement {
  @wire(CurrentPageReference)
  pageReference;

  selectedStudentName(event){
    let studentNames = event.target.value;
    fireEvent(this.pageReference, 'pubSubHit', studentNames);
  }

}