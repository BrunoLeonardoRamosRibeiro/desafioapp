import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:desafioapp/app/data/models/album_model.dart';
import 'package:desafioapp/app/data/repositories/album_interface.dart';
import 'package:desafioapp/app/data/services/shared_preferences_service.dart';
import 'package:desafioapp/app/helpers.dart';
import 'package:http/http.dart' as http;

class AlbumRepository implements IAlbum {
  SharedPref sharedPref = SharedPref();

  @override
  Future<Either<MyError, List<AlbumModel>>> call() async {
    try {
      List<AlbumModel> albums;

      bool postExists = await sharedPref.checkIfLocalDataExists('albums');

      if (postExists) {
        Iterable lista = await sharedPref.read("albums");
        albums = lista.map((model) => AlbumModel.fromJson(model)).toList();

        return Right(albums);
      } else {
        var url = AppAssets.URL_ALBUMS;
        var header = {
          "Content-Type": "application/json",
        };

        var response = await http.get(Uri.parse(url), headers: header);

        if (response.statusCode == 200) {
          Iterable lista = json.decode(response.body);
          albums = lista.map((model) => AlbumModel.fromJson(model)).toList();
          sharedPref.save("albums", albums);
          return Right(albums);
        } else {
          return Left(MyError.NO_AUTH);
        }
      }
    } catch (e) {
      return Left(MyError.NO_CONNECTION);
    }
  }
}
