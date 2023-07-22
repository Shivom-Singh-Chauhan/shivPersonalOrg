public class LapindromeString {
    public static void splitString(string checkString){
        
        integer stringLength = checkString.length();
        //integer stringMiddle
        List<String> charList = checkString.split('');
        List<String> firstList = new List<String>(); 
        List<String> SecondList = new List<String>();
        
        
        if(math.mod(stringLength, 2) == 0){
            
            for( integer i = 0 ; i< (stringLength/2); i++){
                firstList.add(charList[i]);
            }
            for( integer i = stringLength/2; i < stringLength; i++){
                SecondList.add(charList[i]);
            }
            
            firstList.sort();
            SecondList.sort();
            
            if(firstList == SecondList){
                System.debug('Yes');
            }else{
                System.debug('No');    
            }
            
        }else{
            
            for( integer i = 0 ; i< (stringLength/2); i++){
                firstList.add(charList[i]);
            }
            for( integer i = (stringLength/2) +1; i < stringLength; i++){
                SecondList.add(charList[i]);
            }
            
            firstList.sort();
            SecondList.sort();
            
            if(firstList == SecondList){
                System.debug('Yes');
            }else{
                System.debug('No');    
            }
        }
    }
    
}