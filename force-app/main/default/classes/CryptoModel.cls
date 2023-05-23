public class CryptoModel {

        public String id { get; set; }
        public String symbol { get; set; }
        public String name { get; set; }
        public String image { get; set; }
        public Decimal current_price { get; set; }
        public Decimal market_cap { get; set; }
        public Integer market_cap_rank { get; set; }
        public Decimal fully_diluted_valuation { get; set; }
        public Decimal total_volume { get; set; }
        public Decimal high_24h { get; set; }
        public Decimal low_24h { get; set; }
        public Decimal price_change_24h { get; set; }
        public Decimal price_change_percentage_24h { get; set; }
        public Decimal market_cap_change_24h { get; set; }
        public Decimal market_cap_change_percentage_24h { get; set; }
        public Decimal circulating_supply { get; set; }
        public Decimal total_supply { get; set; }
        public Decimal max_supply { get; set; }
        public Decimal ath { get; set; }
        public Decimal ath_change_percentage { get; set; }
        public String ath_date { get; set; }
        public Decimal atl { get; set; }
        public Decimal atl_change_percentage { get; set; }
        public String atl_date { get; set; }
        public Object roi { get; set; }
        public String last_updated { get; set; }
    
}