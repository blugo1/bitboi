import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> coinList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiURL = 'something.com';
const apiKEY = 'myKEY';

class CoinData {
  Future getCoinData(String userCurrency) async {
    Map<String, String> coinPrices = {};
    for(String coinName in coinList){
      String coinDataURL = '$apiURL/$coinName/$userCurrency?apikey=$apiKEY';

      //Get the result of the http request
      http.Response response = await http.get(coinDataURL);
      
      //Return status code checks
      if(response.statusCode == 200) {
        //All good, get the price for each coin
        var returnData = jsonDecode(response.body);
        double price = returnData['rate'];
        coinPrices[coinName] = price.toStringAsFixed(0);
      } else {
        //Fail
        print(response.statusCode);
        throw 'Oops';
      }
    }
    return coinPrices;
  }
}
