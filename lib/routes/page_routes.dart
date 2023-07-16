import 'package:app_finc/view/despesa_form_page.dart';
import 'package:app_finc/view/despesa_page.dart';
import 'package:app_finc/view/home_page.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoute.homePage,
      page: () => HomePage(),
    ),
    GetPage(
      name: PagesRoute.despFormPage,
      page: () => DespesaFormPage(),
    ),
    GetPage(
      name: PagesRoute.despPage,
      page: () => DespesaPage(),
    ),
  ];
}

abstract class PagesRoute {
  static const String homePage = '/';
  static const String despFormPage = '/despForm';
  static const String despPage = '/desp';
}
