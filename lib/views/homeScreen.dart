// ignore_for_file: file_names

import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:proxy_sheild/controller/home_controller.dart';
import 'package:proxy_sheild/utils/constans.dart';
import 'package:proxy_sheild/views/noInternetConnection.dart';

// https://github.com/microsoft/vscode/issues/85101
class PHomeScreen extends StatelessWidget {
  const PHomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GetBuilder<PHomeController>(builder: (controller) {
        if (controller.resualt == ConnectivityResult.mobile ||
            controller.resualt == ConnectivityResult.wifi ||
            controller.resualt == ConnectivityResult.bluetooth ||
            controller.resualt == ConnectivityResult.ethernet) {
          return Column(
            children: [
              _pApp_Bar(width, height),
              const SizedBox(height: 5),
              //**body here  */
              Flexible(
                child: controller.proxyGeted.isEmpty
                    ? Center(
                        child: Lottie.asset(
                        PConstatns.PloadingLottie,
                        height: 200,
                        width: 200,
                      ))
                    : SizedBox(
                        height: height,
                        child: ListView.builder(
                          itemCount: controller.proxyGeted.length,
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          itemBuilder: (context, index) {
                            return _cardIteam(
                              host: controller.proxyGeted[index].host ?? '',
                              countryCode:
                                  controller.proxyGeted[index].country ?? '',
                              password:
                                  controller.proxyGeted[index].password ?? '',
                              ping: controller.proxyGeted[index].ping ?? '',
                              port: controller.proxyGeted[index].port ?? '',
                            );
                          },
                        ),
                      ),
              ),

              //**body here  */
            ],
          );
        } else if (controller.resualt == ConnectivityResult.none) {
          return PNoInternetScreen();
        }
        return Container();
      }),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _pApp_Bar(width, height) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'ProxySheild',
              style: PConstatns.textBaseStyle,
            ),
            SizedBox(
                width: 150,
                height: 150,
                child: Image.asset('assets/images/shield.png')),
            SizedBox(
              width: 250,
              height: 80,
              // color: Colors.red,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Have Proxy', style: PConstatns.textBaseStyle),
                    Text('whereever you are', style: PConstatns.textBaseStyle),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      width: width,
      height: height * 0.5,
      decoration: BoxDecoration(
          color: PConstatns.headerBlue,
          boxShadow: [
            BoxShadow(
                blurRadius: 15,
                color: const Color(0xff000000).withOpacity(0.20),
                offset: const Offset(0, 8))
          ],
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          )),
    );
  }
}

_cardIteam(
    {required String countryCode,
    required String ping,
    required String port,
    required String host,
    required String password}) {
  // String pathForFlag=countriesList.firstWhere((e)=>e['code']==flag);
  return Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        // height: 70,
        child: Card(
          color: PConstatns.cardGray,
          child: ExpansionTile(
            collapsedTextColor: Colors.white,
            textColor: Colors.white,
            trailing: const Icon(
              Iconsax.arrow_square_down,
              color: Colors.white,
            ),
            iconColor: Colors.white,
            leading: Container(
              width: 70,
              height: 40,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/flags/${countryCode.toLowerCase()}.png'))),
              // color: Colors.green,
            ),
            title: Text(
              PConstatns.getCountryName(countryCode: countryCode),
              style: PConstatns.textBaseStyle.copyWith(fontSize: 20),
            ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'ping : $ping',
                      style: PConstatns.expandedInfo,
                    ),
                  ),
                  Text(
                    'port:  $port',
                    style: PConstatns.expandedInfo,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: IconButton(
                        onPressed: () {
                          String url =
                              'https://telegram.me/proxy?server=$host&port=$port&secret=$password';
                          log(url);
                          try {
                            PConstatns.lunchUrl(url: url);
                          } catch (e) {
                            log(e.toString());
                          }
                        },
                        icon: const Icon(Iconsax.export_34,
                            size: 20, color: Colors.white)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
/* 
Column(
          children: [
        _pApp_Bar(width, height),
        const SizedBox(height: 5),
        //**body here  */
      Flexible(
            child: controller.proxyGeted.isEmpty
                ? Center(
                    child: Lottie.asset(
                    PConstatns.PloadingLottie,
                    height: 200,
                    width: 200,
                  ))
                : SizedBox(
                  height: height,
                  child: ListView.builder(
                    itemCount: controller.proxyGeted.length,
                    padding: const EdgeInsets.symmetric(
                        vertical: 4, horizontal: 8),
                    itemBuilder: (context, index) {
                      return _cardIteam(
                        host: controller.proxyGeted[index].host ?? '',
                        countryCode:
                            controller.proxyGeted[index].country ?? '',
                        password:
                            controller.proxyGeted[index].password ?? '',
                        ping: controller.proxyGeted[index].ping ?? '',
                        port: controller.proxyGeted[index].port ?? '',
                      );
                    },
                  ),
                ),
          ),
        )
        //**body here  */
          ],
        ),
 */