
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  bool isDark = false;

  void themeChange() {
    isDark = !isDark;
    Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
    update();
  }
}