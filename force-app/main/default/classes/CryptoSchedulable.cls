global class CryptoSchedulable implements Schedulable {   
    global void execute(SchedulableContext SC)
    {
        System.enqueueJob(new CryptoQueueable());
    }

}