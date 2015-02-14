/**
   @Author <Kalpita Talwadekar>
   @name <AP_ContactNameAppend_TEST>
   @CreateDate <12/02/2015>
   @Description <Test class to check the validity of name appends on contact.>
   @Version <1.0>
   */
@isTest
public class AP_ContactNameAppend_TEST {

    /**
      *  This method will test the positive scenario for appending the first and last name on contact which are one word. 
      *  @name <testNameAppend_Positive>
      *  @param <NA>
      *  @return <void> 
      *  @throws exception-<NA>
      */
    public testmethod static void testNameSingleWrd_Positive() {
        //creating test data
        Contact con = new Contact(FirstName = 'Ron', LastName = 'Dyan');
        database.insert(con);
        Contact updCon = [Select kdt__Full_Name__c from Contact where LastName = 'Dyan' limit 1];
        system.assertEquals('Ron-Dyan' , updCon.kdt__Full_Name__c);
    }
    
    /**
      *  This method will test the positive scenario for appending the first and last name on contact where first name is blank.
      *  @name <testNameAppend_Positive>
      *  @param <NA>
      *  @return <void> 
      *  @throws exception-<NA>
      */
    public testmethod static void testNameBlankFirst_Positive() {
        //creating test data
        Contact con = new Contact(FirstName = '', LastName = 'Dyan');
        database.insert(con);
        Contact updCon = [Select kdt__Full_Name__c from Contact where LastName = 'Dyan' limit 1];
        system.assertEquals('Dyan' , updCon.kdt__Full_Name__c);        
    }
    
    /**
      *  This method will test the positive scenario for appending the first and last name on contact  which are 2 words.
      *  @name <testNameAppend_Positive>
      *  @param <NA>
      *  @return <void> 
      *  @throws exception-<NA>
      */
    public testmethod static void testNameDoubleWrd_Positive() {
        //creating test data
        Contact con = new Contact(FirstName = 'Ron Will', LastName = 'Dyan V');
        database.insert(con);
        Contact updCon = [Select kdt__Full_Name__c from Contact where LastName = 'Dyan V' limit 1];
        system.assertEquals('Ron#Will#Dyan#V' , updCon.kdt__Full_Name__c);        
    }
    
    /**
      *  This method will test the positive scenario for appending the first and last name on contact  which are 2 words.
      *  @name <testNameAppend_Positive>
      *  @param <NA>
      *  @return <void> 
      *  @throws exception-<NA>
      */
    public testmethod static void testNameOneDoubleWrd_Positive() {
        //creating test data
        Contact con = new Contact(FirstName = 'Ron', LastName = 'Dyan V');
        database.insert(con);
        Contact updCon = [Select kdt__Full_Name__c from Contact where LastName = 'Dyan V' limit 1];
        system.assertEquals('Ron*Dyan*V' , updCon.kdt__Full_Name__c);        
    }
    
    /**
      *  This method will test the negative scenario for appending the first and last name on contact.
      *  @name <testNameAppend_Negative>
      *  @param <NA>
      *  @return <void> 
      *  @throws exception-<NA>
      */
    public testmethod static void testNameAppend_Negative() {
        //creating test data
        Contact con = new Contact(FirstName = 'Ron', LastName = 'Dyan');
        database.insert(con);
        Contact updCon = [Select kdt__Full_Name__c from Contact where LastName = 'Dyan' limit 1];
        updCon.LastName = 'Dyan V';
        update updCon;
        system.assertNotEquals('Ron*Dyan*V' , updCon.kdt__Full_Name__c);
    }

}