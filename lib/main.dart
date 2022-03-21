import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proxy_sheild/controller/bindings/connectivity_binding.dart';
import 'package:proxy_sheild/controller/bindings/home_binding.dart';
import 'package:proxy_sheild/utils/constans.dart';
import 'package:proxy_sheild/views/noInternetConnection.dart';
import 'package:proxy_sheild/views/splashScreen.dart';

import 'views/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return GetMaterialApp(
        initialBinding: PSplashscreenBinding(),
        getPages: [
          GetPage(
              name: PConstatns.PHomeRoute,
              page: () => const PHomeScreen(),
              binding: PHomeBinding()),
          GetPage(
              name: PConstatns.PSplashRoute,
              page: () => const PSplashScreen(),
              binding: PSplashscreenBinding()),
          GetPage(
              name: PConstatns.PnoInternetConnectionRoute,
              page: () => const PNoInternetScreen(),
              binding: PSplashscreenBinding())
        ],
        debugShowCheckedModeBanner: false,
        home: const PSplashScreen());
  }
}
