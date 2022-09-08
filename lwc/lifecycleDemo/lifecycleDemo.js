import { LightningElement } from 'lwc';

export default class LifecycleDemo extends LightningElement {
  constructor(){
    super();
    console.log('Constructor called');
  }

  connectedCallback(){
    console.log('Component Connected Callback is called');
  }

  renderedCallback(){
    console.log('Component Rendered Callback is called');
  }

  disconnectedCallback(){
    console.log('Component DisConnected Callback is called');
  }
}