public class ParttenTask {
    public static void getString(String str){
        //string s = str.charAt(str.length() - 1);
        
        system.debug(str.charAt(0));
        for(integer i = 0 ; i< str.length(); i++){
            string printStr  = str.removeEnd('g').removeEnd('n') +' ' +str.reverse();
            system.debug(printStr);
            
        }
    }
}