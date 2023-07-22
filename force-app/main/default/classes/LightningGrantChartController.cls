public class LightningGrantChartController {
    
    public static string getLineChartMap(){
        List<Account> myLineChartVarList = new List<Account>();
        myLineChartVarList =[SELECT  Name FROM Account];
        System.debug('myLineChartVarList'+myLineChartVarList);       
        return JSON.Serialize(myLineChartVarList);
    }

}