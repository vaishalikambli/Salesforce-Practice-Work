import { LightningElement, api } from 'lwc';

export default class CustomDynamicList extends LightningElement {
  @api content = [];
  @api field;
  @api fieldType;

  label;
  fieldName;
  type;
  @api tableColumns = [
                  { label: 'Name', fieldName: 'name', type: 'String' },
                  { label: 'Website', fieldName: 'website', type: 'String' },
                  { label: 'Phone', fieldName: 'phone', type: 'String' },
                  { label: 'Balance', fieldName: 'amount', type: 'String' },
                  { label: 'CloseAt', fieldName: 'closeAt', type: 'String' }
                ];

}