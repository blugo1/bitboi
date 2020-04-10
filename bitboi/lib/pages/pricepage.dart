import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bitboi/models/coindata.dart';
import 'dart:io' show Platform;

class PricePage extends StatefulWidget {
  @override
  _PricePageState createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  String selectedCurrency = 'USD';

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
            selectedCurrency = value;
          });
        });
  }

  //Dopdown method for ios style selector
  CupertinoPicker iOSPicker() {
    List<Text> textItems = [];

    for (int i = 0; i < currenciesList.length; i++) {
      var newText = Text(
        currenciesList[i],
        style: TextStyle(color: Colors.white),
      );
      textItems.add(newText);
    }

    return CupertinoPicker(
        backgroundColor: Color(0xFF393e46),
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedIndex) {
          print(selectedIndex);
        },
        children: textItems);
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
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Color(0xFF00adb5),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 28.0), //Card size
                child: Text(
                  '1 BTC = ? USD', //Placeholder
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 120.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Color(0xFF222831),
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
