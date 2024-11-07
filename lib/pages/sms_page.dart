import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class SmsPage extends StatelessWidget {
  const SmsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade900,
        title: const Text('SMS autofill'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 25),
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
              const Text(
                'The message will be autofill once the you send the an message of the below type on you mobile:\n\nMessage Format: \n\nPractice: OTP 345359 \n3jGXv46rBdM',
                style: TextStyle(color: Colors.white70),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 40,
              ),
              PinFieldAutoFill(
                decoration: BoxLooseDecoration(
                    strokeColorBuilder: const FixedColorBuilder(Colors.white)),
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
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor: WidgetStatePropertyAll(
                            Colors.indigoAccent.shade100)),
                    child: const Text(
                      'Listen for the OTP',
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
