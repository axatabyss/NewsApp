
import 'package:get/get.dart';
import '../app/views/home_view.dart';
import '../app/views/detail_view.dart';
import '../app/bindings/news_binding.dart';

import 'app_routes.dart';

class AppPages {

  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: NewsBinding(), // Binds NewsController to HomeView
    ),
    GetPage(
      name: Routes.DETAIL,
      page: () => DetailView(),
    ),
  ];

}