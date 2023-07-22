public class task2 {
    public static void taskMethod(integer start, integer column, integer num){
        
        List<integer> ShowList = new List<integer>();
        
        while(num<=0){
            for(integer i=0; i<column ; i++)
            {
                ShowList.add(start);
                num = num -start;
                if(num<start){
                    ShowList.add(num);
                }
            }
            showList.clear();
        }
        
}

}