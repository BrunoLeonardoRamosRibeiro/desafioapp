import 'package:desafioapp/app/data/models/album_model.dart';
import 'package:desafioapp/app/data/models/post_model.dart';
import 'package:desafioapp/app/data/models/todo_model.dart';
import 'package:desafioapp/app/data/repositories/album_repository.dart';
import 'package:desafioapp/app/data/repositories/post_repository.dart';
import 'package:desafioapp/app/data/repositories/todo_repository.dart';
import 'package:desafioapp/app/helpers.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController  {
  PostRepository postRepository = PostRepository();
  AlbumRepository albumRepository = AlbumRepository();
  ToDoRepository toDoRepository = ToDoRepository();

  RxList<PostModel> _posts = RxList<PostModel>();
  List<PostModel> get posts => _posts.call();
  void setPosts(List<PostModel> items) => _posts.assignAll(items);

  RxList<AlbumModel> _albums = RxList<AlbumModel>();
  List<AlbumModel> get albums => _albums.call();
  void setAlbums(List<AlbumModel> items) => _albums.assignAll(items);

  RxList<ToDoModel> _toDos = RxList<ToDoModel>();
  List<ToDoModel> get toDos => _toDos.call();
  void setToDos(List<ToDoModel> items) => _toDos.assignAll(items);

  RxBool _isLoading = RxBool(false);
  bool get isLoading => _isLoading.value;
  void setIsLoading(bool value) => _isLoading.value = value;

  void fetchPosts() async {
    try {
      setIsLoading(true);
      var result = await postRepository.call();
      result.fold((onFail) => AppAssets.showSnackError('Não consegui baixar as Postagens'), (items) => setPosts(items));
    }
    finally {
      setIsLoading(false);
    }
  }

  void fetchAlbums() async {
    try {
      setIsLoading(true);
      var result = await albumRepository.call();
      result.fold((onFail) => AppAssets.showSnackError('Não consegui baixar os Álbuns'), (items) => setAlbums(items));
    }
    finally {
      setIsLoading(false);
    }
  }

  void fetchToDos() async {
    try {
      setIsLoading(true);
      var result = await toDoRepository.call();
      result.fold((onFail) => AppAssets.showSnackError('Não consegui baixar os To-Do(s)'), (items) => setToDos(items));
    }
    finally {
      setIsLoading(false);
    }
  }

}