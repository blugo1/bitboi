import 'package:bitboi/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bitboi/models/coindata.dart';
import 'package:bitboi/models/coincard.dart';
import 'dart:io' show Platform;

class PricePage extends StatefulWidget {
  @override
  _PricePageState createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {

  //Initializers
  String selectedCurrency = 'USD';
  Map<String, String> coinPrices = {};
  bool isWaiting = false;


  //Dropdown method for android style selector
  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (int i = 0; i < currenciesList.length; i++) {
      var newItem = DropdownMenuItem(
        child: Text(currenciesList[i]),
        value: currenciesList[i],
      );

      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
        value: selectedCurrency,
        items: dropdownItems,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value; //COIN DATA GOES HERE IF ANDROID
          });
        });
  }

  //Dopdown method for ios style selector
  CupertinoPicker iOSPicker() {
    List<Text> textItems = [];

    for (int i = 0; i < currenciesList.length; i++) {
      var newText = Text(
        currenciesList[i],
        style: TextStyle(color: offWhite),
      );
      textItems.add(newText);
    }

    return CupertinoPicker(
        backgroundColor: lightGrey,
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedIndex) {
          print(selectedIndex); //COIN DATA GOES HERE IF IOS
        },
        children: textItems);
  }

  Column cardBuilder(){
    List<CoinCard> coinCards = [];
    for(String coinName in coinList){
      coinCards.add(
        CoinCard(
          currencyType: coinName,
          currencySelected: selectedCurrency,
          value: isWaiting ? '?' : coinPrices[coinName], //Display price and ? while loading
        ),
      );
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: coinCards,);
  }

  //Check the platform and return the correct selector UI
  getPicker() {
    if (Platform.isIOS) {
      return iOSPicker();
    } else if (Platform.isAndroid) {
      return androidDropdown();
    } else {
      return null;
    }
  }

  void getData() async {
    isWaiting = true;
    try {
      var data = await CoinData().getCoinData(selectedCurrency);
      isWaiting = false;
      setState(() {
        coinPrices = data;
      });
    } catch (e) {
      print(e);
    }
  }

  //You need this to do this at the beginning
  @override
  void initState(){
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('💰 BitBoi'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          cardBuilder(),
          Container(
            height: 120.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: darkGrey,
            child: Padding(
              padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: getPicker(),
            ),
          ),
        ],
      ),
    );
  }
}
