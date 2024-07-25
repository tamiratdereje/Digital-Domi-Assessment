import 'package:digital_domi_assessment/controllers/home_view_controller.dart';
import 'package:get/get.dart';

class HomeViewBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<HomeViewController>()) {
      Get.lazyPut(() => HomeViewController());
    }
  }
}

