import 'package:get/get.dart';
import 'package:practice/controllers/localization_controller.dart';
import 'package:flutter/material.dart';

class LocalizationPage extends StatelessWidget {
  const LocalizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('localization'.tr),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'string_one'.tr,
                  style: const TextStyle(fontSize: 17),
                ),
                Text(
                  'string_two'.tr,
                  style: const TextStyle(fontSize: 17),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton(
                            onPressed: () {
                              controller.localeEng();
                            },
                            child: Text('english'.tr)),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton(
                            onPressed: () {
                              controller.localeHin();
                            },
                            child: Text('hindi'.tr)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
