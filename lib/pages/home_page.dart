import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/binders/camera_binder.dart';
import 'package:practice/binders/deviceinfo_binder.dart';
import 'package:practice/binders/location_binder.dart';
import 'package:practice/binders/notification_binder.dart';
import 'package:practice/binders/sms_binder.dart';
import 'package:practice/controllers/home_controller.dart';
import 'package:practice/pages/camera_page.dart';
import 'package:practice/pages/device_info_page.dart';
import 'package:practice/pages/localization_page.dart';
import 'package:practice/pages/notification_page.dart';
import 'package:practice/pages/sms_page.dart';

import '../binders/localization_binder.dart';
import 'location_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('practice'.tr),
            actions: [
              IconButton(
                onPressed: () {
                  controller.themeChange();
                },
                icon: Icon(controller.isDark
                    ? Icons.sunny
                    : Icons.nightlight_round_outlined),
              )
            ],
          ),
          body: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            padding: const EdgeInsets.all(5),
            children: [
              gridTile(
                'location',
                Icons.pin_drop_rounded,
                Colors.blueAccent,
                () => Get.to(
                  const LocationPage(),
                  binding: LocationBinder(),
                  transition: Transition.zoom,
                ),
              ),
              gridTile(
                'sms autofill',
                Icons.sms_outlined,
                Colors.deepPurple,
                () => Get.to(
                  const SmsPage(),
                  binding: SmsBinder(),
                  transition: Transition.zoom,
                ),
              ),
              gridTile(
                'notification',
                Icons.notifications,
                Colors.lightGreen,
                () => Get.to(
                  const NotificationPage(),
                  binding: NotificationBinder(),
                  transition: Transition.zoom,
                ),
              ),
              gridTile(
                'localization',
                Icons.language,
                Colors.redAccent,
                () => Get.to(
                  const LocalizationPage(),
                  binding: LocalizationBinder(),
                  transition: Transition.zoom,
                ),
              ),
              gridTile(
                'camera',
                Icons.camera,
                Colors.amber,
                () => Get.to(
                  const CameraPage(),
                  binding: CameraBinder(),
                  transition: Transition.zoom,
                ),
              ),
              gridTile(
                'device info',
                Icons.devices,
                Colors.grey.shade800,
                () => Get.to(
                  const DeviceInfoPage(),
                  binding: DeviceinfoBinder(),
                  transition: Transition.zoom,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget gridTile(
      String localeText, IconData icon, Color color, VoidCallback action) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FilledButton.icon(
        onPressed: action,
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(color),
        ),
        icon: Icon(icon),
        label: Text(localeText.tr),
      ),
    );
  }
}
