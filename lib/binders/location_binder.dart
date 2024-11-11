
import 'package:get/get.dart';
import 'package:practice/controllers/location_controller.dart';

class LocationBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocationController());
  }

}