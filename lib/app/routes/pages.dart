import 'package:desafioapp/app/features/albums/albums_page.dart';
import 'package:desafioapp/app/features/home/bindings/home_binding.dart';
import 'package:desafioapp/app/features/home/home_page.dart';
import 'package:desafioapp/app/features/posts/posts_page.dart';
import 'package:desafioapp/app/features/splash/bindings/splash_binding.dart';
import 'package:desafioapp/app/features/splash/splash_page.dart';
import 'package:desafioapp/app/features/todos/todos_page.dart';
import 'package:desafioapp/app/routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(name: Routes.ROUTE_SPLASH, page: () => SplashPage(), binding: SplashBinding()),
    GetPage(
      name: Routes.ROUTE_HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: Routes.ROUTE_POSTS,
      page: () => PostsPage(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: Routes.ROUTE_ALBUMS,
      page: () => AlbumsPage(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: Routes.ROUTE_TODOS,
      page: () => ToDosPage(),
      transition: Transition.zoom,
    ),
  ];
}