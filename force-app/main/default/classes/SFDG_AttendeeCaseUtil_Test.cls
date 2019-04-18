/**
 * Unit test to validate fancionaly SFDG_AttendeeCaseUtil class
 * Test fanctionality of an Attendee trigger automation
 * Additional test Process Builder update to Delivery status
 * 
 * author A.I.
 */ 
@isTest
private class SFDG_AttendeeCaseUtil_Test {

    @testSetup
    private static void setupTestData(){
        // Prepare set up test data here with relationships
        Account act = new Account(name='Certificate Test');
        insert act;
        Contact cnt = new Contact(firstName='John',LastName='Trail',AccountId=act.Id);
        insert cnt;
        
        Course__c crs = new Course__c(name='DEX450');
        insert crs;
        Delivery__c deliver = new Delivery__c(Course__c=crs.Id,Status__c='Pending');
        insert deliver;
        
    }
    
    @isTest
    private static void createDeliveryCase(){
        // Create Attendee record is objective of a test
        List<Contact> cntList = [SELECT Id, Name FROM Contact];
        List<Delivery__c> dList = [SELECT Id, Name FROM Delivery__c];
        
        Test.startTest();
        
        Attendee__c attend = new Attendee__c(Name='Appy',
            								Delivery__c=dList[0].Id,
                                            Contact__c=cntList[0].Id);
        insert attend;
        // This will run a trigger to create a Case for Delivery
        Test.stopTest();
        // Find new cretaed Case with Subject name = Appy
        Case cs = [SELECT Id, Delivery__c, Subject, ContactId FROM Case WHERE Delivery__c =:dList[0].Id];
		// Validate our tests cAse is created
        System.assertEquals(cs.Subject,'Appy');
        System.assertEquals(cs.ContactId,attend.Contact__c);
    }
    
    @isTest
    private static void checkProcessBuilderDeliveryStatus(){  
        // Create Attendee record is objective of a test
        List<Contact> cntList = [SELECT Id, Name FROM Contact];
        List<Delivery__c> dList = [SELECT Id, Status__c, Name FROM Delivery__c];
        
        Test.startTest();
        
        Attendee__c attend = new Attendee__c(Name='Appy',
            								Delivery__c=dList[0].Id,
                                            Contact__c=cntList[0].Id);
        insert attend;
        // This will run a trigger to create a Case for Delivery
        Test.stopTest();
        // Query Delivery and check the delivery Status change
    	List<Delivery__c> testList = [SELECT Id, Status__c, Name FROM Delivery__c];
        System.assertNotEquals(testList.size(),0);
        System.assertNotEquals(testList[0].Status__c,NULL);
        System.assertEquals(testList[0].Status__c,'Complete');
    }
}