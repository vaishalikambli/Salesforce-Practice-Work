//Write a trigger whenever a record is inserted into the account automatically inserted into the contact
trigger AccountNewContact on Account (after insert) {
  List<Contact> conToAcc = new List<Contact>();

  for(Account acc : Trigger.new){
    Contact con = new Contact();
    con.LastName = 'Mahajan';
    con.AccountId = acc.Id;

    conToAcc.add(con);
  }

  insert conToAcc;
}