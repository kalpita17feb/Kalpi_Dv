public with sharing class FitBit {
    public static final String SERVICE_NAME = 'Fitbit'; 
    public static final String GET_USER_PROFILE = 'https://api.fitbit.com/1/user/36TWPG/profile.json'; 
    public static final String GET_ACTIVITY_BY_DATE = 'https://api.fitbit.com/1/user/36TWPG/activities/steps/date/';
    
    public class FitBitUser{
        public String memberSince {get;set;}
        public String dateOfBirth {get;set;}
        public Decimal weight {get;set;}
        public String glucoseUnit {get;set;}
        public String weightUnit {get;set;}
        public String nickname {get;set;}
        public String locale {get;set;}
        public String foodsLocale {get;set;}
        public Decimal offsetFromUTCMillis {get;set;}
        public String avatar {get;set;}
        public String country {get;set;}
        public String timezone {get;set;}
        public Decimal height {get;set;}
        public String avatar150 {get;set;}
        public String heightUnit {get;set;}
        public Decimal strideLengthRunning {get;set;}
        public String gender {get;set;}
        public String waterUnit {get;set;}
        public Decimal strideLengthWalking {get;set;}
        public String fullName {get;set;}
        public String encodedId {get;set;}
        public String distanceUnit {get;set;}
        public String displayName {get;set;}
    }
    
    public Static FitBitUser getFBUser(String jsonText){
        try{
            jsonText = jsonText.replace('{"user":', '');
            jsonText = jsonText.substring(0, jsonText.length() - 1);
            return (FitBitUser)JSON.deserialize(jsonText, FitBitUser.class);
        }catch(Exception e){
            return (FitBitUser)JSON.deserialize('{}', FitBitUser.class);
        }
    }
    
    public class Activity{
        public List<ActivityStep> activitySteps {get;set;}
    }
 
    public class ActivityStep{
        public String fbDateTime {get;set;}
        public String value {get;set;}
    }
    
    public static Activity getActivity(String jsonText){
        System.debug('jsonText:  ' + jsonText);
        if(jsonText.contains('"success":false')){
            return getInstantiatedActivity();
        }
        try{
            jsonText = jsonText.replace('activities-steps', 'activitySteps');
            jsonText = jsonText.replace('dateTime', 'fbDateTime');
            return (Activity)JSON.deserialize(jsonText, Activity.class);
        }catch(Exception e){
            return getInstantiatedActivity();
        }
    }
    
    public static Activity getInstantiatedActivity(){
        Activity a = new Activity();
        a.activitySteps = new List<ActivityStep>();
        return a;
    }
    
}