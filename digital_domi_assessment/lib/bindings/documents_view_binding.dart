import 'package:digital_domi_assessment/controllers/documents_view_controller.dart';
import 'package:get/get.dart';

class DocumentsViewBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<DocumentsViewController>()) {
      Get.lazyPut(() => DocumentsViewController());
    }
  }
}

