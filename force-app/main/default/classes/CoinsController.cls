public class CoinsController{  
    
    public List<CoinsModel> getCoinsData()
    {
        //SELECT Id, Market_Rank__c, Current_Price__c, Name FROM Coins__c WHERE NOT Name LIKE '%Bitcoin' LIMIT 20
        List<Coins__c> coins = [SELECT Id, Market_Rank__c, Current_Price__c, Name FROM Coins__c WHERE Current_Price__c < 20000 LIMIT 20]; 
        List<CoinsModel> data = new List<CoinsModel>();
        Decimal price;
        String Name;
        
        for(Coins__c  c : coins)
        {
            price = c.Current_Price__c;
            Name = c.Market_Rank__c + ' ' + c.Name;
            data.add(new CoinsModel(price,Name));
        }
        return data;
    }
    
    public class CoinsModel
    {
        //public Decimal marketRank {get;set;}
        public Decimal currentPrice {get;set;}
        public String name {get;set;}
        
        public CoinsModel(Decimal price, String name)
        {
            this.currentPrice = price;
            this.name = name;
        }
    }
    
}