/**
 * Sample Trigger utility for SFDG Unit Test
 * demonstration purposes only.
 * When Attendee record is created we need to create a new case
 * linked to Attendee Contact and Delivery Records
 * 
 * author: A.I.
 */ 
public class SFDG_AttendeeCaseUtil {

    public static void createDeliveryCase(List<Attendee__c> lst){
        List<Case> caseList = new List<Case>();
        for(Attendee__c a : lst){
            // Craete new case for each attendee on delivery
            Case c = new Case();
            c.Status = 'New';
            c.Priority = 'Medium';
            c.Origin = 'Web';
            c.Delivery__c = a.Delivery__c; // Link to Delivery
            c.ContactId = a.Contact__c; // Link to Contact record
            c.Subject = a.Name;
            
            caseList.add(c);
        }
        if(caseList.size()>0){
            insert caseList;
        }
    }
    /**
    public static void updateAllRealtedCases(List<Attendee__c> lst){
        List<ID> deliveryIds = new List<ID>();
        for(Attendee__c a : lst){
            deliveryIds.add(a.Delivery__c);
        }
        List<Case> caseLst = [SELECT Id, Status, ContactId FROM Case
                              WHERE Delivery__c IN :deliveryIds];
        for(Case c : caseLst){
            if(c.Status == 'New' ){
            	c.Status = 'Working';
            }else{
                c.Status = 'New';
            }
        }
        update caseLst;
    }
	**/
}