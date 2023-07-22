trigger AccountTrigger on Account (after update, after insert, after delete, after undelete) {
   /* try{
    //strigger.new[0].Industry = 'Other';
    for(Account acc2:Trigger.Old){
        //account acct = new account();
        for(Account acc1:Trigger.new){
            
            if(acc2.Rating =='Warm' && acc1.Rating =='Cold'){
                //acc1.addError('Can not update');
            }
            else if(acc2.Rating =='Cold' && acc1.Rating =='Warm'){
                
            }else if(acc2.Rating =='Warm' && acc1.Rating =='Warm'){
                
            }else if(acc2.Rating =='Cold' && acc1.Rating =='Cold'){
                if(acc2 != acc1){
                    system.debug('acc2>'+acc2);
                    system.debug('acc1>'+acc1);
                     acc1.addError('Can not update');
                }
                
            }
            }
        }
        
        if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete)){
            
        }
        
    }catch(exception ex){
        system.debug(ex.getLineNumber()+ex.getMessage());
    }
    
    */
    
    
}