import 'package:desafioapp/app/controllers/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlbumsListWidget extends StatelessWidget {
  GlobalController globalController = Get.find<GlobalController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=> ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: globalController.albums.length,
        itemBuilder: (_, index) {
          var item = globalController.albums[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              child: ListTile(
                title: Text(item.title),
              ),
            ),
          );
        },
      ),
    );
  }
}
