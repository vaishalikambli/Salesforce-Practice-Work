import { LightningElement, track } from 'lwc';

export default class HelloWorld extends LightningElement {
  @track dynamicGreeting = 'Ishani';

  greetingChangeHandler(event){
    this.dynamicGreeting = event.target.value;
  }

}