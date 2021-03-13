import 'package:desafioapp/app/data/models/post_model.dart';
import 'package:desafioapp/app/data/repositories/post_repository.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController  {
  PostRepository postRepository = PostRepository();

  RxList<PostModel> _posts = RxList<PostModel>();
  List<PostModel> get posts => _posts.call();
  void setPosts(List<PostModel> items) => _posts.assignAll(items);

  RxBool _isFetchPosts = RxBool(false);
  bool get isFetchPosts => _isFetchPosts.value;
  void setIsFetchPosts(bool value) => _isFetchPosts.value = value;

  void fetchPosts() async {
    try {
      setIsFetchPosts(true);
      print('Pegando os posts');
      var result = await postRepository.call();
      result.fold((onFail) => print(onFail), (items) => setPosts(items));
    }
    finally {
      print('Finalização dos Posts');
      print('Tamanho dos Posts ${posts.length}');
      setIsFetchPosts(false);
    }

  }









}