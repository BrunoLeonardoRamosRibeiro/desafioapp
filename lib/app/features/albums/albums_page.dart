import 'package:desafioapp/app/controllers/global_controller.dart';
import 'package:desafioapp/app/features/albums/widgets/albums_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlbumsPage extends StatelessWidget {
  GlobalController globalController = Get.find<GlobalController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Relação de Álbuns'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Visibility(
                visible: globalController.albums.length > 0,
                replacement: Center(child: Text('Sem álbuns para apresentar')),
                child: AlbumsListWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
