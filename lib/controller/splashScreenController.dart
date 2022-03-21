// ignore_for_file: file_names

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'dart:developer' as devloper;

import '../utils/constans.dart';

class PSplashScreenController extends GetxController {
// function for initing the connectivity
  Future internetConnectivity() async {
    final Connectivity _connectivity = Connectivity();
    ConnectivityResult resualut;
    try {
      resualut = await _connectivity.checkConnectivity();
      await Future.delayed(Duration(seconds: 5));
      switch (resualut) {
        case (ConnectivityResult.wifi):
          devloper.log('*********wifi conncetion*********',
              name: 'internetConnectivity');
          Get.toNamed(PConstatns.PHomeRoute);
          break;
        case (ConnectivityResult.mobile):
          devloper.log('*********mobile conncetion*********',
              name: 'internetConnectivity');
          Get.toNamed(PConstatns.PHomeRoute);
          break;
        case (ConnectivityResult.bluetooth):
          devloper.log('*********blutooth*********',
              name: 'internetConnectivity');
          Get.toNamed(PConstatns.PHomeRoute);
          break;
        case (ConnectivityResult.ethernet):
          devloper.log('******ethernnet conncetion********',
              name: 'internetConnectivity');
          Get.toNamed(PConstatns.PHomeRoute);
          break;
        case (ConnectivityResult.none):
          devloper.log('none internet', name: 'internetConnectivity');
          Get.toNamed(PConstatns.PnoInternetConnectionRoute);
          // Get.toNamed(HomeScreen());
          break;
        // default:
      }
    } on PlatformException catch (e) {
      devloper.log('connectivity Platform  error ',
          error: e, name: 'ConnectivityError');
    } catch (e) {
      // assert(e);

      devloper.log('connectivity error ', error: e, name: 'ConnectivityError');
      throw Exception(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    internetConnectivity();
  }
}
