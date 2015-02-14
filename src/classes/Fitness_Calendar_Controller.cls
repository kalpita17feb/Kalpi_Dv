public with sharing class Fitness_Calendar_Controller {
    public Boolean hasSignedIntoFitbit {get;set;}
    public String message {get;set;}
    public FitBit.FitBitUser fbUser {get;set;}
    public Fitness_Calendar_Month__c fcMonth = new Fitness_Calendar_Month__c();
    public String year {get;set;}
    public String month {get;set;}
    public CustomCalendar cCalendar {get;set;}
    public String monthText {get;set;}
    public String activitySelected {get;set;}
    
    public List<SelectOption> getActivityList() {
        List<SelectOption> act = new List<SelectOption>();
        act.add(new SelectOption('','--Bicycling--'));
        act.add(new SelectOption('activities/calories','Bicycling (leisurely, 10-11.9 mph)'));
        act.add(new SelectOption('activities/calories','Bicycling (moderate, 12-13.9 mph)'));
        act.add(new SelectOption('activities/calories','Bicycling (vigorous, 14-15.9 mph)'));
        act.add(new SelectOption('','--Dancing--'));
        act.add(new SelectOption('activities/caloriesBMR','Aerobic dancing, low impact'));
        act.add(new SelectOption('activities/caloriesBMR','Aerobic dancing, strenuously'));
        act.add(new SelectOption('activities/caloriesBMR','Dancing, choreographed'));
        act.add(new SelectOption('activities/caloriesBMR','Dancing, socially'));
        act.add(new SelectOption('activities/caloriesBMR','Line Dancing'));
        act.add(new SelectOption('','--Gym Activities--'));
        act.add(new SelectOption('activities/activityCalories','Aerobics (high impact)'));
        act.add(new SelectOption('activities/activityCalories','Aerobic dancing, strenuously'));
        act.add(new SelectOption('activities/activityCalories','Aerobics (low impact)'));
        return act;         /*
                            <option value="154">Aerobics (moderate)</option>
                            <option value="230">Basketball, game</option>
                            <option value="138">Basketball, playing recreational</option>
                            <option value="213">Boxing, in a ring competitively</option>
                            <option value="131">Boxing, non-competitive</option>
                            <option value="178">Circuit Training</option>
                            <option value="203">Elliptical trainer</option>
                            <option value="89">Gymnastics</option>
                            <option value="142">Handball, recreational</option>
                            <option value="187">Judo</option>
                            <option value="244">Jumping Rope, moderate/fast</option>
                            <option value="178">Jumping Rope, slow</option>
                            <option value="290">Karate</option>
                            <option value="290">Kickboxing</option>
                            <option value="101">Pilates</option>
                            <option value="138">Racquetball</option>
                            <option value="198">Racquetball, playing competitively</option>
                            <option value="111">Rowing, light </option>
                            <option value="179">Rowing, moderate </option>
                            <option value="203">Rowing, vigorous effort</option>
                            <option value="145">Softball</option>
                            <option value="180">Stair climbing, moderate</option>
                            <option value="90">Stair climbing, slow </option>
                            <option value="267">Stair climbing, vigorous </option>
                            <option value="6">Stretching</option>
                            <option value="133">Swimming, leisure </option>
                            <option value="174">Swimming, moderate effort</option>
                            <option value="49">Swimming, treading water</option>
                            <option value="222">Swimming, vigorous effort</option>
                            <option value="290">Tae Kwon Do</option>
                            <option value="8">Tai Chi</option>
                            <option value="100">Water Aerobics</option>
                            <option value="66">Weight lifting, light </option>
                            <option value="87">Weight lifting, moderate </option>
                            <option value="133">Weight lifting, vigorous</option>
                            <option value="100">Yoga</option>
                            <option value="0"> </option>
                            <option value="0">--Household Activities--</option>
                            <option value="67">Grocery Shopping</option>
                            <option value="72">Housework, light </option>
                            <option value="51">Housework, mopping floors</option>
                            <option value="101">Housework, vacuuming </option>
                            <option value="87">Housework, washing windows </option>
                            <option value="78">Painting/papering</option>
                            <option value="87">Washing the car</option>
                            <option value="0"> </option>
                            <option value="0">--Lawn and Garden--</option>
                            <option value="133">Firewood, chopping</option>
                            <option value="113">Firewood, sawing</option>
                            <option value="89">Firewood, stacking</option>
                            <option value="174">Gardening, heavy</option>
                            <option value="73">Gardening, light </option>
                            <option value="116">Gardening, moderate</option>
                            <option value="96">Hoeing in a garden</option>
                            <option value="160">Mowing</option>
                            <option value="125">Raking leaves </option>
                            <option value="145">Yard Work, general</option>
                            <option value="0"> </option>
                            <option value="0">--Miscellaneous--</option>
                            <option value="98">Badminton</option>
                            <option value="77">Billiards</option>
                            <option value="87">Bowling</option>
                            <option value="56">Fishing, from boat, sitting</option>
                            <option value="111">Fishing, from river bank and walking</option>
                            <option value="67">Frisbee, general playing</option>
                            <option value="67">Grocery Shopping</option>
                            <option value="102">Horseback riding, trotting</option>
                            <option value="31">Horseback riding, walking leisurely</option>
                            <option value="125">In-line skating, moderately</option>
                            <option value="244">Jumping Rope, moderate/fast</option>
                            <option value="178">Jumping Rope, slow</option>
                            <option value="160">Mowing</option>
                            <option value="151">Orienteering</option>
                            <option value="78">Painting/papering</option>
                            <option value="101">Pilates</option>
                            <option value="125">Raking leaves </option>
                            <option value="125">Rollerblading, moderately</option>
                            <option value="278">Shoveling snow, heavy</option>
                            <option value="133">Shoveling snow, light</option>
                            <option value="174">Shoveling snow, moderate</option>
                            <option value="290">Tae Kwon Do</option>
                            <option value="8">Tai Chi</option>
                            <option value="87">Washing the car</option>
                            <option value="100">Yoga</option>
                            <option value="0"> </option>
                            <option value="0">--Outdoor Activities--</option>
                            <option value="100">Badminton</option>
                            <option value="111">Baseball</option>
                            <option value="230">Basketball, game</option>
                            <option value="138">Basketball, playing recreational</option>
                            <option value="100">Bicycling (leisurely, 10-11.9 mph)</option>
                            <option value="200">Bicycling (moderate, 12-13.9 mph)</option>
                            <option value="250">Bicycling (vigorous, 14-15.9 mph)</option>
                            <option value="100">Canoeing, leisurely</option>
                            <option value="133">Firewood, chopping</option>
                            <option value="113">Firewood, sawing</option>
                            <option value="89">Firewood, stacking</option>
                            <option value="56">Fishing, from boat, sitting</option>
                            <option value="111">Fishing, from river bank and walking</option>
                            <option value="67">Frisbee, general playing</option>
                            <option value="174">Gardening, heavy</option>
                            <option value="73">Gardening, light </option>
                            <option value="116">Gardening, moderate</option>
                            <option value="78">Golfing, with a cart</option>
                            <option value="122">Golfing, without a cart </option>
                            <option value="217">Hiking, 10-20 lb. load </option>
                            <option value="232">Hiking, 21-42 lb. load </option>
                            <option value="172">Hiking, general</option>
                            <option value="102">Horseback riding, trotting</option>
                            <option value="31">Horseback riding, walking leisurely</option>
                            <option value="125">In-line skating, moderately</option>
                            <option value="160">Mowing</option>
                            <option value="151">Orienteering</option>
                            <option value="125">Rollerblading, moderately</option>
                            <option value="247">Running a 6 minute mile</option>
                            <option value="222">Running a 7 minute mile</option>
                            <option value="200">Running a 8 minute mile</option>
                            <option value="184">Running a 9 minute mile</option>
                            <option value="156">Running, jogging</option>
                            <option value="278">Shoveling snow, heavy</option>
                            <option value="133">Shoveling snow, light</option>
                            <option value="174">Shoveling snow, moderate</option>
                            <option value="164">Skiing, cross-country moderately</option>
                            <option value="256">Skiing, cross-country rapidly</option>
                            <option value="114">Skiing, cross-country slowly</option>
                            <option value="178">Skiing, downhill moderate</option>
                            <option value="244">Skiing, downhill rapidly</option>
                            <option value="109">Skiing, downhill slowly</option>
                            <option value="150">Snowboarding, light </option>
                            <option value="182">Snowboarding, moderate </option>
                            <option value="178">Snowshoeing</option>
                            <option value="218">Soccer, playing competitively</option>
                            <option value="144">Soccer, recreational</option>
                            <option value="145">Softball</option>
                            <option value="102">Tennis, doubles</option>
                            <option value="178">Tennis, singles</option>
                            <option value="232">Volleyball, game </option>
                            <option value="87">Volleyball, leisure </option>
                            <option value="100">Walking at a normal pace</option>
                            <option value="87">Washing the car</option>
                            <option value="0"> </option>
                            <option value="0">--Running--</option>
                            <option value="247">Running a 6 minute mile</option>
                            <option value="222">Running a 7 minute mile</option>
                            <option value="200">Running a 8 minute mile</option>
                            <option value="184">Running a 9 minute mile</option>
                            <option value="156">Running, jogging</option>
                            <option value="100">Walking at a normal pace</option>
                            <option value="0"> </option>
                            <option value="0">--Sports and Games--</option>
                            <option value="98">Badminton</option>
                            <option value="111">Baseball</option>
                            <option value="230">Basketball, game</option>
                            <option value="138">Basketball, playing recreational</option>
                            <option value="77">Billiards</option>
                            <option value="87">Bowling</option>
                            <option value="213">Boxing, in a ring competitively</option>
                            <option value="131">Boxing, non-competitive</option>
                            <option value="111">Cricket</option>
                            <option value="133">Fencing</option>
                            <option value="189">Football</option>
                            <option value="78">Golfing, with a cart</option>
                            <option value="122">Golfing, without a cart </option>
                            <option value="89">Gymnastics</option>
                            <option value="142">Handball, recreational</option>
                            <option value="178">Hockey</option>
                            <option value="162">Ice skating, competitively</option>
                            <option value="84">Ice skating, leisurely</option>
                            <option value="122">Ice skating, moderately</option>
                            <option value="187">Judo</option>
                            <option value="290">Karate</option>
                            <option value="290">Kickboxing</option>
                            <option value="138">Racquetball</option>
                            <option value="198">Racquetball, playing competitively</option>
                            <option value="203">Scuba diving</option>
                            <option value="164">Skiing, cross-country moderately</option>
                            <option value="256">Skiing, cross-country rapidly</option>
                            <option value="114">Skiing, cross-country slowly</option>
                            <option value="178">Skiing, downhill moderate</option>
                            <option value="244">Skiing, downhill rapidly</option>
                            <option value="109">Skiing, downhill slowly</option>
                            <option value="150">Snowboarding, light </option>
                            <option value="182">Snowboarding, moderate </option>
                            <option value="218">Soccer, playing competitively</option>
                            <option value="144">Soccer, recreational</option>
                            <option value="145">Softball</option>
                            <option value="348">Squash</option>
                            <option value="290">Tae Kwon Do</option>
                            <option value="8">Tai Chi</option>
                            <option value="102">Tennis, doubles</option>
                            <option value="178">Tennis, singles</option>
                            <option value="232">Volleyball, game </option>
                            <option value="87">Volleyball, leisure </option>
                            <option value="222">Water Polo</option>
                            <option value="100">Yoga</option>
                            <option value="0"> </option>
                            <option value="0">--Walking--</option>
                            <option value="78">Golfing, with a cart</option>
                            <option value="122">Golfing, without a cart </option>
                            <option value="67">Grocery Shopping</option>
                            <option value="217">Hiking, 10-20 lb. load </option>
                            <option value="232">Hiking, 21-42 lb. load </option>
                            <option value="172">Hiking, general</option>
                            <option value="151">Orienteering</option>
                            <option value="156">Running, jogging</option>
                            <option value="178">Snowshoeing</option>
                            <option value="180">Stair climbing, moderate</option>
                            <option value="90">Stair climbing, slow </option>
                            <option value="267">Stair climbing, vigorous </option>
                            <option value="100">Walking at a normal pace</option>
                            <option value="0"> </option>
                            <option value="0">--Water--</option>
                            <option value="100">Canoeing, leisurely</option>
                            <option value="111">Rowing, light </option>
                            <option value="179">Rowing, moderate </option>
                            <option value="203">Rowing, vigorous effort</option>
                            <option value="203">Scuba diving</option>
                            <option value="133">Swimming, leisure </option>
                            <option value="174">Swimming, moderate effort</option>
                            <option value="49">Swimming, treading water</option>
                            <option value="222">Swimming, vigorous effort</option>
                            <option value="100">Water Aerobics</option>
                            <option value="222">Water Polo</option>
                            <option value="104">Water Skiing</option>
                            <option value="0"> </option>
                            <option value="0">--Winter--</option>
                            <option value="89">Curling</option>
                            <option value="178">Hockey</option>
                            <option value="162">Ice skating, competitively</option>
                            <option value="84">Ice skating, leisurely</option>
                            <option value="122">Ice skating, moderately</option>
                            <option value="278">Shoveling snow, heavy</option>
                            <option value="133">Shoveling snow, light</option>
                            <option value="174">Shoveling snow, moderate</option>
                            <option value="164">Skiing, cross-country moderately</option>
                            <option value="256">Skiing, cross-country rapidly</option>
                            <option value="114">Skiing, cross-country slowly</option>
                            <option value="178">Skiing, downhill moderate</option>
                            <option value="244">Skiing, downhill rapidly</option>
                            <option value="109">Skiing, downhill slowly</option>
                            <option value="150">Snowboarding, light </option>
                            <option value="182">Snowboarding, moderate </option>
                            <option value="178">Snowshoeing</option> */
    }
    
    public Fitness_Calendar_Controller(){
    String fullFileURL = URL.getSalesforceBaseUrl().toExternalForm();
system.debug('url---'+fullFileURL);
system.debug(ApexPages.currentPage());
        this.hasSignedIntoFitbit = false;
        this.fbUser = new FitBit.FitBitUser();
        OAuth_Token__c ot = new OAuth_Token__c();
        for(OAuth_Token__c otTemp : [SELECT Id, Owner__c FROM OAuth_Token__c WHERE Owner__c = :UserInfo.getUserId() AND 
                                OAuth_Service__r.Name = :FitBit.SERVICE_NAME AND isAccess__c = true]){
            ot = otTemp;    
            this.hasSignedIntoFitbit = true;
            this.fbUser = FitBit.getFBUser(ot.Owner__c);
        }
        
        Date d = Date.today();
        this.year = String.valueOf(d.year());
        this.month = String.valueOf(d.month());
        this.month = (this.month.length() < 2)?'0' + this.month:this.month;
        
        this.monthText = '<-- Previous Month';
        this.cCalendar = this.populateCustomCalendar();
    } 
    
    public PageReference populateData(){
        if(this.fcMonth == null || this.fcMonth.Id == null){
            this.fcMonth = new Fitness_Calendar_Month__c();
            this.fcMonth.Year__c = this.year;
            this.fcMonth.Month__c = this.month;
            this.fcMonth.User__c = UserInfo.getUserId();
            
            insert this.fcMonth;
            List<Fitness_Calendar_Day__c> fcDayList = new List<Fitness_Calendar_Day__c>();
            for(Integer i = 1; i <= Date.daysInMonth(Integer.valueOf(this.year), Integer.valueOf(this.month)); i++){
                String day = (i < 10)?'0' + String.valueOf(i):String.valueOf(i);
                fcDayList.add(new Fitness_Calendar_Day__c(Day__c = day, Fitness_Calendar_Month__c = this.fcMonth.Id, Steps__c = 0));
            }
            
            insert fcDayList;
            this.cCalendar = this.populateCustomCalendar();
        }
 
        if(hasSignedIntoFitbit){ 
            for(OAuth_Token__c ot : [SELECT Id, Owner__c  FROM OAuth_Token__c WHERE Owner__c = :UserInfo.getUserId() AND OAuth_Service__r.Name = :FitBit.SERVICE_NAME AND isAccess__c = true LIMIT 1]){
                if(String.isBlank(ot.Owner__c)){
                    //TODO:Add error checking in the response...
                    String jsonResponse = OAuth.executeOauth('GET', FitBit.SERVICE_NAME, FitBit.GET_USER_PROFILE, '', '');
                    ot.Owner__c  = jsonResponse;
                    try{
                        update ot;
                    }catch(Exception e){
                        System.debug('exception updating oauth token:  ' + e);
                    }
                }
            }
        }
 
        return null;
    }
    
    public CustomCalendar populateCustomCalendar(){
        System.debug('this.year:  ' + this.year);
        System.debug('this.month:  ' + this.month);
        for(Fitness_Calendar_Month__c fcm : [Select Year__c, Year_Month__c, User__c, Month__c, Id, Submitted__c, 
                                               (Select Name, Fitness_Calendar_Month__c, Steps__c, Day__c 
                                               From Fitness_Calendar_Days__r
                                               ORDER BY Day__c ASC) 
                                               From Fitness_Calendar_Month__c 
                                               WHERE User__c = :UserInfo.getUserId()
                                               AND Year__c = :this.year
                                               AND Month__c = :this.month]){
            System.debug('found the month... ');
            this.fcMonth = fcm;                             
        }
                       
        if(this.fcMonth == null || this.fcMonth.Id == null){
            System.debug('its null');
            return new CustomCalendar();
        }   
        
        
        return new CustomCalendar(fcMonth);
    }
    
    public PageReference importFromFitbit(){
        //System.debug(FitBit.getActivity(OAuth.executeOauth('GET', 'Fitbit', 'http://api.fitbit.com/1/user/-/activities/steps/date/2014-01-01/2014-02-28.json', '', '')));     
        String lastDayOfMonth = String.valueOf(Date.daysInMonth(Integer.valueOf(this.year), Integer.valueOf(this.month)));
        String activity = 'https://api.fitbit.com/1/user/36TWPG/'+ activitySelected;
        String calloutUrl = FitBit.GET_ACTIVITY_BY_DATE + this.year + '-' + this.month + '-01/' + this.year + '-' + this.month + '-' + lastDayOfMonth + '.json';
        
        System.debug('calloutURL:  ' + calloutUrl);
        System.debug('FitBit.SERVICE_NAME:  ' + FitBit.SERVICE_NAME);
        
        FitBit.Activity fbActivity = FitBit.getActivity(OAuth.executeOauth('GET', FitBit.SERVICE_NAME, calloutUrl, '', ''));
        
        Map<String, FitBit.ActivityStep> activityMap = new Map<String, FitBit.ActivityStep>();
        for(FitBit.ActivityStep fbas : fbActivity.activitySteps){
            activityMap.put(fbas.fbDateTime, fbas);
        }
        
        List<Fitness_Calendar_Day__c> updateList = new List<Fitness_Calendar_Day__c>();
        String yearMonth = this.year + '-' + this.month + '-';
 
        System.debug('map:  ' + activityMap);
        System.debug('yearMonth:  ' + yearMonth);
        
        this.cCalendar = this.populateCustomCalendar();
 
        for(CustomDay cd : this.cCalendar.customDayList){
            try{            
                if(cd.fcDay.Id != null){
                    System.debug('steps:  ' + activityMap.get(yearMonth + cd.fcDay.Day__c));
                    Integer fbSteps = Integer.valueOf(activityMap.get(yearMonth + cd.fcDay.Day__c).value);
                    cd.fcDay.Steps__c = (fbSteps > cd.fcDay.Steps__c)?fbSteps:cd.fcDay.Steps__c;
                    updateList.add(cd.fcDay);
                }
            }catch (Exception e){
                System.debug('Exception in loop through fitbit activity:  ' + e);
            } 
        }
        
        if(!updateList.isEmpty()){
            update updateList;
        }
        
        this.cCalendar = this.populateCustomCalendar();
        
        for(OAuth_Token__c otTemp : [SELECT Id, Owner__c  FROM OAuth_Token__c WHERE Owner__c = :UserInfo.getUserId() AND OAuth_Service__r.Name = :FitBit.SERVICE_NAME AND isAccess__c = true LIMIT 1]){
            this.fbUser = FitBit.getFBUser(otTemp.Owner__c );
        }
        
        
        return null;
    }
    
    public PageReference changeMonth(){
        Integer intMonth = Integer.valueOf(this.month);
        Integer intYear = Integer.valueOf(this.year);
        System.debug('intMonth:  ' + intMonth);
        System.debug('intYear:  ' + intYear);
 
        
        if(this.monthText.contains('Previous')){
            this.monthText = 'Next Month -->';
            if(intMonth == 1){
                intYear = intYear - 1;
                intMonth = 12;
            }else{
                intMonth = intMonth - 1;
            }
        }else{
            this.monthText = '<-- Previous Month';
            if(intMonth == 12){
                intYear = intYear + 1;
                intMonth = 1;
            }else{
                intMonth = intMonth + 1;
            }
        }
        
        this.year = String.valueOf(intYear);
        this.month = String.valueOf(intMonth);
        System.debug('this.year:  ' + this.year);
        System.debug('this.month:  ' + this.month);
        this.month = (intMonth < 10)?'0' + this.month:this.month;
        System.debug('this.month:  ' + this.month);
        
        System.debug('month -- year:  ' + this.month + '--' + this.year);
        this.fcMonth = new Fitness_Calendar_Month__c();
        this.cCalendar = this.populateCustomCalendar();
        this.populateData();
 
        return null;
    }
    
    public PageReference authorize() {
        String authUrl = '';
        OAuth oa = new OAuth();
        authUrl = oa.newAuthorization(FitBit.SERVICE_NAME);
        System.debug(authUrl);
        if(authUrl==null) {
            this.message = oa.message;
            return null;
        } else {
            return new PageReference(authUrl);
        }
    }
    
    @RemoteAction
    public static String updateFCDay(String id, String steps){
        Integer iSteps = 0;
        iSteps = (steps == '')?0:Integer.valueOf(steps);
        for(Fitness_Calendar_Day__c fcdTemp : [Select Id, Steps__c FROM Fitness_Calendar_Day__c WHERE Id = :id]){
            fcdTemp.Steps__c = iSteps;
            update fcdTemp;
            return 'Success!!';
        }
        return 'ERROR!!';
    }
    
    @RemoteAction
    public static String updateSubmission(String theId, String cbState){
        for(Fitness_Calendar_Month__c fcm : [Select Id, Submitted__c FROM Fitness_Calendar_Month__c WHERE Id = :theId]){
            fcm.Submitted__c = (cbState == 'true')?true:false;
            update fcm;                             
            return cbState + ' ' + fcm.Submitted__c + '  -- Success!!';
        }
        return 'ERROR!!';
    }
    
    public class CustomCalendar{
        //<time datetime="2011-05-29" class="notmonth"><a href="#">29</a></time>
        public List<CustomDay> customDayList {get;set;}
        public Fitness_Calendar_Month__c fcMonth {get;set;}
        public Integer totalSteps {get;set;}
        public Integer daysInMonth {get;set;}
        private Map<Integer, Integer> remainderMap = new Map<Integer, Integer>{0=>6, 1=>0, 2=>1, 3=>2, 4=>3, 5=>4, 6=>5};
        
        public CustomCalendar(){
            init();
        }
 
        public CustomCalendar(Fitness_Calendar_Month__c fcm){
            this.totalSteps = 0;
            this.daysInMonth = 0;
            if(fcm != null){
                this.fcMonth = fcm;
                Date startDate = Date.newInstance(0001, 1, 1);
                CustomDay lastDay = new CustomDay();
                this.customDayList = new List<CustomDay>();
                Boolean hasFoundStart = false;
                for(Fitness_Calendar_Day__c fcd : fcm.Fitness_Calendar_Days__r){
                    Date fcdDate = Date.newInstance(Integer.valueOf(fcm.Year__c), Integer.valueOf(fcm.Month__c), Integer.valueOf(fcd.Day__c));
                    if(!hasFoundStart){
                        Integer remainder = Math.mod(startDate.daysBetween(fcdDate), 7);
                        System.debug('remainder:  ' + remainder);
                        this.customDayList.addAll(fillInBeginningNonMonthDays(remainderMap.get(remainder)));
                        hasFoundStart = true;
                    }
 
                    CustomDay cd = new CustomDay();
                    fcd.Day__c = (Integer.valueOf(fcd.Day__c) > 0)?fcd.Day__c:'';
                    cd.fcDay = fcd;
                    cd.isMonth = true;
                    cd.cdYear = fcm.Year__c;
                    cd.cdMonth = fcm.Month__c;
                    this.customDayList.add(cd);
                    lastDay = cd;
                    this.totalSteps += Integer.valueOf(cd.fcDay.Steps__c);
                    this.daysInMonth ++;
                }
                
                Integer endRemainder = Math.mod(startDate.daysBetween(lastDay.getDaysDate()), 7);
                System.debug('endRemainder:  ' + endRemainder);
                if(endRemainder < 7){
                    this.customDayList.addAll(fillInEndNonMonthDays(remainderMap.get(endRemainder)));
                }
            }else{
                init();
            }
        }       
        
        public void init(){
            this.customDayList = new List<CustomDay>();
            this.fcMonth = new Fitness_Calendar_Month__c();
        }
        
        public Integer getAverageSteps(){
            return Integer.valueOf(this.totalSteps / this.daysInMonth);
        }
        
        public List<CustomDay> fillInBeginningNonMonthDays(Integer remainder){
            System.debug('beginning remainder:  ' + remainder);
            List<CustomDay> cdList = new List<CustomDay>();
            for(Integer i = 0; i < remainder; i++){
                cdList.add(fillCustomDay());
            } 
            return cdList;
        }
        
        public List<CustomDay> fillInEndNonMonthDays(Integer remainder){
            List<CustomDay> cdList = new List<CustomDay>();
            System.debug('end remainder:  ' + remainder);
            for(Integer i = remainder; i < 6; i++){
                cdList.add(fillCustomDay());
            }
            return cdList;
        }
        
        public CustomDay fillCustomDay(){
            CustomDay cd = new CustomDay();
            cd.fcDay = new Fitness_Calendar_Day__c();
            cd.isMonth = false;
            cd.cdYear = '2000';
            cd.cdMonth = '01';
            cd.fcDay.Day__c = '';
            return cd;
        }
    }
    
    public class CustomDay{
        public Fitness_Calendar_Day__c fcDay {get;set;}
        public Boolean isMonth {get;set;}
        public String cdYear {get;set;}
        public String cdMonth {get;set;}
        
        public Date getDaysDate(){
            return Date.newInstance(Integer.valueOf(cdYear), Integer.valueOf(cdMonth), Integer.valueOf(fcDay.Day__c));
        }
        
        public String getFormattedDate(){
            return cdYear + '-' + cdMonth + '-' + fcDay.Day__c;
        }
        
        public String getMonthClass(){
            if(isMonth){
                if(getIsFuture()){
                    return 'future';
                }
                return (Date.today().isSameDay(Date.newInstance(Integer.valueOf(this.cdYear), Integer.valueOf(this.cdMonth), Integer.valueOf(this.fcDay.Day__c))))?'active':'';
            }else{
                return 'notmonth';
            }
        }
 
        public Boolean getIsFuture(){
            if(Date.today() < Date.newInstance(Integer.valueOf(this.cdYear), Integer.valueOf(this.cdMonth), Integer.valueOf(this.fcDay.Day__c))){
                return true;
            }
            return false;
        }
        
        public String getSteps(){
            return (fcDay.Steps__c > 0)?String.valueOf(fcDay.Steps__c).split('\\.').get(0):'0';
        }
    }
}