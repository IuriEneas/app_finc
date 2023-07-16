import 'package:app_finc/controller/home_controller.dart';
import 'package:app_finc/routes/page_routes.dart';
import 'package:app_finc/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(HomeController());
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: PagesRoute.homePage,
      theme: ThemeData.from(
        textTheme: const TextTheme(
          overline: TextStyle(
            color: Colors.white,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blueGrey,
        ),
      ),
    );
  }
}
