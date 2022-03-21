import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:proxy_sheild/modles/proxyModle.dart';
import 'package:proxy_sheild/repository/networking_repo.dart';

class PHomeController extends GetxController {
  List<ProxyModle> proxyGeted = [];

  ConnectivityResult? resualt;
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;
  final Connectivity _connectivity = Connectivity();

  

  updateConnectivityStatus(ConnectivityResult newResualt) {
    resualt = newResualt;
    log('connctivity changed to :$newResualt');
    log('resualt changed to  :$resualt');
    update();
  }

  Future _getProxies() async {
    proxyGeted = await ApiService.instance.proxyGet();
    proxyGeted.reversed;
    log('proxy list geted:${proxyGeted.length}');
    update();
    // _getcountrynameSet();
    return proxyGeted.reversed;
  }

  @override
  void onInit() {
    super.onInit();
    _getProxies();
    _connectivitySubscription = _connectivity.onConnectivityChanged
        .listen((event) => updateConnectivityStatus(event));
  }
}
