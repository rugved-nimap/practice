
import 'package:get/get.dart';
import 'package:practice/controllers/sms_controller.dart';

class SmsBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SmsController(),);
  }

}