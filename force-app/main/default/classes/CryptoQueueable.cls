public class CryptoQueueable implements Queueable, Database.AllowsCallouts{
    public void execute(QueueableContext context)
    {
           CryptoController cc = new CryptoController();
           cc.getCoins();        
    }

}