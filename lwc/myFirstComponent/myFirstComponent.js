import { api, LightningElement } from 'lwc';

export default class MyFirstComponent extends LightningElement {
  greet = 'Hi ';
  hasValue = true;
  Students = ['Jenny', 'Alex', 'Bob', 'Rita'];

  updateGreet(event){ //whenever function called it will pass event parameter
    console.log(event.target.label); //It will store element of source where event called
    this.greet = event.target.value; //Pupulating value from source

    if(this.greet === ''){
      this.hasValue = false;
    }else{
      this.hasValue = true;
    }
  }
}