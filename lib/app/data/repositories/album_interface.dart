import 'package:dartz/dartz.dart';
import 'package:desafioapp/app/data/models/album_model.dart';
import 'package:desafioapp/app/helpers.dart';

abstract class IAlbum {
  Future<Either<MyError, List<AlbumModel>>> call();
}