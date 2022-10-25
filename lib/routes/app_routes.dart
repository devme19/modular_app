import 'package:get/get.dart';
import 'package:mvvm_app/modules/home_module/presentation/bindings/home_binding.dart';
import 'package:mvvm_app/modules/home_module/presentation/pages/home_page.dart';


class AppRoutes {
  static const String homePage = "/homePage";
}

class App {
  static final pages = [
    GetPage(
        name: AppRoutes.homePage,
        page: () => HomePage(),
        binding:HomeBinding()
    ),
  ];
}