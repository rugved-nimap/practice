import 'package:get/get.dart';
import 'package:practice/controllers/home_controller.dart';

class HomeBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }

}