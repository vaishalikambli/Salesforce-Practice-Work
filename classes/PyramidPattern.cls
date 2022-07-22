public class PyramidPattern {    
    Integer outerC, innerC, prStar, climit = 5;
    String starPattern = '';
    String space = '_';
    
    Public void GeneratePyramid(){
		for(outerC = 1; outerC <= climit; outerC++){
            for(innerC = 1; innerC <= outerC; innerC++){
            	space += '_';                
            }
            for(prStar = 1; prStar < 2 * outerC - 1; prStar++){
                starPattern += '*'; 
            }
            starPattern += space + '\n';
    	}
		        
        /*
    	for(outerC = 1; outerC <= climit; outerC++){
            for(innerC = 1; innerC <= outerC; innerC++){
            	starPattern += '* ';                
            }
            starPattern += '\n';
    	}*/
        
        /* Reverse pyramid
        for(outerC = climit; outerC >= 1; outerC--){
            for(innerC = 1; innerC <= outerC; innerC++){
            	starPattern += '* ';                
            }
            starPattern += '\n';
    	}*/
        System.debug('Pyramid pattern \n' + starPattern);
    }    
}