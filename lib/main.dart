import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:newsapp/routes/app_pages.dart';
import 'package:newsapp/routes/app_routes.dart';
import 'package:newsapp/theme/app_theme.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HOME,
      getPages: AppPages.pages,
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: ThemeMode.system,
    );
  }
}