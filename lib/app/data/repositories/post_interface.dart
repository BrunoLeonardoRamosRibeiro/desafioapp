import 'package:dartz/dartz.dart';
import 'package:desafioapp/app/data/models/post_model.dart';
import 'package:desafioapp/app/helpers.dart';

abstract class IPost {
  Future<Either<MyError, List<PostModel>>> call();
}