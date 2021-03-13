import 'package:dartz/dartz.dart';
import 'package:desafioapp/app/data/models/todo_model.dart';
import 'package:desafioapp/app/helpers.dart';

abstract class IToDo {
  Future<Either<MyError, List<ToDoModel>>> call();
}