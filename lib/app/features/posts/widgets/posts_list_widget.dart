import 'package:desafioapp/app/controllers/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsListWidget extends StatelessWidget {
  GlobalController globalController = Get.find<GlobalController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: globalController.posts.length,
        itemBuilder: (_, index) {
          var items = globalController.posts[index];

          return ListTile(
            title: Text(items.title),
          );
        },
      ),
    );
  }
}
