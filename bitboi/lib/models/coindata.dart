import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bitboi/util/constants.dart';

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
        coinPrices[coinName] = price.toStringAsFixed(2);
      } else {
        //Fail
        print(response.statusCode);
        throw 'Oops';
      }
    }
    return coinPrices;
  }
}
