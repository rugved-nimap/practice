
import 'package:get/get.dart';
import 'package:practice/controllers/notification_controller.dart';

class NotificationBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController(),);
  }

}