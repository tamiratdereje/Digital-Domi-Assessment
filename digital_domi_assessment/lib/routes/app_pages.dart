import 'package:digital_domi_assessment/bindings/documents_view_binding.dart';
import 'package:digital_domi_assessment/bindings/home_view_binding.dart';
import 'package:digital_domi_assessment/screens/home_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.homePage;

  static final routes = [
    GetPage(
      name: Routes.homePage,
      page: () => HomeView(),
      bindings: [HomeViewBinding(), DocumentsViewBinding()],
    ),
  ];
}
