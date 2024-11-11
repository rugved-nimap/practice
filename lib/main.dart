import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/binders/home_binder.dart';
import 'package:practice/pages/home_page.dart';
import 'package:practice/services/localization_service.dart';
import 'package:practice/theme/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: HomeBinder(),
      title: 'Practice',
      theme: MyTheme().lightTheme(),
      themeMode: ThemeMode.light,
      darkTheme: MyTheme().darkTheme(),
      translations: LocalizationService(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en'),
      home: const HomePage(),
    );
  }
}
