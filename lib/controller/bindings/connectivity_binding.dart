import 'package:get/get.dart';
import 'package:proxy_sheild/controller/splashScreenController.dart';

class PSplashscreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<PSplashScreenController>(PSplashScreenController());
  }
}
