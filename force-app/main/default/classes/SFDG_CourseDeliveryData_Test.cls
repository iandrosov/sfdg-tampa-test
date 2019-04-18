/**
 * Example code shows how to load test data from a eresource file
 * and preload related records with relationships
 * 
 */ 
@isTest
private class SFDG_CourseDeliveryData_Test {

    @testSetup
    private static void testDataSetup(){
        Test.loadData(Course__c.sObjectType, 'Course_Test');
        System.debug([SELECT Id, Name FROM Course__c]);
        
        Test.loadData(Delivery__c.sObjectType, 'Delivery_Test');
        List<Delivery__c> lst = [SELECT Id, Name, Course__c FROM Delivery__c];
        System.assertNotEquals(0, lst.size());
        for(Delivery__c d : lst){
            System.assertNotEquals(NULL, d.Course__c);
        }
    }
    // Validate that we preloaded test data
    @isTest
    private static void dataLoadTest(){
		List<Course__c> crsList = [SELECT Id, Name FROM Course__c];
        System.assertEquals(2, crsList.size());
        
        List<Delivery__c> lst = [SELECT Id, Name, Course__c FROM Delivery__c];
        System.assertEquals(3, lst.size());
        for(Delivery__c d : lst){
            System.assertNotEquals(NULL, d.Course__c);
        }
        
    }
}