public without sharing class Object2TriggerHandler {
    public static void updateObject1(List<Object2__c> ListObj2){
        
        List<String> matchingEmail = new List<String>();
        for(Object2__c obj:ListObj2){
            matchingEmail.add(obj.Email__c);
        }
        
        List<Object1__c> dataListObj1 = [Select Name , Email__c,User__c From Object1__c Where Email__c IN :matchingEmail];
        
        List<Object2__c> updatedObject2List = new List<Object2__c>();
        map<String, Id> emailUserMap = new map<String, Id>();
        
        for(Object1__c Obj1:dataListObj1){
            emailUserMap.put(Obj1.Email__c,Obj1.User__c);
        }
        
        for(Object2__c obj2:ListObj2){
            if(emailUserMap.ContainsKey(obj2.Email__c)){
                obj2.OwnerId = emailUserMap.get(obj2.Email__c);
                updatedObject2List.add(obj2);
            }
            else{
               obj2.OwnerId = UserInfo.getUserId();
                updatedObject2List.add(obj2);
            }
        }
        update updatedObject2List;
    }
}