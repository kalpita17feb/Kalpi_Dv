/**
   @Author <Kalpita Talwadekar>
   @name <ContactTrigger>
   @CreateDate <12/02/2015>
   @Description <Trigger on Contact>
   @Version <1.0>
   */
trigger ContactTrigger on Contact (after insert, after update) {

    List<Contact> toUpdateContactList = new List<Contact>();
    
    if(trigger.isInsert) {
        AP_ContactTrigger.updateNameOnContact(trigger.new);
    }
    
    if(trigger.isUpdate) {
        for(Contact con: trigger.new) {
            if(con.FirstName!=trigger.oldMap.get(con.Id).FirstName || 
                con.LastName!=trigger.oldMap.get(con.Id).LastName) {
               toUpdateContactList .add(con);
            }
        }
        
        if(!toUpdateContactList.isEmpty()) {
            AP_ContactTrigger.updateNameOnContact(toUpdateContactList);
        }
    }
    
    
}