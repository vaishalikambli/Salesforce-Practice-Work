import { LightningElement } from 'lwc';
import {createRecord}  from 'lightning/uiRecordApi';

export default class LDSComponent extends LightningElement {
  oppName;
  closeDate;
  stage;
  

  get stageOptions() {
    return [
        { label: 'Prospecting', value: 'Prospecting' },
        { label: 'Qualification', value: 'Qualification' },
        { label: 'Needs Analysis', value: 'Needs Analysis' },
        { label: 'Value Proposition', value: 'Value Proposition' },
        { label: 'Id. Decision Makers', value: 'Id. Decision Makers' },
        { label: 'Perception Analysis', value: 'Perception Analysis' },
        { label: 'Proposal/Price Quote', value: 'Proposal/Price Quote' },
        { label: 'Negotiation/Review', value: 'Negotiation/Review' },
        { label: 'Closed Won', value: 'Closed Won' },
        { label: 'Closed Lost', value: 'Closed Lost' }
    ];
  }

  updateOpportunityFieldsValue(event){
    if(event.target.name === 'oppName'){
      this.oppName = event.target.value;
      console.log('oppName :: ' + this.oppName);
    }else if(event.target.name === 'closeDate'){
      this.closeDate = event.target.value;
      console.log('closeDate :: ' + this.closeDate);
    }else if(event.target.name === 'oppStage'){
      this.stage = event.detail.value;
      console.log('Stage :: ' + this.stage);
    }
  }

  CreateNewOpportunity(event){
    const fields = {'Name' : this.oppName, 'CloseDate' : this.closeDate, 'StageName' : this.stage};
    const recordDetails = {apiName : 'Opportunity', fields : fields};

    createRecord(recordDetails).then(response => {
      console.log('response :: ' + response);
    }).catch(error => {
      console.log('Error.......' + JSON.stringify(error));
    })
  }
}