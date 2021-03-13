import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:desafioapp/app/data/models/post_model.dart';
import 'package:desafioapp/app/data/repositories/post_interface.dart';
import 'package:desafioapp/app/data/services/shared_preferences_service.dart';
import 'package:desafioapp/app/helpers.dart';

import 'package:http/http.dart' as http;

class PostRepository implements IPost {
  SharedPref sharedPref = SharedPref();

  @override
  Future<Either<MyError, List<PostModel>>> call() async {
    try {
      List<PostModel> posts;

      bool postExists = await sharedPref.checkIfLocalDataExists('posts');

      if (postExists) {
        print('Posts existe');
        Iterable lista = await sharedPref.read("posts");
        posts = lista.map((model) => PostModel.fromJson(model)).toList();

        return Right(posts);
      } else {
        print('Posts Não existem');
        var url = AppAssets.URL_POSTS;
        var header = {
          "Content-Type": "application/json",
        };

        var response = await http.get(Uri.parse(url), headers: header);

        if (response.statusCode == 200) {
          Iterable lista = json.decode(response.body);
          posts = lista.map((model) => PostModel.fromJson(model)).toList();
          sharedPref.save("posts", posts);
          return Right(posts);
        } else {
          return Left(MyError.NO_AUTH);
        }
      }
    } catch (e) {
      return Left(MyError.NO_CONNECTION);
    }
  }
}
