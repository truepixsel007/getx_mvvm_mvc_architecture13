import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_mvvm_mvc_architecture13/res/getx_localization/languages.dart';
import 'package:getx_mvvm_mvc_architecture13/res/routes/routes.dart';
import 'package:getx_mvvm_mvc_architecture13/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations: Languages(),

      locale: Locale('en_US'),
      fallbackLocale: Locale('ur_PK'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const SplashScreen(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
