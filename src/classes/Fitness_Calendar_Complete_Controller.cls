public with sharing class Fitness_Calendar_Complete_Controller {
    public String service { get; set; }
    public boolean authSuccess { get; set; }
    public String message { get; set; }
 
    public Fitness_Calendar_Complete_Controller() {
 
    } 
 
    public PageReference completeAuthorization() {
        String token = ApexPages.currentPage().getParameters().get('oauth_token');
        if(token != null){
            String verifier = ApexPages.currentPage().getParameters().get('oauth_verifier');
            OAuth oa = new OAuth();
            authSuccess = oa.completeAuthorization(token,verifier);
            this.message = oa.message;
        }else{
            message = 'Invalid request. Missing parameter oauth_token';
        }
        
        PageReference myPageRef = Page.Fitness_Calendar;
        return myPageRef;
    }    
}