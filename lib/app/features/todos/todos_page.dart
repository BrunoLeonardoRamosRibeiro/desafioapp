import 'package:desafioapp/app/controllers/global_controller.dart';
import 'package:desafioapp/app/features/todos/widgets/todos_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToDosPage extends StatelessWidget {
  GlobalController globalController = Get.find<GlobalController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Relação de Postagens'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Visibility(
                visible: globalController.toDos.length > 0,
                replacement: Center(child: Text('Sem To-Dos para apresentar')),
                child: ToDosListWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
