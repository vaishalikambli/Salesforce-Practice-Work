/*
Recording - Class 6 & 7
Collection - List 
*/
public class CollectionClass {
    //Collection in Apex
    //List:
    //1. Ordered collection of elements
    //2. Index value identification
    //3. first value of index starts with 0
    //4. List can be nested and multi-dimensional
    
    Public void ShoppingCart(){
        List<String> fruitBasket = new List<String>();
        List<String> Grocery = new List<String>();
        
        Boolean isAvlb;
        
        fruitBasket.add('Bananas');
        fruitBasket.add('blueberries');
        fruitBasket.add('Strawberries');
        fruitBasket.add('kiwis');
		fruitBasket.add('Apples');
        fruitBasket.add(2,'Raspberries');
        
        Grocery.add('Oranges');
        //Grocery.addall(fruitBasket);
        
        String fruitVal = 'apples';
        
       // isAvlb = fruitBasket.contains(fruitVal);
        
        System.debug('List of fruit items: ' + fruitBasket);
        Grocery = fruitBasket.clone();        
        System.debug('List of grocery items: ' + Grocery);   
        
        isAvlb = fruitBasket.equals(Grocery);
        System.debug('Is this fruit available in fruit basket after ? '+ isAvlb);

		System.debug('Get fruit from fruit basket -- ' + fruitBasket.get(2));  
        System.debug('Get position of fruit from fruit basket -- ' + fruitBasket.indexOf('Kiwis'));  
        System.debug('Is fruit basket empty? ' + fruitBasket.isEmpty());
        System.debug('Total items in fruit basket -- ' + fruitBasket.size());
        
        List<Contact> con = new List<Contact>();
        con = [SELECT id, lastname from contact limit 5]; 
        
        for(Contact c : con){
            c.LastName = c.LastName + ' 1';
            System.debug('Contact name: ' + c.LastName);
        }
    }
}