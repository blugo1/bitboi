import 'package:flutter/material.dart';

//Four main app colors
const Color darkGrey = Color(0xFF222831);
const Color lightGrey = Color(0xFF393e46);
const Color lightBlue = Color(0xFF00adb5);
const Color offWhite = Color(0xFFeeeeee);

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

const apiURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKEY = 'APIKEYHERE';