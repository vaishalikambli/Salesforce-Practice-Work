public class SetCollection {

    Public void ShoppingCart(){
        Set<String> fruitBasket = new Set<String>();
        Set<String> Grocery = new Set<String>();
        
        Boolean isAvlb;
        
        fruitBasket.add('Bananas');
        fruitBasket.add('blueberries');
        fruitBasket.add('Strawberries');
        fruitBasket.add('kiwis');
		fruitBasket.add('Apples');
        
        Grocery.add('Oranges');
        Grocery.add('Strawberries');
        //Grocery.addall(fruitBasket);
        
        String fruitVal = 'apples';
        
       // isAvlb = fruitBasket.contains(fruitVal);
        
        System.debug('List of fruit items: ' + fruitBasket);
        Grocery = fruitBasket.clone();        
        System.debug('List of grocery items: ' + Grocery);   
        
        isAvlb = fruitBasket.equals(Grocery);
        System.debug('Is this fruit available in fruit basket after ? '+ isAvlb);

		//System.debug('Get fruit from fruit basket -- ' + fruitBasket.get(2));  
    //    System.debug('Get position of fruit from fruit basket -- ' + fruitBasket.indexOf('Kiwis'));  
        System.debug('Is fruit basket empty? ' + fruitBasket.isEmpty());
        System.debug('Total items in fruit basket -- ' + fruitBasket.size());
        
        fruitBasket.retainall(Grocery);
        System.debug('Total items in fruit basket -- ' + fruitBasket.size());
        
      /*  List<Contact> con = new List<Contact>();
        con = [SELECT id, lastname from contact limit 5]; 
        
        for(Contact c : con){
            c.LastName = c.LastName + ' 1';
            System.debug('Contact name: ' + c.LastName);
        }*/
    }
    
    
}