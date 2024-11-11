import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/deviceinfo_controller.dart';

class DeviceInfoPage extends StatelessWidget {
  const DeviceInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeviceinfoController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('device info'.tr),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Model: ${controller.model}', style: Theme.of(context).textTheme.bodyMedium,),
                  Text('Brand: ${controller.brand.toString().toUpperCase()}', style: Theme.of(context).textTheme.bodyMedium,),
                  Text('Display: ${controller.display}', style: Theme.of(context).textTheme.bodyMedium,),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
