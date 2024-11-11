import 'package:get/get.dart';
import 'package:practice/controllers/camera_controller.dart';

class CameraBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyCameraController(),);
  }

}