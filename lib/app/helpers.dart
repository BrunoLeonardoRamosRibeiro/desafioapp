import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum MyError {
  NO_CONNECTION,
  NO_AUTH,
  NO_DATA,
}

class AppAssets {

  static const LOGOTIPO = 'assets/images/MULLER.png';
  static const URL_POSTS = 'https://jsonplaceholder.typicode.com/posts';
  static const URL_ALBUMS = 'https://jsonplaceholder.typicode.com/albums';
  static const URL_TODOS = 'https://jsonplaceholder.typicode.com/todos';

  static String erro(MyError value) {
    switch (value) {
      case MyError.NO_CONNECTION:
        return "Sem Conexão";
      case MyError.NO_AUTH:
        return "Sem Autorização";
      case MyError.NO_DATA:
        return "Sem Dados Retornados";
      default:
        return "UNK";
    }
  }

  static showSnackError(String message) {
    Get.snackbar('Erro', message,
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        icon: Icon(
          Icons.dangerous,
          color: Colors.white,
        ));
  }



}

