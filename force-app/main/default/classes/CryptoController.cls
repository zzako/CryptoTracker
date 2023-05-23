public class CryptoController {
    
    public static  List<Coins__c> cList = [SELECT Id,Name,Current_Price__c,Last_Updated__c,Market_Rank__c,Image_URL__c,Upsert_Name__c FROM Coins__c];
    public static List<Coins__c> upsertCoins = [SELECT ID,Upsert_Name__c FROM Coins__c];
    public void getCoins()
    {
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        Http http = new Http();
        request.setEndpoint('https://api.coingecko.com/api/v3/coins/markets?vs_currency=zar');
        request.setMethod('GET');
        response = http.send(request);

        if(response.getStatusCode() == 200)
        {
            List<Object> result = (List<Object>) JSON.deserializeUntyped(response.getBody());
            for (Object coin : result) {
                Map<String, Object> coinData = (Map<String, Object>) coin;
                String name = (String) coinData.get('name');
                Integer marketRank = (Integer) coinData.get('market_cap_rank');
                Decimal currentPrice = (Decimal) coinData.get('current_price');
                String lastUpdated = (String) coinData.get('last_updated');
                DateTime dt = DateTime.valueOf(lastUpdated.substring(0 , lastUpdated.length() -5).replace('T',' '));
                String imgURL = (String) coinData.get('image');
                //System.debug(name + ' #' + marketRank + ' R' + currentPrice + ' ' + dt);           
                updateObject(name,marketRank,currentPrice,dt,imgURL);
            }      
        }        
    }
    
    public static void updateObject(String name,Integer marketRank,Decimal currentPrice, DateTime dt, String imgURL)
    {   
        for(Coins__c cc : cList)
        {
            if(cc.Upsert_Name__c == name)
               {
        //Coins__c c = new Coins__c();
        cc.Name = name;
        cc.Upsert_Name__c = name;
        cc.Current_Price__c = currentPrice;
        cc.Last_Updated__c =  dt;
        cc.Market_Rank__c = marketRank;
        cc.Image_URL__c = imgURL;
        upsertCoins.add(cc);
               }
        }
        
        Map<id,Coins__c> coinmap = new Map<id,Coins__c>();
        coinmap.putall(upsertCoins);
        if(coinmap.size() > 0)
        {
        upsert coinmap.values();
        }
    } 
    
}