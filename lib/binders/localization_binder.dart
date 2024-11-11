
import 'package:get/get.dart';
import 'package:practice/controllers/localization_controller.dart';

class LocalizationBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocalizationController());
  }

}