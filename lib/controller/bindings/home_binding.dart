import 'package:get/get.dart';
import 'package:proxy_sheild/controller/home_controller.dart';

class PHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<PHomeController>(PHomeController());
  }
}
