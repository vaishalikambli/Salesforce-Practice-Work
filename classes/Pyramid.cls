public class Pyramid {
    
    Public void GeneratePyramid(){
        
        Integer count1, count2, count3, climit=7;
        String displayPattern = ' ';
        String starPattern = '*';
        
        for(count1=1; count1 <= climit; count1++){
            for(count2=1; count2 <= climit-count1; count2++){
               System.debug(displayPattern);
            }
            
            for(count3=0; count3 < 2 * count1 - 1; count3++){
                System.debug(starPattern);
            }
        }
    }
}