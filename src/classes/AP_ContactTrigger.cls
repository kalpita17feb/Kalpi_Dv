/**
   @Author <Kalpita Talwadekar>
   @name <AP_ContactTrigger>
   @CreateDate <12/02/2015>
   @Description <Helper Class for Contact Trigger>
   @Version <1.0>
   */
public class AP_ContactTrigger {

     /**
      *  This method update the full name of the contact based on format of firstname and lastname.
      *  @name <updateNameOnContact>
      *  @param <List<Contact>>
      *  @return <void> 
      *  @throws exception-<NA>
      */
    public static void updateNameOnContact(List<Contact> contactList) {
        List<Contact> toUpdateContactList = new List<Contact>();
        
        for(Contact con : contactList) {
            
            if(String.isBlank(con.FirstName) && con.LastName.containsWhitespace()) {
                toUpdateContactList.add(new Contact(Id = con.Id, kdt__Full_Name__c = con.LastName)); //check scenario
            }
            else if(String.isBlank(con.FirstName)) {
                toUpdateContactList.add(new Contact(Id = con.Id, kdt__Full_Name__c = con.LastName));
            }
            else if(con.FirstName.containsWhitespace() && con.LastName.containsWhitespace()) {
                toUpdateContactList.add(new Contact(Id = con.Id, kdt__Full_Name__c = con.FirstName.replace(' ','#') + '#' + con.LastName.replace(' ','#')));
            }
            else if((con.FirstName.containsWhitespace() && !con.LastName.containsWhitespace())) {
                toUpdateContactList.add(new Contact(Id = con.Id, kdt__Full_Name__c = con.FirstName.replace(' ','*') + '*' + con.LastName));
            }
            else if((!con.FirstName.containsWhitespace() && con.LastName.containsWhitespace())) {
                toUpdateContactList.add(new Contact(Id = con.Id, kdt__Full_Name__c = con.FirstName + '*' + con.LastName.replace(' ','*')));
            }
            else if(!con.FirstName.containsWhitespace() && !con.LastName.containsWhitespace()) {
                toUpdateContactList.add(new Contact(Id = con.Id, kdt__Full_Name__c = con.FirstName + '-' + con.LastName));
            }
            
            database.update(toUpdateContactList);
            
        }
    }
    

}