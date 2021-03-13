import 'package:desafioapp/app/controllers/global_controller.dart';
import 'package:desafioapp/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  GlobalController globalController;
  SplashController({@required this.globalController});


  @override
  void onInit() {
    super.onInit();
    globalController.fetchPosts();
    globalController.fetchAlbums();
    globalController.fetchToDos();
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 3)).then((value) => Get.offNamed(Routes.ROUTE_HOME));
  }


}