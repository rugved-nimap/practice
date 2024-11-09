import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:practice/state_manage/app_provider.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

class SmsPage extends StatelessWidget {
  const SmsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('sms autofill')),
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
                '${context.tr('guide_mess')}\n\n${context.tr('format_text')} \n\nPractice: OTP 345359 \n3jGXv46rBdM',
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 40,
              ),
              PinFieldAutoFill(
                decoration: BoxLooseDecoration(
                  strokeColorBuilder: FixedColorBuilder(
                      context.watch<AppProvider>().isDarkMode
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
                    await SmsAutoFill().listenForCode();
                  },
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    backgroundColor:
                        WidgetStatePropertyAll(Colors.indigoAccent.shade100),
                  ),
                  child: Text(
                    context.tr('listen'),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
