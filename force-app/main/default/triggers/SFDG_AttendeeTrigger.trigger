trigger SFDG_AttendeeTrigger on Attendee__c (after insert) {
    // Create a Case for Delivery
    if(Trigger.isInsert){
       SFDG_AttendeeCaseUtil.createDeliveryCase(Trigger.New);
    }
    
}