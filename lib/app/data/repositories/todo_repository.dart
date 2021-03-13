import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:desafioapp/app/data/models/todo_model.dart';
import 'package:desafioapp/app/data/repositories/todo_interface.dart';
import 'package:desafioapp/app/data/services/shared_preferences_service.dart';
import 'package:desafioapp/app/helpers.dart';
import 'package:http/http.dart' as http;

class ToDoRepository implements IToDo {
  SharedPref sharedPref = SharedPref();

  @override
  Future<Either<MyError, List<ToDoModel>>> call() async {
    try {
      List<ToDoModel> toDos;

      bool postExists = await sharedPref.checkIfLocalDataExists('toDos');

      if (postExists) {
        Iterable lista = await sharedPref.read("toDos");
        toDos = lista.map((model) => ToDoModel.fromJson(model)).toList();

        return Right(toDos);
      } else {
        var url = AppAssets.URL_TODOS;
        var header = {
          "Content-Type": "application/json",
        };

        var response = await http.get(Uri.parse(url), headers: header);

        if (response.statusCode == 200) {
          Iterable lista = json.decode(response.body);
          toDos = lista.map((model) => ToDoModel.fromJson(model)).toList();
          sharedPref.save("toDos", toDos);
          return Right(toDos);
        } else {
          return Left(MyError.NO_AUTH);
        }
      }
    } catch (e) {
      return Left(MyError.NO_CONNECTION);
    }
  }
}
