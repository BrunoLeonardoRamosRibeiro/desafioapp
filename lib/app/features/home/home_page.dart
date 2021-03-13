import 'package:desafioapp/app/features/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller)=> Scaffold(
        appBar: AppBar(
          title: Text('Menu Principal'),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: InkWell(
                onTap: () => controller.onClickPosts(),
                child: Card(
                  child: ListTile(
                    title: Text(
                      'Postagens',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text('Relação de postagens'),
                    leading: Icon(
                      Icons.local_post_office_outlined,
                      size: 48,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: InkWell(
                onTap: () => controller.onClickAlbums(),
                child: Card(
                  child: ListTile(
                    title: Text(
                      'Álbuns',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text('Relação de álbuns'),
                    leading: Icon(
                      Icons.picture_in_picture_outlined,
                      size: 48,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: InkWell(
                onTap: () => controller.onClickToDos(),
                child: Card(
                  child: ListTile(
                    title: Text(
                      'To-dos',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text('Relação de To-dos'),
                    leading: Icon(
                      Icons.check_box_outlined,
                      size: 48,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
