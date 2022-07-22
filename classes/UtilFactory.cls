public class UtilFactory {
    public static Boolean flag = true;

    public static Boolean checkRecursive() {
    	if (flag){
            flag = false;
            return true;
        }else {
            return false;
        }		        
    }
}