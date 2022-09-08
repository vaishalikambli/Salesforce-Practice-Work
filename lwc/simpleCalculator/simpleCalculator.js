import { LightningElement, track } from 'lwc';

export default class SimpleCalculator extends LightningElement {
  @track finalResult;
  @track previousResult = [];
  @track showResult = false;

  firstNumber;
  secondNumber;  

  numberChangeHandler(event){
    const inputBoxName = event.target.name;
    
    if(inputBoxName === 'firstNumber'){
      this.firstNumber = event.target.value;
    }else if(inputBoxName === 'secondNumber'){
      this.secondNumber = event.target.value;
    }
  }

  addHandler(){
    const firstNum = parseInt(this.firstNumber);
    const secondNum = parseInt(this.secondNumber);

    this.finalResult = `Result of ${firstNum} + ${secondNum} is ${firstNum + secondNum}`; 
    this.previousResult.push(this.finalResult);
  }

  subtractHandler(){
    const firstNum = parseInt(this.firstNumber);
    const secondNum = parseInt(this.secondNumber);

    this.finalResult = `Result of ${firstNum} - ${secondNum} is ${firstNum - secondNum}`; 
    this.previousResult.push(this.finalResult);
  }

  multiplyHandler(){
    const firstNum = parseInt(this.firstNumber);
    const secondNum = parseInt(this.secondNumber);

    this.finalResult = `Result of ${firstNum} * ${secondNum} is ${firstNum * secondNum}`; 
    this.previousResult.push(this.finalResult);
  }

  divideHandler(){
    const firstNum = parseInt(this.firstNumber);
    const secondNum = parseInt(this.secondNumber);

    this.finalResult = `Result of ${firstNum} / ${secondNum} is ${firstNum / secondNum}`; 
    this.previousResult.push(this.finalResult);
  }

  checkPreviousResultHandler(event){
    this.showResult = event.target.checked;
  }
}