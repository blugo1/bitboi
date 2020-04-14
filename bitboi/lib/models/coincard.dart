import 'package:flutter/material.dart';
import 'package:bitboi/util/constants.dart';

class CoinCard extends StatelessWidget {
  const CoinCard({
    this.value,
    this.currencySelected,
    this.currencyType,
  });

  final String value;
  final String currencySelected;
  final String currencyType;

  @override
  Widget build(BuildContext context){
    return Padding(
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
                  '1 $currencyType = $value $currencySelected',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: offWhite,
                  ),
                ),
              ),
            ),
          );
  }
}