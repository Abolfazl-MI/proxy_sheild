import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:proxy_sheild/modles/proxyModle.dart';

class ApiService {
  ApiService._();
  static ApiService instance = ApiService._();
  var dio = Dio();
  Future<List<ProxyModle>> proxyGet() async {
    List<ProxyModle> finalProxyModleList = [];
    try {
      log('**********netWorking***********', name: 'proxyGet');
      Response response = await dio.get('https://mtpro.xyz/api/?type=mtproto');
      log('**********netWorking status code : ${response.statusCode}***********', name: 'proxyGet');

      List responsedList = response.data;
      log('**********creatingList***********', name: 'proxyGet');
      response.statusCode == 200
          ? finalProxyModleList =
              responsedList.map((e) => ProxyModle.fromJson(e)).toList()
          : Exception('status code is : ${response.statusCode}');
      log(finalProxyModleList.length.toString(), name: 'proxyGet');
      return finalProxyModleList;
    } catch (e) {
      log(e.toString());
      return Future.error('$e');
    }
  }
}
