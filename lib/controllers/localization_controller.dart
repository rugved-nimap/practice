
import 'dart:ui';

import 'package:get/get.dart';

class LocalizationController extends GetxController {

  void localeEng() {
    Get.updateLocale(const Locale('en'));
  }

  void localeHin() {
    Get.updateLocale(const Locale('hi'));
  }
}