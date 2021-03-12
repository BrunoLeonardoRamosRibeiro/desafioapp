import 'package:dartz/dartz.dart';
import 'package:desafioapp/app/data/models/post_model.dart';


abstract class IPost {
  Future<Either<String, PostModel>> call();
}