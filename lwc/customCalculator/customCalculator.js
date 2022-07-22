import { LightningElement } from 'lwc';

export default class CustomCalculator extends LightningElement {
  value1;
  value2;
  outputValue;

  //Get value from Value1 input field
  getValue1(event){
    this.value1 = parseInt(event.target.value);
  }

  //Get value from Value2 input field  
  getValue2(event){
    this.value2 = parseInt(event.target.value);
  }

  //Addition of two numbers
  addition(){
    this.outputValue = `Addition ${this.value1} + ${this.value2} = ${this.value1 + this.value2}`;
  }

  //Subtraction of two numbers
  subtraction(){
    this.outputValue = `Subtraction ${this.value1} - ${this.value2} = ${this.value1 - this.value2}`;
  }

  //Multiplication of two numbers  
  multiplication(){
    this.outputValue = `Multiplication ${this.value1} * ${this.value2} = ${this.value1 * this.value2}`;
  }
  
  //Division of two numbers  
  division(){
    this.outputValue = `Division of ${this.value1} / ${this.value2} = ${this.value1 / this.value2}`;    
  }

  //Swapping of two numbers  
  swapNumbers(){
    this.value1 = this.value1 + this.value2;
    this.value2 = this.value1 - this.value2;
    this.value1 = this.value1 - this.value2;
  }

}