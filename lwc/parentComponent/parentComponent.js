import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {
  students = [{'Name' : 'Jenny', 'Age' : 29}, 
              {'Name' : 'Alex', 'Age' : 21}, 
              {'Name' : 'Bob', 'Age' : 27}, 
              {'Name' : 'Ritu', 'Age' : 22}
             ];

  dataList = [{'amount': "550.50", 'closeAt': "2023-03-03", 'email': 'abc@y.com', 'name': 'Oliever Hay', 'phone': '647-989-0000', 'website' : 'http://www.google.com'},
              {'amount': "1020.00", 'closeAt': "2022-06-02", 'email': 'pqr@y.com', 'name': 'Sharman Roy', 'phone': '416-989-0000', 'website' : 'http://www.google.com'},
              {'amount': "550.50", 'closeAt': "2023-03-03", 'email': 'abc@y.com', 'name': 'Oliever Hay', 'phone': '647-989-0000', 'website' : 'http://www.google.com'},
              {'amount': "550.50", 'closeAt': "2023-03-03", 'email': 'abc@y.com', 'name': 'Oliever Hay', 'phone': '647-989-0000', 'website' : 'http://www.google.com'},
              {'amount': "550.50", 'closeAt': "2023-03-03", 'email': 'abc@y.com', 'name': 'Oliever Hay', 'phone': '647-989-0000', 'website' : 'http://www.google.com'},
              {'amount': "550.50", 'closeAt': "2023-03-03", 'email': 'abc@y.com', 'name': 'Oliever Hay', 'phone': '647-989-0000', 'website' : 'http://www.google.com'}
             ];
}