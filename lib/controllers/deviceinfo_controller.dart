
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';

class DeviceinfoController extends GetxController {

  String model = "";
  String brand = "";
  String display = "";

  @override
  void onInit() {
    getDeviceInfo();
    super.onInit();
  }

  void getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      model = androidInfo.model;
      brand = androidInfo.brand;
      display = androidInfo.display;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      model = iosDeviceInfo.model;
    }
    update();
  }
}