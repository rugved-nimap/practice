
import 'package:get/get.dart';
import 'package:practice/controllers/deviceinfo_controller.dart';

class DeviceinfoBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DeviceinfoController(),);
  }

}