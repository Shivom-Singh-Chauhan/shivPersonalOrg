public class Object1TriggerHandler {
    public static void updateObject2(List<Object1__c> ListObj1){
        
        List<String> matchingEmail = new List<String>();
        for(Object1__c obj:ListObj1){
            matchingEmail.add(obj.Email__c);
        }
        
        List<Object2__c> ListObj2 = [Select Name , Email__c From Object2__c Where Email__c IN :matchingEmail];
        
        map<Object1__c,List<Object2__c>> emailObj2Map = new map<Object1__c,List<Object2__c>>();
        
        for(Object1__c obj1:ListObj1){
            for(Object2__c obj2:ListObj2){
                if(!emailObj2Map.ContainsKey(obj1)){
                emailObj2Map.put(obj1,new List<Object2__c>());
            }
                if(obj1.Email__c == obj2.Email__c){
                    emailObj2Map.get(obj1).add(obj2);
                }
            }
        }
        
        for(Object1__c obj1: emailObj2Map.keySet())
        {
            obj1.Count__c = emailObj2Map.get(obj1).size();
        }
        
        
        List<Object1__c> ListToUpdate = new List<Object1__c>();
        
        for(Object1__c obj1: emailObj2Map.keySet()){
            ListToUpdate.add(obj1);
        }
        
        update ListToUpdate;
        
    }
}