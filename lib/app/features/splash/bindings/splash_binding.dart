import 'package:desafioapp/app/controllers/global_controller.dart';
import 'package:desafioapp/app/features/splash/controllers/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(
      globalController: Get.find<GlobalController>(),
    ));

  }

}