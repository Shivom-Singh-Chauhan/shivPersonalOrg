public class CreateNewRecordController {
    @AuraEnabled
    public static String sendSchemaData(String objectApiName){
        
        sObjectSchema objectMetadata 	= new sObjectSchema();
        List<String> fieldLabel    		= new List<String>();
        List<String> fieldApi    		= new List<String>();
        List<String> fieldType    		= new List<String>();
        List<boolean> required     		= new List<boolean>();
        
        JSONGenerator objectFieldSet = JSON.createGenerator(true);
        
    	Map <String,Schema.SObjectType> globalDescribe = Schema.getGlobalDescribe();
        Schema.SObjectType sObjType = globalDescribe.get(objectApiName);
        Map<String, Schema.SObjectField> mapofField = sObjType.getDescribe().fields.getMap();
        
        objectFieldSet.writeStartArray();
        
        
        for(String fieldName : mapofField.keySet()) {
        	Schema.SObjectField field = mapofField.get(fieldName);
            Schema.DescribeFieldResult fieldResult = field.getDescribe();
            
            
            objectFieldSet.writeStartObject();
            
            objectFieldSet.writeStringField('label', fieldResult.getLabel());
            objectFieldSet.writeStringField('apiName', fieldResult.getName());
            objectFieldSet.writeStringField('type', String.valueOf(fieldResult.getType()));
            objectFieldSet.writeBooleanField('isNillable', fieldResult.isNillable());
            objectFieldSet.writeBooleanField('isCreateable', fieldResult.isCreateable());
            objectFieldSet.writeBooleanField('isUpdateable', fieldResult.isUpdateable());
            
            if(String.valueOf(fieldResult.getType()) == 'REFERENCE'){
                String relatedObj = fieldResult.getRelationshipName();
                //List<sObject> = Database.query('SELECT Id, Name FROM' + relatedObj)
                objectFieldSet.writeStringField('relationObj', relatedObj);
            }
            	
            if(String.valueOf(fieldResult.getType()) == 'PICKLIST'){
                objectFieldSet.writeStringField('picklistValues', JSON.serialize(fieldResult.getPicklistValues()));
                    }
            
            objectFieldSet.writeEndObject();
            
        }
        
        objectFieldSet.writeEndArray();
        
        return objectFieldSet.getAsString();
    }
    
    @AuraEnabled
    public static void createNewRecord(){
        
    }
    
    public class sObjectSchema{
        @AuraEnabled
        public String objectLable;
        @AuraEnabled
        public List<String> fieldApiName;
        @AuraEnabled
        public List<String> fieldLableName;
        @AuraEnabled
        public List<String> fieldType;
        @AuraEnabled
        public List<boolean> isNillable;
        @AuraEnabled
        public List<boolean> is;
    }
}