import { LightningElement,wire,track } from 'lwc';
import getCoins from '@salesforce/apex/CryptoHelper.getCoins';
import LOCALE from "@salesforce/i18n/locale";
import CURRENCY from "@salesforce/i18n/currency";


export default class CryptoConvertor extends LightningElement {

    @wire(getCoins)
    coinsData;

    @track
    userCurrency;
    
    get coinOptions()
    {
        if (this.coinsData.data)
        {
           return this.coinsData.data.map((coin) => {
           return {
            label: coin.Name,
            price: coin.Current_Price__c,
            value: coin.Id,
            image: coin.Image_URL__c
           };
           });
        }
        return [];
    }

    @track
    currentPrice;
    imageURL;
    selectedCoinValue;

    handleCoinSelection(event)
    {
        this.selectedCoin = event.detail.value;
        const selectedOption = this.coinOptions.find(
            (option) => option.value === this.selectedCoin
          );
        this.currentPrice = selectedOption ? selectedOption.price : null;
        //this.currentPrice = new Intl.NumberFormat(LOCALE, { style: 'currency', currency: CURRENCY, currencyDisplay: "symbol"}).format(this.currentPrice);
        this.imageURL = selectedOption ? selectedOption.image : null;
        this.selectedCoinValue = selectedOption ? selectedOption.label : null;

        console.log("price " + this.currentPrice + "image url " + this.imageURL);

    }

    @track
    convertedPrice;
    inputPrice;
    inputPrice2;
    convertedPrice2;



    handleEvent(event)
    {
        this.inputPrice = event.target.value;      
    }

    convertToFiat()
    {
        console.log("inputprice " + this.inputPrice);
    
        this.convertedPrice = this.inputPrice * this.currentPrice;
        //this.userCurrency = new Intl.NumberFormat(LOCALE, { style: 'currency', currency: CURRENCY, currencyDisplay: "symbol"}).format(this.convertedPrice);
        this.userCurrency = this.convertedPrice.toFixed(2);
        console.log("Converted price is " + this.convertedPrice);
    }

    handleEventCrypto(event)
    {
        this.inputPrice2 = event.target.value;      
    }

    convertToCrypto()
    {
        console.log("inputprice " + this.inputPrice2);
        this.convertedPrice2 = this.inputPrice2 / this.currentPrice;
        console.log("Converted price is " + this.convertedPrice2 + " userCurrency is " + this.userCurrency);
    }





}