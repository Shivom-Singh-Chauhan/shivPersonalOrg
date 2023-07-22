public class NewTask {
    public static void newtaskmethod(List<integer> monthlyHours, integer dialyHour)
    {
        List<integer> showList = new List<integer>();
        integer endDay = 0;
        for(integer mon: monthlyHours){
            ShowList.add(dialyHour-endDay);
            mon = mon - (dialyHour-endDay);
            while(mon>=dialyHour){
                showList.add(dialyHour);
               mon = mon - dialyHour;
            }
            ShowList.add(math.mod(mon, dialyHour));
            system.debug(ShowList);
            endDay = math.mod(mon, dialyHour);
            ShowList.clear();
        }
    }

}