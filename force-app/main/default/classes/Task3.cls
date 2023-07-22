public class Task3 {
    public static void pleaseGiveInputInList(){
       List<Schema.SObjectField> reqFields = new List<Schema.SObjectField>();
        Map <String,Schema.SObjectType> gd = Schema.getGlobalDescribe();
        Schema.SObjectType sobjType = gd.get('Contact');
        Schema.DescribeSObjectResult r = sobjType.getDescribe();
        Map<String, Schema.SObjectField> MapofField = r.fields.getMap();
        
        for(String fieldName : MapofField.keySet()) {
            Schema.SObjectField field = MapofField.get(fieldName);
            Schema.DescribeFieldResult F = field.getDescribe();
            System.debug('field-->'+field.getDescribe().isUpdateable());
            //System.debug('F-->'+F.getType()); //type of field
	    reqFields.add(field);
        }
        System.debug(MapofField);
      
    }

}