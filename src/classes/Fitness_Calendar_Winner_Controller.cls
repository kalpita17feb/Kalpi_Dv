public with sharing class Fitness_Calendar_Winner_Controller {
    public Integer targetAverageDailySteps {get;set;}
    public List<CustomUser> customUserList{get;set;}
    public List<CustomUser> customAddedUserList{get;set;}
    public String inputName {get;set;}
    public String year {get;set;}
    public String month {get;set;}
    public String monthText {get;set;}
    public String winner {get;set;}
    public Integer daysInMonth {get;set;}
 
 
    public Fitness_Calendar_Winner_Controller() {
        Date d = Date.today();
        this.year = String.valueOf(d.year());
        this.month = String.valueOf(d.month());
        this.month = (this.month.length() < 2)?'0' + this.month:this.month;
        
        this.monthText = '<-- Previous Month'; 
 
 
        this.targetAverageDailySteps = 8000;
        this.daysInMonth = Date.daysInMonth(Integer.valueOf(this.year), Integer.valueOf(this.month));
    
        this.getCustomUsers();
        this.customAddedUserList = new List<CustomUser>();
    }
 
    public void getCustomUsers(){
        this.customUserList = new List<CustomUser>();
 
        Integer monthlySteps = this.targetAverageDailySteps * this.daysInMonth;
 
        System.debug('monthlySteps:  ' + monthlySteps);
 
        for(Fitness_Calendar_Month__c fcm : [SELECT Id, User__r.Name, Total_Steps__c 
                                             FROM Fitness_Calendar_Month__c
                                             WHERE Month__c = :this.month 
                                             AND Year__c = :this.year
                                             AND Total_Steps__c > :monthlySteps]){
            System.debug('fcm:  ' + fcm);
            CustomUser cu = new CustomUser();
            cu.name = fcm.User__r.Name;
            cu.totalMonthlySteps = (Integer)fcm.Total_Steps__c;
            cu.averageDailySteps = Math.round(fcm.Total_Steps__c / this.daysInMonth);
            this.customUserList.add(cu);
        }
 
 
    }
 
    public PageReference updateUserList(){
        getCustomUsers();
        return null;
    }
 
    public PageReference pickWinner(){
        this.winner = 'Winners:  ';
        List<CustomUser> tempCustomUserList = new List<CustomUser>();
        tempCustomUserList = this.customUserList.clone();
        tempCustomUserList.addAll(this.customAddedUserList);
        Integer upper = tempCustomUserList.size() - 1;
        Integer lower = 0;
        if(tempCustomUserList.size() > 2){
            Integer myWinner = Math.round(Math.random() * (upper - lower)) + lower;
            this.winner += (this.winner == 'Winners:  ')?tempCustomUserList.get(myWinner).name + '  and  ':tempCustomUserList.get(myWinner).name;
            tempCustomUserList.remove(myWinner);
            upper = tempCustomUserList.size() - 1;
            if(upper >= 0){
                myWinner = Math.round(Math.random() * (upper - lower)) + lower;
                this.winner += tempCustomUserList.get(myWinner).name;
            }
        }else{
            for(CustomUser cu : tempCustomUserList){
                this.winner += (this.winner == 'Winners:  ')?cu.name + ',  ':cu.name;
            }
        }
 
 
        return null; 
    }
    
    public PageReference addCustomName(){
        this.customAddedUserList.add(new CustomUser(this.inputName, 0, 0));
        
        this.inputName = '';
        return null;
    }
 
    public PageReference changeMonth(){
        this.winner = '';
        Integer intMonth = Integer.valueOf(this.month);
        Integer intYear = Integer.valueOf(this.year);
        
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
        this.month = (intMonth < 10)?'0' + this.month:this.month;
 
        this.daysInMonth = Date.daysInMonth(Integer.valueOf(this.year), Integer.valueOf(this.month));
 
        
        System.debug('month -- year:  ' + this.month + '--' + this.year);
        this.getCustomUsers();
 
        return null;
    }
 
 
    public class CustomUser{
        public String name {get;set;}
        public Integer totalMonthlySteps {get;set;}
        public Integer averageDailySteps {get;set;}
        
        public CustomUser (){
            this.name = '';
            this.totalMonthlySteps = 0;
            this.averageDailySteps = 0;
        }
        
        public CustomUser(String name, Integer monthly, Integer daily){
            this.name = name;
            this.totalMonthlySteps = monthly;
            this.averageDailySteps = daily;
        }
 
    }
}