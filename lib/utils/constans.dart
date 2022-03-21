// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import 'package:proxy_sheild/utils/countries_list.dart';
import 'package:url_launcher/url_launcher.dart';

class PConstatns {
  static const String PHomeRoute = '/home';
  static const String PSplashRoute = '/splash';
  static const String PnoInternetConnectionRoute = '/noInternetConnection';
  static const Color cardGray = Color(0xFF4D5C7A);
  static const Color headerBlue = Color(0xFF5782D4);
  static const Color logoBoldGreen = Color(0XFF13c37B);
  static const Color logoRegGreen = Color(0XFF61DE56);
  static const String PnoInternetConnectionLottie =
      'assets/lotties/no_internet-connection.json';
  static const String PloadingLottie = 'assets/lotties/loading.json';
  static const TextStyle textBaseStyle =
      TextStyle(fontSize: 25, fontFamily: 'Roboto', color: Colors.white);
  static const TextStyle expandedInfo =
      TextStyle(fontSize: 18, fontFamily: 'Roboto', color: Colors.white);

  static String getCountryName({required String countryCode}) {
    String currentCountry = countriesList
        .firstWhere((element) => element['code'] == countryCode)['name'];
    return currentCountry;
  }

  static Future lunchUrl({required String url}) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw Exception('cant open the link ');
    }
  }
}
