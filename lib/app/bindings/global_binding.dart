import 'package:desafioapp/app/controllers/global_controller.dart';
import 'package:get/get.dart';

class GlobalBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GlobalController(), permanent: true);
  }

}