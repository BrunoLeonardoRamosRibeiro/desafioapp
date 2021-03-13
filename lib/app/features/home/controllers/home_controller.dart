import 'package:desafioapp/app/routes/routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  void onClickPosts() {
    Get.toNamed(Routes.ROUTE_POSTS);
  }
}
