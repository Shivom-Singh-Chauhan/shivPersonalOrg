global class ScheduledMerge implements Schedulable {
   global void execute(SchedulableContext SC) {
      ID jobID = System.enqueueJob(new AsyncExecutionExample());
       system.debug('ID>'+jobID);

   }
}