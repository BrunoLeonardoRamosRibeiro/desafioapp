import 'package:desafioapp/app/controllers/global_controller.dart';
import 'package:desafioapp/app/features/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
