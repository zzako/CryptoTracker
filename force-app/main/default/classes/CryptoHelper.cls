public with sharing class CryptoHelper {
   @AuraEnabled(cacheable=true)
   public static List<Coins__c> getCoins(){   
        return [SELECT ID, Name, Current_Price__c, Market_Rank__c, Last_Updated__c, Image_URL__c, Image__c, Upsert_Name__c FROM Coins__c];   
   }
}