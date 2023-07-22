public class StudentTriggerHandler {
    public static void updateStudentAssisment(List<Student__c> studentList){
        
         List<id> SubjectId = new List<id>();
        for(Student__c sub:studentList){
            SubjectId.add(sub.Subject__c);
        }
        List<Subject__c> totalSub = [SELECT Name FROM Subject__c WHERE Id IN :SubjectId];
        List<Student__c> totaluser = [SELECT Name, Subject__c FROM Student__c WHERE Subject__c IN :SubjectId];
        
        map<Subject__c,integer> numberOfStudentPerSubject = new map<Subject__c,integer>();
        
        for(Subject__c  sub: totalSub){
            for(Student__c stu:totaluser){
            if(!numberOfStudentPerSubject.ContainsKey(sub)){
                numberOfStudentPerSubject.put(sub,1);
                    }else{
                        if(sub.id == stu.Subject__c){
                             numberOfStudentPerSubject.put(sub,numberOfStudentPerSubject.get(sub) +1);
                        }
                    }
        }
        }
        
        List<StudentAssisment__c> stuAssign = new List<StudentAssisment__c>();
        
        for(Subject__c sub:numberOfStudentPerSubject.keyset()){
            StudentAssisment__c stuAss = new StudentAssisment__c();
            stuAss.Subject_Name__c = sub.Name;
            stuAss.No_Of_Student__c = numberOfStudentPerSubject.get(sub);
            
            stuAssign.add(stuAss);
        }
        
        upsert stuAssign;
    }
}