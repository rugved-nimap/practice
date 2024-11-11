import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/home_controller.dart';
import 'package:practice/controllers/sms_controller.dart';
import 'package:sms_autofill/sms_autofill.dart';

class SmsPage extends StatelessWidget {
  const SmsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SmsController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('sms autofill'.tr),
          ),
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${'guide_mess'.tr}\n\n${'format_text'.tr} \n\nPractice: OTP 345359 \n3jGXv46rBdM',
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  PinFieldAutoFill(
                    decoration: BoxLooseDecoration(
                      strokeColorBuilder: FixedColorBuilder(
                          Get.find<HomeController>().isDark
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        controller.listenForCode();
                      },
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        backgroundColor: WidgetStatePropertyAll(
                            Colors.indigoAccent.shade100),
                      ),
                      child: Text(
                        'listen'.tr,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
