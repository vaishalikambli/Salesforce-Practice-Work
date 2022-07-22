public class MapCollection {
    Public Void mapMethod(){
        Map<Integer, String> NumList1 = new Map<Integer, String>();
        Map<Integer, String> NumList2 = new Map<Integer, String>();
        
        NumList1.put(1, 'India');
        NumList1.put(2, 'Canada');
        NumList1.put(3, 'Spain');
        NumList1.put(4, 'Germany');
        
        System.debug('List of countries :: ' + NumList1);
        
        NumList2.putall(NumList1);
        System.debug('List of countries in Numlist-2 :: ' + NumList2);
    }
}