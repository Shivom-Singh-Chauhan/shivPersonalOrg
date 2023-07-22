public class UserTriggerHandler {
    public static void givingPrimetion(List<User> userList){
        List<PermissionSetAssignment> permissionSetList = new List<PermissionSetAssignment>();
        PermissionSet permission = [SELECT ID, Name from PermissionSet WHERE Name = 'B2BBuyer'];
        for (User u : userList){
            PermissionSetAssignment psa = new PermissionSetAssignment (PermissionSetId = permission.Id, AssigneeId = u.Id);
            permissionSetList.add(psa);
        }
        try{
            giveingPermiSet(JSON.serialize(permissionSetList));
            //upsert permissionSetList;
        }catch(exception e){
            system.debug('exception caught' + e);
        }
    }
    
    @future
    public static void giveingPermiSet(String stringfyObj){
        List<PermissionSetAssignment> permissionSetListToUpsert = (List<PermissionSetAssignment>) JSON.deserialize(stringfyObj,List<PermissionSetAssignment>.Class);
        upsert permissionSetListToUpsert;
    }
}